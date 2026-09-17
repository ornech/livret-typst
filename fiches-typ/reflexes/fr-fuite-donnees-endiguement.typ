#import "../../authoring.typ": *

#fiche(
  id: "fr-fuite-donnees-endiguement",
  type: "fiche_reflexe",
  phase: "endiguement",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Fuite de données - Endiguement",
)[
  == Déclencheur
  ```texte
  La fuite de données vient d'être qualifiée (voir fiche Qualification, prérequis). Actions ci-dessous pour le cas le plus courant et le plus sévère - attaque par un acteur externe. Si la cause qualifiée est un acte interne ou une erreur humaine, l'ordre de priorité diffère : préserver les traces et sécuriser les comptes passent avant le blocage des flux réseau.
  ```

  == Actions immédiates
  #debut-actions()
  ```obligatoire
  [Référent technique] Bloquer et superviser les flux d'exfiltration (couper les flux réseau suspects identifiés, mettre les adresses sous surveillance)
  ```
  ```obligatoire
  [Référent technique] Sécuriser les comptes et systèmes compromis (réinitialiser mots de passe et jetons, révoquer les sessions actives)
  ```
  ```obligatoire
  [Référent technique] Restreindre ou supprimer l'accès aux données exposées - couper l'accès au service, sans éteindre la machine
  
  Nécessaire aux investigations.
  ```
  ```obligatoire
  [Référent technique] Préserver les traces avant qu'elles n'expirent (exporter les journaux, augmenter leur rétention)
  ```
  ```differable
  [Référent technique] Mettre en place une surveillance des documents ou informations divulgués (veille sur la publication)
  ```
  ```differable
  [Coordinateur / décideur] Maintenir la continuité des opérations critiques touchées
  ```
  ```secondaire
  [Communication] Préparer un message interne sur la fuite de données
  ```
  ```secondaire
  [Communication] Préparer une communication publique sur la fuite de données, sous validation de la direction et du juridique avant diffusion
  ```

  == À ne pas faire
  ```avertissement
  Ne pas éteindre une machine dont on coupe l'accès réseau/service.
  
  La garder allumée est nécessaire aux investigations.
  ```
  ```avertissement
  Ne pas figer une posture avant d'avoir arbitré la cause.
  
  Exfiltration pour revente/espionnage, précurseur d'un rançongiciel, malveillance interne ou simple erreur de configuration n'appellent pas la même suite.
  ```
  ```avertissement
  Ne pas communiquer publiquement sans validation de la direction et du service juridique.
  ```

  == Critères d'escalade
  ```texte
  Si la fuite s'avère préliminaire à un chiffrement (rançongiciel), si une compromission du système d'information est suspectée, ou si le périmètre s'étend à d'autres organisations (tiers, partenaires), activer le dispositif de crise complet.
  ```

  #fiches-liees((("fr-fuite-donnees-qualification", "Fuite de données"),))

  #source("intercert-france-2026-fiche-reflexe-fuit-2", page: "p. 4-5")
  #imprimer-sources()
]
