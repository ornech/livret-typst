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

// Case à cocher dessinée (pas un glyphe Unicode ☐, dont l'alignement
// vertical dépend de la police) - fonction séparée de action(), pas une
// modification de action() elle-même : action()/```obligatoire``` etc.
// gardent leur icône de priorité (●/◐/○), déjà utilisée par les fiches
// existantes du corpus (ex. "Rassembler et préserver les preuves") - les
// remplacer aurait fait perdre le codage de priorité sur tout le corpus
// déjà écrit, silencieusement, pour un besoin propre aux fiches de type
// checklist/canevas opérationnel (cases à cocher au stylo, cf. cadrage
// §IX).
#let taille-case = 0.85em
#let dessiner-case = box(
  width: taille-case, height: taille-case,
  stroke: 0.7pt + couleur-texte,
  radius: 1pt,
  baseline: 15%, // ajuster visuellement si besoin, recale la case sur la ligne de base du texte
)

// Grille à colonnes fixes (case, taquet, texte) : le texte démarre toujours
// à la même position horizontale, quelle que soit la longueur d'un
// [RESPONSABLE] éventuel - contrairement à une case suivie d'un espace
// simple, qui décale le texte selon la longueur du préfixe.
#let action-case(responsable: none, justification: none, corps) = block(above: espacement-paragraphe, below: espacement-paragraphe)[
  #grid(
    columns: (taille-case, 6pt, 1fr),
    align: (horizon, horizon, top),
    dessiner-case, [],
    [
      #if responsable != none [#text(weight: "bold")[[#upper(responsable)]] #h(2pt)]
      #corps
      #if justification != none { ligne-justification(justification) }
    ]
  )
]

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
  } else if it.lang == "case" {
    let extrait = extraire-role(it.text)
    let coupe = separer-justification(extrait.reste)
    action-case(responsable: extrait.role, justification: coupe.justification, md-inline(coupe.principal))
  } else if it.lang == "texte" {
    let coupe = separer-justification(it.text)
    rendre-texte-brut(coupe.principal, coupe.justification)
  } else {
    it
  }
}

// Une ligne de sommaire (pastille de phase + titre + points de suite +
// numéro de page) - réutilisée par construire-sommaire/-par-type ci-dessous
// ET par fiches-liees (voir plus bas) : un renvoi croisé en fin de fiche
// mérite le même numéro de page, pas seulement un lien cliquable (retour
// utilisateur, 2026-09-17 - un lecteur qui feuillette le PAPIER, sans
// cliquer, doit pouvoir retrouver la fiche visée directement).
#let ligne-sommaire-fiche(d, page) = {
  let pastille = if d.phase != none {
    box(fill: couleur-phase(d.phase), inset: (x: 3pt, y: 1pt), radius: 2pt)[
      #text(size: 7pt, weight: "bold", fill: white)[#abrege-phase(d.phase)]
    ]
  } else { none }
  block(above: 0.2em, below: 0.2em)[
    #link(label("fiche-" + d.id))[
      // Un seul espace flexible (1fr) rempli de points - PAS un #h(1fr) en
      // plus du box(width:1fr) : les deux, mis côte à côte, se partageaient
      // l'espace flexible en deux moitiés égales (un blanc invisible PUIS
      // les points), d'où des points qui démarraient à des endroits
      // différents d'une ligne à l'autre selon la longueur du titre - pas
      // une ligne de points continue jusqu'au numéro de page (bug réel
      // constaté sur le PDF rendu, retour utilisateur, 2026-09-17).
      #pastille #h(4pt) #d.titre #box(width: 1fr)[#repeat[.]] #h(4pt) #page
    ]
  ]
}

// --- Pied de fiche (FICHES LIÉES + SOURCES) : les deux ne s'affichent plus
// à la suite normale du texte, dans le flux de la fiche - retour
// utilisateur, 2026-09-17, ils doivent se retrouver ensemble, en bas de la
// DERNIÈRE page physique de la fiche, dans une police plus petite et en
// italique (registre "note de bas de page", visuellement détaché du corps).
// fiches-liees() et imprimer-sources() ne dessinent donc plus rien
// directement à l'endroit où elles sont appelées : elles empilent leur
// contenu déjà mis en forme dans cet état, et fiche() (plus bas) le relit
// UNE FOIS après tout `corps`, pousse le tout vers le bas de page avec
// v(1fr) et applique la police réduite + italique - peu importe l'ordre où
// l'auteur de la fiche appelle les deux fonctions.
#let pied-fiche = state("pied-fiche", ())

// --- Fiches liées (items[].fiches_liees côté JSON) : renvois croisés en
// fin de fiche. Le titre de la fiche visée est résolu et écrit UNE FOIS,
// au moment de la conversion depuis le JSON (voir convert_corpus.py) -
// pas de requête inter-fichiers à l'exécution, chaque .typ reste
// autonome. Chaque entrée : (id, titre).
// Numéro de page (retour utilisateur, 2026-09-17 : un simple lien, sans
// numéro, ne suffit pas pour un lecteur qui feuillette le PAPIER plutôt que
// de cliquer) : on réutilise ligne-sommaire-fiche (même pastille de phase +
// points de suite + numéro que le sommaire) plutôt qu'inventer une seconde
// mise en forme pour la même information. Le numéro et la phase viennent du
// marqueur <fiche-entree> de la fiche visée (posé par fiche()) - retrouvé
// par son id, pas recalculé.
// Le lien reste tolérant si la fiche visée n'est pas dans CETTE
// compilation (ex : aperçu allégé d'une seule fiche, voir
// main-edition.typ) - une fiche non trouvée retombe sur du texte simple,
// sans numéro ni lien, plutôt qu'une erreur fatale (lien Typst vers un
// label absent).
#let fiches-liees(entrees) = if entrees.len() > 0 {
  pied-fiche.update(l => l + (block(above: espacement-paragraphe)[
    #text(weight: "bold", size: taille-bloc-titre, fill: couleur-bordure-entete)[FICHES LIÉES]
    #for (id, titre) in entrees {
      context {
        let cibles = query(<fiche-entree>).filter(e => e.value.id == id)
        if cibles.len() > 0 {
          let e = cibles.first()
          let page = counter(page).at(e.location()).at(0)
          ligne-sommaire-fiche(e.value, page)
        } else {
          block(above: 0.2em, below: 0.2em)[#titre]
        }
      }
    }
  ],))
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

// Date de validation d'une fiche (voir fiche() plus bas) : générée par
// build.sh à partir du dernier commit git touchant chaque fichier
// fiches-typ/<onglet>/<id>.typ - PAS saisie à la main. Typst n'a aucun
// accès à l'historique git ou aux métadonnées du système de fichiers
// (sandbox volontaire du langage), d'où ce fichier intermédiaire régénéré
// à chaque compilation (voir data/dates-fiches.json, .gitignore).
#let dates-fiches = json("data/dates-fiches.json")

#let formater-reference-apa(cle) = md-inline(sources-data.at(cle))

#let sources-citees = state("sources-citees", ())

#let source(cle, page: none, verifie_le: none, verifie_par: none) = {
  sources-citees.update(l => l + ((cle: cle, page: page, verifie_le: verifie_le, verifie_par: verifie_par),))
}

#let imprimer-sources() = context {
  let liste = sources-citees.get()
  let bloc = if liste.len() == 0 {
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
  pied-fiche.update(l => l + (bloc,))
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

// Dernière phase pour laquelle un repère a déjà été inséré dans le plan/
// index du PDF (voir plus bas, fiche()) - permet de n'insérer ce repère
// qu'UNE FOIS par phase, à sa première apparition, plutôt qu'à chaque
// fiche (retour utilisateur, 2026-09-17 : l'index doit classer les fiches
// PAR PHASE, un niveau de plus que le simple "fiche -> ses groupes"
// existant). Repose sur le fait que le manifeste (data/manifeste.json)
// liste déjà les fiches groupées par phase chronologique (voir main.typ) -
// un repère par CHANGEMENT de phase suffit, pas de tri à refaire ici.
#let etat-derniere-phase-affichee = state("derniere-phase-affichee", none)

// --- enveloppe d'une fiche : pose l'état (bande/entête/pied) puis le titre
// + l'avertissement "non validée" éventuel, exactement comme rendre-fiche
// dans fiche.typ mais pour un contenu écrit à la main plutôt que généré
// depuis un tableau JSON.
// Validation (retour utilisateur, 2026-09-17) : plus de date_validation
// saisie à la main - une fiche est validée dès que `validateur` est
// renseigné, la date affichée vient automatiquement de dates-fiches (voir
// plus haut, alimentée par build.sh depuis git). Pour repasser une fiche
// en "non validé", il suffit de retirer son paramètre `validateur:` -
// aucun champ séparé à effacer/re-remplir en plus.
#let fiche(id: none, type: "fiche_reflexe", phase: none, onglet: none, titre: none, validateur: none, corps) = {
  let valide = validateur != none
  let date-validation = dates-fiches.at(id, default: none)
  etat-phase.update(phase)
  etat-onglet.update(onglet)
  etat-type.update(type-labels.at(type, default: type))
  etat-validation-pied.update(if valide { "Validé le " + date-validation } else { "" })
  // sources-citees est un state() GLOBAL (un seul par document, pas un par
  // fiche) - sans ce reset, imprimer-sources() (appelée en fin de CETTE
  // fiche) lit la liste cumulée depuis la fiche 1, pas seulement les
  // #source() de cette fiche : bug réel constaté sur le PDF rendu (retour
  // utilisateur, 2026-09-17) - le nombre de sources affichées croissait
  // fiche après fiche (jusqu'à 32 sur une seule fiche, alors que le corpus
  // entier ne compte que 55 citations au total) au lieu de rester propre à
  // chaque fiche.
  sources-citees.update(())
  // Même état GLOBAL, même besoin de reset à chaque fiche - voir pied-fiche
  // ci-dessus (authoring.typ) : FICHES LIÉES et SOURCES s'y empilent au fil
  // de `corps`, puis sont relues et affichées ensemble, en bas de page,
  // juste après `corps` (voir plus bas).
  pied-fiche.update(())
  pagebreak(weak: true)

  // Titre de fiche (niveau 2) et titres de groupe (niveau 3, via offset -
  // voir plus bas) restent des headings Typst réels - pour l'apparence
  // imprimée (voir show ci-dessous) ET pour le plan de navigation VS Code
  // (voir groupe() plus haut) ET pour l'index/signets du PDF (voir repère
  // de phase ci-dessous, niveau 1 - un rang plus haut que le titre de
  // fiche, pour que l'index classe les fiches PAR PHASE). offset: 1
  // décale UNIQUEMENT les headings écrits en syntaxe `==` (donc les
  // groupes) - PAS les appels heading(level: ...) explicites ci-dessous
  // (titre, repère de phase), qui restent à leur niveau littéral : need de
  // relire tous les fichiers fiches-typ/ pour ce changement.
  // Un seul rythme vertical pour tout le contenu de la fiche qui n'est PAS
  // déjà géré par action()/encart()/rendre-texte-brut() (qui posent leurs
  // propres above/below explicites, prioritaires sur ce set ambiant) -
  // ferme le troisième cas resté sans réglage : paragraphes/listes Typst
  // natifs écrits directement dans `corps`, hors des blocs ``` de l'API
  // courte. Pas de marker: [] ici - garder la puce par défaut de list(),
  // sous peine de la faire disparaître silencieusement sur toutes les
  // fiches du projet qui écrivent des listes natives.
  set par(leading: 0.65em, spacing: espacement-paragraphe)
  set block(spacing: espacement-paragraphe)
  set list(spacing: espacement-paragraphe, indent: 1em)
  set enum(spacing: espacement-paragraphe, indent: 1em)
  set heading(numbering: none, offset: 1)
  show heading.where(level: 1): it => []
  show heading.where(level: 2): it => text(size: taille-titre-fiche, weight: "bold")[#it.body]
  show heading.where(level: 3): it => block(above: 0.5em, below: 0.1em)[
    #text(weight: "bold", size: taille-bloc-titre, fill: couleur-bordure-entete)[#it.body]
  ]
  show raw.where(block: true): show-raw-fiche

  // Repère de phase (niveau 1, invisible - show heading.where(level:1) ci-
  // dessus le réduit à rien à l'impression) : n'apparaît QUE dans le plan/
  // index du PDF, comme parent de toutes les fiches de cette phase, tant
  // que la phase ne change pas.
  context {
    if phase != none and etat-derniere-phase-affichee.get() != phase {
      heading(level: 1)[#libelle-phase(phase)]
    }
  }
  etat-derniere-phase-affichee.update(phase)

  box(width: 0pt, height: 0pt)[#metadata(none)#label("fiche-" + id)]
  // Marqueur partagé (même label sur toutes les fiches) - permet à
  // construire-sommaire() de retrouver TOUTES les fiches du document par
  // simple requête (query), dans l'ordre où elles apparaissent, sans liste
  // séparée à tenir à jour à la main : réorganiser = juste changer l'ordre
  // des #include dans le fichier principal, le sommaire suit tout seul.
  [#metadata((id: id, titre: titre, phase: phase, type: type, valide-le: if valide { date-validation } else { none })) <fiche-entree>]
  heading(level: 2)[#titre]
  v(0.3em)
  if not valide {
    block(fill: couleur-encart-danger-fond, inset: (x: 6pt, y: 3pt))[
      #text(fill: couleur-encart-danger-texte, weight: "bold", size: taille-validation)[⚠ Non validé — relecture non effectuée]
    ]
  }
  v(0.4em)
  corps

  // FICHES LIÉES + SOURCES, ensemble, poussées en bas de la DERNIÈRE page
  // physique de la fiche (v(1fr) consomme l'espace restant sur cette
  // page), dans une police réduite et en italique - registre "note de bas
  // de page", détaché visuellement du corps plutôt qu'une simple suite du
  // texte (retour utilisateur, 2026-09-17). Les styles explicites posés
  // plus haut dans ces blocs (ex : text(style: "normal", ...) des badges
  // "Non vérifiée") restent prioritaires sur cet ambiant italique - seul le
  // texte qui n'impose pas déjà son propre style en hérite.
  context {
    let items = pied-fiche.get()
    if items.len() > 0 {
      // place(bottom, float: true) plutôt que v(1fr) (essai précédent) :
      // v(1fr) ne pousse le bloc en bas que s'il tient ENTIÈREMENT dans
      // l'espace restant de la page courante - sinon Typst le fait
      // déborder sur une page neuve, mais démarré en HAUT de cette
      // nouvelle page (pas en bas) : bug réel constaté sur le PDF rendu
      // (une fiche assez longue laissait alors SOURCES seule, orpheline en
      // haut d'une page quasi vide, alors que FICHES LIÉES restait en bas
      // de la page précédente). Un flottant "bottom" se reporte lui aussi
      // sur la page suivante si besoin, mais reste ancré à SON bas -
      // exactement le comportement voulu, quelle que soit la longueur du
      // corps de la fiche.
      place(bottom, float: true, block(width: 100%)[
        #set text(size: 0.85 * taille-corps, style: "italic")
        #for it in items { it }
      ])
    }
  }
}

// Sommaire ENTIÈREMENT dérivé de l'ordre d'apparition des fiches dans le
// document (via query() sur le marqueur <fiche-entree> posé par fiche()) -
// aucune liste de titres/phases à saisir ou tenir à jour séparément.
// Réorganiser les fiches (changer l'ordre des #include dans le fichier
// principal) change donc le sommaire automatiquement, sans autre action.
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
