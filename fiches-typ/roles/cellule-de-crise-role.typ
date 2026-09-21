#import "../../authoring.typ": *

#fiche(
  id: "role-cellule-crise",
  type: "fiche_role",
  phase: "preparation",
  onglet: (titre: "Rôles et documents de la cellule de crise", pictogramme: "cercle"),
  titre: "Rôles de la cellule de crise",
)[
  == Coordinateur / décideur
  ```texte
   - Piloter la cellule de crise
   - Animer les points de situation
   - Arbitrer les décisions
  ```
  ```avertissement
  Ne rédige pas de document de suivi (main courante, état de situation). 
  ```
  ```texte
  Le cumul avec le rôle de référent technique est toléré pour une petite structure, mais il doit être signalé que celui qui répare techniquement perd le recul nécessaire pour arbitrer (un risque accru de vision tunnel ).
  ```

  == Historien / secrétaire
  ```texte
   - Tenir la main courante (journal chronologique, une ligne = un évènement, jamais réécrite)
   - Tenir l'état de situation (synthèse ponctuelle, mise à jour à chaque point fixe)
  ```
  ```texte
  N'assure jamais la fonction de décideur  (enregistrer et décider sont deux fonctions strictement incompatibles, quelle que soit la taille de l'organisation.) 
  ```

  == Référent technique (RSSI, ou prestataire infogérance en PME)
  ```texte
   1) Diagnostiquer l'incident
   2) Piloter les actions de remédiation
   3) Transmettre ses constats à l'historien 
  ```
  ```avertissement
  Devrait transmet ses constats au secrétaire plutôt que d'écrire lui-même dans la main courante.
  
  Rester concentré sur l'action.
  ```
  ```note
  Le cumul avec le rôle de décideur/ référent technique est toléré dans une petite structure, mais il faut avoir conscience du risque accru de vision tunnel.
  ```

  == Communication
  ```texte
  Rédiger les messages internes
  ```
  ```texte
  Rédiger les messages externes
  ```
  ```avertissement
  Limite : s'appuie sur l'état de situation tenu par l'historien pour formuler ses messages, sans le rédiger lui-même. Les messages externes doivent être validés par le rôle juridique avant diffusion.
  ```

  == Juridique / conformité
  ```texte
  Piloter les obligations de déclaration (CNIL, ANSSI, assureur, dépôt de plainte)
  ```
  ```texte
  Valider les messages avant diffusion externe
  ```

  == Coordinateur / décideur
  ```texte
  Rassemble la cellule de crise et en définit le rythme de mobilisation selon les besoins (ex : toutes les 2h en début d'incident, puis espacé). Organise des points de situation réguliers.
  ```
  ```avertissement
  Ne cherche pas de coupable auprès des équipes ou du prestataire. Évite de payer une rançon en cas de demande.
  ```
  ```note
  Selon l'incident, mobilise ou informe les fonctions RH (impacts sur les collaborateurs, paie, conditions de travail), financière (trésorerie, coûts directs/indirects de l'attaque) et relation usagers/clients (continuité de service, compensations) - sans qu'elles soient des rôles permanents de la cellule de crise.
  ```

  == Référent technique (RSSI, ou prestataire infogérance en PME)
  ```note
  Conseille la direction sur les choix techniques et technologiques, y compris les enjeux de cybersécurité, en dehors des périodes de crise.
  ```

  == Communication
  ```texte
  Nomme un porte-parole pour répondre aux médias. Si la crise n'est pas encore médiatisée, prépare des éléments de communication proactifs.
  ```
  ```texte
  Intégré à la cellule de crise dès les premières heures, pas seulement une fois l'état de situation disponible : participe à la prise de décision sur la posture de communication et assure une veille médiatique/réseaux sociaux qui alerte la cellule en cas de signal faible (revendication d'un attaquant, publication externe) - une contribution distincte de la rédaction des messages, qui elle s'appuie sur l'état de situation.
  ```

  == Juridique / conformité
  ```texte
  Identifie si des obligations contractuelles (clients, partenaires, fournisseurs) risquent de ne pas être respectées et propose une adaptation du plan de continuité d'activité.
  ```

  #source("cadrage-cellule-crise-2026-gouvernan", page: "n/a - document interne du projet, non paginé")
  #source("anssi-2026-reflexes-cyber-mes-premiers-r", page: "p. 3-9 (pages « Agir en tant que responsable [rôle] »)")
  #imprimer-sources()
]
