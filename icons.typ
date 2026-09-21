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
    } else if cle == "croix" {
      // Croix droite (plus) : deux barres pleines se croisant au centre.
      let long = taille * 0.92
      let epais = taille * 0.32
      place(center + horizon, rect(width: long, height: epais, fill: couleur))
      place(center + horizon, rect(width: epais, height: long, fill: couleur))
    } else if cle == "etoile" {
      // Étoile à cinq branches, pleine : dix sommets alternés (pointes /
      // creux), coordonnées absolues dans la boîte carrée `taille` comme le
      // triangle. Rayon un peu plus grand que celui du cercle (une étoile
      // pleine paraît plus légère à surface égale), recentrée à la main :
      // l'étendue verticale d'une étoile n'est pas symétrique (pointe en
      // haut = R, bas des deux branches = R*cos 36° = 0.809 R).
      let rayon = taille * 0.54
      let creux = rayon * 0.42
      let cx = taille / 2
      let cy = taille / 2 + 0.0955 * rayon
      let sommets = range(10).map(i => {
        let r = if calc.rem(i, 2) == 0 { rayon } else { creux }
        let a = -90deg + i * 36deg
        (cx + r * calc.cos(a), cy + r * calc.sin(a))
      })
      place(top + left, polygon(fill: couleur, ..sommets))
    } else {
      // Plus de repli silencieux sur un cercle : une clé inconnue est une
      // erreur de compilation (le repli avait masqué "croix" et "etoile",
      // déclarées par dix fiches mais jamais dessinées).
      panic("pictogramme-categorie : clé inconnue « " + str(cle) + " » (losange, cercle, carre, triangle, croix, etoile)")
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
