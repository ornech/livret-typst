// Avant-propos du livret - le SEUL endroit où vit le registre narratif
// (contexte, justification, doctrine : charte-redactionnelle.md §0). Jamais
// compressé dans un encart de fiche : une fiche renvoie ici par « Voir
// Avant-propos, §X » (charte §II.E).
//
// Numérotation : les numéros de section ("1." à "7.") et de sous-section
// ("3.2"...) sont écrits EN DUR dans les titres, pas produits par la
// numérotation automatique de Typst - c'est ce qui les rend citables depuis
// les fiches : réordonner une section ne doit jamais renuméroter en silence
// un renvoi déjà écrit ailleurs. Toute modification de cette numérotation est
// à signaler, pas à faire au passage.
//
// Page intégrée par main.typ (front-matter, avant le Sommaire) : même
// mécanisme d'état que Sommaire/Glossaire (etat-libelle-generique), donc pas
// de bande de phase active ni de validation en pied, et un vrai heading de
// niveau 1 posé par main.typ (titre-page-transversale) - ce fichier ne pose
// que les headings de niveau 2 (sections) et 3 (sous-sections).
#import "config.typ": *
#import "icons.typ"
#import "authoring.typ": dessiner-case, encart, ligne-justification

// --- éléments de mise en page propres à l'Avant-propos ------------------

// Bloc "exemple" : volontairement PAS un encart (note/attention/
// avertissement), pour ne pas brouiller la légende du §6.3 - les encarts
// sont réservés aux fiches, avec un sens fixe.
#let exemple(corps) = block(
  width: 100%, above: 0.9em, below: 0.9em,
  stroke: (left: 2pt + couleur-tab-inactif-texte),
  inset: (left: 9pt, y: 3pt),
)[
  #text(size: 8.5pt, weight: "bold", fill: couleur-texte-attenue)[EXEMPLE ILLUSTRATIF] \
  #corps
]

// Ligne de renvoi normatif en fin de section : petite, atténuée - pour que
// la maintenance retrouve d'où vient chaque affirmation, sans alourdir la
// lecture.
#let fondements(corps) = block(above: 0.9em, below: 0em)[
  #text(size: taille-source, fill: couleur-texte-attenue)[Fondements normatifs : #corps]
]

// Ligne "Dans le livret" d'un principe (§3) : où le principe devient règle.
#let dans-le-livret(corps) = block(above: 0.6em, below: 0em)[
  #text(weight: "bold", fill: couleur-bordure-entete)[Dans le livret.] #corps
]

// Source commentée (§7) : titre en gras, apport en dessous.
// `non-verifiee` : renseigné (texte de la réserve) pour une source citée par
// son nom et sa doctrine mais absente du dossier de documentation - le
// marquage figure sur la ligne de titre, pour qu'elle ne paraisse pas avoir
// la même autorité qu'une source consultée (voir l'introduction du §7).
#let source-commentee(titre, corps, non-verifiee: none) = block(above: 0.7em, below: 0.7em, breakable: false)[
  #text(weight: "bold")[#titre]
  #if non-verifiee != none [
    #text(size: 8.5pt, style: "italic", fill: couleur-texte-attenue)[ · #non-verifiee]
  ] \
  #corps
]

#let pastille-phase(slug) = box(fill: couleur-phase(slug), inset: (x: 3pt, y: 1pt), radius: 2pt)[
  #text(size: 7pt, weight: "bold", fill: white)[#abrege-phase(slug)]
]

// Tableau de lecture : filet sous l'en-tête, filets fins entre lignes -
// même sobriété que le reste du livret (pas de fond coloré).
#let tableau(..args) = block(above: 0.9em, below: 0.9em)[
  #set text(size: 9.5pt)
  // Une ligne de tableau ne se coupe jamais entre deux pages (une cellule de
  // légende scindée en deux est illisible) ; l'en-tête, lui, se répète.
  #set table.cell(breakable: false)
  #show table.cell.where(y: 0): set text(weight: "bold", fill: couleur-bordure-entete)
  #table(
    stroke: (x, y) => if y == 0 { (bottom: 0.8pt + couleur-bordure-entete) } else { (bottom: 0.4pt + couleur-tab-inactif-fond) },
    inset: (x: 5pt, y: 5pt),
    align: left + horizon,
    ..args
  )
]

// --- contenu ---------------------------------------------------------------

#let avant-propos() = [
  #set text(lang: "fr")
  // offset: 1 comme dans fiche() (authoring.typ) : `=` (sections) devient un
  // niveau 2 et `==` (sous-sections) un niveau 3, sous le niveau 1
  // "Avant-propos" posé par main.typ - c'est ce qui les imbrique dans les
  // signets du PDF au lieu de les mettre au même rang que le titre.
  #set heading(numbering: none, offset: 1)
  // Même rythme que le corps d'une fiche (voir fiche(), authoring.typ) : le
  // réglage de page (configurer-page) laisse 0.2em d'interligne, trop serré
  // pour de la prose continue.
  #set par(leading: 0.65em, spacing: espacement-paragraphe)
  #set list(spacing: 0.7em, indent: 0.6em)
  #show heading.where(level: 2): it => block(above: 1.35em, below: 0.6em, sticky: true)[
    #text(size: 13pt, weight: "bold")[#it.body]
    #v(-0.5em)
    #line(length: 100%, stroke: 0.6pt + couleur-tab-inactif-fond)
  ]
  #show heading.where(level: 3): it => block(above: 1.3em, below: 0.6em, sticky: true)[
    #text(size: taille-bloc-titre, weight: "bold", fill: couleur-bordure-entete)[#it.body]
    #v(0.35em)
  ]

  Cet avant-propos se lit à froid, en préparation ou en retour d'expérience — jamais pendant l'incident. Les fiches qui suivent sont écrites pour l'inverse : être lues à chaud, par quelqu'un qui n'a pas le temps de comprendre pourquoi elles sont faites ainsi. Ce « pourquoi » est donc réuni ici, une seule fois. Quand une fiche a besoin d'un principe général, elle n'en réexplique rien : elle renvoie à la section concernée, sous la forme « Voir Avant-propos, §X ».

  // ======================================================================
  = 1. Pourquoi ce livret

  Une crise d'origine cyber, au sens du guide de l'ANSSI et du CDSE, est la déstabilisation immédiate et majeure du fonctionnement courant d'une organisation — arrêt des activités, impossibilité de délivrer les services, pertes financières lourdes, perte d'intégrité majeure — causée par une ou plusieurs actions malveillantes sur ses services et ses outils numériques. C'est un événement que les processus habituels de l'organisation ne savent pas traiter.

  Le même guide en relève les spécificités, et chacune pèse sur la manière dont ce livret est construit. La double temporalité — des impacts immédiats, puis une remédiation qui peut s'étendre sur plusieurs semaines, voire plusieurs mois — impose des fiches pour le temps chaud et d'autres pour la durée. L'absence d'unicité de lieu, c'est-à-dire la propagation possible à d'autres organisations par l'interconnexion des systèmes, fait entrer des acteurs extérieurs dans la cellule. Enfin, une menace qui s'adapte aux mesures d'endiguement et une incertitude durable sur le périmètre de la compromission obligent à dire avec soin ce que l'on sait et ce que l'on ignore (§3 et §5).

  Pourquoi des fiches et des canevas, plutôt qu'un plan de gestion de crise classique ? Un plan décrit l'organisation cible, les responsabilités et les processus ; il est écrit pour être discuté et approuvé, et se consulte en général à froid, sous forme numérique — sur le système d'information que l'attaque a justement rendu indisponible. Il est nécessaire, et ce livret ne le remplace pas. Mais le guide de l'ANSSI le rappelle sans détour : on ne peut pas improviser des réponses en plein milieu d'une catastrophe, et la préparation, l'outillage et l'entraînement sont indispensables — pas seulement chez les experts cyber, mais de façon transverse, en associant directions métier, dirigeants et employés. Ce livret retient donc la forme la plus robuste : des fiches d'action que l'on peut imprimer, tenir en main, cocher au stylo et se transmettre de main en main. Le canevas manuscrit n'y est pas une version appauvrie du document : c'en est la forme de référence (§2.2 et §6.2).

  Deux documents normatifs du projet fixent respectivement la forme des fiches et la gouvernance qu'elles supposent : la *charte de rédaction* et le *cadrage de la cellule de crise*. Cet avant-propos les cite par leur numéro de section (« charte, §V », « cadrage, §III »).

  *Ce que le lecteur peut attendre du livret*

  - Un outil de cellule de crise : des séquences d'actions sous délai, des rôles et des autorités de décision nommés, des formules fixes pour consigner, rendre compte et signaler une incertitude.
  - Un cadre de préparation : rôles à désigner, suppléants, matériel à prépositionner, exercices à conduire — sans lesquels les fiches ne sont que du papier.
  - Une mémoire : ce que les référentiels de l'ANSSI et les retours d'expérience enseignent, ramené à ce que la cellule a à faire (§7).

  *Ce qu'il ne faut pas en attendre*

  - Un manuel de sécurité générale : hygiène informatique, durcissement et architecture sécurisée sont hors de son périmètre.
  - Un guide technique d'investigation ou de remédiation : le livret aide à décider et à piloter ; l'expertise reste celle de l'équipe de réponse à incident ou du prestataire.
  - Un substitut à l'entraînement : le guide de l'ANSSI recommande un exercice par an ou tous les deux ans, et rappelle que la gestion du stress et la prise de décision en situation complexe s'apprennent.
  - Une procédure pour chaque cas : face à un scénario non prévu, le chef de cellule tranche (cadrage, §III).

  Le livret suit le déroulé d'une crise en trois temps : avant la crise (Préparation), pendant (Qualification, Endiguement, Remédiation), après (RETEX). La bande de phase, dans la marge de chaque page, et les trois couleurs de la couverture rappellent ce découpage.

  #fondements[charte §0 ; cadrage §III (règle 3) ; ANSSI et CDSE, _Crise d'origine cyber_ ; ANSSI et CCA, _Organiser un exercice_.]

  // ======================================================================
  = 2. Deux facteurs de réalité qui façonnent chaque fiche

  Deux constats précèdent toute règle de rédaction. Ils expliquent la plupart des choix qui peuvent surprendre à la lecture d'une fiche : phrases courtes, cases à cocher, redites d'une fiche à l'autre, renvois par numéro de page plutôt que par lien.

  == 2.1 Des collaborateurs non entraînés, à tous les niveaux d'accréditation

  La cellule de crise ne se compose pas que de personnes formées. Dès que la crise dure, elle associe matériellement des collaborateurs qui n'ont jamais pratiqué la gestion de crise : des suppléants qui n'ont jamais tenu le rôle, des collaborateurs sans activité mobilisés en renfort — le guide de l'ANSSI l'envisage expressément —, des interlocuteurs extérieurs (ARS, SAMU, pompiers, assureur, ANSSI) qui entrent en cellule sans en connaître ni les codes ni le vocabulaire. Le témoignage de Bouygues Construction, dans ce même guide, fait état de plusieurs centaines de personnes impliquées directement dans la résolution de l'incident : à cette échelle, personne ne peut supposer que tout le monde a été formé.

  Ces personnes ne partagent ni les mêmes niveaux d'habilitation, ni le même droit d'en connaître, ni les mêmes responsabilités. Le livret ne peut donc rien présupposer : ni que chacun a lu les fiches à l'avance, ni que chacun peut tout décider, ni même que chacun comprend le vocabulaire de l'autre.

  Trois conséquences pratiques en découlent. Chaque fiche opérationnelle doit se comprendre seule, sans contexte préalable, et porter sa propre légende minimale : on ne renvoie pas un lecteur pressé vers un glossaire (cadrage, §VII, règle 4). Ce sont des rôles, jamais des personnes, qui décident et exécutent : une fonction reste tenue quel que soit son titulaire (cadrage, §III, règle 1). Enfin, une règle de repli protège le non-habilité comme la cellule : en cas de doute, consigner et transmettre, ne jamais agir seul (cadrage, §VII, règle 3).

  == 2.2 Le scénario le plus défavorable est la base de conception

  Le livret est conçu pour le cas où le téléphone, l'informatique, voire l'électricité sont hors service. Ce n'est pas une hypothèse d'école : une attaque peut atteindre précisément les systèmes sur lesquels la cellule s'appuierait pour se coordonner, et le guide de l'ANSSI définit lui-même la résilience comme la capacité de maintenir les activités critiques « éventuellement en mode dégradé, voire sans services et outils numériques disponibles ». Le témoignage de l'Hôpital Nord-Ouest de Villefranche-sur-Saône est plus concret encore : après avoir coupé les systèmes pour stopper la propagation, « les médecins ont dû reprendre un mode de gestion totalement papier pour assurer le suivi des patients ».

  Concevoir pour le pire évite en outre de concevoir deux outils : ce qui fonctionne sans électricité fonctionne avec, l'inverse n'est pas vrai. Le retour au papier est donc la norme envisagée, non un scénario exceptionnel (cadrage, §IX, règle 1). Un exemple de rapport d'exercice fictif, dans le guide de l'ANSSI sur l'organisation d'exercices, le montre a contrario : les procédures dégradées ne couvraient pas toute la gestion de crise — pas de messagerie de secours, annuaires papier non tenus à jour — et il était difficile de joindre l'ensemble des salariés.

  Ce choix a des conséquences concrètes, qui sont autant de règles :

  - le canevas manuscrit est la forme de référence de la fiche (charte, §V) : écriture en capitales, cases assez grandes pour être cochées au stylo (cadrage, §IX, règle 3) ;
  - le matériel de crise est prépositionné : fiches vierges imprimées, stylos, photocopieur, horloge murale de référence locale (règle 2) ;
  - un agent de liaison assure la transmission si les canaux numériques sont hors service, et le délai de transmission physique s'intègre au calcul du H+X (règle 4) ;
  - un lieu de repli est désigné à l'avance, utilisable sans électricité ni réseau (règle 5) ;
  - la charte de rédaction a elle-même un mode dégradé : sous coupure totale, seuls trois impératifs subsistent — l'horodatage systématique, l'action à l'infinitif et la formule d'absence horodatée (règle 6).

  Le PDF que le lecteur tient en main obéit à la même logique : un renvoi vers une autre fiche y porte son numéro de page, pas seulement un lien cliquable, pour que celui qui feuillette du papier s'y retrouve.

  #fondements[cadrage §IX, §III (règle 1), §VII (règles 3 et 4) ; charte §V ; ANSSI et CDSE, _Crise d'origine cyber_, fiches 2 et 10.]

  // ======================================================================
  = 3. Les cinq principes de vigilance opérationnelle

  Les cinq principes qui suivent viennent de Karl Weick et Kathleen Sutcliffe (_Managing the Unexpected_). Ces auteurs ont étudié des organisations dites à haute fiabilité — équipages de porte-avions, contrôle du trafic aérien, centrales nucléaires, par exemple — où une erreur peut être catastrophique et qui se trompent pourtant rarement. Leur constat : la fiabilité ne vient pas de l'absence de surprises, mais de la façon dont l'organisation les cherche, les interprète et les absorbe. Les trois premiers principes portent sur l'anticipation — repérer tôt ce qui va mal ; les deux derniers sur le rétablissement — contenir ce qui a mal tourné et continuer.

  Ces principes ne remplacent pas le format de la charte : ils en encadrent l'usage. La charte comprime — verbes à l'infinitif, phrases courtes, cases à cocher — parce que le temps manque. Cette compression a un coût : une case cochée donne le sentiment d'en avoir fini. Les principes disent ce que la case ne dit pas.

  == 3.1 Préoccupation pour l'échec

  Tout écart, même minime, est traité comme le signal possible d'une défaillance du système et non comme un accident isolé ; on s'intéresse davantage aux ratés et aux signaux faibles qu'aux succès apparents.

  #exemple[
    À 0310, le SOC signale qu'un compte administrateur s'est connecté depuis un poste inhabituel. Rien d'autre n'est constaté ; l'alerte est classée « faux positif probable ». À 0600, la main courante porte « RAS ». Ce RAS ne dit qu'une chose : aucune alerte des sources surveillées depuis 0310. Il ne dit ni que la connexion était légitime, ni que l'attaquant s'est retiré — le guide de l'ANSSI rappelle qu'une menace peut s'adapter aux mesures d'endiguement. Le bon réflexe est de consigner l'alerte avec le statut « Non confirmé », pas de la classer.
  ]

  #dans-le-livret[Le RAS a une portée exacte : jamais « incident écarté », jamais « SI sain » (charte, §III). La sortie de crise repose sur un retour au nominal constaté et étayé, jamais sur un sentiment d'accalmie (cadrage, §XI, règle 1).]

  == 3.2 Réticence à simplifier

  Une situation complexe appelle rarement une explication unique. La cellule résiste à la tentation de retenir la première hypothèse qui satisfait, et garde les hypothèses concurrentes ouvertes tant qu'aucune n'est vérifiée.

  #exemple[
    Une note de rançon s'affiche sur des postes. L'explication immédiate — un rançongiciel, donc restaurer les sauvegardes — est aussi la plus rassurante, car elle s'accompagne d'une procédure. Elle laisse de côté ce que le chiffrement peut masquer : une exfiltration de données préalable, une présence persistante de l'attaquant ailleurs dans le SI. Si l'hypothèse d'exfiltration est écartée trop vite, une obligation de notification à la CNIL peut passer inaperçue, sans que personne ne l'ait décidé.
  ]

  #dans-le-livret[Une hypothèse ne se clôt que sur une vérification, et son motif est consigné : « Hypothèse \[X\] écartée. Motif : \[Y\]. » Tant qu'elle n'est pas vérifiée : « Hypothèse : \[X\]. À valider. » (charte, §II.G ; voir §5.1).]

  == 3.3 Sensibilité aux opérations

  La carte n'est pas le terrain : ce que prévoit la procédure et ce qui se passe réellement en première ligne diffèrent, et c'est en première ligne qu'on le voit d'abord.

  #exemple[
    Une fiche prescrit d'isoler un segment réseau à H+30. Sur place, le technicien constate que ce segment porte aussi la téléphonie interne et le contrôle d'accès des locaux : l'isoler priverait la cellule de ses propres moyens. La fiche ne pouvait pas le savoir. Ce qui compte, c'est que l'information remonte avant l'exécution de l'ordre, pas après.
  ]

  #dans-le-livret[Le guide de l'ANSSI demande un contact permanent avec les équipes opérationnelles cyber et IT dès la mobilisation de la cellule. Les contingences « Si… → » de chaque fiche prévoient l'écart connu ; le chef de cellule tranche l'écart imprévu (cadrage, §III, règle 3) ; la main courante et le RETEX capitalisent l'écart entre le prescrit et le réel.]

  == 3.4 Engagement envers la résilience

  Une cellule ne se juge pas seulement à ce qu'elle évite, mais à ce qu'elle encaisse : sa capacité à absorber un choc et à continuer de fonctionner malgré l'erreur déjà commise.

  #exemple[
    Pendant l'endiguement, un administrateur épuisé redémarre un serveur compromis avant que sa mémoire ait été capturée : une preuve volatile est perdue. La cellule peut consacrer son énergie à chercher qui a fait quoi. Elle peut aussi consigner l'erreur à l'heure où elle est constatée, recenser les sources restantes — journaux des équipements réseau, sauvegardes, autres serveurs — et poursuivre. C'est la seconde attitude que le livret cherche à rendre possible.
  ]

  #dans-le-livret[Un suppléant est désigné pour chaque rôle, avec la même autorité (cadrage, §X). Le mode dégradé est prévu (§2.2). Le roulement des équipes est anticipé, comme le guide de l'ANSSI y invite pour une crise qui peut durer des semaines. Et le RETEX est non punitif (§4) : sans lui, personne n'ose déclarer l'erreur dont la cellule doit tirer parti.]

  == 3.5 Déférence à l'expertise

  En situation critique, la décision va vers celui qui a la compétence la plus pertinente pour le problème précis, pas automatiquement vers le rang le plus élevé.

  #exemple[
    En pleine nuit, le référent technique estime qu'il faut couper un segment qui porte un service critique. Le coordinateur, sous la pression des métiers, hésite. La matrice de décision place la décision de couper chez le référent technique ; le coordinateur est consulté lorsque l'impact métier est majeur : il pèse cet impact, il ne se substitue pas à l'appréciation technique.
  ]

  #dans-le-livret[Ce principe est appliqué à froid, non improvisé à chaud : la matrice D/C/I/E du cadrage (§III) désigne, pour chaque décision, qui décide, qui est consulté, qui est informé, qui exécute. Elle borne aussi le principe : aucune décision majeure ne se prend sur la seule initiative d'un rôle d'exécution, quelle que soit l'urgence perçue. Quand deux compétences s'opposent ou qu'un cas n'est pas prévu, le chef de cellule est l'arbitre unique. Quant au collaborateur non habilité qui détient une information pertinente, il n'agit pas seul : il la consigne et la transmet (§2.1) — son expertise est entendue, elle n'est pas exercée en solitaire.]

  #fondements[cadrage §XII, §III, §X, §XI ; charte §II.G, §III ; Weick et Sutcliffe.]

  // ======================================================================
  = 4. Pourquoi un RETEX non punitif

  *Deux documents, deux publics.* La main courante est le journal chronologique de la cellule. Un seul scribe la tient — l'Historien —, elle est unique et centralisée par cellule, et chaque entrée y est horodatée, même un RAS (cadrage, §VI). Elle est nominative : elle dit qui a constaté, décidé ou fait quoi, et à quelle heure. Ses destinataires sont ceux qui ont besoin de cette exactitude : les assureurs et les autorités judiciaires (cadrage, §VI, règle 4) ; le guide de l'ANSSI en fait aussi l'outil de suivi des actions et des frais engagés. Le RETEX est le retour d'expérience engagé à la clôture de la crise (cadrage, §XI, règle 2). Le support diffusé aux employés remplace les noms par les rôles — « l'opérateur », « le scribe ».

  *Pourquoi ne pas n'en faire qu'un seul ?* Parce que ces deux documents servent des fins opposées. La main courante est une trace probante : elle vaut par sa précision, donc par les noms. Le RETEX est un outil d'apprentissage collectif : il vaut par la sincérité de ceux qui parlent. Or un compte rendu qui nomme, diffusé à tous les employés, transforme le débrief en procès. Chacun se défend, minimise ce qu'il a fait ou se tait — et l'organisation perd exactement l'information dont elle a besoin. La préoccupation pour l'échec (§3.1) suppose que les erreurs et les signaux faibles soient déclarés ; l'engagement envers la résilience (§3.4), que l'erreur commise ne soit pas une faute à cacher.

  Le cadrage le formule ainsi : orienter le débrief sur le déroulé des faits et sur les causes systémiques plutôt que sur les personnes. Ce n'est pas de la complaisance. Dans une cellule où siègent des collaborateurs non entraînés (§2.1), une erreur à 0300 est bien plus souvent le symptôme d'un manque de préparation — fiche absente, exercice jamais fait, chaîne d'alerte incomplète — que d'une défaillance individuelle. Corriger la personne ne corrige pas le manque. L'ANSSI ne dit pas autre chose : le RETEX ne doit pas être considéré comme un audit mais comme une action de capitalisation, et les exercices n'ont pas vocation à « sanctionner » ou à « contrôler », mais à élever le niveau de compétences de ceux qui s'entraînent.

  *Ce que la séparation protège.* La parole de ceux qui témoignent. Les employés eux-mêmes, exposés dans une crise qu'ils n'ont pas choisie. La qualité du diagnostic, qui porte alors sur des causes que l'on peut corriger. Et la diffusion du RETEX : il peut être partagé largement — le guide de l'ANSSI sur la communication de crise consacre une fiche à partager son expérience et à sensibiliser les collaborateurs — précisément parce qu'il n'expose personne.

  *Ce qu'elle ne sacrifie pas.* Aucune information n'est perdue. L'anonymisation change les étiquettes d'un document dérivé, elle ne supprime aucun fait : la main courante nominative reste disponible, à part, pour son propre public. « Non punitif » qualifie donc la finalité du RETEX — apprendre —, pas le statut de la main courante, qui demeure la trace exacte de ce qui s'est passé. Les suites disciplinaires ou judiciaires éventuelles relèvent d'autres procédures, dont le RETEX n'est pas le support.

  #fondements[cadrage §VI, §XI ; ANSSI et CDSE, _Crise d'origine cyber_, fiche 18 ; ANSSI et CCA.]

  // ======================================================================
  = 5. Le vocabulaire, et pourquoi il est fermé

  Un livret utilisé par des personnes qui ne se connaissent pas, sous stress, parfois de nuit, tolère mal l'ambiguïté. Son vocabulaire est donc fermé : un terme désigne un concept et un concept n'a qu'un terme (charte, §I, règle 10) ; tout terme mnémotechnique nouveau est soumis à un test de collision avec le vocabulaire du client et les normes applicables — NIS 2, DORA, ISO 22301 — et abandonné en cas de conflit (règle 9) ; un système ou un actif est toujours désigné par sa référence externe stable — schéma réseau, CMDB, inventaire —, sans synonyme improvisé, même par commodité, même sous stress (cadrage, §VIII, règle 8). Trois choix méritent d'être justifiés.

  == 5.1 Pourquoi le conditionnel grammatical est banni

  Dans un ordre ou dans un compte rendu, le conditionnel ne porte aucune information de statut. « Il faudrait isoler le segment » : est-ce un ordre, un conseil, une possibilité ? « Cela pourrait être du phishing » : est-ce l'hypothèse principale ou une parmi dix ? « Il semblerait que » : quel est, au juste, le degré de certitude de celui qui écrit ? Le lecteur d'une main courante à la relève de 0600, le suppléant qui prend le rôle, le collaborateur non entraîné qui lit un ordre au conditionnel comme une option : tous devinent, et ils ne devinent pas tous pareil. À cela s'ajoute la contrainte réglementaire : selon qu'un fait est établi ou seulement suspecté, l'obligation change — notification à la CNIL sous 72h si l'exfiltration est confirmée (art. 33 du RGPD) ; la même distinction compte sous NIS 2.

  Le livret remplace donc le conditionnel par un lexique fermé de cinq statuts, où l'incertitude est dite et non suggérée :

  #tableau(
    columns: (3.4cm, 5.6cm, 1fr),
    table.header([Statut], [Tournure imposée], [Exemple]),
    [Fait établi], [Indicatif simple], [« Segment 3 compromis. »],
    [Fait probable, non vérifié], [« \[Fait\]. Non confirmé. »], [« Exfiltration de données. Non confirmé. »],
    [Hypothèse à instruire], [« Hypothèse : \[X\]. À valider. »], [« Hypothèse : vecteur = phishing. À valider. »],
    [Hypothèse écartée], [« Hypothèse \[X\] écartée. Motif : \[Y\]. »], [« Hypothèse ransomware écartée. Motif : absence de note de rançon. »],
    [Risque réglementaire conditionné à un fait], [« Si \[fait confirmé\] → \[obligation\]. »], [« Si exfiltration confirmée → notification CNIL sous 72h (Art. 33 RGPD). »],
  )

  Toute incertitude apparaît ainsi explicitement, jamais par une tournure de politesse. La contrainte se contrôle mécaniquement : les formes interdites se cherchent par simple recherche de texte (charte, §VI). Le bannissement vaut pour le registre opérationnel (§6.1) ; dans les fiches de référence et dans cet avant-propos, le conditionnel informatif reste admis, car il n'y prescrit aucune action et n'y masque aucun statut de fait.

  == 5.2 SITREP : « compte rendu de situation », non « point de situation »

  Deux réalités distinctes sont en jeu, que le vocabulaire ne doit pas fondre. Le *point de situation* est l'échange périodique de la cellule : sa cadence est fixée dès l'activation et indexée sur le niveau de gravité déclaré — mineure, majeure, catastrophique —, non sur un ressenti (cadrage, §V, règles 1 et 2). Le *SITREP* (_situation report_) est le compte rendu produit à l'issue de chaque point de situation et diffusé en cellule. Sa remontée vers la Direction générale suit une cadence propre (règle 3), distincte de la précédente et pas systématiquement identique. Traduire SITREP par « point de situation » reviendrait à ne plus savoir si l'on réclame une réunion ou un document, ni de quelle cadence il s'agit.

  SITREP n'est pas un acronyme maison : c'est un terme standard de la doctrine militaire française, dont l'équivalent OTAN est « compte rendu de situation ». Il n'est donc pas soumis au test de collision.

  == 5.3 Pourquoi les acronymes maison restent internes

  Le livret définit deux mnémoniques : CIR (Consigner, Isoler, Rendre compte), séquence immédiate à chaque alerte, et CRP (Constater, Rapporter, Proposer), structure d'un point de situation (charte, §II.F). Ce sont des aides-mémoire pour la cellule. Ils cessent d'en être dès qu'ils franchissent la frontière de l'organisation : un acteur extérieur qui entre en cellule — ARS, SAMU, pompiers, assureur, ANSSI — ne les connaît pas, et un raccourci à l'intérieur devient une barrière à l'extérieur. Le cadrage impose donc un langage clair dès qu'un acteur externe est présent, sans code ni jargon propre à l'organisation (cadrage, §VIII, règle 6), et réserve les acronymes maison aux échanges strictement internes (règle 5). C'est la leçon de la doctrine ICS/NIMS, conçue pour la gestion multi-agences, et la recommandation du guide de l'ANSSI sur la communication de crise : éviter le jargon employé au sein de l'entité.

  #fondements[charte §I, §II.F, §II.G, §IV ; cadrage §V, §VIII ; ANSSI, communication de crise, fiche 6.]

  // ======================================================================
  = 6. Comment lire une fiche

  == 6.1 Trois registres, un test d'appartenance

  Le livret mêle ce qui se lit à chaud, sous contrainte de temps, et ce qui se lit à froid, pour préparer, comprendre ou justifier. Ces deux natures de contenu n'obéissent pas aux mêmes règles d'écriture : les confondre produit soit des fiches d'action noyées de justifications, soit des explications comprimées en une ligne illisible. D'où trois registres :

  - *Opérationnel.* La fiche répond à la question « je suis en crise, là, maintenant, qu'est-ce que je fais ? » : elle prescrit une séquence d'actions sous délai contraint. Écriture télégraphique, canevas complet (§6.2). Exemples : les fiches Qualification et Endiguement, _Notifier une violation de données (CNIL)_, _Reprendre le contrôle du système d'information_.
  - *Référence.* La fiche se consulte à froid mais reste un outil de travail structuré : rôles de la cellule, checklists de préparation, diagnostics de maturité, organisation d'un exercice. Phrases complètes, titres et listes, sans contrainte de longueur ; conditionnel informatif admis.
  - *Narratif.* Contexte, justification, doctrine : le présent avant-propos, et lui seul. Ce contenu n'est jamais comprimé dans un encart de fiche.

  Le type affiché en haut à droite d'une page (Fiche réflexe, Checklist, Diagnostic…) ne suffit pas à trancher : _Notifier une violation de données (CNIL)_ et _Organiser un exercice de simulation de crise cyber_ sont toutes deux des checklists, mais la première est opérationnelle et la seconde de référence. C'est le test, non l'étiquette, qui décide.

  Une fiche opérationnelle n'explique pas : elle renvoie. Trois formules, à ne pas confondre. « Voir Avant-propos, §X » mène à un principe général, une justification ou du contexte. « Voir Annexe X » et « Cf. fiche n°X » mènent à du contenu de référence — notamment réglementaire —, placé dans un bloc distinct du corps actionnable. Aucune des trois ne renvoie à une action.

  == 6.2 Deux formes du même canevas

  Toute fiche opérationnelle se décompose en blocs fonctionnels, chacun séparé et repérable dans le document (charte, §V). Neuf blocs sont toujours requis, dans cet ordre ; deux autres ne le sont que si la fiche consigne un fait daté.

  #tableau(
    columns: (3.3cm, 5.6cm, 1fr),
    table.header([Bloc], [Question à laquelle il répond], [Forme]),
    [Objet], [Que fait-on ?], [Verbe + complément, une phrase.],
    [Déclencheur], [Quand ?], [« Dès que \[condition\]. »],
    [Acteur], [Qui décide ou exécute ?], [Un rôle, jamais un nom.],
    [Délai], [Avant quand ?], [H+X, D+X, HHMM — champ visible et distinct.],
    [Situation \*], [Que sait-on de sûr ?], [Faits confirmés, à l'indicatif.],
    [Incertitudes \*], [Que ne sait-on pas ?], [Statut explicite (§5.1).],
    [Action], [Quoi, dans quel ordre ?], [Verbes à l'infinitif, cases à cocher.],
    [Contingences], [Et si… ?], [« Si \[cas\] → \[action\]. »],
    [Rendu de compte], [À qui, comment, quand ?], [À, Par, Quand.],
    [Règles / restrictions], [Qu'est-ce qui est interdit ou soumis à ordre ?], [« Ne pas… sans… » ; « Sur ordre de… ».],
    [Traçabilité], [Qui a rédigé, quand, quelle version, qui a validé ?], [Rédacteur, date, version, validateur.],
  )

  #text(size: 9pt, fill: couleur-texte-attenue)[\* Blocs conditionnels : requis pour une fiche de qualification, de diagnostic ou d'entrée de main courante ; absents d'une pure procédure écrite en amont (« Isoler un segment réseau »), sans que cela constitue un défaut.]

  Le champ ACTEUR porte le Décideur ou l'Exécutant de la matrice D/C/I/E. Les rôles Consulté et Informé n'y sont jamais empilés : le consulté apparaît dans ACTION (« Consulter \[rôle\] »), l'informé dans RENDU DE COMPTE (charte, §V).

  Ce canevas se rend de deux façons, dont aucune n'est une dégradation de l'autre :

  - *Le canevas manuscrit* est la forme de référence du mode dégradé (§2.2) : une fiche vierge imprimée à l'avance, remplie au stylo. Elle ne sait pas d'avance si elle servira à consigner un fait ; Situation et Incertitudes y restent donc imprimés, à remplir ou à marquer « Sans objet ».
  - *Le rendu typeset* — celui de ce PDF — sert tout usage numérique ou imprimé hors mode dégradé : mêmes blocs, rendus par les éléments de mise en page du gabarit (titres de section, cases à cocher, encarts) plutôt que copiés du canevas manuscrit.

  Ce qui fait la conformité d'une fiche, ce n'est pas sa ressemblance avec le canevas manuscrit, mais la présence de ses blocs et leur séparation repérable à la lecture.

  == 6.3 Légende des symboles

  Les repères ci-dessous sont ceux que le gabarit de ce PDF produit réellement. Cette légende est la référence complète, à lire à froid ; en crise, une fiche doit pouvoir se lire sans revenir ici (§2.1).

  #tableau(
    columns: (5.6cm, 1fr),
    table.header([Repère], [Signification]),
    [
      #pastille-phase("preparation") #pastille-phase("qualification") #pastille-phase("endiguement") #pastille-phase("remediation") #pastille-phase("retex")
    ],
    [*Bande de phase*, dans la marge extérieure de chaque page, et *pastilles* du sommaire et des fiches liées : phase de la fiche. La phase active est en couleur, les autres en gris clair. Trois couleurs, trois temps : gris ardoise pour l'avant-crise (PRÉPARATION), rouge pour la crise (QUALIFICATION, ENDIGUEMENT, REMÉDIATION), vert pour l'après-crise (RETEX).],

    [
      #box[#icons.pictogramme-categorie("losange", couleur: couleur-bordure-entete) #h(2mm) #text(weight: "bold", size: 9pt, fill: couleur-bordure-entete)[RUBRIQUE]] #h(1fr) #text(size: taille-meta, fill: couleur-texte-attenue)[Type de fiche · v0.1.0]
    ],
    [*En-tête* : à gauche, la rubrique de la fiche, précédée d'un pictogramme géométrique (losange, cercle, carré, triangle, croix ou étoile) qui n'est qu'un repère visuel ; à droite, le type de fiche et la version du livret.],

    [
      #block(fill: couleur-encart-danger-fond, inset: (x: 6pt, y: 3pt))[#text(fill: couleur-encart-danger-texte, weight: "bold", size: taille-validation)[#icones-encart.at("avertissement") Non validé — relecture non effectuée]]
    ],
    [*Fiche non validée* : aucun validateur n'est renseigné, la relecture n'a pas eu lieu. Une fiche validée porte, en pied de page, « Validé le » suivi de la date.],

    [
      #text(size: taille-entete-onglet, fill: couleur-texte-attenue)[Validé le AAAA-MM-JJ #h(1fr) n / N]
    ],
    [*Pied de page* : date de validation de la fiche affichée, et numéro de page sur nombre total de pages.],

    [
      #icons.pictogramme-priorite("obligatoire") #h(2pt) #icons.pictogramme-priorite("differable") #h(2pt) #icons.pictogramme-priorite("secondaire") #h(4pt) #text(weight: "bold")[\[RÔLE\]] 1.
    ],
    [*Priorité d'une action*, en tête de ligne : rond plein, action obligatoire (texte en gras) ; rond à moitié plein, action différable (texte normal) ; rond vide, action secondaire (texte en italique gris). Un chiffre numérote les actions d'un groupe ; un rôle entre crochets et en capitales désigne le rôle responsable.],

    [#dessiner-case],
    [*Case à cocher* : action à cocher au stylo une fois faite. Les actions à case n'ont pas de marque de priorité ; elles peuvent porter le rôle responsable entre crochets.],

    [
      #encart("note")[Note] #encart("attention")[Attention] #encart("avertissement")[Avertissement]
    ],
    [*Encarts* : la note (fond bleu clair) apporte une information complémentaire ; l'attention (fond jaune) signale un point de vigilance ; l'avertissement (fond noir, texte blanc) porte une interdiction ou une règle impérative. Un encart n'est jamais le lieu d'un développement doctrinal (§6.1).],

    [
      #ligne-justification[le pourquoi de l'action]
    ],
    [*Ligne « Objectif : … »*, en italique atténué, sous une action ou un encart : la raison de ce qui précède.],

    [
      #text(weight: "bold", size: taille-bloc-titre, fill: couleur-bordure-entete)[FICHES LIÉES] #h(6pt) #text(weight: "bold", size: taille-bloc-titre, fill: couleur-bordure-entete)[SOURCES] #linebreak() #box(fill: couleur-encart-attention-fond, inset: (x: 3pt, y: 1pt), radius: 2pt)[#text(weight: "bold", size: 8pt, fill: couleur-encart-attention-texte)[#icones-encart.at("avertissement") Non vérifiée]]
    ],
    [*Pied de fiche* (petit italique, en bas de la dernière page de la fiche) : FICHES LIÉES, avec la pastille de phase et le numéro de page de chaque fiche citée ; SOURCES, avec la page consultée et soit « Vérifié le … par … », soit la mention « Non vérifiée ».],
  )

  Notations d'usage courant dans les fiches :

  - *H+X, D+X, HHMM.* H+X et D+X sont des échéances relatives, comptées à partir de l'instant de départ que la fiche désigne (par exemple « départ = connaissance de la violation »). Sans suffixe, H+X est en minutes : « H+30 » se lit trente minutes après le départ. Toute échéance en heures porte le suffixe explicite : « H+72h », « 2 à 4h ». D+X se compte à partir du jour de départ et s'accompagne de l'heure : « D+1, 0600 ». HHMM est l'heure sur 24 h, sans séparateur : 0942.
  - *→* introduit, dans une contingence, l'action qui suit : « Si \[fait\] → \[action\] ».
  - *Formules d'absence*, toujours horodatées (charte, §III). RAS : aucune alerte des sources surveillées à ce jour — jamais « incident écarté », jamais « SI sain ». Inchangé : dernier état confirmé toujours valide. NA : information non recueillie, pas « information négative ». Sur ordre : action différée. Sans objet : pas de précision possible.
  - *Non confirmé, À valider* : statuts d'incertitude (§5.1).

  #fondements[charte §0, §I, §II.E, §III, §V ; cadrage §VII ; gabarit de production.]

  // ======================================================================
  = 7. Sources et doctrine

  Cette section n'est pas la bibliographie : la liste des documents cités fiche par fiche, avec leur page, figure en annexe. Elle dit ce que chaque source de doctrine apporte concrètement au livret.

  Toutes les sources ci-dessous ne reposent pas sur le même degré de vérification. *Consultées dans le dossier de documentation du projet :* les guides de l'ANSSI (_Crise d'origine cyber_ avec le CDSE, _Réflexes Cyber_, _Organiser un exercice_ avec le CCA, communication de crise, _Cyberattaques et remédiation_, _EBIOS Risk Manager_), le document d'aide de la CNIL et les fiches réflexes d'InterCERT France. *Citées par leur nom et leur doctrine, non vérifiées sur le texte lors de cette rédaction :* les RETEX hospitaliers (hors le témoignage de Villefranche-sur-Saône, repris du guide de l'ANSSI), Weick et Sutcliffe, la doctrine ICS/NIMS et les documents militaires et de sécurité civile (§7.4). Ce qui en est dit reprend l'attribution posée par la charte (§VIII) et le cadrage (§XIV), non une lecture du document ; il en va de même des passages des §3 et §5.3 qui s'y appuient. Elles portent la mention « non vérifiée sur le texte » et n'ont pas, ici, la même autorité que les précédentes.

  == 7.1 Doctrine de gestion de crise cyber

  #source-commentee[ANSSI et CDSE, _Crise d'origine cyber : les clés d'une gestion opérationnelle et stratégique_ (déc. 2021)][
    Le socle du livret : l'architecture à deux cellules — décisionnelle et opérationnelle —, le rythme des points de situation, les phases de crise et un registre opérationnel fait de verbes d'action. Ses témoignages (Bouygues Construction, Hôpital Nord-Ouest de Villefranche-sur-Saône, CMA CGM) ancrent chaque recommandation dans un cas réel.
  ]

  #source-commentee[ANSSI, _Réflexes Cyber — Mes premiers réflexes en cas d'incident cyber_][
    Le modèle de la cellule unique et des rôles en structure de taille réduite, d'où le profil A du cadrage. Il présente aussi une crise en quatre grandes phases, dont s'inspire le découpage du livret.
  ]

  == 7.2 Retours d'expérience

  #source-commentee(non-verifiee: "non vérifiée sur le texte, sauf le témoignage de Villefranche")[RETEX hospitaliers français (Dax 2021, Corbeil-Essonnes 2022, Villefranche-sur-Saône, Arles, Cannes 2024, Pontarlier)][
    Ils fondent trois choix du livret : la continuité en mode dégradé, avec la main courante papier comme norme (§2.2) ; l'ouverture de la cellule à des acteurs extérieurs (§2.1) ; le langage clair qui en découle (§5.3). La continuité des soins rend l'hypothèse d'un retour au papier immédiatement concrète.
  ]

  == 7.3 Facteurs humains et organisation

  #source-commentee(non-verifiee: "non vérifiée sur le texte")[Karl Weick et Kathleen Sutcliffe, _Managing the Unexpected_ (organisations à haute fiabilité)][
    Les cinq principes de vigilance (§3) : un vocabulaire pour ce qu'aucune procédure ne capture — la qualité d'attention d'une équipe — et le contrepoids nécessaire à la compression de la charte.
  ]

  #source-commentee(non-verifiee: "non vérifiée sur le texte")[Doctrine ICS/NIMS (États-Unis, gestion multi-agences)][
    Une terminologie commune et un langage clair dès que plusieurs organisations interviennent ensemble : le livret en tire la restriction des acronymes maison aux échanges internes (§5.3).
  ]

  == 7.4 Doctrine militaire et de sécurité civile

  Le livret emprunte aux armées et à la sécurité civile la forme de l'ordre et la discipline du compte rendu : leur problème — transmettre un ordre intelligible à des exécutants fatigués, par des canaux parfois dégradés — est celui de la cellule.

  #source-commentee(non-verifiee: "non vérifiée sur le texte")[Mémento Tactique GTIA 2023-2024 (Armée de terre)][
    Les règles de rédaction des ordres et les tournures prescriptives de la charte, ainsi que les formules du chef, l'arbitrage et la chaîne de commandement du cadrage : d'où le chef de cellule, arbitre unique, et le « Sur ordre de ».
  ]

  #source-commentee(non-verifiee: "non vérifiée sur le texte")[TTA 150 — Manuel d'instruction du trinôme][
    Le registre télégraphique, les acronymes et les phrases nominales du §I de la charte.
  ]

  #source-commentee(non-verifiee: "non vérifiée sur le texte")[RFT 3.2.1 — Précis de tactique générale (2022)][
    Les formules du chef et la logique des contingences, d'où la structure « Si… → ».
  ]

  #source-commentee(non-verifiee: "non vérifiée sur le texte")[Aide-mémoire du Cdt (Armée de terre)][
    Les formules d'absence (RAS, Inchangé, NA…) et l'horodatage systématique.
  ]

  #source-commentee(non-verifiee: "non vérifiée sur le texte")[Guide SDIS 70 — Exercice du commandement (2020)][
    La frontière entre pratique militaire et pratique civile, et les check-lists d'activation dont s'inspire le déclenchement de la cellule.
  ]

  == 7.5 Documentation de référence du corpus

  Les fiches s'appuient aussi sur d'autres documents, cités avec leur page dans le bloc SOURCES de chaque fiche et dans la Bibliographie : les _fiches réflexes_ d'InterCERT France (CC BY-NC-SA 4.0), trame des fiches Qualification et Endiguement ; le guide de communication de crise de l'ANSSI, pour les fiches de communication ; _Organiser un exercice de gestion de crise cyber_ (ANSSI et CCA, 2020), pour les exercices ; le document d'aide de la CNIL (2023), pour la notification de violation de données ; _Cyberattaques et remédiation_ (ANSSI), pour la remédiation et la séquence E3R ; _EBIOS Risk Manager_ et sa fiche méthode d'évaluation de la gravité, pour l'échelle de la grille de criticité.

  Deux documents internes du projet font autorité sur la forme et la gouvernance : la charte de rédaction et le cadrage de la cellule de crise.
]
