// Point d'entrée : assemble le livret complet à partir du manifeste
// généré par convert_corpus.py (data/manifeste.json - ordre : par phase
// chronologique, puis onglet, puis fiche, voir ce script). Compiler :
// typst compile --root . main.typ out/livret.pdf
#import "authoring.typ": *

#show: configurer-page

#let manifeste = json("data/manifeste.json")

#etat-onglet.update(none)
#etat-libelle-generique.update("Sommaire")
#etat-phase.update(none)
#etat-validation-pied.update("")

#text(size: taille-titre-fiche, weight: "bold")[Sommaire]
#v(1em)
#construire-sommaire()

#for chemin in manifeste [
  #include chemin
]
