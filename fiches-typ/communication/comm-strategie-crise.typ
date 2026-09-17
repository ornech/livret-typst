#import "../../authoring.typ": *

#fiche(
  id: "comm-strategie-crise",
  type: "fiche_communication",
  phase: "endiguement",
  onglet: (titre: "Communication de crise", pictogramme: "carre"),
  titre: "Définir sa stratégie de communication de crise cyber",
)[
  == Déclencheur
  ```texte
  Dès qu'un incident cyber est confirmé (voir la fiche réflexe du scénario concerné) : réaliser un état des lieux (faits constatés, situation en matière de communication, contexte) avant de proposer une posture de communication à la direction - proactive (l'attaque ou ses impacts sont visibles publiquement : communiquer rapidement pour expliquer, rassurer, préserver l'image) ou réactive (attaque discrète, à des fins de sabotage ou d'espionnage : ne pas prendre la parole spontanément, préparer des éléments prêts à diffuser). Le choix de la posture revient aux dirigeants ; le communicant ne fait que la proposer, et la réévalue tout au long de la crise selon l'évolution du contexte.
  ```

  == À ne pas faire
  ```avertissement
  Ne pas s'engager sur une date de retour à la normale précise au début de l'incident.
  
  Des imprévus sont toujours possibles.
  ```
  ```avertissement
  Ne pas laisser le communicant centraliser seul la rédaction et l'envoi de toutes les communications à toutes les cibles.
  
  Son rôle est de coordonner les prises de parole des différents acteurs pour une communication globale cohérente.
  ```

  == Objectif de communication
  ```texte
  Expliquer et informer (pédagogie sur l'attaque et les actions de remédiation) ; rassurer (montrer que l'entité fait le nécessaire pour sortir de crise) ; préserver l'image et la réputation (communication transparente, non-propagation de rumeurs) ; faire changer les comportements (inciter aux bonnes pratiques de sécurité numérique).
  ```

  == Rançongiciel / attaque à fins lucratives
  ```texte
  Attaque à visibilité et systématicité fortes (impossibilité de service, fuite d'informations, communication propre de l'attaquant), outils de communication classiques potentiellement indisponibles : opter pour une posture proactive dès les premières heures.
  ```

  == Attaque à fins d'espionnage
  ```texte
  Attaque discrète, l'attaquant peut observer les communications de l'entité comme source d'information : posture réactive, communication interne mesurée pour ne pas compromettre la remédiation, pas de communication publique avant l'éviction définitive de l'attaquant, tout en préparant des messages clés prêts à diffuser.
  ```

  == Déni de service / défiguration (fins de déstabilisation)
  ```texte
  Attaques souvent peu sophistiquées et sans impact durable, mais à fort effet symbolique et émotionnel : posture proactive pour expliquer pédagogiquement les impacts réels (généralement modérés) et rassurer rapidement, sous peine de laisser l'attaque atteindre son but de déstabilisation par emballement médiatique.
  ```

  == Exfiltration de données personnelles
  ```texte
  Si l'attaquant publie un échantillon de données, communiquer en plusieurs temps : (1) rapidement après la publication, indiquer avoir pris connaissance de l'incident et qu'une qualification des données est en cours ; (2) une fois la qualification faite, confirmer ou démentir l'appartenance des données, avec excuses si confirmée ; (3) en cas de risque élevé pour les personnes, les informer individuellement (article 34 RGPD) sauf dérogation vers une communication publique.
  ```

  #fiches-liees((("comm-dialogue-scenarios", "Initier un dialogue interne et anticiper des scénarios"), ("comm-messages-cles", "Rédiger les messages clés"), ("comm-piloter-interne", "Piloter sa communication de crise interne"), ("comm-piloter-externe", "Piloter sa communication de crise externe"), ("cnil-notification-violation-donnees", "Notifier une violation de données (CNIL)"),))

  #source("anssi-2026-fiche-5-definir-sa-strategie", page: "p. 1-11")
  #imprimer-sources()
]
