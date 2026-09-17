#import "../../authoring.typ": *

#fiche(
  id: "fr-compromission-tiers-qualification",
  type: "diagnostic",
  phase: "qualification",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Compromission d'un Tiers - Qualification",
)[
  == Déclencheur
  ```texte
  Une entité tierce en relation avec l'organisation (fournisseur, client, prestataire, partenaire, filiale) est signalée victime d'une compromission. Répondre vite avec des réponses approximatives plutôt que chercher l'exhaustivité - fixer un temps contraint (30 minutes à 1 heure) ; une qualification plus fine se fera ensuite. Le Tiers est désigné ci-dessous par ce terme générique, par opposition à l'organisation elle-même.
  ```

  == Critères d'escalade
  ```texte
  Quel que soit le cas de figure retenu (I à IV), mettre en œuvre les mesures d'endiguement (ouvrir la fiche Endiguement) en cohérence avec le périmètre évalué. Si l'incident présente un périmètre étendu, un impact fort ET une résolution urgente (les trois critères réunis, seuil "crise cyber"), activer en plus le dispositif de crise complet. Si un incident est également détecté au sein de l'organisation (cas III ou IV), le qualifier en parallèle via la fiche réflexe correspondant à son propre type.
  ```

  == Mesure 1 - Confirmer l'incident
  ```texte
  D'où provient le signalement (le Tiers lui-même, un partenaire, une source interne ou publique) et semble-t-il fiable ? La compromission du Tiers est-elle confirmée, ou nécessite-t-elle des investigations complémentaires ?
  ```

  == Mesure 2 - Évaluer le périmètre et établir la communication
  ```texte
  Quel type de Tiers (fournisseur, client, prestataire, partenaire, filiale) et quel type de compromission a-t-il subi (rançongiciel, compromission de messagerie, fuite de données, tenant cloud, infostealer, équipement de bordure, défiguration, déni de service...) ?
  ```
  ```texte
  Quel est le type et le niveau des liens IT entre l'organisation et le Tiers (comptes, accès VPN, applications partagées, moyens de communication) ? Le périmètre compromis inclut-il des données ou accès de l'organisation ?
  ```
  ```texte
  Un contact a-t-il pu être établi avec le Tiers (interlocuteur technique ou métier, CERT/CSIRT du Tiers le cas échéant) ?
  ```

  == Mesure 3 - Évaluer l'impact et l'urgence
  ```texte
  La compromission du Tiers a-t-elle un impact confirmé sur le système d'information de l'organisation (connexions ou actions d'administration inhabituelles, signes de compromission similaires) ?
  ```
  ```texte
  Quelles activités critiques liées au Tiers sont impactées, et quel est le niveau de dépendance métier vis-à-vis de ce Tiers (l'organisation peut-elle couper la relation sans dommage) ?
  ```

  == Qualifier l'incident
  ```texte
  Dans lequel des 4 cas l'organisation se trouve-t-elle : (I) aucune compromission confirmée ni côté Tiers ni côté organisation ; (II) Tiers confirmé compromis, organisation non impactée mais risque persistant ; (III) comportement anormal du Tiers, incident suspecté en interne sans confirmation côté Tiers ; (IV) compromission du Tiers confirmée ou fortement suspectée ET incident également détecté en interne ? Quel est au final le niveau de gravité - anomalie courante, incident mineur, incident majeur, ou crise cyber ?
  ```

  #fiches-liees((("fr-compromission-tiers-endiguement", "Compromission d'un Tiers - Endiguement"), ("grille-criticite", "Grille de criticité - évaluer la gravité d'un incident"),))

  #source("intercert-france-2026-fiche-reflexe-comp-6", page: "p. 3-13")
  #imprimer-sources()
]
