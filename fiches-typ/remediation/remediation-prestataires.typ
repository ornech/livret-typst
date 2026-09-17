#import "../../authoring.typ": *

#fiche(
  id: "remediation-prestataires",
  type: "checklist",
  phase: "preparation",
  onglet: (titre: "Remédiation et reconstruction", pictogramme: "croix"),
  titre: "Faire appel à un prestataire",
)[
  == Objectif
  ```texte
  Peu d'organisations disposent en interne des effectifs et de la diversité de compétences nécessaires à un projet de remédiation - la plupart des prestations en incluent une part importante. Idéalement, les relations avec des prestataires devant intervenir dans l'urgence sont contractualisées en amont, pendant la préparation.
  ```

  == Formuler les besoins
  ```texte
  Distinguer, parmi les prestations lors d'une réponse à incident, celles relevant de la remédiation (pilotage de la remédiation ; interventions techniques d'expertise - nettoyage/remédiation Active Directory, réorganisation réseau, récupération de données ; administration de matériel/logiciel/applicatif, à accompagner car ces prestataires ne sont généralement pas des spécialistes de l'intervention sur systèmes compromis) et celles qui n'en relèvent pas (investigation numérique, pilotage de crise). Dresser une liste explicite des actions attendues du prestataire : les termes du domaine sont interprétés de façon très diverse.
  ```

  == Sélectionner les prestataires
  ```texte
  S'appuyer si possible sur des prestataires qualifiés (Visa de sécurité ANSSI, Prestataires de Réponse aux Incidents de Sécurité - PRIS) - en gardant à l'esprit que cette qualification n'intègre pas encore les prestations de pilotage et de mise en œuvre de la remédiation elle-même. À défaut de cadre contractuel préexistant, s'appuyer sur des relations déjà établies via des assureurs ou des organisations sectorielles. Identifier dès la contractualisation les jalons permettant de mesurer l'avancement de la prestation.
  ```

  == Piloter la prestation
  ```texte
  Plusieurs intervenants aux expertises pointues (restauration de fichiers, Active Directory, pare-feu, virtualisation...) se succèdent rapidement : ordonnancer avec prudence et des marges les interventions qui se bloquent mutuellement, organiser le bon recueil et la mise à disposition des livrables entre intervenants (format directement exploitable, sans ressaisie), définir précisément les conditions de fin d'intervention, et détecter au plus vite les points bloquants (points d'avancement fréquents). Le travail en binôme entre les membres de la DSI et les intervenants externes limite les pertes d'information.
  ```

  == Fin de prestation
  ```texte
  La prestation est terminée lorsque tous les jalons ont été atteints. S'assurer de récupérer tous les livrables, même déjà transmis à un autre intervenant, et anticiper les points post-intervention (reconctacter un intervenant pour préciser un paramétrage) pour éviter indisponibilités et coûts imprévus.
  ```

  #fiches-liees((("remediation-e3r-execution", "Reprendre le contrôle du système d'information (séquence E3R)"), ("remediation-piloter-sortie", "Piloter le projet et en sortir"),))

  #source("anssi-2023-cyberattaques-et-remediation-2", page: "p. 70-75")
  #imprimer-sources()
]
