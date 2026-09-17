#import "../../authoring.typ": *

#fiche(
  id: "fr-compromission-messagerie-endiguement",
  type: "fiche_reflexe",
  phase: "endiguement",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Compromission d'un compte de messagerie - Endiguement",
)[
  == Déclencheur
  ```texte
  Une compromission est suspectée ou confirmée sur un compte de messagerie (voir fiche Qualification, prérequis). Une compromission de compte de messagerie n'est que très rarement l'objectif final d'une attaque (hors espionnage) : elle constitue le plus souvent une porte d'entrée vers une attaque plus large (vol d'accès au VPN ou aux applications, arnaque au président, usurpation d'identité). Les mesures ci-dessous visent à reprendre le contrôle du compte et à nettoyer ses emprises ; si la compromission s'avère plus étendue, les recherches se poursuivent au-delà du simple endiguement (voir critères d'escalade).
  ```

  == Actions immédiates
  #debut-actions()
  ```obligatoire
  [Référent technique] Reprendre le contrôle du compte compromis : le bloquer temporairement, réinitialiser mot de passe et sessions/jetons actifs, forcer le réenregistrement du MFA en mode Enforce
  ```
  ```obligatoire
  [Référent technique] Nettoyer les emprises restantes sur le compte compromis : supprimer les délégations et transferts automatiques illégitimes, les accès d'applications tierces frauduleux, et les actions d'administration illégitimes si le compte avait des droits d'administration
  ```
  ```obligatoire
  [Référent technique] Protéger le poste de l'utilisateur compromis (surveillance antivirus, analyse complète ou réinstallation en cas de doute sur une compromission du poste lui-même)
  ```
  ```obligatoire
  [Référent technique] Protéger les autres accès de l'utilisateur compromis : réinitialiser mots de passe et sessions de tous ses comptes associés, en priorité les applications exposées sur Internet, le VPN et les accès distants
  ```
  ```differable
  [Communication] Prévenir les autres utilisateurs ayant été susceptibles d'être contactés par le compte compromis
  ```
  ```obligatoire
  [Référent technique] Augmenter la verbosité et la rétention des journaux liés au compte compromis, les exporter, conserver les e-mails suspects originaux avec leurs en-têtes
  
  Préserver les traces.
  ```

  == À ne pas faire
  ```avertissement
  Ne pas se limiter à un simple changement de mot de passe.
  
  Un infostealer peut avoir extrait plusieurs couples identifiant/mot de passe ainsi que des jetons de session actifs, potentiellement réutilisables sur d'autres applications (un hameçonnage simple n'expose généralement qu'un seul couple).
  ```
  ```avertissement
  Ne pas négliger le cas où le compte appartient à un administrateur ou à du personnel de la DSI : être attentif à la récupération de secrets d'authentification permettant de se connecter au système d'information avec des droits privilégiés.
  ```
  ```avertissement
  Ne pas bloquer le domaine source d'un tiers de confiance sans anticiper l'impact sur l'activité et la relation avec ce tiers, ni sans prévenir le support (HelpDesk) au préalable.
  ```

  == Critères d'escalade
  ```texte
  Si une compromission plus étendue du système d'information est détectée ou suspectée durant l'endiguement (accès à d'autres comptes ou systèmes, exfiltration de données sensibles), qualifier cette extension via la fiche réflexe Compromission système - Qualification. Activer le dispositif de crise complet si le périmètre est étendu, l'impact fort, ET la résolution urgente (les trois critères réunis, seuil "crise cyber").
  ```

  #fiches-liees((("fr-compromission-messagerie-qualification", "Compromission d'un compte de messagerie - Qualification"), ("fr-compromission-systeme-qualification", "Compromission système - Qualification"), ("comm-piloter-interne", "Piloter sa communication de crise interne"), ("comm-messages-cles", "Rédiger les messages clés"), ("reflexe-rassembler-les-preuves", "Rassembler et préserver les preuves"),))

  #source("intercert-france-2026-fiche-reflexe-comp-9", page: "p. 5-11")
  #imprimer-sources()
]
