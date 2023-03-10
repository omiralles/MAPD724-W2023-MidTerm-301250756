import SpriteKit
import GameplayKit
//
// MAPD724 - Advanced iOS Development
// Student Name: Oscar Miralles
// Student ID: 301250756
//

import AVFoundation
import UIKit

class StartScene: SKScene
{
    // instance variables
    var ocean1: Ocean?
    var ocean2: Ocean?
    
    override func sceneDidLoad()
    {
        name = "START"
        
        //Set defautl orientation
        OrientationManager.CurrentOrientation = "portrait"
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        // add the first ocean to the Scene
        ocean1 = Ocean()
        ocean1?.Reset()
        addChild(ocean1!)
        
        // add the second ocean to the scene
        ocean2 = Ocean()
        ocean2?.position.y = -627
        addChild(ocean2!)
    }
    
    var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        //Allow all orientations
        return .portrait
    }
    
    var preferredInterfaceOrientationForPresentation : UIInterfaceOrientation
    {
        return .portrait
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        ocean1?.Update()
        ocean2?.Update()
    }
}
