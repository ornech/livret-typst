#import "../../authoring.typ": *

#fiche(
  id: "exercice-organiser",
  type: "checklist",
  phase: "preparation",
  onglet: (titre: "Préparation", pictogramme: "triangle"),
  titre: "Organiser un exercice de simulation de crise cyber",
)[
  == Objectif
  ```texte
  À froid, en préparation : organiser régulièrement un exercice de simulation de crise cyber est la seule façon de transformer la connaissance de ce livret en réflexes (voir Philosophie). Un exercice sur table (2 à 3 heures, environ 6 semaines de préparation) convient pour une première sensibilisation ; une simulation complète (demi-journée à 2 jours, 2 à 6 mois de préparation) permet d'entraîner réellement le dispositif, y compris en mode dégradé.
  ```

  == Constituer un groupe projet
  ```texte
  Un directeur de l'exercice (DIREX, souvent le RSSI ou la personne en charge des exercices/de la gestion de crise) et plusieurs planificateurs (au moins un expert SSI, une personne en charge de la continuité d'activité, éventuellement un communicant).
  ```

  == Définir les objectifs
  ```texte
  Sélectionner 3 à 4 objectifs parmi : sensibiliser les participants aux problématiques cyber ; former ou entraîner le personnel (faire travailler ensemble équipes SSI et gestion de crise, s'entraîner à choisir entre plans d'endiguement/contournement/remédiation) ; tester la coordination avec d'autres parties prenantes (filiales, prestataires) ; tester ou mettre à jour le dispositif de gestion de crise (annuaires, chaînes d'alerte, stratégie de communication, modes dégradés, PCA/PRA).
  ```

  == Choisir le format
  ```texte
  Exercice sur table (2-3h, ~6 semaines de préparation) : un ou plusieurs animateurs présentent la situation, la cellule de crise réfléchit collectivement - adapté à une organisation peu habituée ou pour une première sensibilisation. Simulation (demi-journée à 2 jours, 2-6 mois de préparation) : une cellule d'animation distincte simule les évènements et interactions - immersion plus forte, permet de tester les interactions entre plusieurs cellules de crise.
  ```

  == Choisir le thème
  ```texte
  S'appuyer sur l'analyse de la menace, les scénarios d'analyse de risques, et le RETEX des incidents/exercices passés. 5 types d'attaque à considérer : défiguration de site web, déni de service, exfiltration de données (personnelles ou critiques), chiffrement/destruction de données, destruction de services. Se méfier du syndrome de l'équipe persuadée que son système n'a aucune faille.
  ```

  == Organisation pratique
  ```texte
  Durée (3h minimum, une journée pour une simulation complète), nom d'exercice (facilite les échanges sans alarmer les non-joueurs, sans trop expliciter le thème), moyens logistiques (outils de communication testés en amont, salle par cellule de crise, salle d'animation séparée), calendrier (réunion de lancement, réunion de planification, interviews d'experts, rédaction du chronogramme, 1 à 2 briefings joueurs, briefings animateurs/observateurs, date communiquée plusieurs mois en amont).
  ```
  ```attention
  Éviter autant que possible de reporter la date de l'exercice.
  
  Risque de démobilisation des participants.
  ```

  == RETEX à chaud (juste après l'exercice, ~1h)
  ```texte
  Tour de table où chaque joueur s'exprime en premier (les observateurs parlent après, pour ne pas influencer). Thématiques : préparation des participants, vraisemblance du scénario, qualité des échanges d'information, qualité de la communication interne/externe, fonctionnement des équipements, logistique, ressources humaines. Aborder les points négatifs sous forme d'axes d'amélioration, surtout pour un premier exercice.
  ```

  == RETEX à froid
  ```texte
  Réunit à nouveau l'ensemble des participants (~1h), quelques jours à un mois après l'exercice, en s'appuyant sur un questionnaire d'auto-évaluation et, si besoin, des entretiens individuels - permet d'identifier les oublis et de proposer des axes d'évolution.
  ```

  == Produire un rapport et un plan d'action
  ```texte
  Rassembler les mains courantes de l'exercice (au moins une doit avoir été tenue par un joueur en cellule de crise), les mails échangés, les notes des observateurs, les comptes-rendus des deux RETEX. Le rapport doit être synthétique, publié sous deux mois, présenter points forts et points à améliorer, et proposer un plan d'action concret avec un responsable par action - à diffuser, éventuellement avec une restitution orale.
  ```

  #fiches-liees((("exercice-ecueils-biais", "Exercice - Écueils et biais"), ("role-cellule-crise", "Rôles de la cellule de crise"),))

  #source("anssi-cca-2020-organiser-un-exercice-de", page: "p. 24-37, p. 104-111")
  #imprimer-sources()
]
