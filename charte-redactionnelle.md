# Charte de rédaction – Manuel opérationnel de gestion de crise cyber

---
## 0. Registres et champ d'application

Le livret mélange deux natures de contenu qui ne doivent jamais suivre les mêmes règles d'écriture : ce qui se lit **à chaud**, sous contrainte de temps, pendant un incident réel, et ce qui se lit **à froid**, pour comprendre, préparer ou justifier. Confondre les deux dans un seul jeu de règles produit soit des fiches d'action noyées de justificatifs, soit des explications compressées en une ligne illisible. Trois registres, chacun avec son champ d'application propre.

### Registre opérationnel (§I à §VII ci-après)

S'applique à toute fiche déclenchée par un fait de crise en cours et prescrivant une séquence d'actions sous délai contraint (H+X) — quel que soit son type déclaré dans le gabarit (`fiche_reflexe`, `checklist` ou autre). Exemples : les fiches Qualification et Endiguement, *Notifier une violation de données (CNIL)*, *Reprendre le contrôle du système d'information*. Ce sont les seules fiches soumises au registre télégraphique (§I), au canevas complet (§V) et à la grille de contrôle qualité (§VI).

**Test d'appartenance** : la fiche répond-elle à « je suis en crise, là, maintenant, qu'est-ce que je fais » ? Si oui → registre opérationnel.

### Registre de référence

S'applique aux fiches consultées à froid mais qui restent des outils de travail structurés : rôles de la cellule, checklists de préparation, diagnostics de maturité, organisation d'exercice. Rédaction en phrases complètes, organisée par titres et listes, sans contrainte de longueur de phrase ni bannissement du conditionnel informatif — les règles 4, 9 et 10 du §I restent recommandées (horaires précis, un terme = un concept, test de collision), pas les règles 1, 2, 5, 7 propres au registre opérationnel.

### Registre narratif

Contexte, justification, philosophie, doctrine : pourquoi le livret est construit ainsi, ce que disent la littérature ou les retours d'expérience, les principes qui doivent éclairer la lecture de toute fiche sans être eux-mêmes des fiches. Ce contenu vit exclusivement dans l'Avant-propos du livret, jamais compressé dans un ⚠ ou un 📝 au fil d'une fiche. Une fiche qui a besoin d'un principe général y renvoie (« Voir Avant-propos, §X » — formule ajoutée en §II.E) plutôt que de le réexpliquer localement.

### Ce que ça change concrètement

- *Rôles de la cellule de crise* relève du registre de référence : pas de cases à cocher, pas de limite de 15 mots par phrase.
- Un type `checklist` peut relever de l'un ou l'autre registre selon son usage réel, jamais selon son type déclaré seul — *Organiser un exercice de simulation* est référence ; *Notifier une violation de données (CNIL)* est opérationnelle malgré un type identique.
- Les cinq principes de vigilance opérationnelle, la culture non-punitive du RETEX, la justification du scénario du pire : c'est du narratif, ça vit dans l'Avant-propos, jamais en encart de fiche.

## I. Règles syntaxiques fondamentales
Champ d'application : registre opérationnel uniquement (§0).

| #   | Règle                                                                                                                                                                                                                                                                            | Application                                                                                                     |
| --- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| 1   | **Sujet + verbe + COD** au maximum. Omettre le sujet si implicite.                                                                                                                                                                                                               | « ☐ Isoler segment. » / « ☐ Alimenter main courante. »                                                          |
| 2   | **Action = indicatif ou impératif. Contingence = structure « Si… alors… » avec verbe à l'indicatif ou à l'infinitif.** Le conditionnel grammatical est banni. L'incertitude se marque par le lexique du §II.G, jamais par un mode verbal.                                        | « Isoler segment. » / « Si SI inopérant → basculer mode dégradé. »                                              |
| 3   | **Missions = verbes. Rôles = substantifs.**                                                                                                                                                                                                                                      | « Isoler », « Restreindre », « Alimenter » (et non « l'isolement », « la restriction »).                        |
| 4   | **Horaires précis** : H+X, D+X, HHMM. H+X sans suffixe est en minutes ; toute échéance en heures porte le suffixe explicite (« H+72h »). D+X est toujours en jours, l'heure HHMM le complète si besoin (« D+1, 0600 »). Jamais de « rapidement », « dans les meilleurs délais ». | « H+30 : couper accès. » / « H+72h : notifier CNIL. » / « D+1, 0600 : SITREP n°2. »                             |
| 5   | **Une idée = une phrase. Pas de subordonnée explicative ou relative.** Les subordonnées de contingence (Si / Quand / Dès que) sont l'exception : elles portent l'action elle-même, pas une explication.                                                                          | « L'incident est confirmé. Isoler segment. » / « Si SI inopérant → basculer mode dégradé. » (admis)             |
| 6   | **Concision télégraphique** : prépositions réduites, compléments elliptiques.                                                                                                                                                                                                    | « Avec CISO, DSI. » (et non « avec le CISO et la DSI »)                                                         |
| 7   | **Phrases nominales** pour les titres et les items de check-list.                                                                                                                                                                                                                | « **ISOLEMENT** » / « **RESTAURATION** »                                                                        |
| 8   | **Participe passé** pour les états et les résultats.                                                                                                                                                                                                                             | « ☐ Segment isolé. » / « ☐ Sauvegarde validée. »                                                                |
| 9   | **Tout terme mnémotechnique** créé dans ce manuel est soumis à un **test de collision** avec le vocabulaire existant du client et les normes applicables (NIS 2, DORA, ISO 22301). En cas de collision, le terme est abandonné. Glossaire en annexe.                             | Voir §VI.                                                                                                       |
| 10  | **Un terme = un concept.** Pas de synonyme.                                                                                                                                                                                                                                      | « Isoler » et non « séparer / cloisonner / couper » (sauf « couper » pour un lien réseau, défini en glossaire). |
| 11  | **Toute entrée de main courante est horodatée** (HHMM, format 24 h), **même un RAS**. Chaque fiche porte : rédacteur, date, version, validateur.                                                                                                                                 | « 0942 – RAS. » / « 0958 – Segment 3 isolé. »                                                                   |

---

## II. Tournures types par fonction

### A. Action / item de check-list

| Modèle                                       | Exemple cyber                                    |
| -------------------------------------------- | ------------------------------------------------ |
| Verbe à l'infinitif, sans sujet.             | « ☐ Isoler le segment réseau. »                  |
| Verbe à l'infinitif + complément elliptique. | « ☐ Alimenter main courante. »                   |
| Phrase nominale (titre de section).          | « **ISOLEMENT** » / « **RESTAURATION** »         |
| Participe passé (état vérifié).              | « ☐ Segment isolé. » / « ☐ Sauvegarde validée. » |

### B. Condition / déclencheur

| Modèle (mode)                                    | Exemple cyber                                            |
| ------------------------------------------------ | -------------------------------------------------------- |
| « Dès que [condition, indicatif], [infinitif]. » | « Dès que l'alerte est confirmée, activer la cellule. »  |
| « En cas de [nom], [infinitif]. »                | « En cas de propagation, couper le lien backbone. »      |
| « Si [condition, indicatif], [infinitif]. »      | « Si le SI est inopérant, basculer en mode dégradé. »    |
| « Quand [état, indicatif], [infinitif]. »        | « Quand le trafic redevient nominal, rétablir l'accès. » |

> Le verbe de l'action est toujours à l'infinitif (ou à l'impératif dans un ordre direct). Le conditionnel n'apparaît jamais, ni dans l'antécédent, ni dans la conséquence.

### C. Prescription / obligation

| Modèle                                | Exemple cyber                                        |
| ------------------------------------- | ---------------------------------------------------- |
| « [Acteur] doit [action]. »           | « Le DSI doit notifier le CISO. »                    |
| « [Acteur] est tenu de [action]. »    | « L'opérateur est tenu de consigner chaque action. » |
| « Ne pas [action] sans [condition]. » | « Ne pas restaurer le SI sans validation du CISO. »  |
| « Sur ordre de [autorité]. »          | « Restaurer sur ordre du chef de cellule. »          |

### D. Finalité / objet

| Modèle                            | Exemple cyber                                          |
| --------------------------------- | ------------------------------------------------------ |
| « Afin de [objectif], [action]. » | « Afin de limiter la propagation, isoler le segment. » |
| « Objectif : [substantif]. »      | « Objectif : endiguer l'incident en H+30. »            |
| « But : [verbe + COD]. »          | « But : restaurer la disponibilité des services. »     |

### E. Rendu de compte / information

| Modèle                                                | Exemple cyber                                                                                                                                  |
| ----------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| « Rendre compte de [fait] à [autorité] par [moyen]. » | « Rendre compte de l'incident au CISO par téléphone. »                                                                                         |
| « SITREP n°X à H+Y. »                                 | « SITREP n°3 à H+90. »                                                                                                                         |
| « Alimenter [document]. »                             | « Alimenter la main courante en temps réel. »                                                                                                  |
| « Voir Annexe X » / « Cf. fiche n°X ».                | Renvoi vers du contenu-référence, jamais vers une action.                                                                                      |
| « Voir Avant-propos, §X ».                            | Renvoi vers un principe général, une justification ou du contexte — jamais du contenu réglementaire de référence (qui suit « Voir Annexe X »). |

> « Voir Annexe X » / « Cf. fiche n°X » suppose que le contenu référencé existe dans un bloc typographiquement distinct du corps actionnable de la fiche (encart, section repérable, mise en forme différente) — jamais mêlé en paragraphe ordinaire au reste du contenu. Si aucun mécanisme de ce type n'existe dans le gabarit utilisé, c'est un blocage à signaler (cf. CLAUDE.md), pas une raison d'écrire le contenu de référence en prose continue dans le corps de la fiche.

### F. Termes mnémotechniques

| Acronyme | Expansion                                    | Usage                              |
| -------- | -------------------------------------------- | ---------------------------------- |
| **CIR**  | **C**onsigner, **I**soler, **R**endre compte | Séquence immédiate à chaque alerte |
| **CRP**  | **C**onstater, **R**apporter, **P**roposer   | Structure d'un point de situation  |

> Tout acronyme créé est soumis au test de collision (règle 9). En cas de conflit avec le vocabulaire client ou les normes, l'acronyme est abandonné. Un acronyme maison (CIR, CRP…) reste d'usage strictement interne : jamais dans une fiche ou un message destiné à un acteur externe (voir [cadrage-cellule-crise.md](cadrage-cellule-crise.md), §VIII).

### G. Incertitude

Le conditionnel grammatical reste interdit (règle 2). L'incertitude, réalité opérationnelle et réglementaire (RGPD, NIS 2), se marque par un lexique fermé, jamais par un mode verbal.

| Statut épistémique                         | Tournure imposée                        | Exemple                                                                    |
| ------------------------------------------ | --------------------------------------- | -------------------------------------------------------------------------- |
| Fait établi                                | Indicatif simple                        | « Segment 3 compromis. »                                                   |
| Fait probable, non vérifié                 | « [Fait]. Non confirmé. »               | « Exfiltration de données. Non confirmé. »                                 |
| Hypothèse à instruire                      | « Hypothèse : [X]. À valider. »         | « Hypothèse : vecteur = phishing. À valider. »                             |
| Hypothèse écartée                          | « Hypothèse [X] écartée. Motif : [Y]. » | « Hypothèse ransomware écartée. Motif : absence de note de rançon. »       |
| Risque réglementaire conditionné à un fait | « Si [fait confirmé] → [obligation]. »  | « Si exfiltration confirmée → notification CNIL sous 72h (Art. 33 RGPD). » |

> Toute incertitude doit apparaître explicitement dans la fiche ou la main courante (« Non confirmé », « À valider »), jamais implicitement via une tournure de politesse (« il semblerait que »).

---

## III. Formules d'absence standard

| Situation                 | Formule                               | Portée exacte                                                                                           |
| ------------------------- | ------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| Rien à signaler           | **RAS**                               | Aucune alerte des sources surveillées à ce jour. Ne signifie jamais « incident écarté » ni « SI sain ». |
| Pas de changement         | **Inchangé**                          | Dernier état confirmé toujours valide.                                                                  |
| Pas de renseignement      | **NA**                                | Information non recueillie, pas « information négative ».                                               |
| Action différée           | **Sur ordre**                         | —                                                                                                       |
| Voir ailleurs             | **Voir Annexe X** / **Cf. fiche n°X** | —                                                                                                       |
| Pas de précision possible | **Sans objet**                        | —                                                                                                       |

> **Rappel (règle 11)** : toute formule d'absence est horodatée. « 0942 – RAS (aucune alerte SOC depuis 0900). »

---

## IV. Interdictions syntaxiques

| ❌ À éviter                                                                                                         | ✅ À faire                                                                           |
| ------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------- |
| « Il est recommandé de procéder à l'isolement du segment réseau dans les meilleurs délais. »                       | « Isoler segment. H+30 max. »                                                       |
| « Si le SI est inopérant, il faudrait basculer en mode dégradé. »                                                  | « Si SI inopérant → basculer mode dégradé. »                                        |
| « L'opérateur devrait envisager une coupure. »                                                                     | « En cas de propagation → couper backbone. »                                        |
| « Il convient de s'assurer que la main courante soit alimentée de manière continue. »                              | « Alimenter main courante en continu. »                                             |
| « Il est impératif que les actions soient consignées. »                                                            | « Consigner chaque action. »                                                        |
| Subordonnées en cascade : « Si l'incident, qui a été détecté par le SIEM, se propage au-delà du segment initial… » | « Incident détecté. Propagation au-delà segment → couper backbone. »                |
| Adverbes vagues : « rapidement », « immédiatement », « dans les meilleurs délais »                                 | « H+15. » / « Immédiat. »                                                           |
| Conditionnel grammatical : « il conviendrait », « on basculerait », « il faudrait », « cela pourrait »             | Banni. Remplacer par infinitif/impératif, ou par le lexique d'incertitude du §II.G. |

---

## V. Canevas de fiche opérationnelle

Champ d'application : registre opérationnel (§0).

### Blocs fonctionnels

Une fiche opérationnelle se décompose en blocs fonctionnels. Chaque bloc est un élément structurel distinct et vérifiable dans le document produit — jamais un paragraphe qui l'évoque en langage naturel. Une fiche où ces blocs ne sont pas séparables et repérables visuellement n'est pas conforme, même si chaque phrase individuelle respecte les règles du §I.

**Neuf blocs toujours requis**, dans cet ordre : Objet, Déclencheur, Acteur, Délai, Action, Contingences, Rendu de compte, Règles/restrictions, Traçabilité (rédacteur, date, version, validateur — cf. §I, règle 11).

**Deux blocs conditionnels** : Situation et Incertitudes ne sont requis que pour une fiche dont la fonction est de consigner un fait daté (ex. : fiche de qualification, diagnostic, entrée de main courante formalisée). Une fiche de pure procédure (ex. : « Isoler un segment réseau »), écrite en amont pour prescrire une séquence d'action, n'a pas de fait à rapporter à la rédaction : ces deux blocs n'y figurent pas, et leur absence n'est pas une non-conformité.

Le DÉLAI est un champ visible et distinct, jamais fondu dans l'Objet ou dans le corps de l'Action (cf. §I, règle 4).

### Deux instanciations légitimes

Ce canevas se rend de deux façons, selon le contexte de production et de lecture — aucune des deux n'est une dégradation de l'autre :

**a. Canevas manuscrit** — forme de référence pour le mode dégradé (cadrage §IX). Une fiche vierge prépositionnée (cadrage §IX, règle 2) ne sait pas à l'avance si elle servira à consigner un fait : Situation et Incertitudes restent donc imprimés sur tout gabarit manuscrit générique, à remplir ou à marquer Sans objet (§III) selon le cas.

```
FICHE n°[X] – [INTITULE EN NOMINAL]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
OBJET        : [verbe + COD, 1 phrase max]
DÉCLENCHEUR  : Dès que [condition].
ACTEUR       : [rôle]
DÉLAI        : H+[X] / D+[X], HHMM

1. SITUATION (faits confirmés, indicatif — si la fiche consigne un fait, sinon Sans objet)
   - [fait 1]
   - [fait 2]

2. INCERTITUDES (statut explicite — cf. §II.G — mêmes conditions que Situation)
   - [hypothèse] : à valider / non confirmé.

3. ACTION (infinitif, verbes)
   ☐ [action 1]
   ☐ [action 2]
   ☐ [action 3]

4. CONTINGENCES (structure Si… → infinitif)
   - Si [scénario A] → [action A]
   - Si [scénario B] → [action B]

5. RENDU DE COMPTE
   - À : [autorité]
   - Par : [moyen]
   - Quand : H+[X]

6. RÈGLES / RESTRICTIONS
   - Ne pas [action] sans [condition].
   - Sur ordre de [autorité].
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RÉDACTEUR    : [nom / rôle]
DATE         : D+[X], HHMM
VERSION      : [n]
VALIDATEUR   : [nom / rôle]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**b. Rendu typeset** — pour tout usage numérique ou imprimé hors mode dégradé : les mêmes blocs fonctionnels, rendus par les primitives du gabarit de production (`authoring.typ` : `fiche()`, `action()`, `encart()`) plutôt que recopiés littéralement depuis le canevas manuscrit ci-dessus. Une fiche conforme en instanciation (b) n'est jamais à réécrire pour imiter visuellement la forme manuscrite — c'est la présence et la séparation repérable des blocs qui font la conformité, pas la ressemblance graphique avec le bloc ASCII. Une fiche de pure procédure omet dès sa conception les blocs Situation et Incertitudes, sans que cela constitue une non-conformité.

L'état actuel du gabarit de production ne porte pas nativement tous les champs de la Traçabilité (rédacteur, version) sur toute fiche, quel que soit son statut de validation. Tant que cette extension n'est pas faite, c'est un blocage à signaler (cf. CLAUDE.md, « Vérification du gabarit avant application »), jamais une raison d'omettre ces champs silencieusement.

Si le gabarit de production ne permet pas nativement de séparer un bloc requis, c'est de la même façon un blocage à signaler, jamais une raison de revenir à la prose continue.

> `ACTEUR` porte le rôle Décideur/Exécutant au sens de la matrice D/C/I/E (cadrage §III). Les rôles Consulté et Informé sont reportés respectivement en section 3 (Action, comme étape « Consulter [rôle] ») et section 5 (Rendu de compte) — jamais empilés dans le champ `ACTEUR` lui-même.

---

## VI. Contrôle qualité (Annexe A)

Chaque fiche est validée par la check-list ci-dessous **avant diffusion** (registre opérationnel uniquement, cf. §0), sur le document produit (rendu final), pas sur le fichier source :

| #   | Vérification                                                                                                                                                                                                          | ☐   |
| --- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --- |
| 1   | Verbe d'action en tête de chaque item ?                                                                                                                                                                               | ☐   |
| 2   | Aucune phrase > 15 mots ?                                                                                                                                                                                             | ☐   |
| 3   | Aucun conditionnel libre (« devrait / conviendrait / faudrait / pourrait / serait / aurait ») ?                                                                                                                       | ☐   |
| 4   | Horaires en H+X / D+X, HHMM (pas de « rapidement ») ?                                                                                                                                                                 | ☐   |
| 5   | Pas de subordonnée explicative (les subordonnées de contingence Si/Quand/Dès que sont admises) ?                                                                                                                      | ☐   |
| 6   | Formule d'absence utilisée si vide (RAS / Inchangé / NA), horodatée, et RAS interprété au sens du §III ?                                                                                                              | ☐   |
| 7   | Toute incertitude marquée explicitement (§II.G), aucune implicite ?                                                                                                                                                   | ☐   |
| 8   | Bloc de traçabilité complet (rédacteur, date, version, validateur) ?                                                                                                                                                  | ☐   |
| 9   | Blocs fonctionnels requis (§V) visuellement séparés et repérables, quelle que soit l'instanciation retenue (manuscrite ou typeset) ? Situation et Incertitudes présents seulement si la fiche consigne un fait daté ? | ☐   |
| 10  | DÉLAI affiché comme champ visible et distinct, jamais fondu dans l'Objet ou l'Action ?                                                                                                                                | ☐   |

> Un script (regex sur les mots interdits : « rapidement », « devrait », « conviendrait », « faudrait », « pourrait », « serait », « aurait », « semblerait », « dans les meilleurs délais », « il est recommandé de », « il convient de ») peut automatiser les points 2, 3 et 4 avant validation humaine. Les points 1, 9 et 10 ne peuvent être vérifiés que sur le rendu final, jamais sur le texte source seul.

---

## VII. Exemple pédagogique avant / après

> **Avant** (tournure administrative naturelle) :
>
> « Il conviendrait de procéder, dans les meilleurs délais, à l'isolement du segment réseau concerné, afin de limiter la propagation de l'incident, tout en veillant à alimenter la main courante de manière continue. »
>
> **Après** (charte appliquée) :
>
> « Isoler segment. H+15. Alimenter main courante en continu. »

---

## VIII. Références sources

| Document                                         | Usage pour la charte                                    |
| ------------------------------------------------ | ------------------------------------------------------- |
| Mémento Tactique GTIA 2023-2024 (Armée de terre) | Règles de rédaction des ordres, tournures prescriptives |
| TTA 150 – Manuel d'instruction du trinôme        | Registre télégraphique, acronymes, phrases nominales    |
| RFT 3.2.1 – Précis de tactique générale (2022)   | Formules du chef, contingences                          |
| Guide SDIS 70 – Exercice du commandement (2020)  | Frontière civil/militaire, check-lists d'activation     |
| ANSSI – Crise d'origine cyber (2021)             | Registre opérationnel cyber, verbes d'action            |
| Aide-mémoire du Cdt (Armée de terre)             | Formules d'absence, horodatage                          |