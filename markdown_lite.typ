// Sous-ensemble de Markdown gras/italique/lien, écrit à la main pour ce
// prototype (pas de moteur CommonMark natif dans Typst - un paquet comme
// `cmarker` existe mais dépend d'un binaire pandoc externe, hors périmètre
// de cet essai). Suffisant pour tester la FIDÉLITÉ DE MISE EN PAGE ; la
// couverture Markdown complète (listes, imbrication) reste à évaluer à part
// si Typst est retenu pour de vrai.
#let re-inline = regex("(?:\*\*([^*]+?)\*\*)|(?:\*([^*]+?)\*)|(?:\[([^\]]+?)\]\(([^\)]+?)\))")

#let md-inline(s) = {
  let out = ()
  let prev = 0
  for m in s.matches(re-inline) {
    if m.start > prev {
      out.push(s.slice(prev, m.start))
    }
    let caps = m.captures
    if caps.at(0) != none {
      out.push(strong[#caps.at(0)])
    } else if caps.at(1) != none {
      out.push(emph[#caps.at(1)])
    } else if caps.at(2) != none {
      out.push(link(caps.at(3))[#caps.at(2)])
    }
    prev = m.end
  }
  if prev < s.len() {
    out.push(s.slice(prev))
  }
  out.sum(default: [])
}

#let md-block(s) = {
  let paragraphes = s.split("\n\n")
  paragraphes.map(p => par(md-inline(p))).sum(default: [])
}
