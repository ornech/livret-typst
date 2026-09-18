#!/usr/bin/env bash
# Compile le livret complet (toutes les fiches, sommaire automatique) en PDF.
# Usage : ./build.sh
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p out data

# Date de "dernière relecture possible" d'une fiche, affichée en pied de
# page une fois validée (voir authoring.typ, fiche()) - la date du DERNIER
# COMMIT GIT touchant le fichier, pas sa date de modification (mtime) :
# choix explicite de l'utilisateur (2026-09-17), la mtime se réinitialise à
# tort à la date d'un `git clone`/`checkout` et perd alors tout son sens,
# contrairement à l'historique git qui suit le fichier partout où le dépôt
# est cloné. Repli sur la mtime UNIQUEMENT si le fichier n'a encore jamais
# été commité (git log ne renvoie rien) - cas d'une fiche flambant neuve.
echo "{" > data/dates-fiches.json
premiere=true
for f in fiches-typ/*/*.typ; do
  id=$(basename "$f" .typ)
  commit_date=$(git log -1 --format=%cd --date=format:%Y-%m-%d -- "$f" 2>/dev/null || true)
  if [ -z "$commit_date" ]; then
    commit_date=$(date -r "$f" +%Y-%m-%d)
  fi
  if [ "$premiere" = true ]; then
    premiere=false
  else
    echo "," >> data/dates-fiches.json
  fi
  printf '  "%s": "%s"' "$id" "$commit_date" >> data/dates-fiches.json
done
echo "" >> data/dates-fiches.json
echo "}" >> data/dates-fiches.json

typst compile --root . main.typ out/livret.pdf
echo "OK : out/livret.pdf"
