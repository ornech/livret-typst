# Livret de gestion de crise cyber — projet Typst

Projet **autonome** (à ouvrir comme un dossier VS Code à part entière) :
les 48 fiches du corpus réel, converties depuis le JSON d'origine vers le
format Typst mis au point dans `Cyber-Reference-Handbook/test-typst/`
(voir son `README.md` pour l'historique complet des essais et des bugs
rencontrés en cours de route).

## Installer

1. **Typst** (le compilateur) :
   ```bash
   curl -sL -o /tmp/typst.tar.xz https://github.com/typst/typst/releases/download/v0.15.1/typst-x86_64-unknown-linux-musl.tar.xz
   cd /tmp && tar xf typst.tar.xz
   mkdir -p ~/.local/bin && cp typst-x86_64-unknown-linux-musl/typst ~/.local/bin/typst
   ```
   Vérifier que `~/.local/bin` est dans le `PATH` (`typst --version`).
2. **Tinymist** (extension VS Code, pour l'édition/aperçu) : dans VS Code,
   onglet Extensions, chercher "Tinymist", installer. `.vscode/settings.json`
   est déjà configuré (`tinymist.rootPath`).

## Générer le PDF complet

```bash
./build.sh
```
ou directement :
```bash
typst compile --root . main.typ out/livret.pdf
```
`main.typ` lit `data/manifeste.json` (ordre des fiches : par phase
chronologique, puis onglet, puis fiche - voir `convert_corpus.py`) et
génère le sommaire automatiquement (aucune liste à tenir à jour à la main).

## Éditer une fiche (aperçu en direct)

Ouvrir `main-edition.typ`, changer la ligne `#include "..."` pour pointer
vers la fiche à éditer, puis dans VS Code : `Ctrl+Shift+P` →
`Typst Preview: Preview Opened File` (avec `main-edition.typ` actif).
Éditer ensuite le fichier de la fiche (`fiches-typ/<onglet>/<id>.typ`) -
l'aperçu se met à jour à la sauvegarde.

Ce gabarit d'édition n'affiche pas la bande de phase ni l'en-tête miroir
(volontaire - voir "Pourquoi deux gabarits" ci-dessous). Pour vérifier la
mise en page exacte d'une fiche, compiler `main.typ` (PDF complet) et
regarder la bonne page, ou construire un `main.typ` réduit à une seule
fiche du manifeste le temps de vérifier.

## Structure du projet

```
authoring.typ      API d'écriture des fiches (fiche(), action(), encart()...)
config.typ         Lit config_rendu.json + meta.json - un seul point de réglage
fiche.typ          Mise en page (bande de phase, en-tête/pied, sommaire)
icons.typ          Pictogrammes vectoriels (catégorie, priorité)
markdown_lite.typ  Sous-ensemble Markdown (gras/italique/lien) pour le texte libre
config_rendu.json  Réglages (polices, tailles, couleurs, phases) - copié du
                    dépôt principal au moment de la conversion
meta.json          Titre/version/auteur du livret - idem
data/sources.json  Bibliographie dédupliquée (clé -> texte APA déjà formaté)
data/manifeste.json Ordre des fiches dans le PDF final (généré, ne pas éditer à la main)
fiches-typ/<onglet>/<id>.typ   Les 48 fiches, une par fichier
main.typ           Point d'entrée : PDF complet
avant-propos.typ   Avant-propos (registre narratif, charte §0) - inclus par main.typ avant le Sommaire ;
                    sections numérotées en dur, citées par les fiches (« Voir Avant-propos, §X »)
main-edition.typ   Point d'entrée : aperçu léger d'une seule fiche
convert_corpus.py  Régénère fiches-typ/ + data/ depuis le JSON du dépôt principal
```

## ⚠️ Décision à prendre : quelle reste la source de vérité ?

Cette conversion est un **instantané** pris le 2026-09-17. Deux chemins
possibles à partir d'ici, à trancher avant d'aller plus loin :

- **A. Le JSON du dépôt principal reste la source de vérité**, ce projet
  Typst n'est qu'un export/essai de rendu. Dans ce cas, ne pas éditer les
  fichiers dans `fiches-typ/` directement - éditer le JSON puis relancer
  `python3 convert_corpus.py .` pour régénérer (écrase `fiches-typ/` et
  `data/` en entier, sans toucher au reste).
- **B. Ce projet Typst devient la source de vérité** pour le contenu, à
  partir de maintenant - dans ce cas, `convert_corpus.py` ne sert plus
  qu'une fois (déjà fait), et l'éditeur Streamlit + le pipeline WeasyPrint
  du dépôt principal deviennent obsolètes pour le contenu (à geler ou
  retirer, pour éviter que les deux sources divergent silencieusement).

Rien n'a été décidé à ce stade - **ne pas éditer dans les deux projets en
parallèle** tant que ce choix n'est pas fait, sous peine de perdre des
modifications d'un côté ou de l'autre.

## Ce qui est couvert

- Les 48 fiches réelles, tous types (`fiche_reflexe`, `fiche_role`,
  `fiche_communication`, `checklist`, `diagnostic`), tous styles d'item
  (texte, action, note, attention, avertissement).
- Bande de phase (6 phases, miroir recto/verso), en-tête bord-à-bord,
  priorité d'action + rôle en préfixe, encarts, justification.
- Sommaire automatique groupé par phase (dérivé de l'ordre des fiches,
  aucune liste à resynchroniser).
- Sources APA dédupliquées (55 citations -> 41 références uniques),
  statut de vérification (badge "Non vérifiée" - jamais posé
  automatiquement, voir CLAUDE.md du dépôt principal).
- Renvois croisés (`fiches_liees`, 42 fiches) - liens cliquables dans le
  PDF complet, dégradent en texte simple si la fiche cible n'est pas dans
  la compilation (aperçu allégé d'une seule fiche).
- Type de fiche traduit en libellé lisible dans l'en-tête (`fiche_reflexe`
  → "Fiche réflexe", etc.)
- Aperçu en direct stable pendant l'édition (gabarit séparé, sans bande de
  phase - voir `test-typst/README.md` pour pourquoi).

## Ce qui N'est PAS couvert (déféré, pas oublié)

- **Deuxième sommaire "par sujet"** (groupé par onglet plutôt que par
  phase, pour les onglets qui traversent plusieurs phases comme
  Communication de crise) - existe dans le pipeline WeasyPrint actuel, pas
  reconstruit ici.
- **Couverture, 1ère de couverture (avertissement), page de légende** -
  contenu fixe non porté par le JSON dans le pipeline actuel non plus,
  mais codé en dur dans le notebook WeasyPrint - à recréer ici si cette
  voie est retenue.
- **Garde-fou de validation à la saisie** (`format.json` fait échouer
  l'enregistrement d'une fiche invalide dans l'éditeur Streamlit) - aucun
  équivalent ici : éditer un `.typ` directement n'empêche pas d'oublier un
  champ requis. Une fiche syntaxiquement correcte mais incomplète
  compilera sans avertissement.
- **Interface de vérification humaine des sources** (case à cocher
  `verifie_le`/`verifie_par` dans l'éditeur Streamlit) - ici, ces deux
  champs se poseraient à la main dans le `.typ`, sans garde-fou empêchant
  de les poser sans avoir vraiment vérifié (contraire à la règle du
  dépôt principal : jamais posés automatiquement, y compris par une IA).
- **Contrôle de pagination strict** (le pipeline actuel échoue si une
  fiche déborde sans marqueur de saut de page choisi par l'auteur) - ici,
  Typst reflue naturellement une fiche trop longue sur la page suivante
  sans avertissement ; un `#pagebreak()` manuel reste possible dans le
  corps d'une fiche pour choisir un point de coupe, mais rien ne signale
  un débord non voulu.
- **Éditeur graphique** - aucun équivalent à
  `editeur_livret_arborescence.py` : éditer un `.typ` est un geste de
  développeur (VS Code + Tinymist), pas un formulaire.

## Bugs réels trouvés en convertissant le corpus complet (corrigés)

1. Largeur de l'en-tête fausse sur les pages paires (verso) - invisible
   avec un nom d'onglet court, flagrant avec "Rôles et documents de la
   cellule de crise" (43 caractères, complètement écrasé avant
   correction).
2. Type de fiche affiché brut dans l'en-tête (`fiche_reflexe` au lieu de
   "Fiche réflexe") - jamais traduit dans le 1er jet de `fiche()`.
3. Style `action` mal détecté par le convertisseur au premier essai (le
   JSON porte `style: "action"` + un champ `priorite` séparé, pas
   directement `style: "obligatoire"`) - toutes les actions du corpus
   sortaient en texte brut avant correction.
4. Pied de page "Validé le ..." qui pouvait afficher la date de la fiche
   suivante plutôt que celle réellement affichée sur la page - remplacé
   par une recherche `query()` (même technique que le sommaire), plus
   fiable qu'un état séquentiel.

Voir `test-typst/README.md` pour l'historique complet des essais qui ont
mené à ce format (syntaxe ``` vs blockquote GitHub, bibliographie,
espacement des paragraphes, etc.).
