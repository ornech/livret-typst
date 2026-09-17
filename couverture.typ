// Page de couverture (retour utilisateur, 2026-09-17 : absente du rendu -
// voir README.md "Ce qui N'est PAS couvert"). Hors gabarit standard : pas
// de bande de phase ni d'entête/pied de page - une mise en page dédiée,
// appelée depuis main.typ AVANT #show: configurer-page. Reste sur une
// seule page physique (recto) : main.typ force ensuite un passage à la
// prochaine page impaire, pour ne jamais imprimer de contenu à son dos.
#import "config.typ": *

#let couverture() = {
  set align(center)
  set text(fill: couleur-texte)

  v(1fr)

  // Bandeau des 3 grandes étapes du livret (Avant crise / Crise / Après
  // crise) - même palette que la bande de phase des pages intérieures,
  // pour identifier visuellement le document dès la couverture.
  grid(columns: (1fr, 1fr, 1fr), rows: 6mm, gutter: 0pt,
    rect(width: 100%, height: 100%, stroke: none, fill: rgb(cfg.groupes_couleurs.at("Avant crise"))),
    rect(width: 100%, height: 100%, stroke: none, fill: rgb(cfg.groupes_couleurs.at("Crise"))),
    rect(width: 100%, height: 100%, stroke: none, fill: rgb(cfg.groupes_couleurs.at("Après crise"))),
  )

  v(3cm)
  text(size: 32pt, weight: "bold")[#meta.titre]

  v(1fr)

  text(size: taille-meta, fill: couleur-texte-attenue)[
    Version #meta.version #linebreak()
    Mise à jour le #meta.date_maj
    #if meta.auteur != "" [ #linebreak() #meta.auteur]
    #if meta.organisation != "" [ · #meta.organisation]
  ]

  v(2cm)
}
