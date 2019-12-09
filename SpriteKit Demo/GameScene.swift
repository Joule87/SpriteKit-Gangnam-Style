//
//  GameScene.swift
//  SpriteKit Demo
//
//  Created by Julio Collado on 12/8/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let gangnamSpriteNode = SKSpriteNode(imageNamed: "win_1")
    var gangnamFrames = [SKTexture]()
    
    override func didMove(to view: SKView) {
        gangnamSpriteNode.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(gangnamSpriteNode)
        
        let textureAtlas = SKTextureAtlas(named: "gangnam style frames")
        
        for index in 1..<textureAtlas.textureNames.count {
            let texturename = "win_" + "\(index)"
            gangnamFrames.append(textureAtlas.textureNamed(texturename))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = gangnamSpriteNode.action(forKey: "dance") {
            gangnamSpriteNode.removeAction(forKey: "dance")
        } else {
            gangnamSpriteNode.run(SKAction.repeatForever(SKAction.animate(with: gangnamFrames, timePerFrame: 0.1)), withKey: "dance")
        }
    }
}
