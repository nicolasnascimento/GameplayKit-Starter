//
//  RunningState.swift
//  GameplayKit-Starter
//
//  Created by Nicolas Nascimento on 29/07/19.
//  Copyright © 2019 Nicolas Nascimento. All rights reserved.
//

import GameplayKit

final class GameRunningState: GKState {
    
    weak var scene: GameScene?
    
    init(scene: GameScene) {
        self.scene = scene
        super.init()
    }
    
    // MARK: - State Life cycle
    
    // Set any state-specific element
    override func didEnter(from previousState: GKState?) {
        scene?.world.isPaused = false
        print(self, #function)
    }
}
