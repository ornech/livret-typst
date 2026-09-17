#import "../../authoring.typ": *

#fiche(
  id: "comm-organiser-crise",
  type: "checklist",
  phase: "endiguement",
  onglet: (titre: "Communication de crise", pictogramme: "carre"),
  titre: "Organiser sa communication de crise cyber",
)[
  == Déclencheur
  ```texte
  Dès les premières heures d'une crise cyber (voir la fiche réflexe du scénario concerné) : la communication de crise doit être intégrée immédiatement au dispositif de gestion de crise, avec une répartition des rôles au sein de l'équipe communication.
  ```

  == Répartition des rôles
  ```texte
  Fonction Coordination : intégration aux cellules de gestion de crise, aide à la prise de décision sur la posture de communication, centralisation des productions et de leur validation, lien avec les parties prenantes externes.
  ```
  ```texte
  Fonction Perception : veille médiatique et réseaux sociaux, alerte des parties prenantes en cas de signaux faibles, suivi des prises de parole politiques et des réactions internes.
  ```
  ```texte
  Fonction Réaction : conception rapide de messages adaptés aux différents publics internes et externes, avec l'appui des équipes métiers concernées.
  ```

  == Si les ressources sont insuffisantes
  ```texte
  Si les ressources sont insuffisantes : répartir plusieurs rôles sur les mêmes collaborateurs, faire appel à des renforts internes, ou se faire accompagner (prestataires PRIS qualifiés ANSSI, agences/cabinets spécialisés, accompagnement ANSSI pour les incidents suivis par le CERT-FR).
  ```
  ```texte
  Mettre en place une chaîne de validation hiérarchique rapide, un système de rotation des postes clés, et identifier des collaborateurs d'autres équipes pouvant renforcer l'équipe communication.
  ```

  == Main courante
  ```attention
  Dès le démarrage de la crise, créer (ou alimenter, si elle existe déjà pour l'incident) une main courante. Chaque entrée doit contenir a minima : l'heure et la date, le nom de la personne à l'origine de l'action ou ayant informé, la description de l'action ou de l'événement.
  
  Tracer les événements et actions de communication.
  ```

  == 3 soft skills
  ```texte
  Privilégier le calme (protéger l'équipe cyber/informatique des sollicitations médias), faire preuve d'agilité si le PCA ne suffit plus face à une situation inédite, et prendre soin de sa propre santé face à la pression.
  ```

  #fiches-liees((("role-cellule-crise", "Rôles de la cellule de crise"), ("comm-messages-cles", "Rédiger les messages clés"), ("comm-piloter-interne", "Piloter sa communication de crise interne"), ("comm-piloter-externe", "Piloter sa communication de crise externe"),))

  #source("anssi-2026-fiche-4-organiser-sa-communic", page: "p. 2-3")
  #imprimer-sources()
]
