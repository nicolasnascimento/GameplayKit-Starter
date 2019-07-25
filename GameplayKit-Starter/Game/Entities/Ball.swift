//
//  BasicBall.swift
//  GameplayKit-Starter
//
//  Created by Nicolas Nascimento on 25/07/19.
//  Copyright © 2019 Nicolas Nascimento. All rights reserved.
//

import GameplayKit

final class Ball: GKEntity {
    
    override init() {
        super.init()
        
        // Render
        let renderComponent = RenderComponent(node: SKNode())
        addComponent(renderComponent)
    
        // Sprite
        let spriteComponent = SpriteComponent(imageNamed: "ball")
        addComponent(spriteComponent)
        renderComponent.node.addChild(spriteComponent.spriteNode)
        
        // Scale
        let scaleComponent = ScaleComponent(node: renderComponent.node)
        addComponent(scaleComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
