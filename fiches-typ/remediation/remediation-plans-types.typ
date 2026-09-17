#import "../../authoring.typ": *

#fiche(
  id: "remediation-plans-types",
  type: "checklist",
  phase: "remediation",
  onglet: (titre: "Remédiation et reconstruction", pictogramme: "croix"),
  titre: "Plans types",
)[
  == Objectif
  ```texte
  Trois scénarios archétypes de remédiation, à adapter à la situation réelle - souvent utilisés comme phases successives d'un plan plus complexe plutôt qu'exécutés isolément.
  ```

  == Scénario 1 - Restaurer au plus vite des services vitaux
  ```texte
  S'applique quand la perturbation de l'activité produit un impact majeur sur la survie de l'organisation ou un service essentiel/vital, décorrélable du reste du SI. Objectif : assurer la continuité ou le redémarrage du service vital dans un délai bref, via un cœur de confiance restreint autour d'une « bulle » de redémarrage, sous supervision serrée. Risques résiduels : ne crée pas d'organisation résiliente - sans montée en maturité menée dans un second temps, le risque de récurrence d'incidents sur le reste du SI reste élevé, et son coût peut dépasser celui d'une remédiation complète.
  ```

  == Scénario 2 - Reprendre le contrôle du SI
  ```texte
  L'organisation vise à recréer un système d'information dans un état proche de l'initial, sans transformation profonde. Objectifs : retrouver un fonctionnement nominal dans un délai raisonnable, reprendre le contrôle du SI, via un cœur de confiance dur et maîtrisable dans la durée puis une remédiation du reste du SI sans changement d'architecture. Risques résiduels : la priorité donnée à la vitesse de sortie de crise empêche les travaux de sécurisation en profondeur hors du cœur de confiance - les risques de future compromission et d'escalade de privilège restent élevés.
  ```

  == Scénario 3 - Saisir l'opportunité pour préparer une maîtrise durable du SI
  ```texte
  L'incident est utilisé comme point de départ d'une restructuration de la sécurité du SI, au prix d'un rétablissement plus long et d'un investissement initial plus important. Objectifs : fonctionnement nominal ET protection durable contre la récidive, via un cœur de confiance très complet puis une reprise progressive et sécurisée de chaque secteur du SI (vulnérabilités corrigées, portes dérobées supprimées, supervision intégrée avant réintégration). Risques résiduels : aucun système d'information moderne ne peut protéger fortement tous ses segments - certains postes terminaux resteront compromis ; l'effort se concentre sur la limitation des escalades et des impacts.
  ```

  #fiches-liees((("remediation-strategie-decision", "Décider et piloter dans la durée"), ("remediation-e3r-execution", "Reprendre le contrôle du système d'information (séquence E3R)"),))

  #source("anssi-2023-cyberattaques-et-remediation-2", page: "p. 76-83")
  #imprimer-sources()
]
