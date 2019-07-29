//
//  GameScene.swift
//  GameplayKit-Starter
//
//  Created by Nicolas Nascimento on 25/07/19.
//  Copyright © 2019 Nicolas Nascimento. All rights reserved.
//

import SpriteKit
import GameplayKit

final class GameScene: SKScene {
    
    // The last known timestamp
    var lastTime: TimeInterval = 0.0
    
    // The element which manages entities in the architecture
    lazy var entityManager = EntityManager(scene: world)
    
    // The game state machine
    lazy var stateMachine = GKStateMachine(states: [GameRunningState(scene: self), GamePausedState(scene: self)])
    
    // The world node
    var world: SKNode = SKNode()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        addChild(world)
    }
    
    // Time-based update
    override func update(_ currentTime: TimeInterval) {
        
        // Update Entity Manager
        if lastTime != 0.0 { entityManager.update(with: currentTime - lastTime) }
        lastTime = currentTime
    }
    
    // MARK: - Touch
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let touch = touches.first,
            let node = nodes(at: touch.location(in: self)).first(where: { $0.entity != nil }) {
            if let scaleComponent = node.entity?.component(ofType: ScaleComponent.self) {
                if scaleComponent.scale == 1.0 {
                    scaleComponent.scale(to: 2.0, duration: 1.0)
                } else {
                    scaleComponent.scale(to: 1.0, duration: 1.0)
                }
            }
        } else {
            print(#function)
            stateMachine.enter(stateMachine.currentState is GameRunningState ? GamePausedState.self : GameRunningState.self)
        }
    }
}
