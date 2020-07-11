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
    static var uniqueNames: [String] = [] /// Unique character names
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
                
                    var character: Character?
                    switch choice {
                    case "1" : character = Magician(name: createUniqueName())
                    case "2" : character = Knight(name: createUniqueName())
                    case "3" : character = Berseker(name: createUniqueName())
                    case "4" : character = Soldier(name: createUniqueName())
                    case "5" : character = Assassin(name: createUniqueName())
                    case "6" : character = Archer(name: createUniqueName())
                    default : print("You have to choose 3 characters")
                    }
                    characters.append(character!) /// to each selected player, he is added to his team.
            } else {
                /// If the player makes a mistake, it will be asked again to choose his character.
                print("❌ Please try again ❌")
                addCharacter()
            }
        }
    }
    
 /// This method allows you to create a unique character name.
    func createUniqueName() -> String {
        print("Enter your character's name")
        var uniqueName = ""
        repeat {
            if let name = readLine() {
                if Player.uniqueNames.contains(name) {
                    print("⛔️ This name is already taken ! Please choose another one.")
                } else {
                    Player.uniqueNames.append(name)
                    uniqueName = name
                }
            }
        } while uniqueName == ""
        return uniqueName
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
