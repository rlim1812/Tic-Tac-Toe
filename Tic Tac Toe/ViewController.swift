//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Ryan Lim on 7/14/16.
//  Copyright © 2016 Ryan Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 // 1 = 0's , 2 = X's
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8],[0, 3, 6],[1, 4, 7], [2, 5, 8], [0,4,8],[2,4,6]]
    var gameActive = true
    

    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject){
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
            gameState[sender.tag] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                activePlayer = 2
            } else if activePlayer == 2 {
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                activePlayer = 1
            }
        }
        for combination in winningCombinations {
            if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]){
                gameActive = false
                if gameState[combination[0]] == 1 {
                    gameOverLabel.text = "Player 1 won"
                } else if gameState[combination[0]] == 2 {
                    gameOverLabel.text = "Player 2 won"
                }
                endGame()
            }
        }
        
        if gameActive == true {
            gameActive = false
            for buttonState in gameState {
                if buttonState == 0 {
                    gameActive = true
                }
            }
            if gameActive == false {
                gameOverLabel.text = "It's a draw"
                endGame()
            }
        }
    }
    
    func endGame () {
        gameOverLabel.hidden = false
        playAgainButton.hidden = false
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)
        })

    }
    
    @IBAction func playAgainButton(sender: AnyObject) {
        gameActive = true
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        var buttonToClear : UIButton
        
        for var i = 0; i < 9; i++ {
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

