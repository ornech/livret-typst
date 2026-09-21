#import "../../authoring.typ": *

#fiche(
  id: "cellule-de-crise-principe",
  type: "fiche_role",
  phase: "preparation",
  onglet: (titre: "Rôles et documents de la cellule de crise", pictogramme: "cercle"),
  titre: "Cellule de crise",
)[
  == Qu'est-ce qu'une cellule de crise
  ```texte
  Structure temporaire activée pour la durée de l'incident. Distincte de l'organisation courante.
  ```
  ```texte
  Deux profils possibles, selon la taille et les moyens de l'organisation. Le détail des rôles de chaque profil fait l'objet d'une fiche séparée.
  ```

  #note[
    Profil A — cellule unique.
    #text(weight: "regular")[
      - Objectif : gérer la crise avec une équipe restreinte, sans dédoublement du pilotage stratégique et technique.
      - Contraintes : structure de taille réduite, moyens limités. Cumul de rôles toléré, au prix d'un risque de vision tunnel à surveiller.
      - Moyens : voir fiche Rôles de la cellule de crise, section Profil A.
    ]
  ]
  #note[
    Profil B — deux cellules.
    #text(weight: "regular")[
      - Objectif : séparation de l'arbitrage stratégique (impact sur l'organisation, communication externe) du pilotage technique (diagnostic, confinement, remédiation).
      - Contraintes : nécessite des moyens dédiés, personnel identifié à l'avance pour chacune des deux cellules.
      - Moyens : voir fiche Rôles de la cellule de crise, section Profil B.
    ]
  ]

  == Déclenchement
  ```texte
  Activation par le haut : le volet stratégique décide de déclencher l'état de crise, sur la base de critères préétablis. Il définit aussi les critères de sortie de crise.
  ```
  ```texte
  Activation par le bas : le dispositif opérationnel peut être mobilisé sans le volet stratégique, si des actions immédiates sont nécessaires. Il alerte ensuite les fonctions décisionnelles.
  ```
  ```note
  En profil A, ces deux modes coexistent dans la même cellule : le Coordinateur peut engager des actions immédiates avant d'avoir réuni l'ensemble des rôles.
  ```

  == Ce qu'elle doit produire
  - Main courante : journal chronologique tenu par un seul scribe désigné (l'Historien), toute entrée horodatée, y compris un RAS.
  - Points de situation périodiques, à cadence fixée dès l'activation et indexée sur le niveau de gravité déclaré.
  - SITREP : compte rendu de situation produit à l'issue de chaque point de situation, transmis à la Direction générale.
  - RETEX à la clôture, anonymisé par rôle pour diffusion aux employés.

  ```avertissement
  Un document par public, jamais un document unique multi-destinataires. Main courante nominative → assureurs, autorités judiciaires. RETEX anonymisé → employés. Communication externe → registre propre.
  ```

  == Organisation et autorité
  - Un rôle = une fonction, quel que soit le titulaire. Un rôle absent est remplacé, la fonction ne reste jamais vacante.
  - Chef de cellule : arbitre unique en cas de désaccord, ou face à un scénario non prévu par les fiches.
  - Chaque rôle permanent a un suppléant désigné en amont. Le suppléant assure l'intérim avec la même autorité.

  ```avertissement
  Aucune décision majeure sur la seule initiative d'un rôle d'exécution. Une décision réservée à Juridique ou à la Direction générale ne peut être exécutée par le Référent technique ou la Communication, même en urgence perçue.
  ```

  == Seuils d'escalade vers la Direction générale
  - Arrêt de production au-delà du seuil défini par le PCA de l'organisation.
  - Compromission avérée de données à caractère personnel à grande échelle.
  - Réception d'une demande de rançon.
  - Risque médiatique avéré (article publié, revendication publique de l'attaquant).
  - Risque pour la sécurité des personnes (environnement industriel/OT, santé).
  - Dépassement du mandat budgétaire délégué au Coordinateur ou au pilote opérationnel.

  #fiches-liees((
    ("cellule-de-crise-role", "Rôles de la cellule de crise"),
    ("documents-preparation", "Documents de préparation"),
    ("main-courante-etat-situation", "Main courante et état de situation"),
  ))

  #source(
    "anssi-cdse-2021-crise-d-origine-cyber-le",
    page: "p. 36-37 (Fiche 8, « Activer son dispositif de crise cyber »)",
  )
  #source("cadrage-cellule-crise-2026-gouvernan", page: "n/a - document interne du projet, non paginé")
  #imprimer-sources()
]
