//
//  ContainerViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 23.11.2022.
//

import UIKit

class ContainerViewController: UIViewController {
    enum MenuState {
        case opened
        case closed
    }
    private var menuState: MenuState = .closed
    
    var menuVC = MenuViewController()
    let profileVC = ProfileViewController()
    let tapeVC = TapeViewController()
    var navVC: UINavigationController?
//    lazy var profileVC = ProfileViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addChildVCs()
        // Do any additional setup after loading the view.
    }
    
    private func addChildVCs() {
        // Menu
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        // Profile
        addChild(profileVC)
        view.addSubview(profileVC.view)
        profileVC.didMove(toParent: self)
        
        //Tape
        tapeVC.delegate = self
        let navVC = UINavigationController(rootViewController: tapeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }

}

extension ContainerViewController: TapeViewControllerDelegate {
    func didTapMenuButton() {
        // Animate the menu
        toggleMenu(completion: nil)
    }
    
    func toggleMenu(completion: (() -> Void)?) {
        switch menuState {
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = self.tapeVC.view.frame.size.width - 80
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .opened
                }
            }
        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = 0
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
}

extension ContainerViewController: MenuViewControllerDelegate {
    func didSelect(menuItem: MenuViewController.MenuOptions) {
        toggleMenu { [weak self] in
            switch menuItem {
            case .profile:
                self?.addProfile()
            case .tape:
                self?.resetToTape()            case .aboutus:
                break
            }
        }
    }
    
    func addProfile() {
        let vc = profileVC
        tapeVC.addChild(vc)
        tapeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: tapeVC)
        tapeVC.title = vc.title
    }
    
    func resetToTape() {
        profileVC.view.removeFromSuperview()
        profileVC.didMove(toParent: nil)
    }
}
