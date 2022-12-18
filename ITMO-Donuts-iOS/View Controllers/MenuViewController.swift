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
    private let tapeController: TapeViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TapeViewController")
        guard let tapeVC = vc as? TapeViewController else {
            fatalError()
        }
        return tapeVC
    }()
    private let profileController: ProfileViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
        guard let profileVC = vc as? ProfileViewController else {
            fatalError()
        }
        return profileVC
    }()
    private let cartController: CartViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CartViewController")
        guard let cartVC = vc as? CartViewController else {
            fatalError()
        }
        return cartVC
    }()
    
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
        addChild(cartController)
        
        view.addSubview(tapeController.view)
        view.addSubview(profileController.view)
        view.addSubview(cartController.view)
        tapeController.view.frame = view.bounds
        profileController.view.frame = view.bounds
        cartController.view.frame = view.bounds
        
        tapeController.didMove(toParent: self)
        profileController.didMove(toParent: self)
        cartController.didMove(toParent: self)
        
        tapeController.view.isHidden = true
        profileController.view.isHidden = true
        cartController.view.isHidden = true
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
            cartController.view.isHidden = true
        case .profile:
            tapeController.view.isHidden = true
            profileController.view.isHidden = false
            cartController.view.isHidden = true
        case .cart:
            tapeController.view.isHidden = true
            profileController.view.isHidden = true
            cartController.view.isHidden = false
        case .about:
            tapeController.view.isHidden = true
            profileController.view.isHidden = true
            cartController.view.isHidden = true
        }
    }
}
