#import "../../authoring.typ": *

#fiche(
  id: "comm-piloter-interne",
  type: "fiche_communication",
  phase: "endiguement",
  onglet: (titre: "Communication de crise", pictogramme: "carre"),
  titre: "Piloter sa communication de crise interne",
)[
  == Déclencheur
  ```texte
  Pendant la crise, la communication interne prime sur la communication externe : les collaborateurs sont souvent les premiers impactés (ex : demande de rançon affichée sur les écrans) et ne doivent pas découvrir la crise dans les médias.
  ```

  == À ne pas faire
  ```avertissement
  Ne pas laisser les collaborateurs découvrir l'incident par les médias ou les réseaux sociaux.
  
  La communication interne doit toujours précéder la communication externe.
  ```
  ```avertissement
  Ne pas ignorer les décalages horaires des équipes à l'étranger pour définir le tempo des communications internes.
  ```

  == Objectif de communication
  ```texte
  Informer, rassurer et aligner les collaborateurs pour éviter discours contradictoires, rumeurs, fuites d'informations et panique - et accompagner le changement de comportements en matière de cybersécurité (ex : mise en place du MFA, changement de mots de passe).
  ```

  == Outils classiques (si disponibles)
  ```texte
  Réunion d'équipe ou briefing managers, email interne ou newsletter (objet clair "Information importante - incident cyber en cours"), intranet, réseau social d'entreprise, messagerie interne, affichage dynamique ou papier.
  ```

  == Outils dégradés (si les outils classiques sont indisponibles)
  ```texte
  Téléphone et emails personnels, application de messagerie instantanée temporaire, groupe fermé sur un réseau social grand public, brochures avec consignes, adresse email temporaire hors du système d'information, formulaire de contact sur l'intranet, mode papier-crayon, courrier postal.
  ```

  == Discrétion et confidentialité
  ```texte
  Rappeler aux collaborateurs de ne pas répondre directement aux sollicitations des médias et de les transmettre au service de presse ; restreindre les prises de parole individuelles sur les réseaux sociaux (risques réputationnels et juridiques - clause de confidentialité, devoir de réserve) ; les communications internes risquent de fuiter en externe.
  ```

  #fiches-liees((("comm-strategie-crise", "Définir sa stratégie de communication de crise cyber"), ("comm-messages-cles", "Rédiger les messages clés"), ("comm-boite-outils", "Créer une boîte à outils dédiée"),))

  #source("anssi-2026-fiche-7-piloter-sa-communicat", page: "p. 1-3")
  #imprimer-sources()
]
