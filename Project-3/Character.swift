//
//  Character.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

//MARK: Creation of the Characters class for Players to choose characters.

class Characters {
    var lifePoint: Int // Point of life of the character
    var name: String // Character's name chosen by the player
    var weapon: Weapon //Weapons attributed to the characters
    var charaList: CharaList
    
 //Initialisation des propriétés de la class Characters
    init(lifePoint: Int, name: String, weapon: Weapon, charaList: CharaList) {
        self.lifePoint = lifePoint
        self.name = name
        self.weapon = weapon
        self.charaList = charaList
        
 //le switch : pour être utilisé dans la class StartGame et lister les personnages disponibles pour le choix des personnages qui constitura la team.
        switch self.charaList {
        case .Magician:
            self.lifePoint = 100
            self.weapon = MagicWeapon()
        case .Knight:
            self.lifePoint = 110
            self.weapon = SwordWeapon()
        case .Berseker:
            self.lifePoint = 130
            self.weapon = BigAx()
        case .Soldier:
            self.lifePoint = 120
            self.weapon = GunWeapon()
        case .Assassin:
            self.lifePoint = 115
            self.weapon = DoubleKnife()
        case .Archer:
            self.lifePoint = 110
            self.weapon = ArchWeapon()
        }
    }
        
//the character awards extra points to his teammates when the player chooses to take care of his team.
    func heal(character: Characters) {
        character.lifePoint += 15
    }

//the character attacks using his weapon, which is associated with damage that will impact the opponent and take away health points.
    func attack(character: Characters) {
        character.lifePoint -= weapon.damages
    }

//If the character's life drops to 0 then he is dead and can no longer be used.
    func isDead() -> Bool {
        return lifePoint <= 0
    }
}

//MARK: Creation of the classes of the different characters that the players will be able to choose, with their own characters (Weapons, Names, Life Point).

class Magician: Characters {
    init(name: String, charaList: CharaList) {
        super.init(lifePoint: 100, name: name, weapon: MagicWeapon(), charaList: charaList)
    }
}

class Knight: Characters {
    init(name: String, charaList: CharaList) {
        super.init(lifePoint: 110, name: name, weapon: SwordWeapon(), charaList: charaList)
    }
}

class Berseker: Characters {
    init(name: String, charaList: CharaList) {
        super.init(lifePoint: 130, name: name, weapon: BigAx(), charaList: charaList)
    }
}

class Soldier: Characters {
    init(name: String, charaList: CharaList) {
        super.init(lifePoint: 120, name: name, weapon: GunWeapon(), charaList: charaList)
    }
}

class Assassin: Characters {
    init(name: String, charaList: CharaList) {
        super.init(lifePoint: 115, name: name, weapon: DoubleKnife(), charaList: charaList)
    }
}

class Archer: Characters {
    init(name: String, charaList: CharaList) {
        super.init(lifePoint: 110, name: name, weapon: ArchWeapon(), charaList: charaList)
    }
}

