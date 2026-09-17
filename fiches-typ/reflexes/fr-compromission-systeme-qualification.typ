#import "../../authoring.typ": *

#fiche(
  id: "fr-compromission-systeme-qualification",
  type: "diagnostic",
  phase: "qualification",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Compromission système - Qualification",
)[
  == Déclencheur
  ```texte
  Une compromission est suspectée ou confirmée sur une ou plusieurs machines Windows ou Linux du système d'information. Répondre vite avec des réponses approximatives plutôt que chercher l'exhaustivité - fixer un temps contraint (30 minutes à 1 heure) ; une qualification plus fine se fera ensuite.
  ```

  == Critères d'escalade
  ```texte
  Dès que la compromission est confirmée, ouvrir la fiche Endiguement pour mettre en œuvre les mesures de confinement, quel que soit le niveau de gravité retenu. Si l'incident présente un périmètre étendu, un impact fort ET une résolution urgente (les trois critères réunis, seuil "crise cyber"), activer en plus le dispositif de crise complet. Si le système concerné est un équipement réseau, basculer vers la fiche Compromission d'un équipement de bordure réseau - Qualification. Si un début d'incident de type rançongiciel est suspecté, basculer immédiatement vers la fiche Chiffrement ou effacement en cours.
  ```

  == Avant toute action
  ```attention
  Éviter d'ouvrir une session interactive sur la machine suspectée compromise (connexion locale, RDP, SSH), a fortiori avec un compte privilégié : préférer une action à distance via EDR ou un outil de gestion à distance n'ouvrant pas de session, sinon une connexion locale hors bande. Tracer impérativement toute connexion à une machine compromise dans la main courante.
  ```

  == Mesure 1 - Qualifier le système concerné
  ```texte
  La nature des informations transmises (adresse réseau, nom de machine, alerte de sécurité) permet-elle d'identifier avec sûreté le système suspecté compromis ?
  ```

  == Mesure 2 - Confirmer l'incident
  ```texte
  Les informations observables sur le système (contexte technique, alertes corrélées, indicateurs de compromission connus) confirment-elles la compromission, ou s'agit-il d'un faux positif (opération légitime, réaffectation de la machine, changement de configuration récent) ?
  ```

  == Mesure 3 - Évaluer le périmètre
  ```texte
  L'incident est-il circonscrit à une partie identifiable du système d'information ? Des ressources d'administration ont-elles été compromises (comptes, postes, serveurs) ? Si la machine porte une fonction de gestion d'autres équipements, considérer compromis tout le périmètre qu'elle gère.
  ```
  ```texte
  D'autres systèmes interconnectés sont-ils à risque ? Si le système concerné est un équipement réseau, basculer vers la fiche Compromission d'un équipement de bordure réseau - Qualification.
  ```
  ```attention
  Si les journaux Windows montrent une saisie de la clé de secours BitLocker, considérer que la chaîne de démarrage est potentiellement compromise (bootkit) : les supports de stockage du poste doivent alors être analysés hors ligne, pas en confiance sur le système démarré normalement.
  ```

  == Mesure 4 - Évaluer l'impact
  ```texte
  La machine porte-t-elle une fonction de sécurité ou d'administration critique (annuaire, gestion de configuration, coffre-fort de mots de passe, hyperviseur) ? Quelles activités métier vitales seraient perturbées ? L'incident a-t-il des impacts réglementaires (données sensibles) ?
  ```

  == Mesure 5 - Évaluer l'urgence
  ```texte
  Pour les activités vitales potentiellement perturbées, une procédure de continuité existe-t-elle ? Une échéance importante est-elle imminente ? L'incident est-il à risque de généralisation imminente (forte connectivité, atteinte à une fonction de sécurité) ?
  ```

  == Qualifier l'incident
  ```texte
  Au final, la compromission est-elle confirmée, circonscrite ou étendue, à impact fort, urgente à résoudre ? Quel est le niveau de gravité - anomalie courante, incident mineur, incident majeur, ou crise cyber ? Si un rançongiciel est suspecté en cours, basculer immédiatement vers la fiche Chiffrement ou effacement en cours.
  ```

  #fiches-liees((("fr-compromission-systeme-endiguement", "Compromission système - Endiguement"), ("fr-compromission-bordure-reseau-qualification", "Compromission d'un équipement de bordure réseau - Qualification"), ("fr-chiffrement-qualification", "Chiffrement ou effacement en cours - Qualification"), ("grille-criticite", "Grille de criticité - évaluer la gravité d'un incident"),))

  #source("intercert-france-2026-fiche-reflexe-comp-3", page: "p. 4-13")
  #imprimer-sources()
]
