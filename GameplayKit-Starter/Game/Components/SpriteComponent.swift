//
//  SpriteComponent.swift
//  GameplayKit-Starter
//
//  Created by Nicolas Nascimento on 25/07/19.
//  Copyright © 2019 Nicolas Nascimento. All rights reserved.
//

import GameplayKit

final class SpriteComponent: GKComponent {
    
    var spriteNode: SKSpriteNode
    
    init(imageNamed imageName: String) {
        spriteNode = SKSpriteNode(imageNamed: imageName)
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
