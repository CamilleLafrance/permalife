//
//  Data.swift
//  PermaLife
//
//  Created by apprenant77 on 01/02/2023.
//

import SwiftUI

// Page Boutique

let textStore: String = """
Nos graines, vendues par sachet de 3 grammes,
viennent de notre propre pépinière nichée au
pied du Jura. Nos variétés sont méticuleusement
choisies et labellisées Agriculture biologique.
"""

var vegetables = [
    Products(name: "Oignons", image: "SpringOnions", description: textSpringOnions, price: 3),
    Products(name: "Tomates", image: "Tomatoes", description: textTomatoes, price: 3),
    Products(name: "Aubergine", image: "Eggplant", description: textEggplant, price: 3),
    Products(name: "Petits pois", image: "GreenPeas", description: textGreenPeas, price: 3),
    Products(name: "Céleri", image: "Celery", description: textCelery, price: 3),
    Products(name: "Maïs", image: "Corn", description: textCorn, price: 3),
    Products(name: "Laitue", image: "Lettuce", description: textLettuce, price: 3),
    Products(name: "Poivrons", image: "Peppers", description: textPeppers, price: 3),
]

var accessories = [
    Products(name: "Arrosoir", image: "WateringCan", description: textWateringCan, price: 15),
    Products(name: "Rateau", image: "Rake", description: textRake, price: 15),
    Products(name: "Kit permaculture", image: "Kit", description: textKit, price: 100),
    Products(name: "Lampe", image: "Light", description: textLight, price: 15),
    Products(name: "Transplantoir", image: "Trowel", description: textTrowel, price: 15),
]

// Page détails légumes

let textTomatoes = """
La tomate — Solanum lycopersicum — fait partie
de la famille des Solanaceae et de la tribu
des Solaneae. Le genre Solanum comprend
plus de 1600 espèces connues.
"""

let textSpringOnions = """
L'oignon nouveau a des nutriments aux
multiples bénéfices : les glucides comme
les fibres, les vitamines comme la vitamine
C et les oligo-éléments comme le fer.
"""

let textEggplant = """
L'aubergine est une excellente source de
fibres alimentaires. Les fibres alimentaires
stimulent le bon fonctionnement du système
digestif et contrôlent le taux de cholestérol.
"""

let textGreenPeas = """
Le petit pois bouilli et le pois mange-tout cru
sont des sources de vitamine C. Celle-ci
contribue aussi à la santé des os, des
cartilages, des dents et des gencives.
"""

let textCelery = """
Le céleri est un diurétique naturel très efficace
pour éliminer les déchets et toxines qui peuvent
surcharger les reins et permet de détoxifier
l'organisme.
"""

let textLettuce = """
La laitue régule les fonctions digestives,
favorise la digestion et le transit.
"""

let textCorn = """
Riche en potassium le maïs favorise
l'élimination des toxines. Dans la lutte
contre les calculs, la goutte, les coliques
ou la cystite, rien ne l'égalise !
"""

let textPeppers = """
Le poivron et ses anti-oxydants limitent
les maladies cardiovasculaires et l'amas
du mauvais cholestérol dans les artères.
"""

// Page détails accessoires

let textTrowel = """
Cette petite truelle permet de transplanter,
planter, repiquer les fleurs et les végétaux
de petite taille, notamment dans les parterres,
les pots et les jardinières.
"""

let textRake = """
Ce petit râteau mesurant 28x9x5 cm vous
permettra de bien travailler votre sol, vos
jardinières et vos pots. Il vous suffira de
le laver après chaque utilisation.
"""

let textKit = """
Ce kit tout-en-un, aux dimensions raisonnables,
(50x50xH.10cm), s'adaptera à votre intérieur.
"""

let textLight = """
Offrant une lumière très proche de la lumière
naturelle, les LEDS ne chauffent pas et ont
une durée de vie extrêmement longue en plus
de ne pratiquement rien consommer. 
"""

let textWateringCan = """
Prenez soin de vos plantes en vous procurant
l’arrosoir adapté à vos besoins.
"""
