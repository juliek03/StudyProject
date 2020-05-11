//
//  Weapon.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

//MARK: Creation of the Weapon Mother Class. It will allow to assign all its properties and methods to the daughter classes created below.

class Weapon {
    var damages: Int //point de dégâts de l'arme
    var name: String //nom de l'arme 
    
    init(damages: Int, name: String) {
        self.damages = damages
        self.name = name
    }
}

//MARK: Creation of the girl classes, i.e. the weapons, each with its own class, with the number of damages awarded and their names.

class MagicWeapon: Weapon {
    init() {
        super.init(damages: 10, name: "Magic Stick")
    }
}

class SwordWeapon: Weapon {
    init() {
        super.init(damages: 20, name: "Sword")
    }
}

class BigAx: Weapon {
    init() {
        super.init(damages: 25, name: "Big Ax")
    }
}

class ArchWeapon: Weapon {
    init() {
        super.init(damages: 15, name: "Arch")
    }
}

class GunWeapon: Weapon {
    init() {
        super.init(damages: 12, name: "Gun")
    }
}

class DoubleKnife: Weapon {
    init() {
        super.init(damages: 17, name: "Double Knife")
    }
}
