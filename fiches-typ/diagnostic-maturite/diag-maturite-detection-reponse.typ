#import "../../authoring.typ": *

#fiche(
  id: "diag-maturite-detection-reponse",
  type: "diagnostic",
  phase: "retex",
  onglet: (titre: "Diagnostic de maturité", pictogramme: "etoile"),
  titre: "Détection et réponse à incidents",
)[
  == Objectif
  ```texte
  À utiliser à froid, en préparation, pour évaluer le niveau de maturité de l'organisation sur la détection et la réponse technique aux incidents (escalade d'alerte, processus dédié, détection/investigation, confinement, durcissement, gouvernance de la remédiation).
  ```

  == Stratégique
  ```texte
  Les modalités d'escalade d'une alerte vers la cellule stratégique sont-elles formalisées ?
  ```

  == Opérationnel cyber et IT
  ```texte
  Un processus d'alerte, de gestion et de réponse dédié aux incidents cyber est-il formalisé ?
  ```
  ```texte
  Comment sont menées les actions de détection et d'investigation ?
  ```
  ```texte
  Comment sont formalisées les procédure de confinement en amont de la crise ?
  ```
  ```texte
  Des mémos techniques sont-ils à disposition des équipes ?
  ```
  ```texte
  Comment est défini le plan de durcissement durant la crise ? Comment les investigations sont-elles intégrés dans le travail de durcissement ?
  ```

  == Stratégique
  ```texte
  Quelle gouvernance est mise en place dans le cadre du durcissement et de la remédiation des SI ?
  ```
  ```texte
  Comment les mesures conservatoires et de remédiation sont-elles validées par la cellule stratégique durant la crise ?
  ```

  #source("anssi-s-d-questionnaire-d-evaluation-de", page: "onglet « Questionnaire d'évaluation », thématique « Détection et réponse à incidents »")
  #imprimer-sources()
]
