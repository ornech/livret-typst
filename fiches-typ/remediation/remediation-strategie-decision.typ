#import "../../authoring.typ": *

#fiche(
  id: "remediation-strategie-decision",
  type: "checklist",
  phase: "remediation",
  onglet: (titre: "Remédiation et reconstruction", pictogramme: "croix"),
  titre: "Décider et piloter dans la durée",
)[
  == Déclencheur
  ```texte
  À l'ouverture du projet de remédiation, une fois l'endiguement d'urgence réalisé (voir la fiche réflexe du scénario concerné) : la remédiation est le projet de reprise de contrôle d'un système d'information compromis, distinct de la gestion de crise et de l'investigation. Elle peut modifier le cycle de vie du système d'information durant plusieurs semaines voire plusieurs mois.
  ```

  == Comprendre la séquence E3R
  ```texte
  Endiguement : freiner la progression de l'attaquant, donner du temps et de la visibilité au défenseur. Éviction : éliminer durablement l'adversaire du cœur de confiance (l'administration IT), depuis lequel mener l'éradication. Éradication : nettoyer le système d'information de toute emprise, même mineure. Reconstruction : rebâtir, en parallèle des trois étapes, les moyens nécessaires à la remise en fonction et en condition de sécurité - un échec de la reconstruction du cœur de confiance mène généralement à un cycle de compromission/remédiation pouvant s'étendre sur des mois voire des années. Les dégâts d'une cyberattaque peuvent se chiffrer en millions, voire en dizaines de millions d'euros : les investissements engagés pendant la remédiation conditionnent la reprise d'activité et la gestion de la sécurité par la suite.
  ```

  == Choisir un plan de remédiation
  ```texte
  Trois scénarios archétypes, à adapter à la situation réelle (voir la fiche Plans types de remédiation) : restaurer au plus vite des services vitaux, reprendre le contrôle du SI, ou saisir l'opportunité pour préparer une maîtrise durable du SI. Le choix conditionne la fin du plan de remédiation.
  ```

  == 7 recommandations pour réussir sa remédiation
  ```texte
  Pilotez dans la tempête : sortir de l'immédiateté, prendre le temps de comprendre et de se faire expliciter les options avant de choisir - les incidents se gèrent en semaines et en mois.
  ```
  ```texte
  Assumez des choix structurants : tout vouloir traiter conduit à la dispersion des moyens et à l'échec - seules des décisions stratégiques fortes et des engagements financiers concrets produisent des effets durables.
  ```
  ```texte
  Fixez des objectifs stratégiques centrés sur les métiers : ils conditionnent la fin du plan et se mesurent à la capacité des métiers à travailler - ne pas se laisser emporter dans les arbitrages de détails techniques.
  ```
  ```texte
  Restez réactif et soyez flexible : une remédiation se joue contre une intelligence hostile, les changements adverses peuvent nécessiter des adaptations - la partie ne se termine jamais ; adapter moyens, priorités et temporalités en gardant des objectifs clairs et constants.
  ```
  ```texte
  Gardez l'œil sur l'humain : leadership, gestion du moral et de la fatigue dans la durée sont cruciaux une fois le plan lancé - ménagez les équipes, la remédiation est un marathon, pas un sprint.
  ```
  ```texte
  Contemplez un horizon viable à long terme : des investissements judicieux pendant la remédiation conditionnent la reprise d'activité et la gestion de la sécurité - un projet réussi peut améliorer radicalement la gestion des risques cyber, sans se substituer à un plan de sécurisation dans la durée.
  ```

  #fiches-liees((("remediation-plans-types", "Plans types"), ("remediation-e3r-execution", "Reprendre le contrôle du système d'information (séquence E3R)"), ("role-cellule-crise", "Rôles de la cellule de crise"),))

  #source("anssi-2023-cyberattaques-et-remediation", page: "p. 2-8")
  #imprimer-sources()
]
