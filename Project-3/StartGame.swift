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
    
    func newGame() {
         rulesGame()
        
        player1 = createPlayer()
        player2 = createPlayer()
        
        playGame()
        displayStat()
    }
    
    //Creation of each player's team.
    func createPlayer() -> Player { //Asking to the player to enter the character's name
        let playerName = "Magic"
        let player = Player(name: playerName)
                
        while !player.isTeamFull() { //The player selects a character and gives it a name.
            player.addCharacter(character: createCharacter())
        }
        return player
    }
    
    //Game rules
    func rulesGame() {
        print("Welcome to Fight Warrior. Build your team and choose only 3 characters. Players play turn by turn until the loser! Let the game start!")
    }
    
    //The player must select a character
    func createCharacter() -> Characters {
        let character = Magician(name: "Magic")
        return character
    }
    
    func selectCharacter(player: Player) -> Characters {
        print("Choose your character")
        player.displayTeam()
        return player.characters[0]
    } //le joueur doit pouvoir choisir son perso pour attaquer l'adversaire.
    
    //Players play turn by turn until the loser.
    func playGame() {
        var currentPlayer = player1!
        var notPlaying = player2!
        
        while !player1!.hasLost() || !player2!.hasLost() {
           let selectedCharacter = selectCharacter(player: currentPlayer)
            let characterAttack = selectCharacter(player: notPlaying)
            
            selectedCharacter.attack(character: characterAttack) //ajouter une print pour indiquer quel perso a été attaqué
            
            if currentPlayer === player1! {
                currentPlayer = player2!
                notPlaying = player1!
            } else {
                currentPlayer = player1!
                notPlaying = player2!
            }
        }
    }//quel joueur de jouer, il sélectionne son character, et doit sélectionner le character adverse pour attaquer, ainsi de suite jusqu'au perdant. Return du nombre de tour.
    
    //Methods indicating endgame statistics.
    func displayStat() {
        player1?.displayStats()
        player2?.displayStats()
    }
}
