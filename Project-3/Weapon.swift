//
//  Weapon.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

/// Creation of the Weapon Mother Class. It will allow to assign all its properties and methods to the daughter classes created below.
class Weapon {
    var damages: Int
    var name: String
    
    /// Initialization of the properties of the Game class
    /// - Parameters:
    ///   - damages: weapon's damages
    ///   - name: weapon's name
    init(damages: Int, name: String) {
        self.damages = damages
        self.name = name
    }
}

/// Creation of daughter classes that inherit from the mother class Game and her properties : damages and name
class MagicWeapon: Weapon {
    init() {
        super.init(damages: 100, name: "Magic Stick")
    }
}

class SwordWeapon: Weapon {
    init() {
        super.init(damages: 100, name: "Sword")
    }
}

class BigAx: Weapon {
    init() {
        super.init(damages: 100, name: "Big Ax")
    }
}

class ArchWeapon: Weapon {
    init() {
        super.init(damages: 100, name: "Arch")
    }
}

class GunWeapon: Weapon {
    init() {
        super.init(damages: 100, name: "Gun")
    }
}

class DoubleKnife: Weapon {
    init() {
        super.init(damages: 100, name: "Double Knife")
    }
}
