#import "../../authoring.typ": *

#fiche(
  id: "grille-criticite",
  type: "diagnostic",
  phase: "qualification",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Grille de criticité - évaluer la gravité d'un incident",
)[
  == Déclencheur
  ```texte
  Utilisée pendant la qualification d'un incident (voir la fiche réflexe du scénario concerné, étape "Qualifier l'incident"), en complément - jamais en remplacement - des 3 critères déjà établis dans le livret (périmètre étendu, impact fort, résolution urgente). Objectif : donner un point de départ chiffré à la discussion collective, sans se substituer au jugement de la cellule. Cette grille ne doit jamais être remplie seul dans son coin : la noter à voix haute en cellule, axe par axe, fait partie de l'exercice de qualification lui-même.
  ```

  == 1. Noter chaque critère de 0 à 3
  ```texte
  **Périmètre** - 0 : un poste ou un compte isolé · 1 : plusieurs machines ou comptes d'une même zone · 2 : plusieurs zones ou un système transverse (annuaire, sauvegardes) · 3 : ensemble du système d'information, ou un système vital pour toute l'organisation.
  ```
  ```texte
  **Impact métier** - 0 : aucune gêne perceptible · 1 : ralentissement, contournement possible · 2 : arrêt d'une activité importante · 3 : arrêt d'une activité vitale, atteinte à la sécurité des personnes, ou mise en danger de l'organisation.
  ```
  ```note
  Pour noter ce critère, ne pense pas qu'à l'arrêt d'activité : une atteinte grave peut aussi être humaine, financière, juridique, sur la gouvernance, ou sur l'image et la confiance - sans qu'une seule activité ne s'arrête formellement.
  ```
  ```texte
  **Urgence** - 0 : peut attendre plusieurs jours · 1 : à traiter sous la semaine · 2 : à traiter sous 24 à 48h · 3 : chaque heure compte (propagation active, exfiltration en cours, échéance réglementaire courte).
  ```
  ```texte
  **Exposition externe** - 0 : aucune · 1 : obligation de déclaration probable (réglementaire, assurance) · 2 : déclaration certaine et/ou tiers déjà informés · 3 : déjà public, médiatisé ou revendiqué, avec un risque de perte durable de confiance (clients, partenaires, tutelle) - pas seulement une exposition médiatique passagère.
  ```

  == 2. Additionner - un repère, pas une conclusion
  ```texte
  Faire la somme des 4 critères (0 à 12) : 0-2 anomalie courante (indicatif) · 3-5 incident mineur (indicatif) · 6-8 incident majeur (indicatif) · 9-12 crise cyber (indicatif).
  ```
  ```avertissement
  Ces bandes ne remplacent jamais la règle déjà actée dans ce livret : le seuil "crise cyber" exige que le périmètre soit étendu, ET l'impact fort, ET la résolution urgente - les trois critères réunis, pas une simple addition. Un score élevé peut masquer qu'un seul critère est réellement au maximum pendant que les autres compensent artificiellement à la baisse. Toujours vérifier ces trois critères séparément avant d'activer ou non le dispositif de crise complet, quel que soit le score total.
  ```
  ```note
  Pour lire une bande, demande-toi à quel prix l'organisation surmontera la situation : sans difficulté, avec quelques difficultés (mode dégradé), avec de sérieuses difficultés (mode très dégradé), ou pas du tout (survie menacée) - pas seulement le total obtenu.
  ```

  == Limites et biais à surveiller
  ```attention
  **Illusion de précision** : un chiffre paraît objectif alors qu'il repose sur des estimations grossières, jugées par une seule personne à un instant donné. Un score de 7 n'est pas deux fois plus grave qu'un score de 3 : c'est un repère de discussion, pas une mesure.
  ```
  ```avertissement
  **Faux sentiment de contrôle** - le piège le plus dangereux de cette grille : un score modéré rassure la cellule alors que la situation évolue et peut basculer brutalement (chiffrement qui se propage silencieusement, exfiltration en cours non détectée). Le score est une photo à un instant T, jamais un radar : il doit être repris à chaque point fixe, jamais figé une fois pour toutes.
  ```
  ```attention
  **Biais d'ancrage** : le premier score fixé influence tous les réajustements suivants - on a tendance à sous-estimer une aggravation réelle plutôt qu'à réévaluer franchement à la hausse.
  ```
  ```attention
  **Biais de confirmation** : une fois le score posé, on remarque plus facilement les signaux qui le confirment que ceux qui le contrediraient.
  ```
  ```attention
  **Pensée de groupe** : un score validé collectivement décourage la contestation individuelle d'un participant qui perçoit, seul, un signal alarmant que le score ne reflète pas.
  ```
  ```attention
  **Escalade d'engagement** : une fois un score bas annoncé, la cellule hésite à le réévaluer à la hausse publiquement - cela reviendrait à admettre une erreur d'appréciation initiale, au prix d'un retard à activer le dispositif de crise complet.
  ```
  ```note
  Aucune procédure écrite, cette grille comprise, ne neutralise ces biais par elle-même - seule une culture du risque entretenue par l'entraînement régulier les corrige (voir la fiche Exercice - écueils et biais).
  ```

  #fiches-liees((("fr-chiffrement-qualification", "Chiffrement ou effacement en cours - Qualification"), ("fr-compromission-systeme-qualification", "Compromission système - Qualification"), ("fr-compromission-messagerie-qualification", "Compromission d'un compte de messagerie - Qualification"), ("fr-compromission-bordure-reseau-qualification", "Compromission d'un équipement de bordure réseau - Qualification"), ("fr-compromission-infostealer-qualification", "Compromission par un infostealer - Qualification"), ("fr-defiguration-web-qualification", "Défiguration de site web - Qualification"), ("fr-deni-service-qualification", "Déni de service réseau - Qualification"), ("fr-fuite-donnees-qualification", "Fuite de données"), ("fr-compromission-tiers-qualification", "Compromission d'un Tiers - Qualification"), ("exercice-ecueils-biais", "Exercice - Écueils et biais"),))

  #source("intercert-france-2026-fiche-reflexe-chif-2", page: "p. 5, p. 10 et Annexes p. 13 (étape « Qualifier l'incident »)")
  #source("claude-md-section-retex-synthese-de-cabi", page: "n/a - document interne du projet, non paginé")
  #source("grille-de-notation-par-axes-et-mise-en-g", page: "n/a - document interne du projet, non paginé")
  #source("anssi-2024-ebios-risk-manager-la-methode", page: "p. 26-27 (échelle de gravité des événements redoutés, atelier 1)")
  #source("anssi-2024-fiche-methode-evaluer-la-grav", page: "p. 1 (catégories d'impact à prendre en compte)")
  #imprimer-sources()
]
