//
//  GameViewController.swift
//  Nimbie Ninja
//
//  Created by yang ming on 18/05/2015.
//  Copyright (c) 2015 Tomorrow. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    
    
    var scene: GameScene!;

    override func viewDidLoad() {
      
        super.viewDidLoad();
        
        //configure the view
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        //create and configure the scene
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        //present the scene
        skView.presentScene(scene);
        
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
