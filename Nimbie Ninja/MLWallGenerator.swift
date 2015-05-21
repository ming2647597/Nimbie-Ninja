//
//  MLWallGenerator.swift
//  Nimbie Ninja
//
//  Created by yang ming on 21/05/2015.
//  Copyright (c) 2015 Tomorrow. All rights reserved.
//

import Foundation
import SpriteKit

class MLWallGenerator: SKSpriteNode{
    
    var generationTimer: NSTimer?
    
    func startGeneratingWallsEvery(seconds:NSTimeInterval){
        generationTimer = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: "generateWall", userInfo: nil, repeats: true)
    }
    func generateWall(){
        var scale:CGFloat
        let rand = arc4random_uniform(2)
        if rand == 0{
            scale = -1.0
        }else{
            scale = 1.0
        }
        let wall = MLWall()
        wall.position.x = size.width/2 + wall.size.width/2
        wall.position.y = scale * (kMLGroundHeight/2 + wall.size.height/2)
        addChild(wall)
    }
}
