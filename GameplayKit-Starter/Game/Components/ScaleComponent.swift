//
//  ScaleComponent.swift
//  GameplayKit-Starter
//
//  Created by Nicolas Nascimento on 25/07/19.
//  Copyright © 2019 Nicolas Nascimento. All rights reserved.
//

import GameplayKit

final class ScaleComponent: GKComponent {
    
    var node: SKNode
    
    private(set) var scale: CGFloat
    
    init(node: SKNode) {
        self.node = node
        self.scale = min(node.xScale, node.yScale)
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scale(to scale: CGFloat, duration: TimeInterval = 0.0) {
        if duration <= 0.0 {
            node.setScale(scale)
            self.scale = scale
        } else {
            node.run(SKAction.scale(to: scale, duration: duration)) { [weak self] in
                self?.scale = scale
            }
        }
    }
    
}
