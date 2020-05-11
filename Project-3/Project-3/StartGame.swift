//
//  StartGame.swift
//  Project-3
//
//  Created by Neko on 01/05/2020.
//  Copyright © 2020 Neko. All rights reserved.
//

import Foundation

class Game {
    var player1: Player?
    var player2: Player?
    
    func newGame() {
        player1 = createPlayer()
        player2 = createPlayer()
        
        playGame()
        displayStat()
    }
    
    func createPlayer() -> Player { //création du joueur
       //demande au joueur d'entrer le nom du perso
        let playerName = "Magic"
        let player = Player(name: playerName)
                
        while !player.isTeamFull() {
            //le joueur sélectionne un joueur et lui donne un nom
            player.addCharacter(character: createCharacter())
        }
        return player
    }
    
    func createCharacter() -> Characters {
        let character = Magician(name: "Magic")
        return character //le joueur doit sélectionner un perso
    }
    
    func playGame() {
        while !player1!.hasLost() || !player2!.hasLost() {
            //les joueurs jouent au tour par tour jusqu'au perdant
        }
    }
    
    func displayStat() {
        //les stats du jeu
        player1?.displayStats()
        player2?.displayStats()
    }
}
//les joueurs ajoutent des personnages, check de la team si elle perd sinon c'est au tour du joueur 2
