#import "../../authoring.typ": *

#fiche(
  id: "cnil-notification-violation-donnees",
  type: "checklist",
  phase: "endiguement",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Notifier une violation de données (CNIL)",
)[
  == Déclencheur
  ```texte
    Violation de données confirmée ou fortement suspectée. Notification obligatoire sous 72h à compter de la connaissance de la violation, exclusivement via le téléservice CNIL (notifications.cnil.fr). Dans le doute : notifier quand même, quitte à compléter ensuite. Le DPO (s'il existe) rédige ou valide l'envoi.
  ```

  == À ne pas faire
  ```avertissement
    Notifier ailleurs que sur notifications.cnil.fr, hors panne technique constatée par la CNIL elle-même.
  ```

  ```avertissement
    Sacrifier le délai à l'exhaustivité : notifier à 72h avec ce qu'on a, compléter ensuite.
  ```

  ```avertissement
    Oublier le registre interne des violations : obligatoire même sans notification à la CNIL.
  ```

  == Type de notification
  ```texte
    Complète, initiale à compléter plus tard, ou complémentaire/modifiée d'une notification déjà faite (préciser alors numéro, date et heure de l'initiale).
  ```

  == Identification de l'organisme
  ```texte
    SIREN, dénomination, secteur, effectif, adresse ; responsable légal et contact ; autres organismes impliqués (sous-traitant, responsable conjoint) le cas échéant.
  ```

  == Dates de la violation
  ```texte
    Reprendre la main courante (voir fiche Main courante et état de situation) : début, fin ou dates approximatives, découverte, prise de connaissance. Motif du retard uniquement si les 72h sont dépassées.
  ```

  == Éléments à reprendre de la fiche Qualification
  ```texte
    Voir fiche Fuite de données : nature de la violation (confidentialité/intégrité/disponibilité, origine, cause interne ou externe, malveillante ou accidentelle) ; données concernées (nature, sensibilité éventuelle, volume, catégories de personnes touchées) ; mesures de sécurité en place avant l'incident ; gravité et préjudices potentiels pour les personnes.
  ```

  == Actions déjà menées
  ```texte
    Reprendre les mesures d'Endiguement (voir fiche Fuite de données - Endiguement) : blocage des flux, sécurisation des comptes/systèmes, préservation des traces.
  ```

  == Communication aux personnes concernées
  ```texte
    Reprendre la décision de communication de crise (voir fiche Définir sa stratégie de communication de crise cyber, article 34 RGPD) : personnes informées ou non ? Si non : risque non élevé, protection déjà en place, mesures ultérieures suffisantes, ou effort disproportionné (→ communication publique) ?
  ```

  == Notifications transfrontalières
  ```texte
    Personnes de plusieurs États membres concernées ? Identifier l'autorité chef de file (guichet unique). Vérifier aussi une notification distincte au titre de NIS 2 ou eIDAS.
  ```

  #fiches-liees((
    ("fr-fuite-donnees-qualification", "Fuite de données"),
    ("fr-fuite-donnees-endiguement", "Fuite de données - Endiguement"),
    ("main-courante-etat-situation", "Main courante et état de situation"),
    ("comm-strategie-crise", "Définir sa stratégie de communication de crise cyber"),
  ))

  #source(
    "cnil-2023-violation-de-donnees-personnel",
    page: "sections « Type de notification » à « Notifications transfrontalières » (document sans pagination fixe, format .odt)",
  )
  #imprimer-sources()
]
