#import "../../authoring.typ": *

#fiche(
  id: "reflexe-premiers-reflexes",
  type: "fiche_reflexe",
  phase: "endiguement",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Mes premiers réflexes en cas d'incident cyber",
)[
  == Déclencheur
  ```texte
  Un comportement suspect est constaté sur un poste ou un serveur (exemples : écran noir, message revendiquant une cyberattaque). Cette fiche s'adresse à toute personne de l'organisation, pas seulement à la cellule de crise ou au service informatique - c'est la première fiche à connaître, avant même qu'une cellule de crise soit constituée.
  ```

  == Actions immédiates
  #debut-actions()
  ```obligatoire
  Alerter immédiatement les équipes en charge de l'informatique (ou le prestataire infogérant)
  ```
  ```obligatoire
  Si consigne en est donnée, aider à débrancher la machine du réseau (câble réseau ou Wi-Fi), sans l'éteindre
  ```
  ```obligatoire
  Ne pas rallumer une machine déjà éteinte
  ```
  ```differable
  Suivre les consignes données ensuite par les équipes informatiques ou la cellule de crise
  ```

  == À ne pas faire
  ```avertissement
  Ne pas éteindre une machine suspecte.
  
  Cela peut détruire des preuves utiles à l'investigation (mémoire vive, traces en cours).
  ```
  ```avertissement
  Ne pas rallumer une machine déjà éteinte sans consigne explicite.
  ```
  ```avertissement
  Ne pas tenter de résoudre seul un incident suspecté : alerter plutôt qu'agir sans consigne.
  ```

  == Critères d'escalade
  ```texte
  Toute alerte remontée via cette fiche doit être qualifiée sans délai par le référent technique (voir les fiches réflexes par scénario) pour déterminer si le dispositif de crise doit être activé.
  ```

  #fiches-liees((("role-cellule-crise", "Rôles de la cellule de crise"),))

  #source("anssi-2026-reflexes-cyber-mes-premiers-r", page: "p. 2")
  #imprimer-sources()
]
