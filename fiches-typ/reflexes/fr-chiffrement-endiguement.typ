#import "../../authoring.typ": *

#fiche(
  id: "fr-chiffrement-endiguement",
  type: "fiche_reflexe",
  phase: "endiguement",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Chiffrement ou effacement en cours - Endiguement",
)[
  == Déclencheur
  ```texte
  Un logiciel malveillant de chiffrement ou d'effacement est en train de s'exécuter sur le système d'information. Fait suite à la qualification (voir fiche Qualification, prérequis) : les mesures ci-dessous s'appliquent en cohérence avec le périmètre, l'impact et l'urgence qui y ont été évalués. Contrairement à une compromission système classique où l'on fige en priorité le seul système affecté, le chiffrement touche généralement l'ensemble du parc - les priorités ne visent pas d'abord à stopper la propagation partout à la fois, mais à préserver ce qui permettra de restaurer l'activité (sauvegardes, infrastructure d'authentification centralisée, serveurs de fichiers).
  ```

  == Actions immédiates
  #debut-actions()
  ```obligatoire
  [Référent technique] Isoler temporairement l'accès Internet (couper les flux entrants et sortants sur les pare-feux périphériques, désactiver les accès VPN entrants).
  
  Priver le rançongiciel de son serveur de contrôle et empêcher l'attaquant d'observer la remédiation.
  ```
  ```obligatoire
  [Référent technique] Mettre en pause ou éteindre les serveurs et supports de sauvegarde, locaux et cloud - ne pas les restaurer avant confirmation d'une date de restauration sûre
  
  Préserver les sauvegardes.
  ```
  ```obligatoire
  [Référent technique] Préserver les serveurs de fichiers non sauvegardés et l'infrastructure d'authentification centralisée (l'éteindre ou l'exporter hors ligne)
  ```
  ```obligatoire
  [Référent technique] Préserver les machines métier vitales encore saines en les mettant hors ligne si leur indisponibilité temporaire est supportable
  ```
  ```differable
  [Référent technique] Isoler ou mettre en pause/veille prolongée les machines déjà infectées, sans les éteindre électriquement sauf en dernier recours
  ```
  ```differable
  [Référent technique] Neutraliser ou réinitialiser les comptes à privilèges suspects, rechercher les mécanismes de persistance mis en place par l'attaquant (scripts ou tâches planifiées inconnus, règles de déploiement automatisées)
  
  Entraver la propagation du chiffrement.
  ```
  ```secondaire
  [Référent technique] Exporter et augmenter la rétention des journaux d'équipements et d'authentification, conserver un fichier chiffré et une note de rançon
  
  Préserver les traces.
  ```
  ```secondaire
  [Référent technique] Rétablir progressivement les accès Internet essentiels (avec authentification renforcée et liste blanche) une fois les mesures prioritaires en place
  ```
  ```secondaire
  [Communication] Informer la direction et communiquer en interne qu'un incident est en cours et que certains services peuvent être temporairement indisponibles
  ```

  == À ne pas faire
  ```avertissement
  Ne pas tenter de contourner l'isolement Internet avec un point d'accès mobile ou un réseau Wi-Fi externe si l'organisation en est isolée.
  ```
  ```avertissement
  Ne pas réactiver un compte à privilèges compromis par un simple changement de mot de passe - préférer la création d'un nouveau compte à la réutilisation de l'ancien.
  
  Des jetons de session ou tickets d'authentification déjà émis (ex : ticket Kerberos) peuvent rester valides malgré le changement.
  ```
  ```avertissement
  Ne pas éteindre électriquement une machine chiffrée sauf en dernier recours.
  
  Cela purge la mémoire RAM, qui peut contenir des clés de déchiffrement ou des preuves utiles à l'investigation.
  ```
  ```avertissement
  Ne pas restaurer les sauvegardes avant que l'équipe d'investigation n'ait confirmé une date de restauration sûre.
  ```

  == Critères d'escalade
  ```texte
  Si le périmètre s'avère étendu (plusieurs domaines/environnements d'authentification, propagation qui se poursuit malgré les mesures), que l'impact sur l'activité métier est fort, ET que la résolution est urgente (les trois critères réunis, seuil "crise cyber"), activer le dispositif de crise complet.
  ```

  #fiches-liees((("fr-chiffrement-qualification", "Chiffrement ou effacement en cours - Qualification"), ("comm-piloter-interne", "Piloter sa communication de crise interne"), ("comm-messages-cles", "Rédiger les messages clés"), ("reflexe-rassembler-les-preuves", "Rassembler et préserver les preuves"),))

  #source("intercert-france-2026-fiche-reflexe-chif", page: "p. 2-14")
  #imprimer-sources()
]
