//
//  Character.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

/// Creation of the Characters class for Players to choose characters.
class Characters {
    var lifePoint: Int
    var name: String
    var weapon: Weapon
    
    /// Initialization of the properties of the Characters class
    /// - Parameters:
    ///   - lifePoint: Health point of the character
    ///   - name: Character's name chosen by the player
    ///   - weapon: Weapons attributed to the characters
    init(lifePoint: Int, name: String, weapon: Weapon) {
        self.lifePoint = lifePoint
        self.name = name
        self.weapon = weapon
    }
        
/// The character awards extra points to his teammates when the player chooses to take care of his team.
    func heal(character: Characters) {
        character.lifePoint += 15
    }

/// The character attacks using his weapon, which is associated with damage that will impact the opponent and take away health points.
    /// - Parameter character: Characters type (class Characters)
    func attack(character: Characters) {
        character.lifePoint -= weapon.damages
    }

/// If the character's life drops to 0 then he is dead and can no longer be used.
    func isDead() -> Bool {
        return lifePoint <= 0
    }
}

/// Creation of the classes of the different characters that the players will be able to choose, with their own characters (Weapons, Names, Life Point).
class Magician: Characters {
    init(name: String) {
        super.init(lifePoint: 100, name: name, weapon: MagicWeapon())
    }
}

class Knight: Characters {
    init(name: String) {
        super.init(lifePoint: 100, name: name, weapon: SwordWeapon())
    }
}

class Berseker: Characters {
    init(name: String) {
        super.init(lifePoint: 100, name: name, weapon: BigAx())
    }
}

class Soldier: Characters {
    init(name: String) {
        super.init(lifePoint: 100, name: name, weapon: GunWeapon())
    }
}

class Assassin: Characters {
    init(name: String) {
        super.init(lifePoint: 100, name: name, weapon: DoubleKnife())
    }
}

class Archer: Characters {
    init(name: String) {
        super.init(lifePoint: 100, name: name, weapon: ArchWeapon())
    }
}

