#import "../../authoring.typ": *

#fiche(
  id: "main-courante-etat-situation",
  type: "fiche_role",
  phase: "preparation",
  onglet: (titre: "Préparation", pictogramme: "triangle"),
  titre: "Main courante et état de situation",
)[
  == La main courante
  ```texte
  Doit consigner tous les événements  (techniques,  de communication, frais financiers ou action) afin au fil de l'eau afin de :
   - Servir de preuve (dépôt de plainte, assureur, CNIL)
   - Reconstituer l'historique de l'incident pour nourrir un RETEX
  ```
  ```avertissement
  *Chaque entrée de la main courante doit obligatoirement comporter :*
  - Date et heure (UTC de préférence)
  - Le nom de la personne à l’origine de l'action ou ayant rapporté l’événement
  - La description factuelle de l’action ou de l’événement
  ```

  == Le point de situation
  ```texte
  Son objectif  : 
  1. Support visuel pour l'animation des "point de situation" (toutes les 2 à 4h)
  2. Clarifier et alimenter la chaîne de rédaction et de vulgarisation
  3. Garantir la diffusion via des canaux dégradés et déconnectés
  
  *Cette trame devrait contenir les rubriques  :*
  - En-tête : Horodatage précis, numéro du point de situation et niveau de confidentialité.
  - Synthèse managériale (1 à 3 phrases) : Résumé de l'état global destiné aux dirigeants
  - Faits constatés et périmètre de compromission : Type d'attaque (rançongiciel, déni de service, etc.), vecteurs d'intrusion suspectés et équipements/réseaux touchés
  - Impacts métiers et continuité d'activité : Services et applications indisponibles, processus métiers bloqués et modes dégradés (PCA/PRA) activés
  - Actions réalisées et à venir : Mesures conservatoires prises (isolations, déconnexions), travaux de remédiation et jalons prioritaires pour les prochaines heures
  - Incertitudes et zones d'ombre : Identification explicite des éléments techniques ou opérationnels non encore confirmés
  - Volet communication et perception : Posture adoptée, retours de la veille médiatique/réseaux sociaux et principales sollicitations externes reçues
  ```

  == Limites et biais à surveiller
  ```avertissement
  Un état de situation figé au moment de sa première rédaction devient trompeur à mesure que l'incident évolue : à chaque point fixe, reprendre explicitement deux questions avant de valider la nouvelle version - cette qualification (gravité, périmètre) tient-elle encore ? quelle hypothèse alternative a été envisagée, et pourquoi a-t-elle été écartée ?
  ```
  ```note
  Les biais qui menacent le score de la grille de criticité (ancrage, confirmation, pensée de groupe, escalade d'engagement - voir fiche Grille de criticité) menacent tout autant l'état de situation à chaque mise à jour : un point de situation est une photo à un instant T, jamais un radar.
  ```

  #fiches-liees((("role-cellule-crise", "Rôles de la cellule de crise"), ("documents-preparation", "Documents de préparation"), ("grille-criticite", "Grille de criticité - évaluer la gravité d'un incident"),))

  #source("anssi-cdse-2021-crise-d-origine-cyber-le", page: "p. 38, p. 43")
  #source("intercert-france-2026-fiche-reflexe-fuit-2", page: "p. 3 (section « Ouvrir une main courante »)")
  #imprimer-sources()
]
