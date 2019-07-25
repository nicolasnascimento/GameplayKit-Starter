//
//  EntityManager.swift
//  Infinitium
//
//  Created by Nicolas Nascimento on 2/19/16.
//  Copyright © 2018 Nicolas Nascimento. All rights reserved.
//

import GameplayKit
import SpriteKit

protocol EntityManagerDelegate: class {
    func levelUp()
    func gameOver()
    func countPoint()
    func beginGame()
    func gameIsRunning() -> Bool
}

final class EntityManager {
    
    // The scene where entities will be drawn
    private weak var scene: SKScene?
    
    // The delegate for entity manager items
    weak var delegate: EntityManagerDelegate?
    
    // The entities from the game
    var entities: [GKEntity] = []
    
    /// Designed Initializer
    init(scene: SKScene,
         backgroundColor: SKColor = .black,
         backgroundKind: ParticleComponent.Kind? = nil) {
        
        self.scene = scene
        
        // Add scene entity
        let scene = Scene(scene: scene, backgroundColor: backgroundColor, backgroundKind: backgroundKind)
        add(entity: scene)
        scene.delegate = self
    }
    
    /// Make sure to give the opportunity for all objects to update
    func update(with delta: TimeInterval) {
        self.entities.forEach {
            $0.update(deltaTime: delta)
        }
    }
    
    // MARK: - CRUD
    
    // This will make sure that the entity will be added to both the gameplay part
    // and the visual part
    func add(entity: GKEntity) {
        // Gets the component that has the visual part
        if let node = entity.component(ofType: RenderComponent.self)?.node {
            scene?.addChild(node)
        }
        entities.append(entity)
    }
    /// This will make sure that the entity will removed from tha gameplay part
    /// and the visual part
    func remove(entity: GKEntity) {
        // Gets the component that has the visual part
        entity.component(ofType: RenderComponent.self)?.node.removeFromParent()
        entities.removeAll{ $0 == entity }
    }
    func removeAllEntities() {
        while let entity = entities.last { remove(entity: entity) }
    }
}

// MARK: - Shortcuts
extension EntityManager {
    var touchComponents: [TouchComponent] {
        return entities.compactMap{ $0.component(ofType: TouchComponent.self) }
    }
}

// MARK: - Scene Delegate
extension EntityManager: SceneDelegate {
    func scene(_ scene: Scene, boundsCrossedBy entity: GKEntity) {
        remove(entity: entity)
    }
}

