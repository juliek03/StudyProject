//
//  Player.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

//Creation of the Player class, which will allow players to create their team of 3 characters each and give them different names.

class Player {
    var name: String
    var characters: [Characters] = []
    init(name: String) {
        self.name = name
    }
    
 //Method where the Player can choose his 3 Characters.
    func addCharacter() {
            print("Choose 3 characters to build your best team !"
            + "\n1. The Magician"
            + "\n2. The Knight"
            + "\n3. The Berserker"
            + "\n4. The Soldier"
            + "\n5. The Assassin"
            + "\n6. The Archer")
            
            if let choice = readLine() {
                switch choice {
                case "1" : Magician.self
                case "2" : Knight.self
                case "3" : Berseker.self
                case "4" : Soldier.self
                case "5" : Assassin.self
                case "6" : Archer.self
                default : print("You have to choose 3 characters")
                }
            }
        }
    
//Method that allows not to select more than 3 characters.
    func isTeamFull() -> Bool {
        return characters.count == 1
    }
    
//Method that allows to indicate that when the life points of all the characters are at 0 then the player has lost.
    func hasLost() -> Bool {
        for character in characters {
            if !character.isDead() {
               return false
            }
        }
        return true
    } //Using the For loop to browse the characters array to see if the player's characters are alive, if so he can still play, if not he has lost.
    
//A method of indicating a player's stats.
    func displayStats() {
        //statistique des joueurs: Nom du joueur, PV des perso, nombre de tour joueur, les armes utilisées.
        print(self.name)
    }
    
//Method that allows the player to choose the character that will attack the opponent.
    func displayTeam() {
        var i = 1
        for character in characters {
            print("\(i). \(character.name)")
            i += 1
        }
    }
}
