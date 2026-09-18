// Bibliographie complète - annexe demandée par l'utilisateur (2026-09-17),
// à la fin du livret. Contrairement au glossaire (contenu authored),
// cette page est ENTIÈREMENT dérivée de data/sources.json - la même liste
// dédupliquée déjà utilisée pour le bloc SOURCES de chaque fiche (voir
// authoring.typ, formater-reference-apa) - aucune référence saisie une
// seconde fois : les 41 documents uniques cités dans tout le corpus,
// triés alphabétiquement, comme une bibliographie classique.
#import "config.typ": *
#import "markdown_lite.typ": md-inline

#let sources-data = json("data/sources.json")

#let bibliographie() = {
  let references = sources-data.values().sorted()
  for ref in references {
    block(above: 0.4em, below: 0.4em)[
      #set text(size: taille-source)
      #md-inline(ref)
    ]
  }
}
