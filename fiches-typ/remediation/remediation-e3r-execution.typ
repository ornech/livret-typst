#import "../../authoring.typ": *

#fiche(
  id: "remediation-e3r-execution",
  type: "fiche_reflexe",
  phase: "remediation",
  onglet: (titre: "Remédiation et reconstruction", pictogramme: "croix"),
  titre: "Reprendre le contrôle du système d'information (séquence E3R)",
)[
  == Déclencheur
  ```texte
  Une compromission majeure a été confirmée et endiguée en urgence (voir la fiche réflexe du scénario concerné) : le projet de remédiation prend le relais pour reprendre durablement le contrôle du système d'information, selon la séquence E3R (Endiguement-Éviction-Éradication, complétée par la Reconstruction). Chaque étape doit être menée à son terme avant de passer à la suivante : échouer à une étape compromet généralement la suivante et force à reprendre tout ou partie des étapes antérieures. La préservation des traces reste une préoccupation constante : les activités de remédiation détruisent des traces indispensables à l'investigation forensique - maintenir un dialogue avec l'équipe menant les analyses.
  ```

  == Actions immédiates
  #debut-actions()
  ```obligatoire
  [Référent technique] Endiguement - couper l'accès Internet par filtrage, mettre en sécurité les sauvegardes par déconnexion du réseau, segmenter le réseau au niveau 2, isoler les services compromis de l'annuaire/infrastructure d'authentification centralisée ; en dernier recours seulement, éteindre électriquement une machine sensible (l'extinction purge la mémoire vive, potentiellement utile à l'investigation ou au déchiffrement - voir fiches réflexes). Assurer une traçabilité forte de ces actions (main courante) : elles sont souvent l'une des causes directes de dysfonctionnements du système d'information.
  
  Limiter la liberté de l'attaquant et augmenter la connaissance sur l'attaque.
  ```
  ```obligatoire
  [Référent technique] Éviction - recréer une infrastructure de virtualisation, créer une compartimentation réseau isolant les composants sensibles, basculer un annuaire compromis vers un annuaire sain, mettre en place des stations d'administration dédiées et renforcées. Préparer minutieusement cette bascule, puis l'exécuter en une fois, de façon brutale et rapide.
  
  Créer un socle système et réseau hors de portée de l'attaquant. Réduire les opportunités de compromission du nouveau cœur de confiance.
  ```
  ```obligatoire
  [Référent technique] Éradication - déployer un EDR et une supervision sur les postes de travail, découper le système d'information en sous-systèmes migrés progressivement vers une architecture contrôlée, mettre en place une collecte d'événements détaillée et une campagne de recherche de compromission dans les journaux, passer systématiquement des outils de recherche de marqueurs associés à l'attaquant.
  
  Supprimer les accès de l'adversaire et les voies de retour possibles.
  ```
  ```differable
  [Référent technique] Reconstruction - reconstruire progressivement le système d'information, par isolement (couper le SI en sous-réseaux assainis un par un, avec des flux progressifs et précis entre eux) ou par sanctuarisation (créer un nouveau réseau sain dans lequel les services assainis sont progressivement réintégrés)
  ```

  == À ne pas faire
  ```avertissement
  Ne pas agir hâtivement sur un système compromis sans en mesurer l'effet - sélectionner les mesures d'endiguement avec prudence.
  
  Toute action coercitive peut être perçue par un adversaire encore présent et provoquer une réaction.
  ```
  ```avertissement
  Ne pas viser une éradication exhaustive à tout prix - préférer un niveau d'assurance moindre complété par des capacités de détection et de réaction dans la durée, plutôt que d'épuiser les équipes sur un objectif inatteignable.
  
  Il n'est généralement pas possible de garantir avoir découvert toutes les portes dérobées.
  ```
  ```avertissement
  Ne pas accumuler les mesures de sécurité dans le cœur de confiance sans en contrôler chacune depuis celui-ci.
  
  Chaque élément importé (ex : console d'un EDR) est une source potentielle de recompromission de la zone de confiance.
  ```
  ```avertissement
  Ne pas tenter une éviction partielle par simple nettoyage d'un système compromis sans recréer d'environnement de confiance, sauf en dernier recours.
  
  Le nettoyage d'un environnement compromis par un adversaire compétent est très difficile, et les cas de re-compromission ne sont pas rares.
  ```

  == Critères d'escalade
  ```texte
  Si une étape de la séquence échoue (retour de l'attaquant après éviction, découverte d'une persistance après éradication), reprendre la séquence depuis l'étape précédente concernée plutôt que de poursuivre - ne jamais avancer sur une étape compromise.
  ```

  #fiches-liees((("remediation-strategie-decision", "Décider et piloter dans la durée"), ("remediation-piloter-sortie", "Piloter le projet et en sortir"), ("remediation-prestataires", "Faire appel à un prestataire"),))

  #source("anssi-2023-cyberattaques-et-remediation-2", page: "p. 30-41")
  #imprimer-sources()
]
