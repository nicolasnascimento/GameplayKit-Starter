//
//  ViewController.swift
//  GameplayKit-Starter
//
//  Created by Nicolas Nascimento on 25/07/19.
//  Copyright © 2019 Nicolas Nascimento. All rights reserved.
//

import UIKit
import SpriteKit

final class ViewController: UIViewController {
    
    override func loadView() {
        view = SKView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let view = view as? SKView else { return }
        let scene = GameScene(size: view.bounds.size)
        scene.scaleMode = .aspectFit
        
        // Ensures the center of the screen is origin of the scene
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        view.presentScene(scene)
        
        // Creates a set of fake entities
        createFakeEntities(for: scene)
    }
}

extension ViewController {
    
    func createFakeEntities(for scene: GameScene) {
        
        let ball = Ball()
        scene.entityManager.add(entity: ball)
        
        let autoball = AutoBall(following: ball)
        scene.entityManager.add(entity: autoball)
    }
    
}

