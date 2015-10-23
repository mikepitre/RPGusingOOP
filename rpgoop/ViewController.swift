//
//  ViewController.swift
//  rpgoop
//
//  Created by Mike Pitre on 10/22/15.
//  Copyright © 2015 Mike Pitre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHpLbl.text = "\(player.hp) HP"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
        }
        
         enemyImg.hidden = false
    }
    
    @IBAction func onChestPressed(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
        
    }
    
    @IBAction func attackPressed(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.hidden = false
        }
        
        if !enemy.isAlive {
            enemyImg.hidden = true
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
        }
    }
    
    


}

