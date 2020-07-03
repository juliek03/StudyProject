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
    
    /// Initialization of the Game class
    /// - Parameters:
    ///   - damages: weapon's damages
    ///   - name: weapon's name
    init(damages: Int, name: String) {
        self.damages = damages
        self.name = name
    }
}

/// Creation of daughter classes that inherit from the mother class Game and her properties : damages and name
final class MagicStick: Weapon { //final : empêche à magicstick d'être la classe mère d'une autre classe
    init() {
        super.init(damages: 40, name: "Magic Stick")
    }
}

final class Sword: Weapon {
    init() {
        super.init(damages: 45, name: "Sword")
    }
}

class BigAx: Weapon {
    init() {
        super.init(damages: 50, name: "Big Ax")
    }
}

class Arch: Weapon {
    init() {
        super.init(damages: 30, name: "Arch")
    }
}

class Gun: Weapon {
    init() {
        super.init(damages: 40, name: "Gun")
    }
}

class DoubleKnife: Weapon {
    init() {
        super.init(damages: 35, name: "Double Knife")
    }
}
