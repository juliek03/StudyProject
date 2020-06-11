//
//  StartGame.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

/// Creation of the Game class for the course of the game: Game rules, choice of characters and player actions.
class Game {
    var player1: Player?
    var player2: Player?
    
/// Game execution
    func newGame() {
        rulesGame()
        
        player1 = createPlayer()
        player2 = createPlayer()
    
        let round = playGame()
        statistic(round: round)
    }
    
/// Game rules. Shows players how the game is played.
    func rulesGame() {
        print("Welcome to Fight Warrior 🥊! Build your team and choose only 3 characters. Players play turn by turn until the loser 👎! 👾Let the game start !👾")
    }
    
/// Creation of each player's team.
    func createPlayer() -> Player? { /// Asking to the player to enter his name
        print("Enter your name ✍️")
        guard let playerName = readLine() else {
            return nil
        }
        
        print("All right \(playerName)! 👌")
        let player = Player(name: playerName)
        
        while !player.isTeamFull() { /// imposes a limit of 3 people per team. And lets the player create his own team.
            player.addCharacter()
        }
        print("🎉 Well done! Your team is now ready !")
        return player
    }
    
/// The player chosen in his team, the character who attacks and the one who is attacked. He can only choose the characters that are still alive.
    func chooseCharacter(player: Player) -> Character {
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
  
/// Players play turn by turn until the loser. This method indicates which player should play, he selects his character, then selects the opposing character who will suffer the attack or choose his own character to heal, and so on until the loser. with a Return of the number of turns.
    func playGame() -> Int {
        var currentPlayer = player1!
        var notPlaying = player2!
        var round = 0
        
        while !player1!.hasLost() && !player2!.hasLost() {
           print("🤼 Choose your character 🤼")
            let selectedCharacter = chooseCharacter(player: currentPlayer)
/// The player has two choices: he can either attack an opponent or he can heal a character from his team.
            print("Choose 1 to attack 🥊 and 2 to heal 🚑.")
            if let choice = readLine() {
                switch choice {
                case "1":
                    print("Select a character to attack")
                    let character = chooseCharacter(player: notPlaying)
                    selectedCharacter.attack(character: character)
                    print("‼️ The character \(selectedCharacter.name) attacked \(character.name) ‼️")
                default: /// considers it to be choice 2 or any other choice if the players indicate a value other than 2.
                    print("Select a character to heal")
                    let character = chooseCharacter(player: currentPlayer)
                    selectedCharacter.heal(character: character)
                    print("‼️ The character \(selectedCharacter.name) healed \(character.name) ‼️")
                }
            }
            /// a chest may appear randomly in the game play
            if Chest.random() { /// random gives one chance out of 11 to make a chest appear in the game.
            let weapon = Chest.randomWeapon()
            selectedCharacter.weapon = weapon
            print("🎁 Great! You found a chest with that new weapon: \(weapon.name)!")
            }
    
            if currentPlayer === player1! { /// the loop allows players to take turns: if it's not player 1's turn, it's player 2's turn.
                currentPlayer = player2!
                notPlaying = player1!
            } else {
                currentPlayer = player1!
                notPlaying = player2!
            }
            round += 1 /// to count the number of round
        }
       return round
    }
    
/// Methods indicating endgame statistics.
    func statistic(round: Int) {
        print("You have completed \(round) round !")
        player1?.displayStats()
        player2?.displayStats()
        
        if player1!.hasLost() { /// send back a printout to find out which of the two players has won.
            print("🎊 And the winner is Player 2 🎊")
        } else {
            print("🎊 And the winner is Player 1 🎊")
        }
    }
}
