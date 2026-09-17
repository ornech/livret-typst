#import "../../authoring.typ": *

#fiche(
  id: "fr-compromission-bordure-reseau-qualification",
  type: "diagnostic",
  phase: "qualification",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Compromission d'un équipement de bordure réseau - Qualification",
)[
  == Déclencheur
  ```texte
  Un équipement de bordure réseau de l'organisation (pare-feu, passerelle VPN, routeur ou box internet) est suspecté compromis, OU un équipement de bordure possédé par l'organisation est affecté par une vulnérabilité récemment annoncée. Répondre vite avec des réponses approximatives plutôt que chercher l'exhaustivité - fixer un temps contraint (30 minutes à 1 heure) ; une qualification plus fine se fera ensuite.
  ```

  == Critères d'escalade
  ```texte
  Si la gravité conclue est "incident majeur" ou "crise cyber", activer le dispositif de crise complet et ouvrir la fiche Endiguement. Même si l'équipement n'est finalement pas compromis mais reste affecté par une vulnérabilité non corrigée, appliquer tout de même les mesures de la fiche Endiguement.
  ```

  == Mesure 1 - Confirmer la compromission
  ```texte
  L'incident est-il confirmé ou nécessite-t-il des investigations complémentaires ? Quel est le niveau de compromission de l'équipement - accès utilisateur (fonctionnalités d'administrateur, sans exécution de code) ou accès interne (exécution de code arbitraire, généralement plus grave et rendant l'expulsion de l'attaquant plus difficile) ?
  ```
  ```texte
  La compromission est-elle récente (moins de quelques heures) ou ancienne ? Y a-t-il des traces de latéralisation de l'attaquant vers d'autres machines ?
  ```

  == Mesure 2 - Évaluer le périmètre
  ```texte
  L'incident est-il circonscrit à une partie identifiable du système d'information ? Quels secrets ont été compromis (mots de passe locaux, secrets LDAP/Active Directory - notamment un compte administrateur de domaine, secrets de tunnels VPN, secrets d'infrastructure de clés/certificats, communautés ou clés SNMP, secrets MFA) et donnent-ils accès à d'autres parties du SI ?
  ```
  ```texte
  D'autres systèmes d'information interconnectés avec celui de l'organisation sont-ils à risque, y compris des tiers joignables via cet équipement ? D'autres équipements de bordure de même marque, ou partageant les mêmes secrets, sont-ils à risque ?
  ```

  == Mesure 3 - Évaluer l'impact
  ```texte
  Des activités vitales sont-elles perturbées ? L'attaquant dispose-t-il de droits étendus sur le SI ? La DSI a-t-elle les compétences internes pour réinstaller l'équipement ou installer les correctifs ?
  ```

  == Mesure 4 - Évaluer l'urgence
  ```texte
  Les impacts sont-ils élevés ? Quelles activités vitales sont menacées par cette compromission, et l'attaquant est-il en position de les perturber facilement ?
  ```

  == Qualifier l'incident
  ```texte
  Au final, la compromission de l'équipement de bordure est-elle confirmée ? L'incident est-il circonscrit ou étendu, à impact fort, urgent (la situation peut-elle se dégrader rapidement) ? Quel est le niveau de gravité - anomalie courante, incident mineur, incident majeur, ou crise cyber ?
  ```

  #fiches-liees((("fr-compromission-bordure-reseau-endiguement", "Compromission d'un équipement de bordure réseau - Endiguement"), ("fr-compromission-systeme-qualification", "Compromission système - Qualification"), ("grille-criticite", "Grille de criticité - évaluer la gravité d'un incident"),))

  #source("intercert-france-2026-fiche-reflexe-comp", page: "p. 2-9")
  #imprimer-sources()
]
