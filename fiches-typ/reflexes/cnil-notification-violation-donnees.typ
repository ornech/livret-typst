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
  Une violation de données à caractère personnel est confirmée ou fortement suspectée. La notification à la CNIL est obligatoire sous 72 heures à compter de la connaissance de la violation, exclusivement via le téléservice CNIL (notifications.cnil.fr). En cas de doute sur la nécessité de notifier, faire une pré-déclaration précisant qu'une compromission potentielle a eu lieu, même sans exfiltration confirmée. Cette fiche prépare et fiabilise l'information à rassembler avant de notifier en ligne - elle ne remplace jamais le téléservice.
  ```

  == À ne pas faire
  ```avertissement
  Ne jamais notifier en dehors du téléservice CNIL (notifications.cnil.fr), hors panne technique constatée par la CNIL elle-même.
  
  Toute notification adressée par un autre canal est refusée.
  ```
  ```avertissement
  Ne pas attendre d'avoir toutes les réponses pour notifier - en cas de doute, une pré-déclaration reste possible sans confirmation d'exfiltration.
  
  Le délai de 72h prime sur l'exhaustivité.
  ```

  == Type de notification
  ```texte
  Notification complète, notification initiale à compléter ultérieurement, ou notification complémentaire/modifiée d'une notification déjà réalisée (dans ce cas, noter le numéro, la date et l'heure de la notification initiale) ?
  ```

  == Identification de l'organisme
  ```texte
  Numéro SIREN, dénomination, secteur d'activité, effectif, adresse ; coordonnées du responsable légal et d'une personne à contacter pour plus d'informations ; autres organismes impliqués (sous-traitant, responsable conjoint) le cas échéant.
  ```

  == Dates de la violation
  ```texte
  Date et heure de début et de fin de la violation (ou dates approximatives si elle est toujours en cours), date et heure de la prise de connaissance, circonstances de la découverte, et motif du retard de notification le cas échéant.
  ```

  == Nature de la violation
  ```texte
  Perte de confidentialité, d'intégrité et/ou de disponibilité ? Origine de l'incident (piratage/rançongiciel, hameçonnage, équipement perdu ou volé, erreur d'envoi ou de publication...) et cause (acte interne ou externe, malveillant ou accidentel) ?
  ```

  == Données concernées
  ```texte
  Quelle nature de données (état civil, coordonnées, identifiants/mots de passe, données financières, documents officiels...) et, le cas échéant, quelles données sensibles (santé, biométrie, origine, opinions...) ? Nombre approximatif d'enregistrements et de personnes concernées ? Quelles catégories de personnes (employés, clients, patients, mineurs...) ?
  ```
  ```texte
  Quelles mesures de sécurité étaient en place avant la violation (chiffrement, sauvegardes...) ?
  ```

  == Conséquences et actions
  ```texte
  Quels impacts sur les données et quels préjudices potentiels pour les personnes (vol d'identité, fraude, perte financière, discrimination...) ? Estimation du niveau de gravité - négligeable, limité, important, ou maximal.
  ```
  ```texte
  Quelles mesures techniques et organisationnelles ont été appliquées suite à la violation ?
  ```

  == Communication aux personnes concernées
  ```texte
  Les personnes concernées ont-elles été, ou seront-elles informées ? Si non, la justification relève-t-elle d'un risque non élevé, de mesures de protection déjà en place (chiffrement), de mesures ultérieures suffisantes, ou d'un effort disproportionné (auquel cas prévoir une communication publique) ?
  ```

  == Notifications transfrontalières
  ```texte
  Le traitement cible-t-il des personnes de plusieurs états membres ? La violation a-t-elle été ou sera-t-elle notifiée à une autre autorité de protection des données, ou à une autre autorité pour une exigence légale distincte (NIS, eIDAS) ?
  ```

  #fiches-liees((("fr-fuite-donnees-endiguement", "Fuite de données - Endiguement"),))

  #source("cnil-2023-violation-de-donnees-personnel", page: "sections « Type de notification » à « Notifications transfrontalières » (document sans pagination fixe, format .odt)")
  #imprimer-sources()
]
