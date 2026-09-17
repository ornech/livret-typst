#import "../../authoring.typ": *

#fiche(
  id: "fr-deni-service-qualification",
  type: "diagnostic",
  phase: "qualification",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Déni de service réseau - Qualification",
)[
  == Déclencheur
  ```texte
  Un incident de type déni de service réseau est détecté ou suspecté contre un ou plusieurs services de l'organisation exposés sur Internet. Répondre vite avec des réponses approximatives plutôt que chercher l'exhaustivité - fixer un temps contraint (30 minutes à 1 heure) ; une qualification plus fine se fera ensuite.
  ```

  == Critères d'escalade
  ```texte
  Si la gravité conclue est "incident majeur" ou "crise cyber", activer le dispositif de crise complet et ouvrir la fiche Endiguement. Si l'organisation dispose de prestations externalisées (FAI, hébergeur, CDN), demander dès la qualification si des services d'atténuation du déni de service peuvent être activés, inclus ou en supplément, et sous quel délai.
  ```

  == Mesure 1 - Confirmer l'incident
  ```texte
  L'indisponibilité ou le ralentissement d'un ou plusieurs services est-il confirmé ? Un incident de production peut-il être écarté (mise à jour récente, changement de configuration, problème technique interne/externe, expiration de certificat ou de domaine, pic d'activité métier légitime) ?
  ```
  ```texte
  Les signaux disponibles (supervision de sécurité, supervision système, supervision réseau, signalement d'utilisateurs ou de partenaires, revendication d'un attaquant) confirment-ils un déni de service ? Conserver toute revendication (capture d'écran).
  ```

  == Mesure 2 - Évaluer le périmètre
  ```texte
  La chaîne de flux du déni de service peut-elle être cartographiée, de la source à la destination (FAI, hébergeur, services dépendants - DNS, CDN, tiers) ? Quel est l'élément défaillant de cette chaîne, et qui en assure l'administration (interne ou infogérant) ?
  ```

  == Mesure 3 - Évaluer les caractéristiques du déni de service
  ```texte
  De quel type de déni de service s'agit-il - volumétrique, sur les protocoles réseau, ou applicatif ? Les requêtes proviennent-elles d'une source unique, de plages IP, ou sont-elles massivement distribuées (DDoS) ? Nos propres infrastructures participent-elles à une attaque par réflexion ou rebond vers un tiers ?
  ```

  == Mesure 4 - Évaluer l'impact
  ```texte
  Quelles activités métier (internes ou externes) sont impactées ? L'incident a-t-il un impact réglementaire (RGPD si l'indisponibilité touche des données personnelles), financier direct, ou chez un tiers (attaque par réflexion depuis nos infrastructures) ? Des mesures d'endiguement ont-elles déjà été entreprises, avec quel impact sur les activités ?
  ```

  == Mesure 5 - Évaluer l'urgence
  ```texte
  Pour chaque activité vitale impactée, une procédure de continuité (mode nominal ou dégradé) existe-t-elle et sous combien de temps peut-elle être mise en œuvre ?
  ```

  == Qualifier l'incident
  ```texte
  Au final, l'incident de type déni de service réseau est-il confirmé ? Circonscrit ou étendu, à impact fort, urgent à résoudre ? Quel est le niveau de gravité - anomalie courante, incident mineur, incident majeur, ou crise cyber ?
  ```

  #fiches-liees((("fr-deni-service-endiguement", "Déni de service réseau - Endiguement"), ("grille-criticite", "Grille de criticité - évaluer la gravité d'un incident"),))

  #source("intercert-france-2026-fiche-reflexe-deni", page: "p. 4-13")
  #imprimer-sources()
]
