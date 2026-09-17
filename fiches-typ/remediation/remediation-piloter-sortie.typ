#import "../../authoring.typ": *

#fiche(
  id: "remediation-piloter-sortie",
  type: "checklist",
  phase: "remediation",
  onglet: (titre: "Remédiation et reconstruction", pictogramme: "croix"),
  titre: "Piloter le projet et en sortir",
)[
  == Déclencheur
  ```texte
  Pendant le pilotage du projet de remédiation (voir fiche Reprendre le contrôle du système d'information) : le pilotage est un projet à part entière, distinct de la gestion de crise et du pilotage de l'investigation - leur cumul par une même personne est rarement efficace (charge de travail et compétences différentes).
  ```

  == Responsabilités
  ```texte
  Le ou les pilotes de la remédiation établissent le plan, suivent l'exécution des tâches, qualifient les changements, s'appuient sur des experts pour les choix techniques complexes, et font arbitrer par la direction de crise les choix et modifications de priorités.
  ```

  == Communication pendant la remédiation
  ```texte
  Décideurs : format synthétique et régulier - calendrier de remédiation, délais, suivi des risques par étape, sans les noyer dans le détail technique.
  ```
  ```texte
  Équipes de remédiation : vision fréquemment mise à jour de l'avancement global, pas seulement de leur propre lot - privilégier des équipes pluridisciplinaires plutôt que des spécialistes isolés.
  ```
  ```texte
  Directions métiers : calendrier et changements dans les processus métier, points hebdomadaires - leur implication contribue à la cohésion de l'organisation durant l'incident.
  ```
  ```texte
  Reste de l'organisation et partenaires extérieurs : accompagner les changements perçus par les utilisateurs (ex : authentification multifacteur) sans exposer le détail des opérations, en synchronisation avec la communication de crise.
  ```

  == Équipes de remédiation
  ```texte
  Une équipe chargée de rétablir un service devrait au moins inclure : un pilote, un ou des acteurs de la direction informatique, un ou des acteurs du métier concerné, un ou des experts techniques nécessaires à l'exécution.
  ```

  == Conditions de sortie
  ```texte
  La fin du projet est atteinte lorsque tous les objectifs stratégiques ont été satisfaits, fixés à un niveau réaliste - une éradication totale n'est pas un objectif réaliste : viser l'élimination des présences sensibles et le traitement des reliquats au fil de leur détection ultérieure.
  ```

  == Temporalité de la sortie
  ```texte
  Une première sortie « de temps chaud » - rendre aux métiers l'essentiel de leurs capacités antérieures, dans un environnement plus sécurisé, autour d'un cœur de confiance protégeant les comptes privilégiés - peut précéder de longtemps la fin effective de la remédiation. Les transitions réussies ne le sont que grâce au soutien continu de la direction : continuer à communiquer périodiquement l'avancement avec l'organe décisionnel, accompagner les utilisateurs à privilèges dans leurs nouvelles pratiques, et faire un retour à toute l'organisation sur la remédiation et ses objectifs pour minimiser le contre-coup de la sortie de crise.
  ```

  == Le risque de démobilisation précoce
  ```attention
  La sortie de crise est le moment où l'on démantèle la plupart des dispositifs exceptionnels, alors que les équipes de remédiation ont encore un travail conséquent à accomplir et que la justification des pratiques d'administration sécurisée s'estompe chez les utilisateurs privilégiés - un risque réel d'abandonner la remédiation à mi-chemin et de retourner, par praticité, vers des pratiques d'exploitation non sécurisées.
  ```

  == Après la fin de la remédiation
  ```texte
  Procéder à un retour d'expérience, si possible en plusieurs phases « à chaud » pour inclure les intervenants externes (souvent indisponibles plus tard) - la remédiation doit aboutir à un plan d'action de sécurisation post-incident.
  ```

  == Problèmes courants du redémarrage métier
  ```texte
  Planifier scrupuleusement l'ordre de redémarrage des services (dépendances techniques et organisationnelles), identifier les tests de validation de chaque étape, et prévoir des points de go/no-go. 4 problèmes récurrents à anticiper : dépendances circulaires entre services, remise en production de données antérieures (espace disque, choix de la date à restaurer), synchronisation avec des services externes (expirations, désynchronisations), réconciliation des données métier générées pendant la crise.
  ```

  #fiches-liees((("remediation-e3r-execution", "Reprendre le contrôle du système d'information (séquence E3R)"), ("role-cellule-crise", "Rôles de la cellule de crise"), ("comm-organiser-crise", "Organiser sa communication de crise cyber"),))

  #source("anssi-2023-cyberattaques-et-remediation-2", page: "p. 42-51")
  #imprimer-sources()
]
