//
//  Weapon.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

//MARK: Création de la classe mère Arme. Elle permettra d'attribuer toutes ses propriétés et méthodes aux classes filles créée ci-dessous.

class Weapon {
    var damages: Int
    var name: String
    
    init(damages: Int, name: String) {
        self.damages = damages
        self.name = name
    }
}

//MARK: Création des classes filles soit les armes, chacune à sa propre classe, avec son nombre de dommages attribués et leurs noms.

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
