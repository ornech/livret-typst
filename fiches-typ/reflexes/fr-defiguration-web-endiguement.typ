#import "../../authoring.typ": *

#fiche(
  id: "fr-defiguration-web-endiguement",
  type: "fiche_reflexe",
  phase: "endiguement",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Défiguration de site web - Endiguement",
)[
  == Déclencheur
  ```texte
  Une défiguration de site web est en cours, causée par la compromission du site web lui-même (compte de gestion usurpé, sabotage interne, ou vulnérabilité applicative exploitée) - voir fiche Qualification, prérequis. Si la qualification a plutôt déterminé que la cause est un système tiers (DNS, fournisseur de contenu, équipement en amont, tenant cloud), ne pas utiliser cette fiche : suivre les pistes indiquées en fin de fiche Qualification.
  ```

  == Actions immédiates
  #debut-actions()
  ```obligatoire
  [Référent technique] Mettre le site web hors ligne (mode maintenance ou arrêt du service ; en dernier recours, mettre les serveurs hôtes hors ligne si le risque de compromission du serveur lui-même est élevé)
  ```
  ```obligatoire
  [Référent technique] Mettre en ligne une page de maintenance minimale (HTML statique, sans lien externe ni JavaScript), avec quelques informations essentielles validées avant diffusion
  ```
  ```obligatoire
  [Référent technique] Préserver le contenu du site web affecté (l'exporter et le mettre de côté pour analyse) avant toute reconstruction
  ```
  ```obligatoire
  [Référent technique] Préserver les journaux (équipements en amont, console de gestion, serveurs hôtes) avant leur rotation
  ```
  ```differable
  [Référent technique] Réinitialiser les accès du compte de gestion usurpé et des autres comptes de gestion, avec authentification forte, et réinitialiser les secrets présents sur le serveur hôte (comptes d'administration locaux/domaine, mots de passe en clair dans les fichiers de configuration, clés privées TLS/SSH/API)
  
  Réduire le risque de futures usurpations.
  ```
  ```differable
  [Référent technique] Isoler ou mettre hors ligne les serveurs hôtes compromis, qualifier une éventuelle compromission système ou latéralisation
  
  Limiter la propagation sur le système d'information.
  ```
  ```secondaire
  [Référent technique] Préserver les sauvegardes du site web (configuration, code, fichiers, base de données), sans les restaurer avant investigation
  ```
  ```secondaire
  [Communication] Communiquer publiquement pour désapprouver l'affichage illégitime (revendication politique ou idéologique)
  ```

  == À ne pas faire
  ```avertissement
  Ne pas mettre le serveur hôte hors ligne par réflexe - arbitrer l'impact métier avant d'aller au-delà de la mise hors ligne du seul site web.
  
  Si plusieurs applications sont hébergées dessus, cela les affecte toutes.
  ```
  ```avertissement
  Ne pas restaurer les sauvegardes du site web en production avant qu'une investigation ait été menée.
  
  Si le site web a été compromis, ses sauvegardes peuvent l'être aussi.
  ```
  ```avertissement
  Ne pas considérer l'endiguement terminé une fois la page défigurée masquée.
  
  Le cache d'un CDN ou d'un mandataire inverse peut continuer à l'afficher - en demander la réinitialisation.
  ```
  ```avertissement
  Ne pas révoquer un certificat TLS wildcard sans anticiper l'impact.
  
  Tous les serveurs qui l'utilisent doivent renouveler le leur avant la révocation de l'ancien.
  ```

  == Critères d'escalade
  ```texte
  Si la compromission s'étend au-delà du site web (serveur hôte compromis, latéralisation possible, tenant cloud suspecté), que l'impact est fort, ET que la résolution est urgente (les trois critères réunis, seuil "crise cyber"), activer le dispositif de crise complet.
  ```

  #fiches-liees((("fr-defiguration-web-qualification", "Défiguration de site web - Qualification"), ("fr-compromission-systeme-qualification", "Compromission système - Qualification"), ("comm-piloter-externe", "Piloter sa communication de crise externe"), ("comm-messages-cles", "Rédiger les messages clés"), ("reflexe-rassembler-les-preuves", "Rassembler et préserver les preuves"),))

  #source("intercert-france-2026-fiche-reflexe-defi", page: "p. 4-10")
  #imprimer-sources()
]
