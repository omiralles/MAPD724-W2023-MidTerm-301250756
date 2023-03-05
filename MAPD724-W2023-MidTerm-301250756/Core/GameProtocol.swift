//
// MAPD724 - Advanced iOS Development
// Student Name: Oscar Miralles
// Student ID: 301250756
//

protocol GameProtocol
{
    // Initialization
    func Start()
    
    // update every frame
    func Update()
    
    // check if the position is outside the bounds of the Screen
    func CheckBounds()
    
    // a method to reset the position
    func Reset()
}
