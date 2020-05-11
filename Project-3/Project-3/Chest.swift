//
//  Chest.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

//Creation of the chest class so that it intervenes randomly in the game and can contain a weapon that can be used by the player and attributed to the character.

class Chest {
    static let getWeapon = [MagicWeapon(), SwordWeapon(), BigAx(), GunWeapon(), ArchWeapon(), DoubleKnife()]
   
    static func randomWeapon() -> Weapon {
        let randomChest = Int(arc4random_uniform(UInt32(getWeapon.count)))
        let weapon = getWeapon[randomChest]
        return weapon
    }
} 
