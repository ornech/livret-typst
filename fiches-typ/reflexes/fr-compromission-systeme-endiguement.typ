#import "../../authoring.typ": *

#fiche(
  id: "fr-compromission-systeme-endiguement",
  type: "fiche_reflexe",
  phase: "endiguement",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Compromission système - Endiguement",
)[
  == Déclencheur
  ```texte
  Une compromission est fortement suspectée (levée de doute en cours) ou confirmée sur une machine Windows ou Linux (voir fiche Qualification, prérequis). Une compromission système n'est qu'une étape dans la tentative de compromission du système d'information : un adversaire s'y est introduit et y a certainement eu une activité - le traitement ne doit pas se limiter à la suppression de codes malveillants. La préservation des traces doit rester une préoccupation constante pour tous les choix d'action, y compris pour figer la situation : préférer les actions altérant le moins possible le système. Si la qualification suspecte un début d'incident rançongiciel, ne pas utiliser cette fiche : dérouler la séquence Chiffrement ou effacement en cours (Qualification puis Endiguement), dont les actions sont plus radicales.
  ```

  == Actions immédiates
  #debut-actions()
  ```obligatoire
  [Référent technique] Interrompre l'activité de la machine infectée (mise en pause si machine virtuelle, veille prolongée si poste client, sinon isolation réseau de préférence via EDR ; extinction en tout dernier recours)
  
  Figer la situation.
  ```
  ```obligatoire
  [Référent technique] Isoler au niveau réseau les zones infectées du reste du système d'information (couper les flux dans les deux sens ; isolation prioritaire si la zone touche un réseau industriel ou un système d'importance vitale)
  ```
  ```obligatoire
  [Référent technique] Sécuriser des sauvegardes à jour des données accessibles depuis la machine compromise et valider l'accès fonctionnel aux sauvegardes sans compromettre leur intégrité
  ```
  ```obligatoire
  [Référent technique] Préserver les traces sur les machines infectées avant toute réinitialisation (instantané avec mémoire pour une machine virtuelle, prélèvement forensique pour une machine physique)
  ```
  ```differable
  [Référent technique] Réinitialiser les identifiants et secrets suspectés compromis (comptes utilisés sur la machine, comptes homonymes, certificats, jetons et clés associés à la machine)
  ```
  ```differable
  [Référent technique] Préserver les traces des journaux d'équipements et d'authentification (exporter, augmenter la rétention)
  ```

  == À ne pas faire
  ```avertissement
  Ne pas redémarrer ou éteindre un équipement infecté ou suspecté avant que la cloture de l'incident.
  
  Risque de destruction de preuves.
  ```
  ```avertissement
  Un compte administrateur intégré à privilèges maximaux (ex : RID 500 sous Active Directory, ou équivalent) ne se désactive pas comme un compte individuel : s'il est suspecté compromis, effectuer une rotation de son mot de passe et considérer une escalade vers le traitement d'une compromission de l'infrastructure d'authentification centralisée dans son ensemble.
  
  L'attaquant a pu en altérer l'intégrité ou s'émettre des accès privilégiés.
  ```
  ```avertissement
  Ne pas ouvrir de session interactive (connexion locale, RDP, SSH) sur la machine compromise, a fortiori avec un compte privilégié.
  ```

  == Critères d'escalade
  ```texte
  Si un compte administrateur intégré à privilèges maximaux est suspecté compromis, escalader vers le traitement d'une compromission de l'infrastructure d'authentification centralisée dans son ensemble. Si le périmètre est étendu, l'impact fort, ET la résolution urgente (les trois critères réunis, seuil "crise cyber"), activer le dispositif de crise complet.
  ```

  #fiches-liees((("fr-compromission-systeme-qualification", "Compromission système - Qualification"), ("fr-chiffrement-qualification", "Chiffrement ou effacement en cours - Qualification"), ("fr-chiffrement-endiguement", "Chiffrement ou effacement en cours - Endiguement"), ("reflexe-rassembler-les-preuves", "Rassembler et préserver les preuves"),))

  #source("intercert-france-2026-fiche-reflexe-comp-7", page: "p. 3-15")
  #imprimer-sources()
]
