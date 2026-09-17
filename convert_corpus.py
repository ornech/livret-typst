#!/usr/bin/env python3
"""Convertit le corpus JSON réel (fiches/*/*.json + livret.json) vers le
format Typst défini dans authoring.typ (voir test-typst/README.md, essais
n°2/3/4). Sortie : un dossier autonome pret a devenir un nouveau projet
VS Code (voir --out).

N'écrit JAMAIS dans fiches/*/*.json ni livret.json (lecture seule sur le
corpus réel) - source de verite inchangee, uniquement une conversion vers
un format de sortie different.
"""
import json
import re
import sys
import unicodedata
from pathlib import Path

RACINE = Path(__file__).resolve().parent.parent  # /data/projets/Cyber-Reference-Handbook

ORDRE_CANONIQUE_GROUPES = [
    "Déclencheur", "Objectif", "Actions immédiates", "À ne pas faire",
    "Critères d'escalade", "Missions", "Limites",
    "Objectif de communication", "Éléments de langage",
]

STYLES_ENCART = {"note", "attention", "avertissement"}


def slugify(texte, maxlen=40):
    t = unicodedata.normalize("NFKD", texte).encode("ascii", "ignore").decode()
    t = re.sub(r"[^a-zA-Z0-9]+", "-", t).strip("-").lower()
    return t[:maxlen].rstrip("-")


def decouper_en_runs(items):
    runs = []
    derniere = object()
    for it in items:
        sp = it.get("sous_phase")
        if sp != derniere:
            runs.append({"sous_phase": sp, "items": []})
            derniere = sp
        runs[-1]["items"].append(it)
    return runs


def reordonner_items(items):
    """Port exact de _reordonner_items (rendu_livret.ipynb) : les runs a
    nom canonique passent dans l'ordre de lecture fixe, les autres gardent
    leur ordre d'apparition d'origine, a la suite."""
    runs = decouper_en_runs(items)

    def cle(i_run):
        i, run = i_run
        try:
            return (0, ORDRE_CANONIQUE_GROUPES.index(run["sous_phase"]))
        except ValueError:
            return (1, i)

    runs_tries = [r for _, r in sorted(enumerate(runs), key=cle)]
    resultat = []
    for run in runs_tries:
        resultat.extend(run["items"])
    return resultat


def echapper_typ(s):
    """Echappe les caracteres speciaux Typst pour un titre de groupe (==),
    qui EST du balisage natif (pas un bloc brut) - # [ ] _ * < > @ $ doivent
    etre neutralises pour ne pas etre pris pour de la syntaxe."""
    return re.sub(r'([#\[\]_*<>@$\\])', r'\\\1', s)


def texte_brut_pour_bloc(texte):
    """Un bloc ``` est deja du texte brut - seule la sequence de fermeture
    ``` poserait probleme si elle apparaissait litteralement dans le texte
    (jamais rencontre dans le corpus reel, verifie ci-dessous a l'usage)."""
    return texte


def construire_bloc(lang, texte, justification=None):
    corps = texte_brut_pour_bloc(texte)
    if justification:
        corps += "\n\n" + texte_brut_pour_bloc(justification)
    return f"```{lang}\n{corps}\n```"


def convertir_item(item):
    style = item.get("style", "texte")
    texte = item["texte"]
    justification = item.get("justification")

    if style == "action":
        prefixe = f'[{item["responsable"]}] ' if item.get("responsable") else ""
        return construire_bloc(item["priorite"], prefixe + texte, justification)
    if style in STYLES_ENCART:
        return construire_bloc(style, texte, justification)
    if style == "saut_de_page":
        return "#pagebreak()"
    # "texte" ou style absent
    return construire_bloc("texte", texte, justification)


def convertir_fiche(fiche, onglet_meta, sources_cle_par_texte, titres_par_id):
    lignes = []
    lignes.append('#import "../../authoring.typ": *')
    lignes.append("")
    lignes.append("#fiche(")
    lignes.append(f'  id: {json.dumps(fiche["id"], ensure_ascii=False)},')
    lignes.append(f'  type: {json.dumps(fiche["type"], ensure_ascii=False)},')
    if fiche.get("phase"):
        lignes.append(f'  phase: {json.dumps(fiche["phase"], ensure_ascii=False)},')
    lignes.append(
        f'  onglet: (titre: {json.dumps(onglet_meta["titre"], ensure_ascii=False)}, '
        f'pictogramme: {json.dumps(onglet_meta.get("pictogramme", "cercle"), ensure_ascii=False)}),'
    )
    lignes.append(f'  titre: {json.dumps(fiche["titre"], ensure_ascii=False)},')
    if fiche.get("date_validation") and fiche.get("validateur"):
        lignes.append(f'  date_validation: {json.dumps(fiche["date_validation"], ensure_ascii=False)},')
        lignes.append(f'  validateur: {json.dumps(fiche["validateur"], ensure_ascii=False)},')
    lignes.append(")[")

    items = reordonner_items(fiche.get("items", []))
    runs = decouper_en_runs(items)

    premiere_action_run = True
    for run in runs:
        sp = run["sous_phase"]
        elements = run["items"]
        a_des_actions = any(it.get("style") == "action" for it in elements)
        if sp:
            lignes.append(f"  == {echapper_typ(sp)}")
        if a_des_actions:
            lignes.append("  #debut-actions()")
        for it in elements:
            bloc = convertir_item(it)
            for l in bloc.split("\n"):
                lignes.append("  " + l)
        lignes.append("")

    # fiches liees (resolues en (id, titre) au moment de la conversion -
    # pas de requete inter-fichiers a l'execution)
    liees = fiche.get("fiches_liees") or []
    if liees:
        paires = ", ".join(
            f'({json.dumps(fid, ensure_ascii=False)}, {json.dumps(titres_par_id.get(fid, fid), ensure_ascii=False)})'
            for fid in liees
        )
        lignes.append(f"  #fiches-liees(({paires},))")
        lignes.append("")

    # sources
    refs = fiche.get("references_sources", [])
    for r in refs:
        cle = sources_cle_par_texte[r["reference"]]
        page = r.get("page") or ""
        parts = [f'{json.dumps(cle, ensure_ascii=False)}']
        if page:
            parts.append(f'page: {json.dumps(page, ensure_ascii=False)}')
        if r.get("verifie_le"):
            parts.append(f'verifie_le: {json.dumps(r["verifie_le"], ensure_ascii=False)}')
        if r.get("verifie_par"):
            parts.append(f'verifie_par: {json.dumps(r["verifie_par"], ensure_ascii=False)}')
        lignes.append(f'  #source({", ".join(parts)})')
    lignes.append("  #imprimer-sources()")
    lignes.append("]")
    lignes.append("")
    return "\n".join(lignes)


def main():
    out_dir = RACINE / "livret-typst"
    if len(sys.argv) > 1:
        out_dir = Path(sys.argv[1]).resolve()

    livret = json.loads((RACINE / "livret.json").read_text(encoding="utf-8"))

    # --- charge toutes les fiches reelles, dans l'ordre onglet -> fiches ---
    onglets_tries = sorted(livret["onglets"], key=lambda o: o.get("ordre", 0))
    fiches_completes = []  # (onglet, fiche_dict)
    titres_par_id = {}
    for onglet in onglets_tries:
        for fid in onglet["fiches"]:
            chemin = RACINE / "fiches" / onglet["id"] / f"{fid}.json"
            fiche = json.loads(chemin.read_text(encoding="utf-8"))
            fiches_completes.append((onglet, fiche))
            titres_par_id[fid] = fiche["titre"]

    # --- deduplique les sources par texte, cle stable ---
    sources_cle_par_texte = {}
    sources_data = {}
    for _onglet, fiche in fiches_completes:
        for r in fiche.get("references_sources", []):
            texte = r["reference"]
            if texte in sources_cle_par_texte:
                continue
            base = slugify(texte)
            cle = base
            n = 2
            while cle in sources_data:
                cle = f"{base}-{n}"
                n += 1
            sources_cle_par_texte[texte] = cle
            sources_data[cle] = texte

    # --- ecrit les fichiers ---
    (out_dir / "data").mkdir(parents=True, exist_ok=True)
    (out_dir / "fiches-typ").mkdir(parents=True, exist_ok=True)

    (out_dir / "data" / "sources.json").write_text(
        json.dumps(sources_data, ensure_ascii=False, indent=2), encoding="utf-8"
    )

    manifeste_par_onglet = {}  # onglet_id -> [chemins]
    manifeste_ids = []
    n_fiches = 0
    for onglet, fiche in fiches_completes:
        onglet_dir = out_dir / "fiches-typ" / onglet["id"]
        onglet_dir.mkdir(parents=True, exist_ok=True)
        contenu = convertir_fiche(fiche, onglet, sources_cle_par_texte, titres_par_id)
        (onglet_dir / f"{fiche['id']}.typ").write_text(contenu, encoding="utf-8")
        chemin_relatif = f"fiches-typ/{onglet['id']}/{fiche['id']}.typ"
        manifeste_par_onglet.setdefault(onglet["id"], []).append(chemin_relatif)
        manifeste_ids.append((fiche.get("phase"), chemin_relatif))
        n_fiches += 1

    print(f"OK : {n_fiches} fiches converties dans {out_dir}/fiches-typ/")
    print(f"OK : {len(sources_data)} sources uniques dans {out_dir}/data/sources.json "
          f"(sur {sum(len(f.get('references_sources', [])) for _, f in fiches_completes)} citations)")

    # --- manifeste principal, groupe par phase (ordre chronologique), puis
    # dans l'ordre d'apparition onglet -> fiche a l'interieur d'une phase
    # (meme parcours que _sommaire_entrees_plates, rendu_livret.ipynb) ---
    ordre_phases = ["preparation", "qualification", "endiguement", "investigation", "remediation", "retex"]
    par_phase = {p: [] for p in ordre_phases}
    sans_phase = []
    for phase, chemin in manifeste_ids:
        if phase in par_phase:
            par_phase[phase].append(chemin)
        else:
            sans_phase.append(chemin)

    manifeste_final = []
    for p in ordre_phases:
        manifeste_final.extend(par_phase[p])
    manifeste_final.extend(sans_phase)

    (out_dir / "data" / "manifeste.json").write_text(
        json.dumps(manifeste_final, ensure_ascii=False, indent=2), encoding="utf-8"
    )
    if sans_phase:
        print(f"ATTENTION : {len(sans_phase)} fiche(s) sans phase reconnue, "
              f"placees en fin de manifeste : {sans_phase}")


if __name__ == "__main__":
    main()
