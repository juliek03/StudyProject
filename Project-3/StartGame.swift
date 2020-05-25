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
        print("Enter your name")
        guard let playerName = readLine() else {
            return nil
        }
        
        print("All right \(playerName)!")
        let player = Player(name: playerName)
        
        while !player.isTeamFull() { //The player selects a character and gives it a name.
            player.addCharacter()
        }
        print("🎉 Well done! Your team is now ready!")
        return player
    }
    
//le joueur doit pouvoir choisir son personnage pour attaquer l'adversaire. Mais pas celui qui est mort
    func attackCharacter(player: Player) -> Characters {
        print("Choose your character to fight")
        player.displayTeam()
        return player.characters[0]
    }
    
//Players play turn by turn until the loser. This method indicates which player should play, he selects his character, then selects the opposing character who will suffer the attack, and so on until the loser. with a Return of the number of turns.
    
    func playGame() {
        var currentPlayer = player1!
        var notPlaying = player2!
        
        while !player1!.hasLost() || !player2!.hasLost() {
           let selectedCharacter = attackCharacter(player: currentPlayer)
            let characterAttack = attackCharacter(player: notPlaying)
            
            selectedCharacter.attack(character: characterAttack) //add a printout to indicate which character has been attacked.
            
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
