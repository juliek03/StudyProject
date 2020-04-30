//
//  Player.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

//Création de la classe Player, celle-ci permettra aux joueurs de constituer leur équipe de 3 personnages chacun et de leur attribuer des noms différents.

class Player {
    var name: String
    var characters: [Character] = []
    init(name: String) {
        self.name = name
    }
    
    //Méthode où le Joueur peut choisir ses 3 Personnages
    func addCharacter(character: Character) {
        characters.append(character)
    }
    
    //Méthode qui permet de ne pas sélectionner plus de 3 personnages
    func isTeamFull() -> Bool {
        return characters.count == 3
    }
    
    //Méthode qui permet d'indiqué que lorsque les PV de tous les personnages sont à 0 alors le joueur a perdu
    func hasLost() -> Bool {
        for character in characters {
            if !character.isDead() {
               return false
            }
        }
        return true
    } //Utilisation de la boucle For afin de parcourir le tableau characters afin de savoir si les personnages du joueur sont en vie, si oui il peut encore jouer, sinon il a perdu.
}
