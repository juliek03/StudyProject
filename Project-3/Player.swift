//
//  Player.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

/// Creation of the Player class, which will allow players to create their team of 3 characters each and give them different names.
class Player {
    let name: String
    var characters: [Character] = [] /// Character's table 
    /// Initialization of the Player class.
    /// - Parameter name: player's name
    init(name: String) {
        self.name = name
    }
    
 /// Method where the Player can choose his 3 Characters to build his team.
    func addCharacter() {
            print("Choose 3 characters to build your best team !🦾"
            + "\n1. The Magician"
            + "\n2. The Knight"
            + "\n3. The Berserker"
            + "\n4. The Soldier"
            + "\n5. The Assassin"
            + "\n6. The Archer")
        
            if let choice = readLine() { /// The player chooses his 3 characters
                if choice == "1" || choice == "2" || choice == "3" || choice == "4" || choice == "5" || choice == "6" {
                  print("Enter your character's name")
                    if let name = readLine() { /// line 34 : The player indicates the names of his characters
                        var character: Character?
                        switch choice {
                        case "1" : character = Magician(name: name)
                        case "2" : character = Knight(name: name)
                        case "3" : character = Berseker(name: name)
                        case "4" : character = Soldier(name: name)
                        case "5" : character = Assassin(name: name)
                        case "6" : character = Archer(name: name)
                        default : print("You have to choose 3 characters")
                        }
                        characters.append(character!) /// to each selected player, he is added to his team.
                    }
                  ///si le player entre un nom de personnage il ne peut pas mettre le mm nom. Effectuer un tableau à part et dés que le joueur entre le nom il s'ajoute au tableau. Il faut aller vérifier dans ce tableau pour savoir si le nom existe déjà.
                } else {
                    /// If the player makes a mistake, it will be asked again to choose his character.
                    print("❌ Please try again ❌")
                    addCharacter()
                }
            }
        }
    
/// Method that allows not to select more than 3 characters.
    func isTeamFull() -> Bool {
        return characters.count == 3
    }
    
/// Method that allows to indicate that when the life points of all the characters are at 0 then the player has lost. Using the For loop to browse the characters array to see if the player's characters are alive, if so he can still play, if not he has lost.
    func hasLost() -> Bool {
        for character in characters {
            if !character.isDead() {
               return false
            }
        }
        return true
    }
    
/// A method of indicating a player's stats. Player statistics : player name, health point of characters, number of player turns, weapons used.
    func displayStats() {
        print(self.name)
        /// Browse the characters table of each player to display statistics
        for character in characters {
        print("\(character.name) - \(character.lifePoint) - \(character.weapon)")
    }
}
    
/// This method allows to display the characters of the team by indicating their name and their hit point. So that players can know the status of their character.
    func displayAliveTeam() {
        var i = 1
        for character in self.aliveCharaters() {
            print("\(i). \(character.name) - \(character.lifePoint)")
            i += 1
        }
    }

/// Method to display only living characters of the player's team.
func aliveCharaters() -> [Character] {
    var characterAlive: [Character] = []
    for character in characters {
        if !character.isDead() {
            characterAlive.append(character)
        }
    }
    return characterAlive
 }
}
