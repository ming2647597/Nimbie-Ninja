//
//  GameScene.swift
//  Nimbie Ninja
//
//  Created by yang ming on 18/05/2015.
//  Copyright (c) 2015 Tomorrow. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var movingGround:MLMovingGround!
    var hero:MLHero!
    var cloudGenrator:MLCloudGenerator!
    var wallGenerator: MLWallGenerator!
    
    var isStarted = false
    
    override func didMoveToView(view: SKView) {
        //backgroundColor = UIColor.blueColor()
        //ground of the screen 
        
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        
        
        //set up background for screen
        
        let backgroundTexture = SKTexture(imageNamed: "background.jpg")
        let backgroundImage = SKSpriteNode(texture: backgroundTexture, size: view.frame.size)
        backgroundImage.position = view.center
        addChild(backgroundImage)
        
        // add background
        //let ground = SKSpriteNode(color: UIColor.brownColor(), size: CGSize(width: view.frame.size.width, height: 70))
        //CGSizeMake(view.frame.size.width, 20)
        movingGround = MLMovingGround(size: CGSizeMake(view.frame.width,kMLGroundHeight))
        movingGround.position = CGPointMake(0, view.frame.size.height/2)
        addChild(movingGround)
        
        //add hero
        hero = MLHero()
        hero.position = CGPointMake(70, movingGround.position.y + movingGround.frame.size.height/2 + hero.frame.size.height/2)
        addChild(hero)
        hero.breath()
    
        //let ground = MLMovingGround(size: CGSizeMake(view.frame.width, 20))
        //ground.position = view.center
        //ground.position = CGPointMake(0, view.frame.size.height/2)
        //addChild(ground)
        
        //add cloud generator
        //cloudGenrator = MLCloudGenerator(color: UIColor.clearColor(), size: view.frame.size)
        //cloudGenrator.position = view.center
        //addChild(cloudGenrator)
        //cloudGenrator.populate(0)
        //cloudGenrator.startGeneratingWithSpawnTime(0)
        
        
        //add wall generator
        wallGenerator = MLWallGenerator(color: UIColor.clearColor(), size: view.frame.size)
        wallGenerator.position = view.center
        addChild(wallGenerator)
        
        //add start label
        
        let tapToStartLabel = SKLabelNode(text: "Tap to start")
        tapToStartLabel.name = "tapToStartLabel"
        
        tapToStartLabel.position.x = view.center.x
        tapToStartLabel.position.y = view.center.y + 1800
        tapToStartLabel.position = view.center
        tapToStartLabel.fontName = "Helvatica"
        tapToStartLabel.fontColor = UIColor.redColor()
        tapToStartLabel.fontSize = 60.0
        addChild(tapToStartLabel)
    }
    
    func start(){
        isStarted = true
        
        let tapToStartLabel = childNodeWithName("tapToStartLabel")
        tapToStartLabel?.removeFromParent()
        hero.stop()
        //hero.startRunning()
        movingGround.start()
        wallGenerator.startGeneratingWallsEvery(1)
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        //start moving action
        //movingGround.start()
        //hero.stop()
        //hero.startRunning()
        //hero.flip()
        if !isStarted {
            start()
        }else{
            hero.flip()
        }

    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
