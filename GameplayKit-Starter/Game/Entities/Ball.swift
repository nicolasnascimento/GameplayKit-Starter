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
        renderComponent.node.position.x += 100
    
        // Sprite
        let spriteComponent = SpriteComponent(imageNamed: "red-ball")
        addComponent(spriteComponent)
        renderComponent.node.addChild(spriteComponent.spriteNode)
        
        // Scale
        let scaleComponent = ScaleComponent(node: renderComponent.node)
        addComponent(scaleComponent)
        
        // Autonomous
        let agentComponent = GKAgent2D()
        addComponent(agentComponent)
        agentComponent.position = vector2(Float(renderComponent.node.position.x),
                                          Float(renderComponent.node.position.y))
        agentComponent.maxSpeed = 100
        agentComponent.mass = 0.01
        agentComponent.behavior = GKBehavior(goals: [GKGoal(toWander: 10)])
        agentComponent.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Ball: GKAgentDelegate {
    func agentWillUpdate(_ agent: GKAgent) {
        guard let agent = agent as? GKAgent2D, let node = component(ofType: RenderComponent.self)?.node, !node.isPaused else { return }
        agent.position = vector2(Float(node.position.x),
                                 Float(node.position.y))
        agent.rotation = Float(node.zRotation)
    }
    func agentDidUpdate(_ agent: GKAgent) {
        guard let agent = agent as? GKAgent2D, let node = component(ofType: RenderComponent.self)?.node, !node.isPaused else { return }
        node.position = CGPoint(x: Double(agent.position.x),
                                y: Double(agent.position.y))
        node.zRotation = CGFloat(agent.rotation)
    }
}
