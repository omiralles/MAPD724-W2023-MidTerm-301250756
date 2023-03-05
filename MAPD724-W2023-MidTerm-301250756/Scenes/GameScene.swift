//
// MAPD724 - Advanced iOS Development
// Student Name: Oscar Miralles
// Student ID: 301250756
//

import SpriteKit
import GameplayKit
import AVFoundation
import UIKit

class GameScene: SKScene
{
    // instance variables
    var ocean1: Ocean?
    var ocean2: Ocean?
    var player: Player?
    var island: Island?
    var clouds : [Cloud] = []
    
    override func sceneDidLoad()
    {
        name = "GAME"
        
        //Store current orientation and redim scene
        if (UIDevice.current.orientation.isLandscape) {
            OrientationManager.CurrentOrientation = "landscape"
            self.scene?.size.height = CGFloat(750.0)
            self.scene?.size.width = CGFloat(1626.0)
        } else {
            OrientationManager.CurrentOrientation = "portrait"
            self.scene?.size.height = CGFloat(1626.0)
            self.scene?.size.width = CGFloat(750.0)
        }
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        // add the first ocean to the Scene
        ocean1 = Ocean()
        ocean1?.Reset()
        addChild(ocean1!)
        
        // add the second ocean to the scene
        ocean2 = Ocean()
        //Establish ocena2 position depending on the orientation
        if (OrientationManager.CurrentOrientation == "portrait") {
            ocean2?.position.y = -627
        }
        else {
            ocean2?.position.x = -627
        }
        addChild(ocean2!)
        
        // add the player to the Scene
        player = Player()
        addChild(player!)
        
        // add the island to the Scene
        island = Island()
        addChild(island!)
        
        //Add diferent clouds depending on orientation
        if (OrientationManager.CurrentOrientation == "portrait") {
            // add 3 clouds to the Scene
            for _ in 0...2
            {
                let cloud = Cloud()
                clouds.append(cloud)
                addChild(cloud)
            }
        }
        else {
            for _ in 0...1
            {
                let cloud = Cloud()
                clouds.append(cloud)
                addChild(cloud)
            }
        }
        
        // Engine Sound - Background noise / music
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        addChild(engineSound)
        engineSound.autoplayLooped = true
        engineSound.run(SKAction.changeVolume(to: 0.5, duration: 0))

        
        
        // preload / prewarm impulse sounds
        do
        {
            let sounds: [String] = ["thunder", "yay"]
            for sound in sounds
            {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url:URL = URL(fileURLWithPath: path)
                let avPlayer: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                avPlayer.prepareToPlay()
            }
        }
        catch
        {
            
        }
    }
    
    var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        //Allow all orientations
        return .allButUpsideDown
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        if (OrientationManager.CurrentOrientation == "portrait") {
            player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
        }
        else {
            player?.TouchMove(newPos: CGPoint(x: -640, y: pos.y))
        }
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        if (OrientationManager.CurrentOrientation == "portrait") {
            player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
        }
        else {
            player?.TouchMove(newPos: CGPoint(x: -640, y: pos.y))
        }
        
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        if (OrientationManager.CurrentOrientation == "portrait") {
            player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
        }
        else {
            player?.TouchMove(newPos: CGPoint(x: -640, y: pos.y))
        }
        
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
        //Detect changes on orientation to redraw the scene
        if (UIDevice.current.orientation.isLandscape && (OrientationManager.CurrentOrientation == "portrait")) {
            OrientationManager.CurrentOrientation = "landscape"
            self.scene?.size.height = CGFloat(750.0)
            self.scene?.size.width = CGFloat(1626.0)
            
            ocean1?.removeFromParent()
            ocean1 = Ocean()
            ocean1?.Reset()
            addChild(ocean1!)
            
            ocean2?.removeFromParent()
            ocean2 = Ocean()
            ocean2?.position.x = -627
            addChild(ocean2!)
            
            //Test
            print("landscape x ocean 1: \(ocean1?.position.x ?? 0.0)")
            print("landscape x ocean 2: \(ocean2?.position.x ?? 0.0)")
            print("landscape y ocean 1: \(ocean1?.position.y ?? 0.0)")
            print("landscape y ocean 2: \(ocean2?.position.y ?? 0.0)")
            
            player?.Reset()
            
            for cloud in clouds
            {
                cloud.removeFromParent()
            }
            
            clouds.removeAll()
            
            //Two clouds landscape
            for _ in 0...1
            {
                let cloud = Cloud()
                clouds.append(cloud)
                addChild(cloud)
            }
            
        } else if (UIDevice.current.orientation.isPortrait && (OrientationManager.CurrentOrientation == "landscape")) {
            OrientationManager.CurrentOrientation = "portrait"
            self.scene?.size.height = CGFloat(1626.0)
            self.scene?.size.width = CGFloat(750.0)
            
            ocean1?.removeFromParent()
            ocean1 = Ocean()
            ocean1?.Reset()
            addChild(ocean1!)
            
            ocean2?.removeFromParent()
            ocean2 = Ocean()
            ocean2?.position.y = -627
            addChild(ocean2!)
            
            //Test
            print("landscape x ocean 1: \(ocean1?.position.x ?? 0.0)")
            print("landscape x ocean 2: \(ocean2?.position.x ?? 0.0)")
            print("landscape y ocean 1: \(ocean1?.position.y ?? 0.0)")
            print("landscape y ocean 2: \(ocean2?.position.y ?? 0.0)")
            
            player?.Reset()
            
            for cloud in clouds
            {
                cloud.removeFromParent()
            }
            
            clouds.removeAll()
            
            //Three clouds portrait
            for _ in 0...2
            {
                let cloud = Cloud()
                clouds.append(cloud)
                addChild(cloud)
            }
        }
        
        ocean1?.Update()
        ocean2?.Update()
        player?.Update()
        island?.Update()
        
        CollisionManager.SquaredRadiusCheck(scene: self, object1: player!, object2: island!)
        
        // update each cloud in the clouds array
        for cloud in clouds
        {
            cloud.Update()
            CollisionManager.SquaredRadiusCheck(scene: self, object1: player!, object2: cloud)
        }
        
    }
}
