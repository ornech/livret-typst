#import "../../authoring.typ": *

#fiche(
  id: "fr-compromission-messagerie-qualification",
  type: "diagnostic",
  phase: "qualification",
  onglet: (titre: "Fiches réflexes", pictogramme: "losange"),
  titre: "Compromission d'un compte de messagerie - Qualification",
)[
  == Déclencheur
  ```texte
  Une compromission de compte de messagerie est suspectée. Répondre vite avec des réponses approximatives plutôt que chercher l'exhaustivité - fixer un temps contraint (30 minutes à 1 heure) ; une qualification plus fine se fera ensuite.
  ```

  == Critères d'escalade
  ```texte
  Si la compromission n'a pas pu être confirmée, il reste conseillé par précaution de forcer un renouvellement du mot de passe et du MFA du ou des comptes concernés et de révoquer les sessions actives. Si la gravité conclue est "incident majeur" ou "crise cyber", activer le dispositif de crise complet et ouvrir la fiche Endiguement. Si une compromission système est suspectée, la qualifier en parallèle via la fiche réflexe Compromission système.
  ```

  == Mesure 1 - Identifier le compte suspecté
  ```texte
  La nature des informations transmises (signalement utilisateur, alerte de sécurité, détection automatisée) permet-elle d'identifier de manière fiable le ou les comptes suspectés, et existe-t-il des délégations de droit vers ou depuis ce compte qui étendraient la compromission ?
  ```

  == Mesure 2 - Confirmer le signalement
  ```texte
  L'analyse des courriels (envois non reconnus, règles de gestion illégitimes, connexions inhabituelles) permet-elle de confirmer la compromission, ou s'agit-il d'un faux positif ?
  ```

  == Mesure 3 - Évaluer le périmètre
  ```texte
  L'incident est-il circonscrit à la messagerie, ou d'autres accès de l'organisation (VPN, partage de fichiers, applications tierces) sont-ils potentiellement compromis ? Le compte affecté est-il sensible (administration, VIP) ?
  ```
  ```texte
  L'accès initial peut-il être identifié (hameçonnage, force brute, infostealer) ? Un infostealer suggère une compromission plus large (plusieurs identifiants et jetons de session actifs) qu'un simple hameçonnage (généralement un seul couple identifiant/mot de passe).
  ```

  == Mesure 4 - Évaluer l'impact
  ```texte
  Des données auraient-elles pu être exfiltrées ? La compromission pourrait-elle avoir donné accès à un autre compte, système ou application ? Le compte stocke-t-il des données sensibles ou soumises à réglementation ?
  ```
  ```texte
  Quelles activités métier (internes ou externes) sont perturbées par la compromission de ce compte, quelles chaînes d'activité en dépendent, et cela provoque-t-il une perte financière importante ?
  ```

  == Mesure 5 - Évaluer l'urgence
  ```texte
  Pour les activités essentielles dont la perturbation serait inacceptable, une procédure de maintien d'activité en mode nominal ou dégradé existe-t-elle et doit-elle être envisagée ?
  ```
  ```texte
  L'activité malveillante détectée est-elle récente et donc sujette à évolution, ou ancienne et stable ? Existe-t-il un risque de généralisation imminente de l'incident ?
  ```

  == Qualifier l'incident
  ```texte
  Au final, l'incident est-il confirmé, circonscrit à ce compte ou étendu, à impact fort, urgent à résoudre ? Quel est le niveau de gravité - anomalie courante, incident mineur, incident majeur, ou crise cyber ?
  ```
  ```attention
  Pour un incident à grande portée politique, financière ou juridique, ne pas exclure la piste d'une compromission frauduleuse par un administrateur interne ou par l'hébergeur de la messagerie.
  ```

  #fiches-liees((("fr-compromission-messagerie-endiguement", "Compromission d'un compte de messagerie - Endiguement"), ("fr-compromission-systeme-qualification", "Compromission système - Qualification"), ("grille-criticite", "Grille de criticité - évaluer la gravité d'un incident"),))

  #source("intercert-france-2026-fiche-reflexe-comp-4", page: "p. 5-10")
  #imprimer-sources()
]
