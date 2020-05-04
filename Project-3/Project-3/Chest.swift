//
//  Chest.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

//Création de la classe coffre de manière à ce qu'elle intervienne de manière aléatoire dans la partie de jeu et qu'elle puisse contenir une arme qui pourra être utilisée par le joueur et attribuée au personnage.

class Chest {
    let getWeapon = [MagicWeapon(), SwordWeapon(), BigAx(), GunWeapon(), ArchWeapon(), DoubleKnife()]
   
    func randomWeapon() {
        let randomChest = Int(arc4random_uniform(UInt32(getWeapon.count)))
        let weapon = getWeapon[randomChest]
    }
} 
