//
import SwiftUI
import SceneKit



struct SceneKitView: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()

        // 3Dシーンの読み込み
        let scene = SCNScene(named: "model.dae") ?? SCNScene()
        sceneView.scene = scene

        // カメラの設定
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
        scene.rootNode.addChildNode(cameraNode)

        // ライト
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)

        // 背景など
        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = UIColor(red: 255/255, green: 232/255, blue: 214/255, alpha: 1.0)

        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {
        // 必要に応じて更新処理を書く
    }
}

