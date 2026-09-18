// Glossaire des termes techniques et acronymes - annexe demandée par
// l'utilisateur (2026-09-17), à la fin du livret. Contenu authored
// directement ici (pas dérivé du JSON) : liste des acronymes/termes
// RÉELLEMENT employés dans le corpus des 48 fiches (vérifié par recherche
// dans fiches-typ/ avant rédaction, pas une liste générique de
// cybersécurité) - avec leur développement complet et une définition
// courte. Quelques acronymes rencontrés mais dont le développement exact
// restait incertain (ex : TAMT, TRD, croisés une seule fois sans être
// définis dans la fiche qui les cite) ont été volontairement exclus
// plutôt que deviner - voir CLAUDE.md du dépôt principal, règle générale
// contre l'invention de contenu non vérifié.
#import "config.typ": *

#let entrees-glossaire = (
  (terme: "ANSSI", def: "Agence nationale de la sécurité des systèmes d'information - autorité française de référence en cybersécurité, source principale du corpus de ce livret."),
  (terme: "API", def: "Application Programming Interface (interface de programmation) - point d'accès permettant à un logiciel d'en piloter un autre."),
  (terme: "BGP", def: "Border Gateway Protocol - protocole de routage utilisé entre grands réseaux (ex : redirection de trafic vers un service anti-DDoS)."),
  (terme: "CDN", def: "Content Delivery Network (réseau de diffusion de contenu) - infrastructure répartissant la charge d'un site web sur plusieurs serveurs."),
  (terme: "CDSE", def: "Club des directeurs de sécurité des entreprises - coauteur, avec l'ANSSI, du guide de référence sur la gestion de crise d'origine cyber."),
  (terme: "CERT", def: "Computer Emergency Response Team - équipe de réponse aux incidents de sécurité informatique (ex : CERT-FR, rattaché à l'ANSSI)."),
  (terme: "CNIL", def: "Commission nationale de l'informatique et des libertés - autorité française chargée de la protection des données personnelles, destinataire des notifications de violation de données."),
  (terme: "DDoS", def: "Distributed Denial of Service (déni de service distribué) - attaque visant à rendre un service indisponible en le submergeant de requêtes depuis de nombreuses sources."),
  (terme: "DIRANIM", def: "Directeur d'animation - pilote la cellule d'animation pendant un exercice de simulation de crise (voir fiche Organiser un exercice)."),
  (terme: "DIREX", def: "Directeur de l'exercice - responsable de la conception et du pilotage d'un exercice de simulation de crise, souvent le RSSI."),
  (terme: "DMIA", def: "Durée maximale d'interruption admissible - métrique de continuité d'activité : durée maximale pendant laquelle une activité peut être interrompue sans dommage inacceptable."),
  (terme: "DNS", def: "Domain Name System - système traduisant les noms de domaine en adresses IP ; cible ou vecteur fréquent d'attaques (déni de service, détournement)."),
  (terme: "DORA", def: "Digital Operational Resilience Act - règlement européen sur la résilience opérationnelle numérique des entités du secteur financier."),
  (terme: "DSI", def: "Direction (ou directeur) des systèmes d'information."),
  (terme: "E3R", def: "Endiguement - Éviction - Éradication - Reconstruction : séquence de remédiation définie dans ce livret pour reprendre durablement le contrôle du système d'information après une compromission majeure."),
  (terme: "EDR", def: "Endpoint Detection and Response - solution de détection et de réponse aux menaces installée sur les postes et serveurs."),
  (terme: "FACET", def: "Faits, Actions, Compassion, Engagement, Transparence - méthode de structuration d'un message de communication de crise."),
  (terme: "FAI", def: "Fournisseur d'accès à Internet."),
  (terme: "IoC", def: "Indicator of Compromise (marqueur/indicateur de compromission) - trace technique (fichier, adresse IP, empreinte...) révélant une activité malveillante."),
  (terme: "LDAP", def: "Lightweight Directory Access Protocol - protocole d'accès à un annuaire d'identités (ex : Active Directory)."),
  (terme: "MFA", def: "Multi-Factor Authentication (authentification multifacteur) - combinaison de plusieurs facteurs (mot de passe + code, biométrie...) pour authentifier un utilisateur."),
  (terme: "NIS2", def: "Directive européenne sur la sécurité des réseaux et des systèmes d'information (2ᵉ version) - fixe des obligations de cybersécurité pour certains secteurs critiques."),
  (terme: "OIV", def: "Opérateur d'importance vitale - organisation dont l'activité est indispensable à la survie de la Nation, soumise à des obligations de sécurité renforcées."),
  (terme: "OSE", def: "Opérateur de services essentiels - organisation fournissant un service essentiel au fonctionnement de l'économie ou de la société, au sens de la directive NIS."),
  (terme: "PAO", def: "Publication assistée par ordinateur - outils de mise en page utilisés notamment pour produire des communications de crise."),
  (terme: "PCA", def: "Plan de continuité d'activité - dispositif organisationnel et technique permettant à une organisation de maintenir ses activités essentielles pendant une crise."),
  (terme: "PDMA", def: "Perte de données maximale admissible - métrique de continuité d'activité : volume de données (mesuré en durée) qu'une organisation peut accepter de perdre lors d'un incident."),
  (terme: "PME", def: "Petite et moyenne entreprise."),
  (terme: "PRA", def: "Plan de reprise d'activité - volet technique du PCA, décrivant la remise en service des systèmes d'information après un sinistre."),
  (terme: "PRIS", def: "Prestataire de réponse aux incidents de sécurité - prestataire qualifié par l'ANSSI pour accompagner la remédiation d'un incident cyber."),
  (terme: "RDP", def: "Remote Desktop Protocol - protocole de prise en main à distance d'un poste ou serveur Windows."),
  (terme: "RDS", def: "Remote Desktop Services - services Windows de mise à disposition de bureaux/applications à distance."),
  (terme: "RETEX", def: "Retour d'expérience - phase (et document) de capitalisation des enseignements tirés d'une crise ou d'un exercice."),
  (terme: "RGPD", def: "Règlement général sur la protection des données - réglementation européenne encadrant le traitement des données personnelles."),
  (terme: "RH", def: "Ressources humaines."),
  (terme: "RSSI", def: "Responsable de la sécurité des systèmes d'information - rôle pivot de la cellule de crise, référent technique sur les enjeux cyber."),
  (terme: "SHA", def: "Secure Hash Algorithm - famille de fonctions de hachage cryptographique (ex : SHA-256), utilisée notamment pour garantir l'intégrité de preuves collectées."),
  (terme: "SI", def: "Système d'information - ensemble des ressources (matériels, logiciels, données, procédures) permettant de traiter l'information d'une organisation."),
  (terme: "SIREN", def: "Système d'identification du répertoire des entreprises - numéro d'identification unique d'une entreprise en France."),
  (terme: "SNMP", def: "Simple Network Management Protocol - protocole de supervision et d'administration des équipements réseau."),
  (terme: "SSH", def: "Secure Shell - protocole d'administration à distance chiffré, courant sur les serveurs et équipements réseau."),
  (terme: "SSI", def: "Sécurité des systèmes d'information - discipline visant à protéger la disponibilité, l'intégrité et la confidentialité des systèmes d'information."),
  (terme: "TLS", def: "Transport Layer Security - protocole de chiffrement des communications réseau (ex : HTTPS)."),
  (terme: "VDI", def: "Virtual Desktop Infrastructure - poste de travail virtualisé, hébergé et exécuté sur un serveur distant."),
  (terme: "VPN", def: "Virtual Private Network (réseau privé virtuel) - tunnel chiffré permettant un accès distant sécurisé à un réseau."),
)

#let glossaire() = {
  for e in entrees-glossaire {
    block(above: 0.5em, below: 0.5em)[
      #text(weight: "bold", fill: couleur-bordure-entete)[#e.terme]
      #h(4pt) — #h(4pt) #e.def
    ]
  }
}
