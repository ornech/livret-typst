#import "config.typ": *
#import "icons.typ"
#import "markdown_lite.typ": md-inline, md-block

// --- état par page, lu depuis le calque de fond / pied de page (context) ---
// Équivalent Typst du HTML statique pré-rendu par rendu_livret.ipynb : là où
// le pipeline actuel calcule à l'avance, en Python, ce que chaque page doit
// afficher, Typst reflue le contenu lui-même - il faut donc un mécanisme
// réactif (state) pour que le calque de fond (bande de phase, en-tête)
// sache, à CHAQUE page physique, quelle est la fiche/l'onglet/la phase en
// cours, y compris sur une page de continuation après un saut_de_page.
#let etat-phase = state("phase-active", none)
#let etat-onglet = state("onglet-actif", none)
#let etat-type = state("type-fiche-actif", none)
#let etat-suite = state("page-de-suite", false)
#let etat-validation-pied = state("validation-pied", "")
#let etat-libelle-generique = state("libelle-generique", none)

#let ordre-canonique = (
  "Déclencheur", "Objectif", "Actions immédiates", "À ne pas faire",
  "Critères d'escalade", "Missions", "Limites",
  "Objectif de communication", "Éléments de langage",
)

#let index-canonique(sp) = {
  if sp == none { return none }
  for (i, nom) in ordre-canonique.enumerate() {
    if nom == sp { return i }
  }
  none
}

// Regroupe les lignes consécutives partageant le même sous_phase (voir
// _decouper_en_runs, rendu_livret.ipynb) - pas un regroupement par nom sur
// tout le tableau.
#let decouper-en-runs(items) = {
  let runs = ()
  for it in items {
    let sp = it.at("sous_phase", default: none)
    if runs.len() == 0 or runs.last().sp != sp {
      runs.push((sp: sp, elements: (it,)))
    } else {
      let i = runs.len() - 1
      runs.at(i) = (sp: sp, elements: runs.at(i).elements + (it,))
    }
  }
  runs
}

// Replace les runs à nom canonique dans l'ordre de lecture fixe ; les runs
// non reconnus gardent leur ordre d'apparition d'origine, à la suite des
// runs canoniques (voir _reordonner_items - même règle, y compris son effet
// de bord sur un saut_de_page logé dans un groupe non canonique : il migre
// avec son groupe, à la fin).
#let reordonner-items(items) = {
  let runs = decouper-en-runs(items)
  let cles = runs.enumerate().map(((i, r)) => {
    let pos = index-canonique(r.sp)
    (key: if pos != none { pos } else { 1000 + i }, i: i)
  })
  let ordre = cles.sorted(key: p => p.key).map(p => p.i)
  let resultat = ()
  for idx in ordre {
    resultat = resultat + runs.at(idx).elements
  }
  resultat
}

// Découpe la liste (déjà réordonnée) en segments coupés par un marqueur
// saut_de_page - chaque segment démarre une nouvelle page physique (voir
// _paginer_fiche). Le marqueur lui-même n'est jamais rendu.
#let segmenter-sauts-de-page(items) = {
  let segments = ((),)
  for it in items {
    if it.at("style", default: "texte") == "saut_de_page" {
      segments = segments + ((),)
    } else {
      let i = segments.len() - 1
      segments.at(i) = segments.at(i) + (it,)
    }
  }
  segments
}

// Le "pourquoi" (items[].justification), séparé du "comment" (texte) -
// italique + opacité réduite sur la couleur DÉJÀ active dans le contexte
// (texte sombre en temps normal, blanc dans un encart avertissement) -
// context text.fill lit cette couleur en vigueur, exactement l'équivalent
// de `opacity` en CSS qui s'applique à currentColor plutôt qu'à une teinte
// fixe (voir CLAUDE.md, Mise en page et charte graphique).
#let ligne-justification(txt) = context {
  let base = text.fill
  set text(style: "italic", weight: "regular", fill: base.transparentize(28%))
  block(above: 0.35em, below: 0em)[Objectif : #md-inline(txt)]
}

#let rendre-encart(style, it) = {
  let (fond, txt) = if style == "note" {
    (couleur-encart-note-fond, couleur-encart-note-texte)
  } else if style == "attention" {
    (couleur-encart-attention-fond, couleur-encart-attention-texte)
  } else {
    (couleur-encart-danger-fond, couleur-encart-danger-texte)
  }
  block(fill: fond, inset: 6pt, width: 100%, above: espacement-encart, below: espacement-encart)[
    #set text(fill: txt, weight: "bold")
    #icones-encart.at(style) #h(3pt) #md-inline(it.texte)
    #if it.at("justification", default: none) != none {
      ligne-justification(it.justification)
    }
  ]
}

#let rendre-action(n, it) = {
  let priorite = it.priorite
  let (poids, style-txt) = if priorite == "obligatoire" { ("bold", "normal") }
    else if priorite == "secondaire" { ("regular", "italic") }
    else { ("regular", "normal") }
  let couleur-txt = if priorite == "secondaire" { rgb("#444444") } else { couleur-texte }
  block(above: 0.3em, below: 0.3em)[
    #icons.pictogramme-priorite(priorite) #h(2pt)
    #if it.at("responsable", default: none) != none [
      #text(weight: "bold")[[#upper(it.responsable)]] #h(2pt)
    ]
    #n\. #h(1pt)
    #text(weight: poids, style: style-txt, fill: couleur-txt)[#md-inline(it.texte)]
    #if it.at("justification", default: none) != none {
      ligne-justification(it.justification)
    }
  ]
}

#let rendre-texte(it) = block(above: 0.25em, below: 0.25em)[
  #md-block(it.texte)
  #if it.at("justification", default: none) != none {
    ligne-justification(it.justification)
  }
]

#let rendre-run(sp, elements) = {
  let entete = if sp != none {
    block(above: 0.5em, below: 0.1em)[#text(weight: "bold", size: taille-bloc-titre, fill: couleur-bordure-entete)[#sp]]
  } else { none }
  let n-action = 0
  let corps = ()
  for it in elements {
    let style = it.at("style", default: "texte")
    if style == "action" {
      n-action = n-action + 1
      corps.push(rendre-action(n-action, it))
    } else if style in ("note", "attention", "avertissement") {
      corps.push(rendre-encart(style, it))
    } else {
      corps.push(rendre-texte(it))
    }
  }
  entete + corps.sum(default: [])
}

#let rendre-items-segment(items) = {
  decouper-en-runs(items).map(r => rendre-run(r.sp, r.elements)).sum(default: [])
}

#let rendre-sources(refs) = {
  if refs.len() == 0 {
    return block(above: espacement-blocs)[
      #block(fill: couleur-encart-attention-fond, inset: (x: 6pt, y: 3pt))[
        #text(fill: couleur-encart-attention-texte, weight: "bold")[⚠ Aucune référence source renseignée pour cette fiche]
      ]
    ]
  }
  block(above: espacement-blocs)[
    #text(weight: "bold", size: taille-bloc-titre, fill: couleur-bordure-entete)[SOURCES]
    #set text(size: taille-source, style: "italic")
    #for r in refs [
      #block(above: 0.2em, below: 0.2em)[
        #md-inline(r.reference)
        #if r.at("page", default: "") != "" [ #r.page. ]
        #if r.at("verifie_le", default: none) != none and r.at("page", default: "") != "" {
          text(style: "normal", fill: couleur-texte-attenue)[· Vérifié le #r.verifie_le par #r.at("verifie_par", default: "")]
        } else if r.at("page", default: "") != "" {
          box(fill: couleur-encart-attention-fond, inset: (x: 3pt, y: 1pt), radius: 2pt)[
            #text(style: "normal", weight: "bold", fill: couleur-encart-attention-texte)[⚠ Non vérifiée]
          ]
        } else {
          box(fill: couleur-encart-attention-fond, inset: (x: 3pt, y: 1pt), radius: 2pt)[
            #text(style: "normal", weight: "bold", fill: couleur-encart-attention-texte)[⚠ Page non renseignée]
          ]
        }
      ]
    ]
  ]
}

// --- calque de fond : bande de phase (bleed tab) + entête bord-à-bord ---
// Dessiné en coordonnées PAGE ABSOLUES (page(background: ...) fournit un
// calque de la taille physique complète, sous les marges) - c'est ce qui
// permet à la bande et à la règle d'en-tête de déborder jusqu'au bord
// physique / jusqu'au bord de la bande, exactement comme les marges
// négatives du CSS actuel, sans avoir à re-simuler le modèle de boîte CSS.
#let dessiner-fond() = context {
  let impair = calc.rem(here().page(), 2) == 1
  let phase = etat-phase.get()
  let onglet = etat-onglet.get()
  let ftype = etat-type.get()
  let libelle-generique = etat-libelle-generique.get()

  // bande de phase - toujours visible (les 6 phases restent affichées même
  // sur une page transversale comme le sommaire, aucune n'y est active).
  let ext-x = if impair { page-w - marge-exterieure } else { marge-exterieure - largeur-bande }
  for (i, p) in phases.enumerate() {
    let actif = p.slug == phase
    let fond = if actif { couleur-phase(p.slug) } else { couleur-tab-inactif-fond }
    let txt = if actif { white } else { couleur-tab-inactif-texte }
    let y = marge-haut + marge-haut-bande + i * hauteur-zone
    place(dx: ext-x, dy: y, box(width: largeur-bande, height: hauteur-zone, fill: fond, clip: true)[
      #align(center + horizon)[
        #rotate(if impair { 90deg } else { -90deg })[
          #text(fill: txt, size: taille-tab-phase, weight: if actif { "bold" } else { "regular" })[#p.abrege]
        ]
      ]
    ])
  }

  // entête bord-à-bord (bord de reliure -> bord intérieur de la bande) -
  // soit l'entête d'une fiche (pictogramme+onglet / type+version), soit
  // l'entête générique d'une page transversale (libellé / version) - voir
  // rendre_entete_fiche vs rendre_entete_generique, rendu_livret.ipynb.
  // Bug réel corrigé (2026-09-17, repéré sur "Rôles et documents de la
  // cellule de crise" - onglet assez long pour rendre visible une largeur
  // de boîte fausse que des noms courts masquaient jusqu'ici) : sur une
  // page paire (verso), l'entête doit s'étendre du bord intérieur de la
  // bande (marge-exterieure) jusqu'au bord physique droit (page-w), pas
  // l'inverse - la formule reprenait par erreur celle de la BANDE, pas
  // celle de l'ENTÊTE.
  let hx0 = if impair { 0mm } else { marge-exterieure }
  let hx1 = if impair { page-w - marge-exterieure } else { page-w }
  place(dx: hx0, dy: marge-haut, box(width: hx1 - hx0, height: marge-haut-bande)[
    #align(bottom)[
      #set text(size: taille-entete-onglet)
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon))[
        #if onglet != none {
          box[#icons.pictogramme-categorie(onglet.pictogramme, couleur: couleur-bordure-entete) #h(2mm) #text(weight: "bold", fill: couleur-bordure-entete)[#upper(onglet.titre)]]
        } else {
          text(weight: "bold", fill: couleur-bordure-entete)[#upper(libelle-generique)]
        }
      ][
        #if onglet != none {
          text(size: taille-meta, fill: couleur-texte-attenue)[#ftype #linebreak() v#meta.version]
        } else {
          text(size: taille-meta, fill: couleur-texte-attenue)[Livret · v#meta.version]
        }
      ]
      #v(1.2mm)
      #line(length: 100%, stroke: 3pt + couleur-bordure-entete)
    ]
  ])
}

// N'utilise PAS etat-validation-pied (state) : un vrai bug rencontré à
// l'usage sur le corpus complet (48 fiches) - le texte "Validé le ..."
// d'une page affichait parfois la valeur de la fiche SUIVANTE plutôt que
// celle réellement affichée (état lu avant la mise à jour attendue, y
// compris en compilation complète - pas un souci d'aperçu). Remplacé par
// une recherche via query() sur le marqueur <fiche-entree> (authoring.typ)
// - même technique, déjà fiable, que le sommaire : on cherche la dernière
// fiche dont le marqueur précède ou est sur la page courante, et on lit
// SA date de validation directement, sans dépendre d'un ordre de mise à
// jour séquentiel.
#let dessiner-pied() = context {
  set text(size: taille-entete-onglet, fill: couleur-texte-attenue)
  let ici = here().page()
  let pertinente = none
  for e in query(<fiche-entree>) {
    if e.location().page() <= ici {
      pertinente = e
    }
  }
  let texte-validation = if pertinente != none {
    let vl = pertinente.value.at("valide-le", default: none)
    if vl != none { "Validé le " + vl } else { "" }
  } else { "" }
  grid(columns: (1fr, auto), align: (left, right))[
    #texte-validation
  ][
    #counter(page).display() / #counter(page).final().at(0)
  ]
}

// `set` a une portée de bloc en Typst : ce doit être un template englobant
// le reste du document (#show: configurer-page), pas une fonction appelée
// normalement - un appel normal aurait vu ses `set` s'éteindre à la fin de
// la fonction, sans jamais atteindre le contenu qui suit dans main.typ (bug
// réel rencontré au premier essai : fond/entête/pied/police absents).
#let configurer-page(corps) = {
  set page(
    width: page-w, height: page-h,
    margin: (
      inside: marge-reliure,
      outside: marge-exterieure + respiration,
      // Le texte du corps ne doit pas commencer sous l'entête, qui vit dans
      // le calque de fond (background) et ne participe donc pas au flux
      // normal - contrairement au HTML, où .entete était un vrai premier
      // enfant de .page et poussait le reste du contenu vers le bas tout
      // seul. marge_haut_bande_mm est déjà, dans le schéma existant,
      // l'espace réservé pour l'entête avant que la bande ne commence :
      // on le réutilise ici comme hauteur de l'entête plutôt que d'inventer
      // un réglage séparé (bug réel rencontré au 2e essai : titre et
      // entête superposés, l'un recouvrant l'autre).
      top: marge-haut + marge-haut-bande, bottom: marge-bas,
    ),
    binding: left,
    background: dessiner-fond(),
    footer: dessiner-pied(),
  )
  set text(font: ("Liberation Sans",), size: taille-corps, fill: couleur-texte)
  set par(leading: leading-paragraphe, spacing: espacement-paragraphe)
  corps
}

// Gabarit d'ÉDITION - à utiliser uniquement pour l'aperçu en direct pendant
// la rédaction (voir main-authoring-edition.typ), jamais pour produire le
// PDF final. Retire tout ce qui dépend de state()/context pour dessiner par
// page (bande de phase, en-tête miroir) : c'est précisément ce mécanisme
// qui s'est révélé mal recalculé par la recompilation incrémentale de
// l'aperçu Tinymist (constaté à l'usage - jamais faux en compilation
// complète `typst compile`, seulement dans l'aperçu live). Les fonctions de
// contenu (fiche(), groupe(), action()...) restent identiques et
// continuent d'appeler leurs etat-*.update() sans effet ici, puisqu'aucune
// page(background:) ne les lit dans ce gabarit - une seule fiche marche
// donc sans modification avec les deux gabarits.
#let configurer-page-edition(corps) = {
  set page(
    width: page-w, height: page-h,
    margin: 2cm,
    footer: context [
      #set text(size: taille-entete-onglet, fill: couleur-texte-attenue)
      #align(right)[#counter(page).display() / #counter(page).final().at(0)]
    ],
  )
  set text(font: ("Liberation Sans",), size: taille-corps, fill: couleur-texte)
  set par(leading: leading-paragraphe, spacing: espacement-paragraphe)
  corps
}

// --- sommaire (extrait) : une ligne = titre + points de suite + numéro de
// page, avec une pastille de phase (comme le "Sommaire par sujet", qui
// mélange plusieurs phases par onglet - voir CLAUDE.md). Le numéro de page
// est résolu via un compteur natif interrogé à l'endroit du label, pas via
// une chaîne CSS générée (target-counter) - le bug de compteur remis à zéro
// rencontré avec WeasyPrint n'a pas d'équivalent ici.
#let ligne-sommaire(titre, lbl, phase-slug) = context {
  let pastille = if phase-slug != none {
    box(fill: couleur-phase(phase-slug), inset: (x: 3pt, y: 1pt), radius: 2pt)[
      #text(size: 7pt, weight: "bold", fill: white)[#abrege-phase(phase-slug)]
    ]
  } else { none }
  block(above: 0.2em, below: 0.2em)[
    #link(label(lbl))[
      #pastille #h(4pt) #titre #h(1fr) #box(width: 1fr)[#repeat[.]] #h(4pt) #counter(page).at(label(lbl)).at(0)
    ]
  ]
}

// --- rendu complet d'une fiche : autant de pages physiques que nécessaire,
// coupées uniquement aux marqueurs saut_de_page choisis par l'auteur (voir
// _paginer_fiche) - le reflow NORMAL entre ces points est pris en charge
// nativement par la mise en page de Typst, sans mesure par dichotomie.
// IMPORTANT (bug réel rencontré à l'essai) : le calque de fond d'une page
// lit l'état tel qu'il était établi AVANT le saut de page qui y mène, pas
// après - Typst résout l'entête/le pied/le fond au moment où il détermine
// la mise en page de la page, ce qui précède le contenu que CETTE MÊME
// page va elle-même émettre. Une mise à jour d'état doit donc toujours être
// posée juste AVANT le `pagebreak()` qui ouvre la page concernée, jamais
// juste après. Pour une fiche, onglet/phase/type/validation ne changent
// jamais d'une page à l'autre : un seul appel avant le tout premier saut de
// page suffit, contrairement au réflexe "un update par page" qui semblait
// naturel en partant du modèle HTML statique (où chaque div de page
// portait directement ses propres valeurs).
#let preparer-etat-fiche(fiche, onglet) = {
  let valide = fiche.at("date_validation", default: none) != none and fiche.at("validateur", default: none) != none
  etat-phase.update(fiche.at("phase", default: none))
  etat-onglet.update(onglet)
  etat-type.update(fiche.type)
  etat-validation-pied.update(if valide { "Validé le " + fiche.date_validation } else { "" })
}

#let rendre-fiche(fiche, onglet) = {
  let items-ordonnes = reordonner-items(fiche.items)
  let segments = segmenter-sauts-de-page(items-ordonnes)
  let valide = fiche.at("date_validation", default: none) != none and fiche.at("validateur", default: none) != none

  for (i, seg) in segments.enumerate() {
    let suite = i > 0
    if suite { pagebreak() }
    box(width: 0pt, height: 0pt)[#metadata(none)#label("fiche-" + fiche.id + "-p" + str(i))]
    if i == 0 { box(width: 0pt, height: 0pt)[#metadata(none)#label("fiche-" + fiche.id)] }

    text(size: taille-titre-fiche, weight: "bold")[
      #fiche.titre
      #if suite { text(size: taille-meta, weight: "regular", fill: couleur-texte-attenue)[ (suite)] }
    ]
    v(0.3em)
    if not valide {
      block(fill: couleur-encart-danger-fond, inset: (x: 6pt, y: 3pt))[
        #text(fill: couleur-encart-danger-texte, weight: "bold", size: taille-validation)[⚠ Non validé — date et validateur manquants]
      ]
    }
    v(0.4em)
    rendre-items-segment(seg)
    if i == segments.len() - 1 {
      rendre-sources(fiche.at("references_sources", default: ()))
    }
  }
}
