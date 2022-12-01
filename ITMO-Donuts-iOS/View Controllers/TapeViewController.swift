//
//  TapeViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 23.11.2022.
//

import UIKit

protocol TapeViewControllerDelegate: AnyObject {
    func didTapMenuButton()
}

class TapeViewController: UIViewController {
    weak var delegate: TapeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tape"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapMenuButton))
    }

    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }
}
