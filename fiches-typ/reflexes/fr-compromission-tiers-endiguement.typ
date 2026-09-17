#import "../../authoring.typ": *

#fiche(
  id: "fr-compromission-tiers-endiguement",
  type: "fiche_reflexe",
  phase: "endiguement",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Compromission d'un Tiers - Endiguement",
)[
  == Déclencheur
  ```texte
  Un Tiers en relation avec l'organisation (fournisseur, client, prestataire, partenaire, filiale) est confirmé compromis, ou un comportement suspect lui est associé (voir fiche Qualification, prérequis). Les actions ci-dessous s'appliquent selon le cas identifié en qualification : si aucune compromission n'est confirmée ni côté Tiers ni côté organisation (cas I), se limiter à la sensibilisation interne et au maintien du canal de communication avec le Tiers (actions 4 et 5 ci-dessous) ; si le Tiers est confirmé compromis mais pas l'organisation (cas II), ajouter les mesures de remédiation d'urgence et de surveillance (actions 1 et 3) ; si un incident est également détecté au sein de l'organisation (cas III ou IV), traiter en plus cet incident via la fiche réflexe correspondant au type identifié (action 2).
  ```

  == Actions immédiates
  #debut-actions()
  ```obligatoire
  [Référent technique] Étudier au cas par cas les accès à couper avec le Tiers selon l'étendue de l'interconnexion et la gravité de l'incident chez le Tiers (interconnexions de machines, accès applicatifs, blocage des mails provenant du Tiers, mise en quarantaine de logiciels ou matériels fournis par le Tiers)
  ```
  ```obligatoire
  [Référent technique] Si un incident est également détecté au sein de l'organisation, le traiter selon la fiche réflexe correspondant au type identifié (compromission système, compromission de messagerie, chiffrement ou effacement, défiguration de site web, compromission d'équipement de bordure réseau, déni de service, ou fuite de données) - une compromission par infostealer ou d'un téléphone se traite également via la fiche réflexe fuite de données
  ```
  ```differable
  [Référent technique] Mettre en place une surveillance et rechercher, sur le périmètre interne, des marqueurs de compromission (IoC) semblables à ceux observés chez le Tiers
  ```
  ```differable
  [Coordinateur / décideur] Maintenir un canal de communication avec le Tiers.
  
  Suivre l'évolution de la situation et le notifier des actions entreprises.
  ```
  ```secondaire
  [Communication] Sensibiliser en interne sur le risque actuel et mettre en place un canal de signalement des comportements suspects en lien avec le Tiers
  ```

  == À ne pas faire
  ```avertissement
  Ne pas couper systématiquement tous les accès au Tiers par réflexe - arbitrer coupure ou maintien selon l'étendue réelle de l'interconnexion et la gravité de l'incident chez le Tiers.
  
  Exemple : une compromission d'un compte de messagerie chez le Tiers ne justifie pas de couper les accès VPN de tous les comptes.
  ```
  ```avertissement
  Ne pas relâcher la vigilance si le Tiers est confirmé compromis mais que l'organisation ne l'est pas encore - garder le canal de communication ouvert et la surveillance active.
  
  Le risque persiste.
  ```

  == Critères d'escalade
  ```texte
  Si le périmètre s'avère étendu, l'impact sur l'activité métier fort, ET la résolution urgente (les trois critères réunis, seuil "crise cyber"), activer le dispositif de crise complet.
  ```

  #fiches-liees((("fr-compromission-tiers-qualification", "Compromission d'un Tiers - Qualification"), ("fr-compromission-systeme-endiguement", "Compromission système - Endiguement"), ("fr-compromission-messagerie-endiguement", "Compromission d'un compte de messagerie - Endiguement"), ("fr-chiffrement-endiguement", "Chiffrement ou effacement en cours - Endiguement"), ("fr-defiguration-web-endiguement", "Défiguration de site web - Endiguement"), ("fr-compromission-bordure-reseau-endiguement", "Compromission d'un équipement de bordure réseau - Endiguement"), ("fr-deni-service-endiguement", "Déni de service réseau - Endiguement"), ("fr-fuite-donnees-endiguement", "Fuite de données - Endiguement"), ("comm-piloter-interne", "Piloter sa communication de crise interne"), ("comm-messages-cles", "Rédiger les messages clés"), ("reflexe-rassembler-les-preuves", "Rassembler et préserver les preuves"),))

  #source("intercert-france-2026-fiche-reflexe-comp-2", page: "p. 4-8")
  #imprimer-sources()
]
