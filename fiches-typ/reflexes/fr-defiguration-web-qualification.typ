#import "../../authoring.typ": *

#fiche(
  id: "fr-defiguration-web-qualification",
  type: "diagnostic",
  phase: "qualification",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Défiguration de site web - Qualification",
)[
  == Déclencheur
  ```texte
  Une défiguration (defacement) est détectée sur un site web de l'organisation. Répondre vite avec des réponses approximatives plutôt que chercher l'exhaustivité - fixer un temps contraint (30 minutes à 1 heure) ; une qualification plus fine se fera ensuite. La défiguration a 7 causes possibles regroupées en deux familles : compromission du site web lui-même (compte de gestion usurpé, sabotage interne, vulnérabilité applicative), ou compromission d'un système tiers (contenu tiers importé, enregistrement DNS, équipement en amont, tenant cloud/hébergeur) - la qualification vise à déterminer laquelle, car la suite en dépend directement.
  ```

  == Critères d'escalade
  ```texte
  Si la gravité conclue est "incident majeur" ou "crise cyber", activer le dispositif de crise complet. Si la cause identifiée est un système tiers plutôt que le site web lui-même, ne pas ouvrir la fiche Endiguement associée : suivre les pistes indiquées en fin de qualification (réinitialisation DNS, retrait des liens vers un fournisseur de contenu tiers, ou fiche réflexe Compromission système si le serveur hôte est également touché).
  ```

  == Mesure 1 - Confirmer l'incident
  ```texte
  L'incident de type défiguration de site web est-il confirmé, ou nécessite-t-il des investigations complémentaires ?
  ```

  == Mesure 2 - Identifier les systèmes compromis
  ```texte
  Les serveurs hôtes hébergeant le site web défiguré peuvent-ils être précisément identifiés, et sont-ils hébergés en interne, chez un prestataire externe, ou au sein d'un tenant cloud ?
  ```
  ```texte
  Quels systèmes semblent avoir été compromis : les serveurs hôtes du site web eux-mêmes, ou un système tiers (fournisseur de contenu tiers, enregistrement DNS, équipement en amont) ?
  ```

  == Mesure 3 - Évaluer le périmètre
  ```texte
  Un compte d'administration semble-t-il avoir été usurpé ? Si oui, pourrait-il avoir d'autres accès aux interfaces de gestion ou aux accès distants de l'entreprise ?
  ```
  ```texte
  En plus du défacement, le serveur hôte lui-même pourrait-il être compromis ? Une propagation à d'autres serveurs ou au tenant cloud est-elle possible ?
  ```

  == Mesure 4 - Évaluer l'impact
  ```texte
  Quelles activités sont impactées par la défiguration, ou le seraient par une mise hors ligne du site ou du serveur hôte ? Sont-elles vitales ? L'incident a-t-il des impacts réglementaires (données sensibles hébergées) ?
  ```

  == Mesure 5 - Évaluer l'urgence
  ```texte
  Pour les activités vitales perturbées ou susceptibles de l'être en cas de mise hors ligne, une procédure de continuité existe-t-elle et est-elle déjà en cours de mise en œuvre ?
  ```

  == Qualifier l'incident
  ```texte
  La défiguration est-elle causée par une compromission du site web lui-même, ou par un système tiers (DNS, fournisseur de contenu, équipement en amont, tenant) ? L'incident est-il circonscrit sur le système d'information, ou étendu ? Présente-t-il un impact fort pour l'activité métier ? Est-il urgent à résoudre ? Au final, quel est le niveau de gravité - anomalie courante, incident mineur, incident majeur, ou crise cyber ?
  ```

  #fiches-liees((("fr-defiguration-web-endiguement", "Défiguration de site web - Endiguement"), ("fr-compromission-systeme-qualification", "Compromission système - Qualification"), ("grille-criticite", "Grille de criticité - évaluer la gravité d'un incident"),))

  #source("intercert-france-2026-fiche-reflexe-defi-2", page: "p. 4-11")
  #imprimer-sources()
]
