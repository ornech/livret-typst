// Point d'entrée : assemble le livret complet à partir du manifeste
// généré par convert_corpus.py (data/manifeste.json - ordre : par phase
// chronologique, puis onglet, puis fiche, voir ce script). Compiler :
// typst compile --root . main.typ out/livret.pdf
#import "authoring.typ": *
#import "couverture.typ": couverture

// --- couverture : pas de bande de phase ni d'entête/pied (réglages de
// page par défaut, avant #show: configurer-page ci-dessous) - reste sur
// une seule page physique (recto uniquement). #pagebreak(to: "odd") force
// ensuite le passage à la prochaine page impaire : si la couverture
// occupe la page 1 (impaire), une page blanche est insérée en page 2
// (son verso) pour que rien ne s'imprime au dos de la couverture, et le
// sommaire démarre bien en page 3, elle aussi impaire.
#set page(width: page-w, height: page-h, margin: 2.5cm, numbering: none)
#couverture()
#pagebreak(to: "odd")
#counter(page).update(1)

#show: configurer-page

#let manifeste = json("data/manifeste.json")

#etat-onglet.update(none)
#etat-libelle-generique.update("Sommaire")
#etat-phase.update(none)
#etat-validation-pied.update("")

#pagebreak(weak: true, to: "odd")
#text(size: taille-titre-fiche, weight: "bold")[Sommaire]
#v(1em)
#construire-sommaire()

// --- second sommaire (retour utilisateur, 2026-09-17) : mêmes fiches,
// classées par type plutôt que par phase (voir construire-sommaire-par-type,
// authoring.typ).
#pagebreak(weak: true)
#etat-libelle-generique.update("Sommaire par type")
#text(size: taille-titre-fiche, weight: "bold")[Sommaire par type]
#v(1em)
#construire-sommaire-par-type()

#for chemin in manifeste [
  #include chemin
]
