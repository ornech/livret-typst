# Document de cadrage – Gouvernance de la cellule de crise cyber

---

## I. Profils de cellule de crise

Deux profils sont possibles selon la taille et les moyens de l'organisation. Le choix du profil est fait en amont, en phase de préparation, et documenté. Le reste de ce cadrage s'applique aux deux profils ; les écarts sont signalés lorsqu'ils existent.

### Profil A — Cellule unique (structure de taille réduite)

Rôles permanents : Coordinateur/décideur, Historien/secrétaire, Référent technique, Communication, Juridique/conformité (voir la fiche « Rôles de la cellule de crise »). Le cumul de rôles est toléré (ex. décideur/référent technique), au prix d'un risque de vision tunnel à surveiller.

### Profil B — Deux cellules (structure disposant de moyens dédiés)

| Cellule | Niveau | Composition | Rôle |
|---|---|---|---|
| Décisionnelle (stratégique) | Pilotage | Direction générale, communication, juridique/DPO, RH, métier impacté | Arbitre les décisions engageant l'organisation, valide la posture externe |
| Opérationnelle (tactique) | Exécution | RSSI (pilote), DSI production, forensics, SOC | Diagnostique, contient, remédie ; remonte à la cellule décisionnelle |

Dans ce profil, le « Coordinateur » du profil A se dédouble : un pilote de la cellule opérationnelle (souvent le RSSI) et un chef de la cellule décisionnelle (souvent la Direction générale ou son représentant). La matrice d'autorité (§III) et les seuils d'escalade (§IV) s'appliquent alors entre les deux cellules, pas seulement entre cellule et Direction générale.

---

## II. Déclenchement et activation

| # | Règle | Application |
|---|---|---|
| 1 | Seuil d'activation défini a priori | Ex. : SIEM confirme compromission avérée, ou impact sur service critique > X minutes. |
| 2 | Autorité de déclenchement nommée : un titulaire, un suppléant | Pas de collège délibérant avant activation. |
| 3 | Délai de convocation cible fixé | Ex. : cellule opérationnelle en place à H+30. |
| 4 | Premier acte formalisé | Ouverture immédiate de la main courante + nomination du Coordinateur (profil A) ou des deux pilotes de cellule (profil B). |

---

## III. Chaîne de décision et matrice d'autorité

| # | Règle | Application |
|---|---|---|
| 1 | Un rôle = une fonction, quel que soit le titulaire | Un rôle absent (ex. RSSI indisponible) est remplacé (§X) ; la fonction demeure, jamais vacante. |
| 2 | Table de délégation explicite par rôle | Ce que chaque rôle décide seul, ce qu'il doit remonter — formalisée avant la crise, pas improvisée pendant. |
| 3 | Chef de cellule = arbitre unique en cas de désaccord | Tranche les scénarios non prévus par les contingences « Si… → » de la charte de rédaction. En profil B, le pilote opérationnel arbitre au niveau tactique, la Direction générale au niveau stratégique. |
| 4 | Aucune décision majeure sur la seule initiative d'un rôle d'exécution | Cf. matrice ci-dessous : une décision marquée D pour Juridique ou Direction générale ne peut être exécutée par le Référent technique ou la Communication, même en cas d'urgence perçue. |

D = Décideur · C = Consulté avant décision · I = Informé après décision · E = Exécutant

| Décision | D | C | I | E |
|---|---|---|---|---|
| Déclencher la cellule de crise | Tout membre pressenti | — | Direction générale | — |
| Couper un système / segmenter le réseau | Référent technique | Coordinateur (si impact métier majeur) | Historien | Équipes IT |
| Activer le PCA/PRA | Coordinateur | Référent technique, direction métier concernée | Cellule de crise | Équipes métier |
| Payer une rançon | Direction générale | Juridique, assureur, Coordinateur | Cellule de crise | — |
| Notifier la CNIL (violation de données) | Juridique | Coordinateur, référent technique | Direction générale | Juridique |
| Notifier l'ANSSI / déposer plainte | Juridique | Coordinateur | Direction générale | Juridique |
| Communiquer en externe (presse, réseaux sociaux, clients) | Porte-parole désigné | Juridique (validation obligatoire) | Cellule de crise | Communication |
| Clore la cellule de crise | Coordinateur | Direction générale | Ensemble des parties prenantes | — |

> En profil B, lire « Coordinateur » comme le pilote de la cellule opérationnelle et « Direction générale » comme la cellule décisionnelle.

---

## IV. Seuils d'escalade

La cellule agit sur mandat propre jusqu'à ces seuils ; au-delà, le Coordinateur (profil A) ou le pilote de la cellule opérationnelle (profil B) saisit obligatoirement la Direction générale / cellule décisionnelle avant de poursuivre :

- Arrêt de production au-delà du seuil défini par le PCA de l'organisation.
- Compromission avérée de données à caractère personnel à grande échelle.
- Réception d'une demande de rançon.
- Risque médiatique avéré (article publié, revendication publique de l'attaquant).
- Risque pour la sécurité des personnes (environnement industriel/OT, santé).
- Dépassement du mandat budgétaire délégué au Coordinateur / au pilote opérationnel.

> Chaque franchissement de seuil est consigné dans la main courante (horodatage, seuil franchi, décision prise en retour).

---

## V. Rythme de crise et rendu de compte

**SITREP** (*situation report*) : point de situation périodique transmis en cellule, oral ou écrit. Terme standard de gestion de crise (utilisé notamment par l'ANSSI), pas un acronyme maison — non soumis au test de collision (§VIII).

| # | Règle | Application |
|---|---|---|
| 1 | Cadence de SITREP fixée dès l'activation | Ex. : 2 à 4h en phase aiguë, glissant en phase de stabilisation. |
| 2 | Cadence indexée sur un niveau de gravité déclaré, jamais improvisée | Mineure / majeure / catastrophique — le choix H+15 vs H+2 découle du niveau déclaré, pas d'un ressenti. |
| 3 | Rendu de compte ascendant vers la Direction générale (ou cellule décisionnelle en profil B) | Fréquence fixée en amont, et systématiquement dès franchissement d'un seuil d'escalade (§IV). |

---

## VI. Main courante et traçabilité

| # | Règle | Application |
|---|---|---|
| 1 | Un scribe désigné par cellule (l'Historien) | Pas de main courante à plusieurs mains simultanées. |
| 2 | Main courante unique et centralisée, par cellule | Consultable en lecture par tous les rôles de la cellule concernée, modifiable par le seul scribe du moment. |
| 3 | Toute entrée horodatée, y compris un RAS | RAS = aucune alerte des sources surveillées à ce jour. Ne signifie jamais « incident écarté » ni « SI sain ». |
| 4 | Un document par public, jamais un document unique multi-destinataires | Main courante nominative → assureurs, autorités judiciaires. RETEX anonymisé par rôle → employés (§XI). Communication externe → cellule de communication, sous un registre propre. |

---

## VII. Diffusion des fiches et habilitations

| # | Règle | Application |
|---|---|---|
| 1 | Création, validation et consultation de chaque fiche définies par rôle | Versionnement géré en cellule. |
| 2 | Matrice d'habilitation explicite par niveau | Ce qu'un non-habilité peut faire seul, transmettre, ou ne jamais faire. |
| 3 | Règle de repli pour les non-habilités | En cas de doute → consigner et transmettre, ne jamais agir seul. |
| 4 | Chaque fiche porte sa légende minimale en en-tête | Pas de renvoi à un glossaire séparé pour les symboles et abréviations d'usage courant sur la fiche. |

---

## VIII. Communication externe et vocabulaire

| # | Règle | Application |
|---|---|---|
| 1 | Un seul porte-parole désigné à un instant T | Nommé par le Coordinateur, ou la Direction générale pour les prises de parole de haut niveau. |
| 2 | Tout message externe validé par le Juridique avant diffusion | Presse, réseaux sociaux, clients, partenaires — sans exception, y compris pour une réponse jugée urgente. |
| 3 | Tout contact avec une autorité externe passe par le Juridique, sous mandat du Coordinateur | ANSSI, CNIL, police/gendarmerie, assureur. |
| 4 | Le Référent technique et les équipes d'exécution ne s'expriment jamais directement vers l'extérieur | Y compris sur des forums techniques ou réseaux professionnels, pendant la durée de la crise. |
| 5 | Un acronyme maison (CIR, CRP…) reste d'usage strictement interne | Jamais utilisé dans une fiche ou un message destiné à un acteur externe. |
| 6 | Langage clair imposé dès qu'un acteur externe entre en cellule | ARS, SAMU, pompiers, assureur, ANSSI — aucun code ni jargon propre à l'organisation. |
| 7 | Tout terme mnémotechnique soumis au test de collision avant adoption | Cf. charte de rédaction, règle 9. |
| 8 | Désignation d'un système ou d'un actif fixée par sa référence externe stable | Schéma réseau, CMDB, inventaire — aucun synonyme improvisé en cellule, même par commodité, même sous stress. |

---

## IX. Continuité en mode dégradé

| # | Règle | Application |
|---|---|---|
| 1 | Le scénario le plus défavorable est la base de conception | Téléphone, informatique, voire électricité hors service. Le retour au papier est la norme envisagée, pas un scénario exceptionnel. |
| 2 | Matériel de crise prépositionné | Fiches vierges imprimées, stylos, photocopieur, horloge murale de référence locale. |
| 3 | Canevas de fiche conçu pour un usage manuscrit sous stress | Écriture en capitales, cases assez grandes pour être cochées au stylo. |
| 4 | Fonction agent de liaison si les canaux numériques sont hors service | Le délai de transmission physique s'intègre au calcul du H+X. |
| 5 | Lieu de repli désigné à l'avance | Sans électricité ni réseau. |
| 6 | Mode dégradé de la charte elle-même défini | Sous coupure totale : seuls l'horodatage systématique, l'action à l'infinitif et la formule d'absence horodatée restent impératifs. |

---

## X. Suppléance des rôles

- Chaque rôle permanent (profil A) ou chaque poste de chaque cellule (profil B) a un suppléant désigné en amont, hors période de crise.
- En l'absence du titulaire, le suppléant assure l'intérim avec la même autorité décisionnelle (§III) — aucune décision ne reste en attente faute de suppléance planifiée.
- Les incompatibilités de cumul de rôles restent valables pour un suppléant : un même suppléant ne peut couvrir simultanément Historien et Coordinateur, ni Historien et Référent technique.

---

## XI. Clôture et retour d'expérience

| # | Règle | Application |
|---|---|---|
| 1 | Critères de sortie de crise explicites | Retour au nominal constaté et étayé, jamais un sentiment d'accalmie. |
| 2 | Clôture décidée par le Coordinateur (profil A) ou conjointement par les deux cellules (profil B), validée par la Direction générale | Bilan RETEX formel engagé dans la foulée. |
| 3 | RETEX anonymisé par rôle, distinct de la main courante (§VI, règle 4) | Le support diffusé aux employés remplace les noms par les rôles (« l'opérateur », « le scribe »), pour orienter le débrief sur le déroulé des faits et les causes systémiques plutôt que sur les personnes. Aucune perte d'information : la main courante nominative reste disponible à part, pour son propre public. |
| 4 | Chaîne de notification externe formalisée, rôle responsable désigné | Ex. : notification CNIL sous 72h si exfiltration confirmée. |

---

## XII. Principes de vigilance opérationnelle

Ces cinq principes (Weick & Sutcliffe, *High Reliability Organizations*) encadrent la lecture et la rédaction de toute fiche opérationnelle ; ils ne remplacent pas le format de la charte, ils en encadrent l'usage.

| # | Principe | Application en cellule |
|---|---|---|
| 1 | Préoccupation pour l'échec | Tout signal faible est traité comme une info sur une défaillance systémique possible. Un « RAS » n'est jamais une preuve d'absence de problème. |
| 2 | Réticence à simplifier | Une hypothèse ne se clôt pas parce qu'elle est confortable, mais parce qu'elle est vérifiée. |
| 3 | Sensibilité aux opérations | Rester attentif à ce qui se passe réellement en première ligne, pas seulement à ce que prévoient les procédures — « la carte n'est pas le terrain ». |
| 4 | Engagement envers la résilience | La cellule développe la capacité à absorber un choc et à continuer de fonctionner malgré l'erreur déjà commise. |
| 5 | Déférence à l'expertise | En situation critique, la décision migre vers qui a la compétence la plus pertinente pour ce problème précis, pas automatiquement vers le rang hiérarchique le plus élevé. |

---

## XIII. Articulation avec la charte de rédaction

Ce document définit les autorités et les flux que la [charte de rédaction](charte-redactionnelle.md) présuppose sans les nommer :

- « Rendre compte de [fait] à [autorité] » (charte §II.E) : l'autorité destinataire est déterminée par §V et §VIII ci-dessus.
- « Sur ordre de [autorité] » (charte §II.C) : l'autorité habilitée à donner cet ordre est déterminée par la matrice §III.
- « Si [fait confirmé] → [obligation] » (charte §II.G, cas réglementaire) : le déclencheur d'obligation renvoie aux seuils d'escalade §IV et à la chaîne de validation §VIII.
- Les acronymes maison définis en charte §II.F (CIR, CRP) sont soumis à la restriction d'usage du §VIII, règle 5 : jamais dans une fiche ou un message destiné à un acteur externe.
- Le champ `ACTEUR` du canevas §V de la charte suit la matrice D/C/I/E du §III ci-dessus : voir charte §V pour la convention de report des rôles Consulté et Informé.

Toute fiche mentionnant un rôle, une validation ou un rendu de compte doit être cohérente avec les autorités définies ici.

---

## XIV. Références sources

| Document | Usage pour ce cadrage |
|---|---|
| ANSSI, *Crise d'origine cyber* (déc. 2021, MAJ mars 2023) | Architecture à deux cellules, rythme de SITREP, phases de crise, registre opérationnel |
| ANSSI, *Mes premiers réflexes cyber* | Modèle à cellule unique, rôles en structure de taille réduite |
| RETEX hospitaliers français (Dax 2021, Corbeil-Essonnes 2022, Villefranche-sur-Saône, Arles, Cannes 2024, Pontarlier) | Continuité en mode dégradé, main courante papier, ouverture à des acteurs externes |
| Weick & Sutcliffe, *Managing the Unexpected* (High Reliability Organizations) | Principes de vigilance opérationnelle |
| Doctrine ICS/NIMS (États-Unis, gestion multi-agences) | Restriction des acronymes maison aux échanges internes |
| Mémento Tactique GTIA 2023-2024 (Armée de terre) | Formules du chef, arbitrage, chaîne de commandement |
| Guide SDIS 70 – Exercice du commandement (2020) | Frontière civil/militaire, check-lists d'activation |
