//
// MAPD724 - Advanced iOS Development
// Student Name: Oscar Miralles
// Student ID: 301250756
//

import GameplayKit
import SpriteKit

class Ocean : GameObject
{
    // constructor / initializer
    init()
    {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start()
    {
        zPosition = Layer.ocean.rawValue
        verticalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        //Check bounds depending on orientation
        if (OrientationManager.CurrentOrientation == "portrait") {
            if(position.y <= -2253)
            {
                Reset()
            }
        }
        else {
            if(position.x <= -2253)
            {
                Reset()
            }
        }
    }
    
    override func Reset()
    {
        //Reset position and object rotation depending on orientation
        if (OrientationManager.CurrentOrientation == "portrait") {
            position.y = 2253
            position.x = 0
            zRotation = CGFloat(0.0)
        }
        else {
            position.x = 1453
            position.y = 0
            zRotation = .pi / 2
        }
    }
    
    func Move()
    {
        //Move obeject depending on orientation
        if (OrientationManager.CurrentOrientation == "portrait") {
            position.y -= verticalSpeed!
        }
        else {
            position.x -= verticalSpeed!
        }
    }
}
