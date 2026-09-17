#import "../../authoring.typ": *

#fiche(
  id: "fr-chiffrement-qualification",
  type: "diagnostic",
  phase: "qualification",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Chiffrement ou effacement en cours - Qualification",
)[
  == Déclencheur
  ```texte
  Un logiciel malveillant de chiffrement ou d'effacement (ex : rançongiciel) est détecté ou suspecté sur le système d'information. Répondre vite avec des réponses approximatives plutôt que chercher l'exhaustivité - fixer un temps contraint (30 minutes à 1 heure) ; une qualification plus fine se fera ensuite, avec l'appui d'une équipe spécialisée si besoin.
  ```

  == Critères d'escalade
  ```texte
  Si la gravité conclue est "incident majeur" ou "crise cyber", activer le dispositif de crise complet et ouvrir la fiche Endiguement. Si le chiffrement est déjà constaté ou la menace paraît imminente, ne pas attendre la fin de la qualification pour engager les premières mesures d'endiguement (isolement Internet notamment).
  ```

  == Mesure 1 - Confirmer l'incident de type rançongiciel
  ```texte
  Y a-t-il un signal fort (demande de rançon, fichiers illisibles avec extension anormale, détection d'un code de chiffrement par les outils de sécurité, création d'archives en masse) ? À défaut, y a-t-il des signaux faibles (services ou serveurs inaccessibles, antivirus/EDR désactivé sur une partie du parc, extinctions de machines virtuelles en masse, grosse exfiltration détectée) ?
  ```

  == Mesure 2 - Évaluer le périmètre
  ```texte
  Quels types de machines sont chiffrés (postes, serveurs, stockage, hyperviseurs, machines virtuelles, équipements industriels) et quelles zones du système d'information sont touchées ?
  ```
  ```texte
  Des comptes à privilèges ont-ils été compromis (authentifications anormales, comptes illégitimes ajoutés aux groupes d'administration Active Directory) ? D'autres systèmes interconnectés (VPN, VDI, RDS, bastion) sont-ils à risque ?
  ```

  == Mesure 3 - Évaluer l'impact métier
  ```texte
  Quelles activités métier vitales sont perturbées ? L'organisation a-t-elle les compétences internes pour reconstruire ou maintenir ces activités ?
  ```
  ```texte
  Le système affecté est-il soumis à une réglementation particulière (OSE, OIV) ou contient-il des données sensibles (classifiées, personnelles, santé, finance) ?
  ```
  ```texte
  Les sauvegardes sont-elles elles-mêmes chiffrées ? Sont-elles hors ligne, saines, rapides à restaurer ? Un contrôleur de domaine, un DNS ou un hyperviseur critique a-t-il été chiffré ?
  ```

  == Mesure 4 - Évaluer l'urgence
  ```texte
  Pour chaque activité vitale impactée, une procédure de continuité (mode nominal ou dégradé) existe-t-elle et est-elle déjà en cours de mise en œuvre ?
  ```

  == Qualifier l'incident
  ```texte
  Au final : l'incident de type rançongiciel est-il confirmé, circonscrit ou étendu, à impact fort, urgent à résoudre ? Quel est le niveau de gravité - anomalie courante, incident mineur, incident majeur, ou crise cyber ?
  ```

  #fiches-liees((("fr-chiffrement-endiguement", "Chiffrement ou effacement en cours - Endiguement"), ("grille-criticite", "Grille de criticité - évaluer la gravité d'un incident"),))

  #source("intercert-france-2026-fiche-reflexe-chif-2", page: "p. 2-10")
  #imprimer-sources()
]
