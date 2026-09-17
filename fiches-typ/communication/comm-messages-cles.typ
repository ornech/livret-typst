#import "../../authoring.typ": *

#fiche(
  id: "comm-messages-cles",
  type: "fiche_communication",
  phase: "endiguement",
  onglet: (titre: "Communication de crise", pictogramme: "carre"),
  titre: "Rédiger les messages clés",
)[
  == Déclencheur
  ```texte
  Une fois la posture de communication définie (voir fiche Définir sa stratégie de communication de crise cyber) : rédiger des messages véridiques et factuels (jamais de mensonge, ni minimisation ni exagération de la sophistication de l'attaque), avec un ton pédagogique et rassurant, un vocabulaire adapté au public visé (éviter le jargon et les termes anxiogènes), faits relire et valider par la cellule de crise stratégique.
  ```

  == À ne pas faire
  ```avertissement
  Ne jamais mentir ni exagérer/minimiser volontairement la sophistication de l'attaque.
  
  La supercherie sera découverte et amplifiera la crise médiatique.
  ```
  ```avertissement
  Ne pas utiliser l'humour dans la communication de crise.
  
  Risque d'être perçu comme une gestion légère ou déconnectée de la réalité, quel que soit le vécu réel de la situation.
  ```
  ```avertissement
  Ne pas mentionner un accompagnement par l'ANSSI sans validation préalable de l'agence elle-même (cert-fr@ssi.gouv.fr).
  ```

  == Objectif de communication
  ```texte
  Structurer tout message de crise (communiqué, publication, actualité web) selon la méthode FACET : Faits, Actions, Compassion, Engagement, Transparence.
  ```

  == Éléments de langage
  ```texte
  Faits : nommer l'incident "incident de cybersécurité" ou "cyberattaque" plutôt que "piratage" ; ne pas détailler publiquement le mode opératoire technique ; donner une date approximative de début ou de détection.
  ```
  ```texte
  Actions : mettre en avant les mesures prises pour stopper l'attaque et rétablir les services, la mise en place d'une cellule de crise, l'état de la continuité (mode normal ou dégradé), un contact dédié pour les questions.
  ```
  ```texte
  Compassion : s'adresser aux victimes directes et à celles qui pourraient se considérer comme telles ; en cas de victimes physiques (blessés, décès), la compassion passe avant toute autre considération (méthode CAFET plutôt que FACET).
  ```
  ```texte
  Engagement : montrer que l'entité a réagi rapidement (cellule de crise mobilisée) et rappeler que la sécurité des systèmes et la protection des données sont une priorité, avec les enseignements ou mesures prévus pour l'avenir.
  ```
  ```texte
  Transparence : ne jamais s'engager sur une date de retour à la normale précise - donner de la visibilité à chaque étape plutôt qu'une échéance ; indiquer qu'un point de contact dédié (email générique, numéro vert) centralise les questions pour protéger la cellule de crise des sollicitations directes.
  ```

  == Sujets à traiter uniquement de façon réactive
  ```attention
  Identité et motivations de l'attaquant : ne jamais communiquer spontanément - sujet à traiter uniquement de façon réactive si la question est posée, sans jamais confirmer ni infirmer au-delà de ce qui est déjà public. L'attribution publique d'une cyberattaque (désigner le groupe d'attaquants ou le commanditaire, le plus souvent un État) est une décision politique prise au plus haut niveau de l'État - distincte de l'imputation technique (caractérisation des outils/tactiques de l'attaquant) - jamais une décision qui revient à l'entité victime : s'y risquer expose à se tromper, à faire la publicité de l'attaquant, ou à ajouter une dimension géopolitique incontrôlable à la crise.
  ```
  ```attention
  Rançon : l'ANSSI recommande de ne jamais la payer (ne garantit ni le déchiffrement ni la non-publication des données, entretient le système frauduleux). Si une demande de rançon est déjà publique, elle peut être confirmée dans les messages ; ne jamais indiquer publiquement avoir payé.
  ```

  #fiches-liees((("comm-strategie-crise", "Définir sa stratégie de communication de crise cyber"), ("comm-piloter-interne", "Piloter sa communication de crise interne"), ("comm-piloter-externe", "Piloter sa communication de crise externe"),))

  #source("anssi-2026-fiche-6-rediger-les-messages", page: "p. 1-8")
  #imprimer-sources()
]
