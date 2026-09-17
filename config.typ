// Projet autonome : config_rendu.json et meta.json vivent à la racine de
// CE projet (copiés depuis le dépôt principal au moment de la conversion,
// voir README.md) - à resynchroniser manuellement si le dépôt principal
// change ces fichiers, pas de lien automatique entre les deux projets.
#let cfg = json("config_rendu.json")
#let meta = json("meta.json")

#let page-w = 210mm
#let page-h = 297mm

#let marge-haut = cfg.page.marge_haut_mm * 1mm
#let marge-bas = cfg.page.marge_bas_mm * 1mm
#let marge-reliure = cfg.page.marge_reliure_mm * 1mm
#let marge-exterieure = cfg.page.marge_exterieure_mm * 1mm
#let largeur-bande = cfg.page.largeur_bande_phase_mm * 1mm
#let respiration = cfg.page.respiration_texte_bande_mm * 1mm
#let marge-haut-bande = cfg.page.marge_haut_bande_mm * 1mm
#let marge-bas-bande = cfg.page.marge_bas_bande_mm * 1mm

#let contenu-hauteur = page-h - marge-haut - marge-bas
#let hauteur-bande = contenu-hauteur - marge-haut-bande - marge-bas-bande
#let phases = cfg.phases
#let hauteur-zone = hauteur-bande / phases.len()

#let taille-corps = cfg.typographie.taille_corps_pt * 1pt
#let taille-titre-fiche = cfg.typographie.taille_titre_fiche_pt * 1pt
#let taille-entete-onglet = cfg.typographie.taille_entete_onglet_pt * 1pt
#let taille-meta = cfg.typographie.taille_meta_pt * 1pt
#let taille-bloc-titre = cfg.typographie.taille_bloc_titre_pt * 1pt
#let taille-validation = cfg.typographie.taille_validation_pt * 1pt
#let taille-source = cfg.typographie.taille_source_pt * 1pt
#let taille-tab-phase = cfg.typographie.taille_tab_phase_pt * 1pt
#let taille-sommaire-titre = cfg.typographie.taille_sommaire_titre_pt * 1pt
#let interligne = cfg.typographie.interligne
// Espace supplémentaire entre les lignes d'un même paragraphe (leading Typst,
// pas la hauteur de ligne totale) - dérivé de interligne, comme dans
// config_rendu.json (ex : interligne 1.45 -> 0.45em de leading en plus).
#let leading-paragraphe = (interligne - 1) * 1em
// Espace ENTRE deux paragraphes distincts - réglage INDÉPENDANT de
// interligne (config_rendu.json, typographie.espacement_paragraphe_pt) :
// un premier essai le dérivait de interligne (* 2), mais un changement de
// interligne changeait alors cet espacement sans qu'on le veuille, et
// pouvait même le repasser sous leading-paragraphe si interligne diminuait
// (bug réel constaté, 2026-09-16 : interligne baissé à 1.2 côté
// config_rendu.json a fait recoller les paragraphes/actions entre eux).
#let espacement-paragraphe = cfg.typographie.espacement_paragraphe_pt * 1pt
#let espacement-blocs = cfg.typographie.espacement_blocs_pt * 1pt
#let espacement-encart = cfg.typographie.espacement_encart_pt * 1pt

#let couleur-texte = rgb(cfg.couleurs.couleur_texte)
#let couleur-fond = rgb(cfg.couleurs.couleur_fond)
#let couleur-texte-attenue = rgb(cfg.couleurs.couleur_texte_attenue)
#let couleur-bordure-entete = rgb(cfg.couleurs.couleur_bordure_entete)
#let couleur-tab-inactif-fond = rgb(cfg.couleurs.couleur_tab_inactif_fond)
#let couleur-tab-inactif-texte = rgb(cfg.couleurs.couleur_tab_inactif_texte)
#let couleur-encart-danger-fond = rgb(cfg.couleurs.couleur_encart_danger_fond)
#let couleur-encart-danger-texte = rgb(cfg.couleurs.couleur_encart_danger_texte)
#let couleur-encart-note-fond = rgb(cfg.couleurs.couleur_encart_note_fond)
#let couleur-encart-note-texte = rgb(cfg.couleurs.couleur_encart_note_texte)
#let couleur-encart-attention-fond = rgb(cfg.couleurs.couleur_encart_attention_fond)
#let couleur-encart-attention-texte = rgb(cfg.couleurs.couleur_encart_attention_texte)

#let icones-encart = cfg.icones_encart

// PHASE_COLORS : toujours derive de groupe -> couleur, jamais une valeur
// independante par phase (meme regle que rendu_livret.ipynb).
#let couleur-phase(slug) = {
  for p in phases {
    if p.slug == slug {
      return rgb(cfg.groupes_couleurs.at(p.groupe))
    }
  }
  rgb("#333333")
}

#let abrege-phase(slug) = {
  for p in phases {
    if p.slug == slug { return p.abrege }
  }
  slug
}

#let groupe-phase(slug) = {
  for p in phases {
    if p.slug == slug { return p.groupe }
  }
  none
}

#let priorite-marques = (
  obligatoire: "obligatoire",
  differable: "différable",
  secondaire: "secondaire",
)
