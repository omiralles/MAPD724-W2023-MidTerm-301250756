//
// MAPD724 - Advanced iOS Development
// Student Name: Oscar Miralles
// Student ID: 301250756
//

import GameplayKit
import SpriteKit

class Player : GameObject
{
    // Initializer
    init()
    {
        super.init(imageString: "plane", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func Start()
    {
        zPosition = Layer.plane.rawValue
        Reset()
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        //Check limits depending on orientation
        if (OrientationManager.CurrentOrientation == "portrait") {
            // constrain the player on the left boundary
            if(position.x <= -320)
            {
                position.x = -320
            }
            
            // constrain the player on the right boundary
            if(position.x >= 320)
            {
                position.x = 320
            }
        }
        else {
            // constrain the player on the left boundary
            if(position.y <= -320)
            {
                position.y = -320
            }
            
            // constrain the player on the right boundary
            if(position.y >= 320)
            {
                position.y = 320
            }
        }
    }
    
    override func Reset()
    {
        //Reset position and object rotation depending on orientation
        if (OrientationManager.CurrentOrientation == "portrait") {
            position.y = -640
            zRotation = CGFloat(0.0)
        }
        else {
            position.x = -640
            zRotation = -(.pi / 2)
        }
    }
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
    
}
