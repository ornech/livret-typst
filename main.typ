// Point d'entrée : assemble le livret complet à partir du manifeste
// généré par convert_corpus.py (data/manifeste.json - ordre : par phase
// chronologique, puis onglet, puis fiche, voir ce script). Compiler :
// typst compile --root . main.typ out/livret.pdf
#import "authoring.typ": *
#import "couverture.typ": couverture
#import "glossaire.typ": glossaire
#import "bibliographie.typ": bibliographie
#import "avant-propos.typ": avant-propos

// Titre d'une page transversale (Sommaire, Glossaire, Bibliographie...) :
// un vrai heading de niveau 1 (pas juste du texte stylé), pour apparaître
// dans le panneau de signets/index du PDF au même rang que les phases
// (retour utilisateur, 2026-09-17) - portée du show/set limitée à ce bloc
// {}, ne doit pas s'appliquer aux headings des fiches #include-ées plus
// bas, qui posent déjà leur propre règle (voir fiche(), authoring.typ).
#let titre-page-transversale(txt) = {
  set heading(numbering: none)
  show heading.where(level: 1): it => text(size: taille-titre-fiche, weight: "bold")[#it.body]
  heading(level: 1)[#txt]
}

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

// IMPORTANT (voir fiche.typ, dessiner-fond) : le calque de fond d'une page
// lit l'état tel qu'il était établi AVANT le saut de page qui y mène, pas
// après - chaque etat-*.update() ci-dessous doit donc précéder le
// #pagebreak() de la page qu'il concerne, jamais le suivre (bug réel
// rencontré ici à l'essai : l'entête de "Sommaire par type" affichait
// encore le libellé "Sommaire", et celui du Glossaire affichait la bande
// de phase RETEX de la dernière fiche, tous deux mis à jour trop tard).
#etat-onglet.update(none)
#etat-phase.update(none)
#etat-validation-pied.update("")

// --- Avant-propos (registre narratif, charte §0) : front-matter, avant le
// Sommaire. Même mécanisme que Sommaire/Glossaire ci-dessous - pas de phase
// ni d'onglet actifs, libellé d'entête générique, vrai heading de niveau 1
// pour l'index du PDF (les sections 1 à 7 sont des headings de niveau 2/3,
// posés par avant-propos.typ). La numérotation de page continue celle du
// reste du livret (elle repart à 1 sur sa première page, juste après la
// couverture) : le "n / total" du pied et les numéros du sommaire restent
// cohérents.
// CONTRAINTE : l'Avant-propos doit compter un nombre PAIR de pages (12
// aujourd'hui). S'il en compte un nombre impair, le #pagebreak(to: "odd") du
// Sommaire insère une page blanche, et celle-ci porte alors l'entête
// "Sommaire" (l'état est déjà mis à jour à ce stade - même limite que pour
// le Glossaire, voir plus bas). À revérifier après toute retouche du texte.
#etat-libelle-generique.update("Avant-propos")
#pagebreak(weak: true, to: "odd")
#titre-page-transversale("Avant-propos")
#v(1em)
#avant-propos()

#etat-libelle-generique.update("Sommaire")
#pagebreak(weak: true, to: "odd")
#titre-page-transversale("Sommaire")
#v(1em)
#construire-sommaire()

// --- second sommaire (retour utilisateur, 2026-09-17) : mêmes fiches,
// classées par type plutôt que par phase (voir construire-sommaire-par-type,
// authoring.typ).
#etat-libelle-generique.update("Sommaire par type")
#pagebreak(weak: true)
#titre-page-transversale("Sommaire par type")
#v(1em)
#construire-sommaire-par-type()

#for chemin in manifeste [
  #include chemin
]

// --- annexes (retour utilisateur, 2026-09-17) : glossaire des acronymes/
// termes techniques (contenu authored, voir glossaire.typ) et bibliographie
// complète (dérivée de data/sources.json, voir bibliographie.typ) - deux
// pages transversales de plus, comme les sommaires : pas de phase, pas
// d'onglet (remis à none - la dernière fiche #include-ée plus haut les a
// laissés sur SA propre phase/onglet), mais un vrai heading de niveau 1
// pour apparaître dans l'index du PDF au même rang que "Sommaire"/les
// phases.
#etat-onglet.update(none)
#etat-phase.update(none)
#etat-libelle-generique.update("Glossaire")
#pagebreak(weak: true, to: "odd")
#titre-page-transversale("Glossaire")
#v(1em)
#glossaire()

#etat-libelle-generique.update("Bibliographie")
#pagebreak(weak: true, to: "odd")
#titre-page-transversale("Bibliographie")
#v(1em)
#bibliographie()
