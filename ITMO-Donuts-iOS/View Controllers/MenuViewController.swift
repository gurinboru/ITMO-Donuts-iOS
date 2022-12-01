//
//  MenuViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 23.11.2022.
//

import UIKit
import SideMenu

class MenuViewController: UIViewController, ContainerControllerDelegate {
    
    private var sideMenu: SideMenuNavigationController?
    private let tapeController = TapeViewController()
    private let profileController = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = ContainerController(with: SideMenuItem.allCases)
        menu.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true

        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        addChildControllers()
    }
    
    private func addChildControllers() {
        addChild(tapeController)
        addChild(profileController)
        view.addSubview(tapeController.view)
        view.addSubview(profileController.view)
        tapeController.view.frame = view.bounds
        profileController.view.frame = view.bounds
        
        tapeController.didMove(toParent: self)
        profileController.didMove(toParent: self)
        
        tapeController.view.isHidden = true
        profileController.view.isHidden = true
    }
    
    @IBAction func didTapMenuButton(_ sender: Any) {
        present(sideMenu!, animated: true)
    }
    
    func didSelectMenuItem(named: SideMenuItem) {
        sideMenu?.dismiss(animated: true, completion: nil)
        
        title = named.rawValue
        
        switch named {
        case .tape:
            tapeController.view.isHidden = false
            profileController.view.isHidden = true
        case .profile:
            tapeController.view.isHidden = true
            profileController.view.isHidden = false
        }
    }
}
