//
// MAPD724 - Advanced iOS Development
// Student Name: Oscar Miralles
// Student ID: 301250756
//

import GameplayKit
import SpriteKit

class Island : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.island.rawValue
        verticalSpeed = 5.0
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if (OrientationManager.CurrentOrientation == "portrait") {
            if(position.y <= -876)
            {
                Reset()
            }
        }
        else {
            if(position.x <= -876)
            {
                Reset()
            }
        }
    }
    
    override func Reset()
    {
        //Randomize element and position depending on orientation
        if (OrientationManager.CurrentOrientation == "portrait") {
            position.y = 876
            // get a pseudo random number
            let randomX:Int = (randomSource?.nextInt(upperBound: 626))! - 313
            position.x = CGFloat(randomX)
        }
        else {
            position.x = 876
            // get a pseudo random number
            let randomY:Int = (randomSource?.nextInt(upperBound: 626))! - 313
            position.y = CGFloat(randomY)
        }
        
        isColliding = false
    }
    
    // public method
    func Move()
    {
        //Move object depending on orientation
        if (OrientationManager.CurrentOrientation == "portrait") {
            position.y -= verticalSpeed!
        }
        else {
            position.x -= verticalSpeed!
        }
    }
}
