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

/// Creation of daughter classes that inherit from the mother class Game and her properties : damages and name. final: prevents daughter classes from being the mother class of another class
final class MagicStick: Weapon {
    init() {
        super.init(damages: 40, name: "Magic Stick")
    }
}

final class Sword: Weapon {
    init() {
        super.init(damages: 45, name: "Sword")
    }
}

final class BigAx: Weapon {
    init() {
        super.init(damages: 50, name: "Big Ax")
    }
}

final class Arch: Weapon {
    init() {
        super.init(damages: 30, name: "Arch")
    }
}

final class Gun: Weapon {
    init() {
        super.init(damages: 40, name: "Gun")
    }
}

final class DoubleKnife: Weapon {
    init() {
        super.init(damages: 35, name: "Double Knife")
    }
}
