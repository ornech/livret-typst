#import "../../authoring.typ": *

#fiche(
  id: "fr-compromission-bordure-reseau-endiguement",
  type: "fiche_reflexe",
  phase: "endiguement",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Compromission d'un équipement de bordure réseau - Endiguement",
)[
  == Déclencheur
  ```texte
  La compromission d'un équipement de bordure réseau (pare-feu, passerelle VPN, routeur ou box internet) a été confirmée, ou un équipement de bordure est affecté par une vulnérabilité non corrigée (voir fiche Qualification, prérequis). Deux stratégies d'endiguement sont possibles selon la gravité de la compromission et la maîtrise du parc par le défenseur : entraver directement l'attaquant (isolement), au risque de le faire réagir brutalement s'il dispose d'accès non détectés ; ou le superviser pour préparer l'investigation sans l'alerter, si l'isolement n'est pas praticable ou souhaitable.
  ```

  == Actions immédiates
  #debut-actions()
  ```obligatoire
  [Référent technique] Isoler l'équipement compromis du reste du système d'information (déconnexion réseau physique ou via un équipement tiers) ; si l'équipement n'est pas isolable, isoler le SI entier d'Internet en dernier recours
  ```
  ```obligatoire
  [Référent technique] Filtrer au maximum le trafic entrant et sortant de l'équipement, de préférence depuis des équipements en amont ou en aval plutôt que sur l'équipement compromis lui-même
  ```
  ```obligatoire
  [Référent technique] Si la compromission résulte d'une vulnérabilité avec correctif disponible, l'appliquer ; sinon, appliquer les mesures de mitigation du fabricant ou isoler le service vulnérable
  ```
  ```obligatoire
  [Référent technique] Changer tous les secrets utilisés ou potentiellement accessibles par l'attaquant (identifiants, secrets VPN, certificats)
  ```
  ```differable
  [Référent technique] Préserver l'état système (instantané ou export de configuration) et les journaux de l'équipement avant toute réinitialisation
  ```
  ```secondaire
  [Référent technique] Augmenter la journalisation de l'équipement et du reste du parc.
  
  Appuyer la suite de l'investigation.
  ```

  == À ne pas faire
  ```avertissement
  Ne pas considérer l'incident clos à la fin de l'endiguement - poursuivre immédiatement la supervision et l'investigation forensique.
  
  Le défenseur reste en position fragile, en particulier si une stratégie de supervision plutôt que d'isolement a été choisie.
  ```
  ```avertissement
  Ne pas réaliser les mesures de filtrage réseau sur l'équipement compromis lui-même si possible - les effectuer sur des équipements en amont ou en aval.
  
  Limiter le risque que l'attaquant modifie lui-même la configuration de l'équipement compromis.
  ```
  ```avertissement
  Ne pas isoler le SI entier sans évaluer les impacts au préalable.
  
  Une fois cette action réalisée, le SI n'est plus connecté à Internet - les impacts peuvent être considérables.
  ```
  ```avertissement
  Si l'équipement à isoler est une passerelle VPN, ne pas l'isoler sans s'être assuré au préalable que les administrateurs en charge de la suite de la réponse à incident disposent d'un autre accès au système d'information.
  
  Sinon, l'isolement les coupe eux-mêmes de leur seul accès distant.
  ```

  == Critères d'escalade
  ```texte
  Si le périmètre est étendu (compromission de niveau interne plutôt qu'utilisateur, accès à d'autres parties du SI), que l'impact est fort, ET que la résolution est urgente (les trois critères réunis, seuil "crise cyber"), activer le dispositif de crise complet. Immédiatement après l'endiguement, mettre en œuvre une supervision des tentatives de retour de l'attaquant et une investigation forensique pour déterminer l'ampleur de la compromission.
  ```

  #fiches-liees((("fr-compromission-bordure-reseau-qualification", "Compromission d'un équipement de bordure réseau - Qualification"), ("reflexe-rassembler-les-preuves", "Rassembler et préserver les preuves"),))

  #source("intercert-france-2026-fiche-reflexe-comp-10", page: "p. 4-11")
  #imprimer-sources()
]
