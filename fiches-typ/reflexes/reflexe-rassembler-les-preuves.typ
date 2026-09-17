#import "../../authoring.typ": *

#fiche(
  id: "reflexe-rassembler-les-preuves",
  type: "fiche_reflexe",
  phase: "endiguement",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Rassembler et préserver les preuves",
)[
  == Déclencheur
  ```texte
  Un scénario d'incident est en cours de traitement (voir la fiche réflexe du scénario concerné). Cette fiche regroupe les gestes de préservation des preuves communs à tous les scénarios, à mener en parallèle des actions d'endiguement propres au scénario - elle ne remplace pas la fiche du scénario, elle la complète. Principe transversal, valable au-delà des seules actions listées ici : la préservation des traces doit influencer tous les choix d'action de l'endiguement, pas seulement ceux-ci - à choix équivalent, préférer systématiquement l'action qui altère le moins possible le système.
  ```

  == Actions immédiates
  #debut-actions()
  ```obligatoire
  [Référent technique] Identifier et préserver les journaux des équipements de sécurité (pare-feux, passerelles VPN, proxy, consoles antivirus/EDR, sondes réseau) : s'ils ne sont pas déjà envoyés vers un centralisateur de logs, les exporter sur un support hors ligne et augmenter leur durée de rétention, ainsi que leur verbosité si possible
  ```
  ```obligatoire
  [Référent technique] Identifier et préserver les journaux d'authentification (infrastructure d'authentification centralisée, fournisseur d'identité ou de second facteur) : exporter ces journaux et augmenter leur durée de rétention - les journaux d'une machine déjà éteinte ou en veille sont considérés comme préservés
  ```
  ```obligatoire
  [Référent technique] Avant de mettre hors service une machine infectée, en préserver une image : instantané avec export de la mémoire pour une machine virtuelle ; prélèvement forensique pour une machine physique (via l'EDR, un agent forensique, le service d'administration, ou un outil manuel) - vérifier au préalable que la politique de gestion de l'équipement autorise l'exécution de cet outil
  ```
  ```differable
  [Référent technique] Si le centralisateur de logs est lui-même potentiellement compromis, arbitrer entre le préserver déconnecté du réseau (conserve les traces déjà collectées mais ne permet plus de suivre les actions futures de l'attaquant) et le laisser accessible pour continuer la supervision
  ```
  ```differable
  [Référent technique] Si une judiciarisation est envisageable, collecter les preuves de façon recevable juridiquement : tracer la procédure de collecte dans la main courante et calculer une empreinte cryptographique des fichiers collectés (ex : SHA-256)
  ```
  ```secondaire
  [Référent technique] Collecter en complément les artefacts propres au scénario en cours indiqués dans sa fiche réflexe (ex : note de rançon et fichier chiffré, e-mail original avec en-têtes, capture d'écran datée d'une revendication)
  ```

  == À ne pas faire
  ```avertissement
  Ne pas augmenter la verbosité des journaux sans limite pendant l'incident.
  
  Le volume généré peut saturer le stockage et, pour un déni de service notamment, aggraver l'incident en cours.
  ```
  ```avertissement
  Ne pas exécuter un outil de prélèvement forensique sans vérifier au préalable que la politique de gestion de l'équipement l'autorise.
  
  Certains environnements ne permettent pas l'exécution d'outils arbitraires.
  ```
  ```avertissement
  Ne pas négliger la traçabilité de la collecte elle-même (main courante, procédure, empreintes).
  
  Une preuve mal tracée perd sa valeur devant la justice ou l'assureur.
  ```
  ```avertissement
  En cas de suspicion d'un acte malveillant interne, ne pas communiquer largement sur la collecte de preuves en cours.
  
  Un cercle de diffusion mal maîtrisé risque de permettre l'effacement de preuves par un complice.
  ```

  == Critères d'escalade
  ```texte
  Cette fiche accompagne l'endiguement d'un scénario déjà ouvert : les critères d'escalade sont ceux de la fiche réflexe du scénario en cours, pas propres à celle-ci. En cas de doute sur la recevabilité juridique d'une preuve ou sur l'opportunité d'un dépôt de plainte, se référer au rôle Juridique/conformité de la cellule de crise.
  ```

  #fiches-liees((("fr-chiffrement-endiguement", "Chiffrement ou effacement en cours - Endiguement"), ("fr-compromission-systeme-endiguement", "Compromission système - Endiguement"), ("fr-compromission-messagerie-endiguement", "Compromission d'un compte de messagerie - Endiguement"), ("fr-compromission-bordure-reseau-endiguement", "Compromission d'un équipement de bordure réseau - Endiguement"), ("fr-compromission-infostealer-endiguement", "Compromission par un infostealer - Endiguement"), ("fr-defiguration-web-endiguement", "Défiguration de site web - Endiguement"), ("fr-deni-service-endiguement", "Déni de service réseau - Endiguement"), ("fr-fuite-donnees-endiguement", "Fuite de données - Endiguement"), ("fr-compromission-tiers-endiguement", "Compromission d'un Tiers - Endiguement"),))

  #source("intercert-france-2026-fiche-reflexe-chif", page: "sections « Préserver les traces » des 8 fiches réflexes Endiguement listées (Chiffrement, Compromission système/messagerie/bordure réseau/infostealer, Défiguration, Déni de service, Fuite de données) - page variable selon la fiche, non consolidée ici")
  #source("anssi-cdse-2021-crise-d-origine-cyber-le", page: "p. 43 (Fiche 11 « Activer ses réseaux de soutien »)")
  #imprimer-sources()
]
