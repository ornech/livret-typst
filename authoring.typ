// API d'auteur pour écrire une fiche DIRECTEMENT en Typst - alternative à
// la fiche pilotée par un tableau JSON `items[]` (voir fiche.typ, essai
// précédent). Réutilise les mêmes primitives visuelles (bande de phase,
// entête, couleurs/tailles de config_rendu.json) - seule la façon dont le
// CONTENU est saisi change : de vrai balisage Typst (gras/italique/listes
// natifs) plus quelques fonctions courtes pour le vocabulaire du projet,
// au lieu d'un formulaire Streamlit remplissant un objet JSON.
#import "config.typ": *
#import "icons.typ"
#import "markdown_lite.typ": md-inline, md-block
#import "fiche.typ": etat-phase, etat-onglet, etat-type, etat-validation-pied, etat-libelle-generique, configurer-page, configurer-page-edition, ligne-sommaire

#let ligne-justification(corps) = context {
  let base = text.fill
  set text(style: "italic", weight: "regular", fill: base.transparentize(28%))
  block(above: 0.35em, below: 0em)[Objectif : #corps]
}

// Un groupe (equivalent de items[].sous_phase) n'a plus de fonction dédiée
// depuis que les titres de section sont de vrais headings Typst (voir show
// heading.where(level: 2) dans fiche()) : `groupe("X")[corps]` ne faisait
// plus que `heading(level: 2)[X]` suivi de corps, donc un pur doublon de la
// syntaxe native `== X` - retiré (retour utilisateur, 2026-09-16). L'auteur
// écrit directement `== Nom du groupe` suivi du contenu, dans l'ordre
// voulu (plus besoin de règle de réordonnancement canonique, l'ordre du
// fichier EST l'ordre d'affichage) ; VS Code (Tinymist) en tire toujours le
// même plan de navigation cliquable, puisque `==` EST un heading niveau 2.

// Numérotation d'un groupe d'actions consécutives - à réinitialiser une
// fois avant chaque nouveau groupe (comme on redémarrerait une liste
// numérotée). Pas un champ à saisir : l'auteur ne gère que l'ordre.
#let compteur-action = counter("action-en-cours")
#let debut-actions() = compteur-action.update(0)

#let action(priorite: "obligatoire", responsable: none, justification: none, corps) = context {
  compteur-action.step()
  let n = compteur-action.get().at(0) + 1
  let (poids, style-txt) = if priorite == "obligatoire" { ("bold", "normal") }
    else if priorite == "secondaire" { ("regular", "italic") }
    else { ("regular", "normal") }
  let couleur-txt = if priorite == "secondaire" { rgb("#444444") } else { couleur-texte }
  // above/below à la moitié de espacement-paragraphe chacun (deux actions
  // consécutives cumulent les deux, retrouvant l'écart complet) - avant
  // 0.3em fixe, plus petit que l'interligne interne d'un paragraphe : deux
  // actions se touchaient visuellement plus que deux lignes d'un même
  // texte, hiérarchie inversée (bug réel signalé par l'utilisateur,
  // 2026-09-16).
  block(above: espacement-paragraphe, below: espacement-paragraphe)[
    #icons.pictogramme-priorite(priorite) #h(2pt)
    #if responsable != none [#text(weight: "bold")[[#upper(responsable)]] #h(2pt)]
    #n\. #h(1pt)
    #text(weight: poids, style: style-txt, fill: couleur-txt)[#corps]
    #if justification != none { ligne-justification(justification) }
  ]
}

#let encart(style, justification: none, corps) = {
  let (fond, txt) = if style == "note" {
    (couleur-encart-note-fond, couleur-encart-note-texte)
  } else if style == "attention" {
    (couleur-encart-attention-fond, couleur-encart-attention-texte)
  } else {
    (couleur-encart-danger-fond, couleur-encart-danger-texte)
  }
  block(fill: fond, inset: 6pt, width: 100%, above: espacement-encart, below: espacement-encart)[
    #set text(fill: txt, weight: "bold")
    #icones-encart.at(style) #h(3pt) #corps
    #if justification != none { ligne-justification(justification) }
  ]
}
#let note(justification: none, corps) = encart("note", justification: justification, corps)
#let attention(justification: none, corps) = encart("attention", justification: justification, corps)
#let avertissement(justification: none, corps) = encart("avertissement", justification: justification, corps)

// --- Syntaxe courte : blocs ``` détournés (retour utilisateur, 2026-09-16 :
// "#action(priorite: ..., responsable: ...)[...] c'est issu de mon ancienne
// technologie [JSON], remplaçable par des balises ```:warning") - Typst
// tokenise déjà les blocs ``` comme du texte brut (raw), sans qu'on ait
// besoin d'écrire un parseur : une seule règle `show raw` (posée dans
// fiche(), voir plus bas) redirige les blocs dont l'étiquette de langage
// correspond à un style connu vers action()/encart(), et laisse tous les
// autres blocs ``` se comporter normalement (bloc de code, ex :
// ```python). Deux conventions à l'intérieur du texte brut, pour rester
// aussi proches que possible de ce que produit déjà le rendu :
//   - une éventuelle ligne "[Rôle] reste du texte" en tête → rôle
//     responsable, exactement le préfixe déjà affiché sur une action ;
//   - un paragraphe séparé par une ligne vide → justification (le
//     "pourquoi"), déjà un concept Markdown standard (nouveau paragraphe).
// Limite assumée : le texte d'un bloc ``` est brut, pas interprété comme
// balisage Typst - repassé ici par md-block/md-inline (déjà écrit pour le
// 1er essai) pour retrouver gras/italique/liens.
#let priorites-valides = ("obligatoire", "differable", "secondaire")
#let encarts-valides = ("note", "attention", "avertissement")

#let extraire-role(texte) = {
  let m = texte.match(regex("^\[([^\]]+)\]\s*"))
  if m != none {
    (role: m.captures.at(0), reste: texte.slice(m.end))
  } else {
    (role: none, reste: texte)
  }
}

// Un bloc ``` garde ses retours à la ligne internes tels quels (texte
// brut) - contrairement au balisage Typst normal, où une seule fin de
// ligne compte comme un espace (le texte se justifie). On reproduit ce
// comportement "un seul \n = espace" à la main (retour à la ligne dans le
// FICHIER SOURCE, juste pour la lisibilité en l'éditant - pas une fin de
// paragraphe voulue), pour ne pas casser la justification en lignes figées
// correspondant au découpage arbitraire du fichier .typ.
#let normaliser-paragraphe(p) = p.split("\n").map(l => l.trim()).join(" ")

#let separer-justification(texte) = {
  let parts = texte.trim().split("\n\n").map(normaliser-paragraphe)
  if parts.len() > 1 {
    (principal: parts.at(0), justification: parts.slice(1).join(" "))
  } else {
    (principal: parts.at(0), justification: none)
  }
}

// Style "texte" (paragraphe libre, pas de puce) explicitement passé par un
// bloc ``` lui aussi - nécessaire pour le corpus réel converti depuis le
// JSON : ces items contiennent déjà du Markdown (**gras**, *italique*)
// saisi du temps du pipeline WeasyPrint, avec la même convention que
// md-inline/md-block ici - mais AUSSI potentiellement des caractères
// spéciaux Typst (#, [, ], _, *) qui casseraient un balisage natif. Un bloc
// ``` les neutralise tous d'un coup (texte brut), pas de règle
// d'échappement à écrire fiche par fiche.
#let rendre-texte-brut(texte, justification) = block(above: espacement-paragraphe, below: espacement-paragraphe)[
  #md-block(texte)
  #if justification != none { ligne-justification(justification) }
]

#let show-raw-fiche(it) = {
  set text(font: ("Liberation Sans",), size: taille-corps, fill: couleur-texte)
  if it.lang in priorites-valides {
    let extrait = extraire-role(it.text)
    let coupe = separer-justification(extrait.reste)
    action(priorite: it.lang, responsable: extrait.role, justification: coupe.justification, md-inline(coupe.principal))
  } else if it.lang in encarts-valides {
    let coupe = separer-justification(it.text)
    encart(it.lang, justification: coupe.justification, md-inline(coupe.principal))
  } else if it.lang == "texte" {
    let coupe = separer-justification(it.text)
    rendre-texte-brut(coupe.principal, coupe.justification)
  } else {
    it
  }
}

// --- Fiches liées (items[].fiches_liees côté JSON) : renvois croisés en
// fin de fiche. Le titre de la fiche visée est résolu et écrit UNE FOIS,
// au moment de la conversion depuis le JSON (voir convert_corpus.py) -
// pas de requête inter-fichiers à l'exécution, chaque .typ reste
// autonome. Chaque entrée : (id, titre).
// Le lien reste tolérant si la fiche visée n'est pas dans CETTE
// compilation (ex : aperçu allégé d'une seule fiche, voir
// main-edition.typ) - un lien Typst vers un label absent est une erreur
// fatale, pas juste un lien mort ; on vérifie d'abord son existence
// (query) et on retombe sur du texte simple sinon.
#let fiches-liees(entrees) = if entrees.len() > 0 {
  block(above: espacement-paragraphe)[
    #text(weight: "bold", size: taille-bloc-titre, fill: couleur-bordure-entete)[FICHES LIÉES]
    #for (id, titre) in entrees [
      #context {
        let cible = label("fiche-" + id)
        let existe = query(cible).len() > 0
        block(above: 0.2em, below: 0.2em)[
          #if existe { link(cible)[#titre] } else { titre }
        ]
      }
    ]
  ]
}

// --- Essai (abandonné) de syntaxe façon GitHub (`> [!WARNING] ...`), à la
// demande explicite de l'utilisateur pour comparer avec les blocs ```
// ci-dessus. Rejeté après test, pour une raison de fond et pas un simple
// bug à corriger : en dehors d'un bloc ``` (texte brut), Typst fusionne
// déjà les retours à la ligne simples en espaces AVANT qu'une règle `show`
// ne voie le texte (comportement normal du balisage, comme un saut de
// ligne "mou" en Markdown) - `it.text` d'une correspondance `show regex()`
// ne contient donc plus aucun `\n`, vérifié directement (un bloc de 2
// lignes produit `it.text` sur une seule "ligne" logique). Conséquence :
// impossible de distinguer de façon fiable une ligne "> " de continuation
// d'une ligne "> " vide censée marquer un changement de paragraphe
// (justification) - les deux finissent en simples "> " noyés dans le
// texte. Ce n'est pas un problème de regex (le lookahead manquant, déjà
// identifié séparément, n'est pas en cause ici) : c'est une perte
// d'information du modèle de texte de Typst pour du contenu hors bloc brut.
// Les blocs ``` restent donc la seule syntaxe courte retenue - c'est
// justement PARCE qu'ils préservent le texte tel quel que
// show-raw-fiche (ci-dessus) fonctionne correctement.

// --- sources : une clé -> texte APA déjà formaté (data/sources.json),
// citée ici avec sa page précise pour CETTE fiche - le texte n'est saisi
// qu'une fois, jamais recopié sur chaque fiche qui le cite.
//
// Format simplifié (dict plat clé -> chaîne), PAS Hayagriva structuré
// (auteur/titre/année séparés) : le corpus réel (48 fiches JSON
// converties, voir convert_corpus.py) ne porte que des références déjà
// formatées en une seule chaîne APA (`references_sources[].reference`),
// jamais décomposées en champs - les redécomposer à l'automatique aurait
// été fragile pour un gain net nul (le rendu final est le même texte).
// N'utilise PAS #cite()/#bibliography() : un essai avec la vraie API de
// citation Typst (#cite(label(cle), form: "prose") dans une box 0×0
// clip: true, pour récupérer le texte APA sans afficher de citation
// visible) a provoqué un vrai bug de mise en page - un espace vide de
// plusieurs centimètres avant le bloc Sources, reproduit de façon fiable
// en compilation batch (`typst compile`, rien à voir avec l'aperçu en
// direct de l'éditeur).
#let sources-data = json("data/sources.json")

#let formater-reference-apa(cle) = md-inline(sources-data.at(cle))

#let sources-citees = state("sources-citees", ())

#let source(cle, page: none, verifie_le: none, verifie_par: none) = {
  sources-citees.update(l => l + ((cle: cle, page: page, verifie_le: verifie_le, verifie_par: verifie_par),))
}

#let imprimer-sources() = context {
  let liste = sources-citees.get()
  if liste.len() == 0 {
    block(above: espacement-blocs)[
      #block(fill: couleur-encart-attention-fond, inset: (x: 6pt, y: 3pt))[
        #text(fill: couleur-encart-attention-texte, weight: "bold")[⚠ Aucune référence source renseignée pour cette fiche]
      ]
    ]
  } else {
    block(above: espacement-blocs)[
      #text(weight: "bold", size: taille-bloc-titre, fill: couleur-bordure-entete)[SOURCES]
      #for s in liste [
        #block(above: 0.2em, below: 0.2em)[
          #set text(size: taille-source)
          #formater-reference-apa(s.cle)
          #set text(style: "italic")
          #if s.page != none [ #s.page.]
          #h(4pt)
          #if s.verifie_le != none [
            #text(fill: couleur-texte-attenue)[· Vérifié le #s.verifie_le par #s.verifie_par]
          ] else [
            #box(fill: couleur-encart-attention-fond, inset: (x: 3pt, y: 1pt), radius: 2pt)[
              #text(style: "normal", weight: "bold", fill: couleur-encart-attention-texte)[⚠ Non vérifiée]
            ]
          ]
        ]
      ]
    ]
  }
}

// Libellés affichés pour chaque type de fiche (format.json, enum type) -
// oublié dans le 1er jet de fiche() (qui affichait la valeur JSON brute,
// ex : "fiche_reflexe", dans l'en-tête) - repéré en préparant la conversion
// des 48 fiches réelles, où les 5 types apparaissent tous.
#let type-labels = (
  fiche_reflexe: "Fiche réflexe",
  fiche_role: "Fiche rôle",
  fiche_communication: "Fiche communication",
  checklist: "Checklist",
  diagnostic: "Diagnostic",
)

// --- enveloppe d'une fiche : pose l'état (bande/entête/pied) puis le titre
// + l'avertissement "non validée" éventuel, exactement comme rendre-fiche
// dans fiche.typ mais pour un contenu écrit à la main plutôt que généré
// depuis un tableau JSON.
#let fiche(id: none, type: "fiche_reflexe", phase: none, onglet: none, titre: none, date_validation: none, validateur: none, corps) = {
  let valide = date_validation != none and validateur != none
  etat-phase.update(phase)
  etat-onglet.update(onglet)
  etat-type.update(type-labels.at(type, default: type))
  etat-validation-pied.update(if valide { "Validé le " + date_validation } else { "" })
  pagebreak(weak: true)

  // Titre de fiche (niveau 1) et titres de groupe (niveau 2) restent des
  // headings Typst réels - pour l'apparence imprimée (voir show ci-dessous)
  // ET pour le plan de navigation VS Code (voir groupe() plus haut).
  set heading(numbering: none)
  show heading.where(level: 1): it => text(size: taille-titre-fiche, weight: "bold")[#it.body]
  show heading.where(level: 2): it => block(above: 0.5em, below: 0.1em)[
    #text(weight: "bold", size: taille-bloc-titre, fill: couleur-bordure-entete)[#it.body]
  ]
  show raw.where(block: true): show-raw-fiche

  box(width: 0pt, height: 0pt)[#metadata(none)#label("fiche-" + id)]
  // Marqueur partagé (même label sur toutes les fiches) - permet à
  // construire-sommaire() de retrouver TOUTES les fiches du document par
  // simple requête (query), dans l'ordre où elles apparaissent, sans liste
  // séparée à tenir à jour à la main : réorganiser = juste changer l'ordre
  // des #include dans le fichier principal, le sommaire suit tout seul.
  [#metadata((id: id, titre: titre, phase: phase, type: type, valide-le: if valide { date_validation } else { none })) <fiche-entree>]
  heading(level: 1)[#titre]
  v(0.3em)
  if not valide {
    block(fill: couleur-encart-danger-fond, inset: (x: 6pt, y: 3pt))[
      #text(fill: couleur-encart-danger-texte, weight: "bold", size: taille-validation)[⚠ Non validé — date et validateur manquants]
    ]
  }
  v(0.4em)
  corps
}

// Sommaire ENTIÈREMENT dérivé de l'ordre d'apparition des fiches dans le
// document (via query() sur le marqueur <fiche-entree> posé par fiche()) -
// aucune liste de titres/phases à saisir ou tenir à jour séparément.
// Réorganiser les fiches (changer l'ordre des #include dans le fichier
// principal) change donc le sommaire automatiquement, sans autre action.
#let ligne-sommaire-fiche(d, page) = {
  let pastille = if d.phase != none {
    box(fill: couleur-phase(d.phase), inset: (x: 3pt, y: 1pt), radius: 2pt)[
      #text(size: 7pt, weight: "bold", fill: white)[#abrege-phase(d.phase)]
    ]
  } else { none }
  block(above: 0.2em, below: 0.2em)[
    #link(label("fiche-" + d.id))[
      #pastille #h(4pt) #d.titre #h(1fr) #box(width: 1fr)[#repeat[.]] #h(4pt) #page
    ]
  ]
}

#let construire-sommaire() = context {
  let entrees = query(<fiche-entree>)
  for e in entrees {
    let d = e.value
    let page = counter(page).at(e.location()).at(0)
    ligne-sommaire-fiche(d, page)
  }
}

// --- second sommaire (retour utilisateur, 2026-09-17) : mêmes fiches,
// mais regroupées par type de fiche (fiche_reflexe, fiche_role...) plutôt
// que par phase chronologique - une classification transversale, utile
// pour retrouver par exemple toutes les checklists sans connaître leur
// phase. Ordre des groupes fixé par ordre-types (pas alphabétique, ni
// l'ordre d'apparition dans le document) ; à l'intérieur d'un groupe, les
// fiches restent dans leur ordre d'apparition (celui du manifeste).
#let ordre-types = ("fiche_reflexe", "fiche_role", "fiche_communication", "checklist", "diagnostic")

#let construire-sommaire-par-type() = context {
  let entrees = query(<fiche-entree>)
  for t in ordre-types {
    let groupe = entrees.filter(e => e.value.type == t)
    if groupe.len() == 0 { continue }
    block(above: 0.8em, below: 0.3em)[
      #text(weight: "bold", size: taille-bloc-titre, fill: couleur-bordure-entete)[#upper(type-labels.at(t, default: t))]
    ]
    for e in groupe {
      let d = e.value
      let page = counter(page).at(e.location()).at(0)
      ligne-sommaire-fiche(d, page)
    }
  }
}
