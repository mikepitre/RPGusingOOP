//
//  DevilWizard.swift
//  rpgoop
//
//  Created by Mike Pitre on 10/22/15.
//  Copyright © 2015 Mike Pitre. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
}