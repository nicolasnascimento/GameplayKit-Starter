//
//  AutoBall.swift
//  GameplayKit-Starter
//
//  Created by Nicolas Nascimento on 26/07/19.
//  Copyright © 2019 Nicolas Nascimento. All rights reserved.
//

import GameplayKit

final class AutoBall: GKEntity {
    
    init(following ball: Ball) {
        super.init()
        
        // Render
        let renderComponent = RenderComponent(node: SKNode())
        addComponent(renderComponent)
        
        // Sprite
        let spriteComponent = SpriteComponent(imageNamed: "blue-ball")
        addComponent(spriteComponent)
        renderComponent.node.addChild(spriteComponent.spriteNode)
        
        // Autonomous
        if let otherAgent = ball.component(ofType: GKAgent2D.self) {
            let agentComponent = GKAgent2D()
            addComponent(agentComponent)
            agentComponent.position = vector2(Float(renderComponent.node.position.x),
                                              Float(renderComponent.node.position.y))
            agentComponent.maxSpeed = 100
            agentComponent.mass = 0.01
            let wanderGoal = GKGoal(toWander: 20)
            let seekGoal = GKGoal(toSeekAgent: otherAgent)
            agentComponent.behavior = GKBehavior(goals: [wanderGoal, seekGoal], andWeights: [0.99, 0.01])
            agentComponent.delegate = self
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Agent Delegate
extension AutoBall: GKAgentDelegate {
    
    
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
