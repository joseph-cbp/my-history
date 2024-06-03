import SwiftUI
import SpriteKit

struct ContentView: View {
    let startScene = StartScene()
    let firstScene = GameScene()
    let secondScene = BattleScene()
    let thirdScene = FinalScene(text: "teste")
    
    var body: some View {
        VStack {
            SpriteView(scene: startScene, debugOptions: [
//                .showsPhysics
            ])
                .ignoresSafeArea()
        }
    }
}
