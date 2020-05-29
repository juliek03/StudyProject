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
    
        playGame()
        displayStat()
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
    func attackCharacter(player: Player) -> Characters {
        print("🤼 Choose your character to fight 🤼")
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
        return attackCharacter(player: player)
    }
  
//Cette méthode a le même principe que la func attackCharacter, celle-ci permet de choisir le personnage a soigner dans sa propre équipe. 
    func healCharacter(player: Player) -> Characters {
        print("🚑 Choose the character you want to treat in your team 🚑")
        player.displayAliveTeam()
        
        if let choice = readLine() {
            if choice == "1" {
                           return player.healMyTeam()[0]
                       } else if (choice == "2" && player.characters.count >= 2) {
                           return player.healMyTeam()[1]
                       }
                       else if (choice == "3" && player.characters.count == 3) {
                           return player.healMyTeam()[2]
                       }
                   }
                   print("❌ Please, try again ❌")
                   return healCharacter(player: player)
        }
    
    
//Players play turn by turn until the loser. This method indicates which player should play, he selects his character, then selects the opposing character who will suffer the attack, and so on until the loser. with a Return of the number of turns.
    
    func playGame() {
        var currentPlayer = player1!
        var notPlaying = player2!
        
        while !player1!.hasLost() && !player2!.hasLost() {
            let selectedCharacter = attackCharacter(player: currentPlayer) //si attaque = joueur adverse si soigne = perso team
            let characterAttack = attackCharacter(player: notPlaying)
            
            selectedCharacter.attack(character: characterAttack)
            print("‼️ The character \(selectedCharacter.name) attacked \(characterAttack.name) ‼️")
            
            if currentPlayer === player1! {
                currentPlayer = player2!
                notPlaying = player1!
            } else {
                currentPlayer = player1!
                notPlaying = player2!
            }
        }
    }
    
//Methods indicating endgame statistics.
    func displayStat() {
        player1?.displayStats()
        player2?.displayStats()
    }
}
