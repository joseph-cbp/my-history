import SwiftUI
import SpriteKit

struct ContentView: View {
    let startScene = StartScene()
    #warning("Por que criou todas as cenas aqui?")
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
