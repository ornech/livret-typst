// Pictogrammes vectoriels natifs Typst (circle/polygon/box) - equivalent du
// generateur de SVG en ligne (svg_pictogramme/svg_priorite) de
// rendu_livret.ipynb, mais en primitives de dessin du moteur plutot qu'en
// chaines SVG construites a la main.

#let pictogramme-categorie(cle, taille: 3.2mm, couleur: black) = {
  let c = taille / 2
  box(width: taille, height: taille)[
    #if cle == "losange" {
      place(center + horizon, rotate(45deg, square(size: taille * 0.72, fill: couleur)))
    } else if cle == "cercle" {
      place(center + horizon, circle(radius: c, fill: couleur))
    } else if cle == "carre" {
      place(center + horizon, square(size: taille * 0.85, fill: couleur))
    } else if cle == "triangle" {
      place(center + horizon, polygon(fill: couleur, (c, 0mm), (taille, taille), (0mm, taille)))
    } else {
      place(center + horizon, circle(radius: c, fill: couleur))
    }
  ]
}

// Priorite d'une action : rond plein (obligatoire), rond mi-plein
// (differable), rond vide (secondaire) - meme code que
// PRIORITE_MARQUES/svg_priorite, en formes natives.
#let pictogramme-priorite(cle, taille: 2.6mm) = {
  let r = taille / 2
  box(width: taille, height: taille, baseline: taille * 0.15)[
    #if cle == "obligatoire" {
      place(center + horizon, circle(radius: r, fill: black))
    } else if cle == "differable" {
      place(center + horizon, circle(radius: r, stroke: 0.5pt + black))
      place(center + horizon, box(width: taille, height: taille, clip: true, radius: 50%)[
        #place(top + right, rect(width: r, height: taille, fill: black))
      ])
    } else {
      place(center + horizon, circle(radius: r, stroke: 0.5pt + black))
    }
  ]
}
