#import "../../authoring.typ": *

#fiche(
  id: "fr-compromission-infostealer-endiguement",
  type: "fiche_reflexe",
  phase: "endiguement",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Compromission par un infostealer - Endiguement",
)[
  == Déclencheur
  ```texte
  Une compromission par un infostealer est fortement suspectée ou confirmée sur un poste ou un serveur (voir fiche Qualification, prérequis). À la différence d'une compromission système, un infostealer ne compromet pas nécessairement la machine elle-même de façon durable : il vise les comptes, identifiants, sessions actives et gestionnaires de mots de passe accessibles depuis cette machine - garder ces cibles en tête tout au long de l'endiguement. Si la qualification suggère plutôt un début de compromission système plus large, ou un rançongiciel, ne pas utiliser cette fiche : dérouler respectivement la séquence Compromission système ou Chiffrement ou effacement en cours.
  ```

  == Actions immédiates
  #debut-actions()
  ```obligatoire
  [Référent technique] Interrompre l'activité de la machine infectée (mise en pause si machine virtuelle, veille prolongée si poste client, sinon isolation réseau de préférence via EDR), et isoler les zones réseau touchées
  
  Figer la situation.
  ```
  ```obligatoire
  [Référent technique] Réinitialiser les identifiants des comptes suspectés compromis (comptes utilisés sur la machine, comptes homonymes sur d'autres machines, comptes à privilèges par défaut) : considérer compromis tout compte dont les identifiants étaient accessibles depuis la machine (gestionnaire de mots de passe, navigateur, sessions actives), y compris les comptes cloud (rotation de mot de passe, révocation des sessions et jetons) - si une messagerie est concernée, voir aussi la fiche Compromission d'un compte de messagerie
  ```
  ```obligatoire
  [Référent technique] Réinitialiser les secrets liés à la machine infectée (certificats, jetons et clés d'API, comptes cloud)
  ```
  ```obligatoire
  [Référent technique] Préserver les traces sur la machine infectée avant toute réinitialisation (instantané avec mémoire pour une machine virtuelle, prélèvement forensique pour une machine physique).
  
  Particulièrement critique en cas de signalement différé, où les traces sont la seule preuve d'une compromission déjà ancienne.
  ```
  ```differable
  [Référent technique] Préserver les traces des journaux d'authentification (Active Directory, Entra ID, IDP, ou autres fournisseurs d'identité selon les comptes touchés) : exporter, augmenter la rétention
  ```
  ```differable
  [Référent technique] Sécuriser des sauvegardes à jour des données accessibles depuis la machine compromise
  ```

  == À ne pas faire
  ```avertissement
  Ne pas limiter la réponse à la machine infectée - considérer compromis tout compte dont les identifiants étaient accessibles depuis la machine, pas seulement la machine elle-même.
  
  Un infostealer vise les comptes, identifiants, sessions et gestionnaires de mots de passe.
  ```
  ```avertissement
  Ne pas réinitialiser ou éteindre un équipement infecté ou suspecté avant que le traitement de l'incident n'ait été clos.
  
  En particulier en cas de signalement différé, où les traces sont la seule preuve d'une compromission déjà ancienne.
  ```
  ```avertissement
  Ne pas ouvrir de session interactive (connexion locale, RDP, SSH) sur la machine compromise, a fortiori avec un compte privilégié.
  ```
  ```avertissement
  En cas de signalement différé (fuite d'identifiants potentiellement ancienne), ne pas suivre l'ordre par défaut de cette fiche à la lettre : préserver les traces (actions 4 et 5) doit alors primer sur la réinitialisation des identifiants et secrets (actions 2 et 3).
  
  Ces traces peuvent être la seule preuve d'une compromission déjà ancienne.
  ```

  == Critères d'escalade
  ```texte
  Si la qualification suggère un début de compromission système plus large, dérouler la séquence Compromission système. Si un rançongiciel est suspecté, basculer vers la séquence Chiffrement ou effacement en cours. Si le périmètre est étendu, l'impact fort, ET la résolution urgente (les trois critères réunis, seuil "crise cyber"), activer le dispositif de crise complet.
  ```

  #fiches-liees((("fr-compromission-infostealer-qualification", "Compromission par un infostealer - Qualification"), ("fr-compromission-systeme-qualification", "Compromission système - Qualification"), ("fr-compromission-systeme-endiguement", "Compromission système - Endiguement"), ("fr-chiffrement-qualification", "Chiffrement ou effacement en cours - Qualification"), ("fr-chiffrement-endiguement", "Chiffrement ou effacement en cours - Endiguement"), ("fr-compromission-messagerie-qualification", "Compromission d'un compte de messagerie - Qualification"), ("reflexe-rassembler-les-preuves", "Rassembler et préserver les preuves"),))

  #source("intercert-france-2026-fiche-reflexe-comp-5", page: "p. 3-15")
  #imprimer-sources()
]
