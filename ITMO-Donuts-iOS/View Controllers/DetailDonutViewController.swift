//
//  DetailDonutViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 19.12.2022.
//

import UIKit
import SceneKit

class DetailDonutViewController: UIViewController {

    @IBOutlet weak var donutModel: SCNView!

    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var energetic: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var price: UILabel!
    var dataSource = Donuts().donuts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = dataSource[UserData.selectedDonut].title
        price.text = String(dataSource[UserData.selectedDonut].price) + "руб."
        desc.text = dataSource[UserData.selectedDonut].description
        energetic.text = String(dataSource[UserData.selectedDonut].energetic) + "Ккал."
//        let url = URL(string: "https://raw.githubusercontent.com/" + dataSource[UserData.selectedDonut].model)
//        print(url!)
        
//        let scene = try? SCNScene(url: URL(string: dataSource[UserData.selectedDonut].model)!)
        let scene = SCNScene(named: "product_" + String(UserData.selectedDonut) + ".obj")
        
        // 5: Adding light to scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 35)
        scene?.rootNode.addChildNode(lightNode)
        
        // 6: Creating and adding ambien light to scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientLightNode)
        
        // If you don't want to fix manually the lights
        //        sceneView.autoenablesDefaultLighting = true
        
        // Allow user to manipulate camera
        donutModel.allowsCameraControl = true
        
        // Show FPS logs and timming
        // sceneView.showsStatistics = true
        
        // Set background color
        donutModel.backgroundColor = UIColor.white
        
        // Allow user translate image
        donutModel.cameraControlConfiguration.allowsTranslation = false
        
        // Set scene settings
        donutModel.scene = scene
    }

    @IBAction func addToCart(_ sender: Any) {
        UserData.cartDonuts.append(UserData.selectedDonut)
    }
    
}
