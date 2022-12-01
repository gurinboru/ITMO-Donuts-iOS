//
//  MenuViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 23.11.2022.
//

import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    func didSelect(menuItem: MenuViewController.MenuOptions)
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    weak var delegate: MenuViewControllerDelegate?
    
    enum MenuOptions: String, CaseIterable {
        case tape = "Tape"
        case profile = "Profile"
        case aboutus = "About Us"
        
        var imageName: String {
            switch self {
            case .tape:
                return "tape"
            case .profile:
                return "profile"
            case .aboutus:
                return "about us"
            }
        }
    }
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = nil
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    let greyColor = UIColor.gray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
    }

    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.imageView?.image = UIImage(systemName: MenuOptions.allCases[indexPath.row].imageName)
        cell.imageView?.tintColor = .white
        cell.backgroundColor = greyColor
        cell.contentView.backgroundColor = greyColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOptions.allCases[indexPath.row]
        delegate?.didSelect(menuItem: item)
    }
}
