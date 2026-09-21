# Instructions pour Claude Code

## Déterminer le registre avant toute correction

Avant d'appliquer une règle des §I à §VII de la charte à une fiche, déterminer son registre au sens du §0 de la charte (opérationnel / référence / narratif) à l'aide du test d'appartenance qui y est donné. Ne jamais se fonder sur le seul type déclaré du gabarit (`fiche_reflexe`, `checklist`, etc.) pour cette détermination — deux fiches du même type peuvent relever de registres différents. Le registre opérationnel (télégraphique, canevas complet, grille §VI) ne s'applique qu'aux fiches qui le sont réellement selon ce test.

## Correction rédactionnelle des fiches

Pour toute demande de correction, relecture ou réécriture d'une fiche (dossier `fiches-typ/`), les seuls points d'entrée normatifs sont :

1. [charte-redactionnelle.md](charte-redactionnelle.md) — syntaxe, tournures, formules d'absence, gestion de l'incertitude, canevas de fiche.
2. [cadrage-cellule-crise.md](cadrage-cellule-crise.md) — chaîne de commandement, autorités de décision, flux de communication interne/externe, seuils d'escalade. Toute mention d'un rôle, d'une validation ou d'un rendu de compte dans une fiche doit être cohérente avec ce document.

Ne pas appliquer de règles de style ou d'organisation personnelles ou génériques : se conformer strictement à ces deux documents.

## Priorité normative

Les fiches existantes dans `fiches-typ/` antérieures à la charte ne constituent jamais une référence de style ou de structure, même en cas de doute ou d'absence de précédent conforme. Seuls `charte-redactionnelle.md` et `cadrage-cellule-crise.md` font foi. Une fiche existante non conforme à ces deux documents est elle-même à corriger, jamais un précédent à suivre pour en traiter une autre.

## Vérification du gabarit avant application

Avant d'appliquer une exigence structurelle de la charte (canevas §V, mécanisme d'annexe §II.E) ou du cadrage à une fiche, vérifier que le gabarit de production (`authoring.typ`, définition de `fiche()` et des types associés) la supporte nativement — champs, blocs, éléments actionnables.

L'absence d'un champ ou d'un mécanisme requis par la charte ou le cadrage est un blocage à signaler explicitement à l'utilisateur, jamais une conversion silencieuse en prose libre ou en habillage improvisé pour contourner la limite du template. Proposer l'extension du gabarit nécessaire plutôt que de dégrader le contenu pour qu'il tienne dans le gabarit existant.

## Deux instanciations légitimes du canevas §V

Le canevas §V de la charte admet deux rendus légitimes, ni l'un ni l'autre n'étant une version dégradée de l'autre : (a) le canevas manuscrit, forme de référence pour le mode dégradé ; (b) le rendu typeset via les primitives de `authoring.typ` (`fiche()`, `action()`, `encart()`), pour tout usage numérique ou imprimé hors mode dégradé.

Une fiche déjà conforme en instanciation (b) n'est jamais à réécrire pour recopier littéralement le bloc ASCII du canevas manuscrit. La conformité tient à la présence et à la séparation repérable des blocs fonctionnels (§V), pas à la ressemblance graphique avec le canevas manuscrit.

Vérifier en particulier, sur chaque fiche du registre opérationnel :

- **Délai** : champ visible et distinct dans le rendu, jamais fondu dans l'Objet ou l'Action.
- **Traçabilité** (rédacteur, date, version, validateur) : si le gabarit ne porte pas nativement un de ces champs pour toute fiche, quel que soit son statut de validation, le signaler comme blocage (cf. « Vérification du gabarit avant application » ci-dessus), jamais l'omettre silencieusement ni le remplacer par du texte libre improvisé.
- **Situation / Incertitudes** : requis uniquement si la fiche consigne un fait daté (§V). Leur absence sur une fiche de pure procédure n'est pas une non-conformité à corriger.

## Vérification avant clôture d'une tâche

Aucune correction, relecture ou réécriture n'est considérée terminée sans :

1. Rendu réel du document (`typst compile` → PDF, page concernée), jamais une relecture du `.typ` source seul.
2. Repassage de la grille de contrôle qualité §VI de la charte sur ce rendu, item par item — en particulier l'item 1 (« verbe d'action en tête de chaque item ? »), qui n'a de sens que vérifié visuellement sur la page produite.

## Documentation de référence

Une correction ne doit jamais entrer en contradiction avec la documentation de référence présente dans le dossier [source_documentaire/](source_documentaire/). En cas de doute ou de conflit apparent entre une reformulation imposée par la charte/le cadrage et un fait, une procédure ou une exigence réglementaire issue de cette documentation, la documentation de référence prévaut : signaler le conflit plutôt que de trancher silencieusement.