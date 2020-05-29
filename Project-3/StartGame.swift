//
//  StartGame.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

//Creation of the Game class for the course of the game: Game rules, choice of characters and player actions.
class Game {
    var player1: Player?
    var player2: Player?
    
//Game execution
    func newGame() {
        rulesGame()
        
        player1 = createPlayer()
        player2 = createPlayer()
    
        let round = playGame()
        displayStat(round: round)
    }
    
//Game rules
    func rulesGame() {
        print("Welcome to Fight Warrior 🥊! Build your team and choose only 3 characters. Players play turn by turn until the loser 👎! 👾Let the game start !👾")
    }
    
//Creation of each player's team.
    func createPlayer() -> Player? { //Asking to the player to enter his name
        print("Enter your name ✍️")
        guard let playerName = readLine() else {
            return nil
        }
        
        print("All right \(playerName)! 👌")
        let player = Player(name: playerName)
        
        while !player.isTeamFull() { //The player selects a character and gives it a name.
            player.addCharacter()
        }
        print("🎉 Well done! Your team is now ready !")
        return player
    }
    
//Le joueur choisi dans sa team, le personnage qui attaque et celui qui est attaqué. Le joueur peut uniquement choisir les personnages qui sont encore en vie.
    func chooseCharacter(player: Player) -> Characters {
        player.displayAliveTeam()
        
        if let choice = readLine() {
            if choice == "1" {
                return player.aliveCharaters()[0]
            } else if (choice == "2" && player.characters.count >= 2) {
                return player.aliveCharaters()[1]
            }
            else if (choice == "3" && player.characters.count == 3) {
                return player.aliveCharaters()[2]
            }
        }
        print("❌ Please, try again ❌")
        return chooseCharacter(player: player)
    }
  
//Players play turn by turn until the loser. This method indicates which player should play, he selects his character, then selects the opposing character who will suffer the attack or choose his own character to heal, and so on until the loser. with a Return of the number of turns.
    
    func playGame() -> Int {
        var currentPlayer = player1!
        var notPlaying = player2!
        var round = 0
        
        while !player1!.hasLost() && !player2!.hasLost() {
           print("🤼 Choose your character 🤼")
            let selectedCharacter = chooseCharacter(player: currentPlayer) //si attaque = joueur adverse si soigne = perso team
    
            print("Choose 1 to attack 🥊 and 2 to heal 🚑.")
            if let choice = readLine() {
                switch choice {
                case "1":
                    print("Select a character to attack")
                    let character = chooseCharacter(player: notPlaying)
                    selectedCharacter.attack(character: character)
                    print("‼️ The character \(selectedCharacter.name) attacked \(character.name) ‼️")
                default: //considers it to be choice 2 or any other choice if the players indicate a value other than 2.
                    print("Select a character to heal")
                    let character = chooseCharacter(player: currentPlayer)
                    selectedCharacter.heal(character: character)
                    print("‼️ The character \(selectedCharacter.name) healed \(character.name) ‼️")
                }
            }
            //in the game, a chest appears randomly.
            let weapon = Chest.randomWeapon()
            selectedCharacter.weapon = weapon
            print("🎁 Great! You found a chest with that new weapon: \(weapon.name)!")
            
            if currentPlayer === player1! {
                currentPlayer = player2!
                notPlaying = player1!
            } else {
                currentPlayer = player1!
                notPlaying = player2!
            }
            round += 1 //to count the number of round
        }
       return round
    }
    
//Methods indicating endgame statistics.
    func displayStat(round: Int) {
        print("You have completed \(round) round")
        player1?.displayStats()
        player2?.displayStats()
    }
//    Mettre le gagnant avec un print("le gagnant est XXX")
}
