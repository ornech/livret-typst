#import "../../authoring.typ": *

#fiche(
  id: "fr-deni-service-endiguement",
  type: "fiche_reflexe",
  phase: "endiguement",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Déni de service réseau - Endiguement",
)[
  == Déclencheur
  ```texte
  Un incident de type déni de service réseau touche un ou plusieurs services de l'organisation exposés sur Internet (voir fiche Qualification, prérequis). Les actions ci-dessous s'appliquent en cohérence avec le périmètre et les caractéristiques déterminés en qualification (volumétrique, sur les protocoles, ou applicatif) : commencer par les éléments en amont du composant défaillant (FAI), terminer par le composant défaillant lui-même, en appliquant les actions une par une pour en juger l'efficacité.
  ```

  == Actions immédiates
  #debut-actions()
  ```obligatoire
  [Référent technique] Déterminer le périmètre et l'ordre des actions d'endiguement à partir des caractéristiques établies en qualification
  ```
  ```obligatoire
  [Référent technique] Limiter le trafic en amont avec le FAI : contacter son support technique, faire bloquer les requêtes selon les éléments discriminants identifiés en qualification (IP source, protocole, géolocalisation), activer son service anti-DDoS si disponible
  ```
  ```obligatoire
  [Référent technique] Activer un service anti-DDoS externe si disponible (redirection du trafic par annonces BGP/tunnel GRE ou par DNS)
  ```
  ```obligatoire
  [Référent technique] En cas d'attaque sur les services DNS, filtrer les requêtes malformées et désactiver les fonctions inutilisées ; en cas d'attaque applicative, activer le CDN si disponible pour répartir la charge sur le contenu
  ```
  ```differable
  [Référent technique] Agir dans le périmètre de l'hébergeur : activer le service anti-DDoS de l'hébergeur, ajuster les règles de pare-feu et de répartition de charge selon les éléments discriminants
  ```
  ```secondaire
  [Référent technique] Désactiver les composants tiers optionnels et non essentiels
  ```
  ```secondaire
  [Référent technique] Préserver les traces des journaux d'équipements, en maîtrisant l'augmentation de verbosité.
  
  Ne pas déclencher un nouveau déni de service par saturation du stockage.
  ```

  == À ne pas faire
  ```avertissement
  Ne pas définir des règles de blocage précises basées sur des discriminants applicatifs fins sur une attaque volumétrique d'ampleur.
  
  Risque de surcharger le pare-feu applicatif et de causer un nouveau déni de service.
  ```
  ```avertissement
  Ne pas augmenter excessivement la verbosité des journaux pendant l'attaque.
  
  Une attaque par déni de service augmente déjà fortement leur volumétrie, au risque de saturer le stockage.
  ```
  ```avertissement
  Ne pas recourir à un CDN ou un service anti-DDoS externalisé sans en mesurer l'impact sur la confidentialité des données - à évaluer d'un point de vue métier et réglementaire (RGPD).
  
  Ces solutions déchiffrent généralement le trafic TLS pour fonctionner.
  ```

  == Critères d'escalade
  ```texte
  Si l'incident n'est toujours pas contenu à l'issue de ces actions, la remédiation passe par une réforme de l'architecture, une contractualisation de service spécifique (anti-DDoS) et la formation des personnels. Si le périmètre est étendu, l'impact fort, ET la résolution urgente (les trois critères réunis, seuil "crise cyber"), activer le dispositif de crise complet.
  ```

  #fiches-liees((("fr-deni-service-qualification", "Déni de service réseau - Qualification"), ("reflexe-rassembler-les-preuves", "Rassembler et préserver les preuves"),))

  #source("intercert-france-2026-fiche-reflexe-deni-2", page: "p. 4-11")
  #imprimer-sources()
]
