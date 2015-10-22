//
//  Kimara.swift
//  rpgoop
//
//  Created by Mike Pitre on 10/22/15.
//  Copyright © 2015 Mike Pitre. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    let ImmuneMax = 15
    
    override var loot: [String] {
        return ["Tough Hide", "Kimara Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= ImmuneMax {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
        
    }
}