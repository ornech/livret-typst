#import "../../authoring.typ": *

#fiche(
  id: "fr-compromission-infostealer-qualification",
  type: "diagnostic",
  phase: "qualification",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Compromission par un infostealer - Qualification",
)[
  == Déclencheur
  ```texte
  Une compromission par un infostealer (logiciel malveillant de vol d'identifiants) est suspectée ou confirmée sur un poste ou un serveur. Répondre vite avec des réponses approximatives plutôt que chercher l'exhaustivité - fixer un temps contraint (30 minutes à 1 heure). Deux cas de figure : une alerte de détection (EDR, antivirus, pare-feu, proxy) signalant une compromission en cours, ou un signalement différé (équipe CTI, source externe de confiance) d'une fuite d'identifiants potentiellement déjà ancienne.
  ```

  == Critères d'escalade
  ```texte
  Dès que la compromission par infostealer est confirmée, ouvrir la fiche Endiguement pour mettre en œuvre les mesures de confinement, quel que soit le niveau de gravité retenu. Si l'incident présente un périmètre étendu, un impact fort ET une résolution urgente (les trois critères réunis, seuil "crise cyber"), activer en plus le dispositif de crise complet. Si la qualification suggère plutôt un début de compromission système plus large, basculer vers la fiche Compromission système.
  ```

  == Avant toute action
  ```attention
  Éviter d'ouvrir une session interactive sur la machine suspectée compromise (connexion locale, RDP, SSH), a fortiori avec un compte privilégié : préférer une action à distance via EDR ou un outil de gestion à distance n'ouvrant pas de session. Tracer impérativement toute connexion à une machine compromise dans la main courante.
  ```

  == Mesure 1 - Identifier le système concerné
  ```texte
  La nature des informations transmises (alerte de détection en cas d'attaque en cours, ou signalement d'une fuite d'identifiants) permet-elle d'identifier avec confiance le système compromis par l'infostealer ?
  ```

  == Mesure 2 - Confirmer l'incident
  ```texte
  Les informations observables sur le système confirment-elles la compromission par infostealer (collecte de données de navigateurs, de gestionnaires de mots de passe, de portefeuilles de cryptomonnaie, de clés SSH), ou s'agit-il d'un faux positif ?
  ```

  == Mesure 3 - Évaluer le périmètre
  ```texte
  L'incident est-il circonscrit à une partie identifiable du système d'information ? Des ressources d'administration ont-elles été compromises ? Combien de comptes sont potentiellement compromis (coffre-fort de mots de passe, sessions enregistrées, connexions d'assistance antérieures) ?
  ```

  == Mesure 4 - Évaluer l'impact
  ```texte
  Les comptes compromis ont-ils des fonctions sensibles (métier, SI, RH, financier) ou donnent-ils accès à des services cloud ? La machine porte-t-elle une fonction de sécurité ou d'administration critique ? Quelles activités métier seraient perturbées, et l'incident a-t-il des impacts réglementaires (données sensibles, obligations OSE/OIV/NIS2) ?
  ```

  == Mesure 5 - Évaluer l'urgence
  ```texte
  L'attaque est-elle en cours (alerte immédiate) ou déjà ancienne (signalement différé, actions potentiellement déjà réalisées par l'attaquant) ? Existe-t-il un risque de généralisation imminente ?
  ```

  == Qualifier l'incident
  ```texte
  Au final, la compromission par infostealer est-elle confirmée ? L'incident est-il circonscrit ou étendu, à impact fort, urgent à résoudre ? Quel est le niveau de gravité - anomalie courante, incident mineur, incident majeur, ou crise cyber ? Si un début de compromission système plus large ou un rançongiciel est suspecté, basculer vers la fiche correspondante.
  ```

  #fiches-liees((("fr-compromission-infostealer-endiguement", "Compromission par un infostealer - Endiguement"), ("fr-compromission-systeme-qualification", "Compromission système - Qualification"), ("grille-criticite", "Grille de criticité - évaluer la gravité d'un incident"),))

  #source("intercert-france-2026-fiche-reflexe-comp-8", page: "p. 4-14")
  #imprimer-sources()
]
