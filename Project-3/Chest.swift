//
//  Chest.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

///Creation of the chest class so that it intervenes randomly in the game and can contain a weapon that can be used by the player and attributed to the character.

class Chest {
/// getWeapon : is a table that stores the different weapons of the characters.
    static let getWeapon = [MagicWeapon(), SwordWeapon(), BigAx(), GunWeapon(), ArchWeapon(), DoubleKnife()]
/// func randomWeapon( ) : this method returns the Weapon class, to introduce a random weapon into the game.
    static func randomWeapon() -> Weapon {
        let randomChest = Int(arc4random_uniform(UInt32(getWeapon.count)))
        let weapon = getWeapon[randomChest]
        return weapon
    }
/// this function is different from randomWeapon( ), it allows you not to make a vault appear regularly at each turn of the game.
    static func random() -> Bool {
        let random = Int(arc4random_uniform(UInt32(10)))
        return (random) == 1
    }
}


