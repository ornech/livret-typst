#import "../../authoring.typ": *

#fiche(
  id: "fr-fuite-donnees-qualification",
  type: "diagnostic",
  phase: "qualification",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Fuite de données",
)[
  == Déclencheur
  ```texte
  Une fuite de données de l'organisation est suspectée ou confirmée. Répondre vite avec des réponses approximatives plutôt que chercher l'exhaustivité - une qualification plus fine se fera ensuite.
  ```

  == Critères d'escalade
  ```texte
  Si la gravité conclue est "incident majeur" ou "crise cyber", activer le dispositif de crise complet et ouvrir la fiche Endiguement.
  ```

  == Mesure 1 - Confirmer l'incident
  ```texte
  Le signalement ou la revendication est-il crédible (échantillon disponible), et concerne-t-il bien mon organisation (pas déjà publique) ?
  ```

  == Mesure 2 - Identifier la source
  ```texte
  Les données fuitées sont-elles hébergées par mon organisation ou par un tiers ?
  ```
  ```texte
  Y a-t-il une compromission du système d'information avérée ou suspectée en lien avec cette fuite ?
  ```

  == Mesure 3 - Évaluer le périmètre
  ```texte
   - Quel volume et quelle nature de données sont concernés ? Sont-elles anciennes ou récentes ?
   - D'autres systèmes interconnectés sont-ils à risque, ou d'autres données à venir en publication ?
  ```

  == Mesure 4 - Évaluer l'impact
  ```texte
  Quel type de données a fuité (métier, personnelles, authentification, classifiées) ?
  ```
  ```texte
  Le système affecté est-il soumis à une réglementation particulière (OSE, OIV, NIS2, DORA) ? La fuite est-elle déjà connue publiquement ?
  ```

  == Mesure 5 - Évaluer l'urgence
  ```texte
   - L'exfiltration est-elle toujours en cours ? 
   -  y a-t-il un délai réglementaire à respecter (CNIL 72h, assurance) ? 
   - quel est le niveau de gravité : anomalie courante, incident mineur, incident majeur, ou crise cyber ?
  ```

  #fiches-liees((("fr-fuite-donnees-endiguement", "Fuite de données - Endiguement"),))

  #source("intercert-france-2026-fiche-reflexe-fuit", page: "p. 4-9")
  #imprimer-sources()
]
