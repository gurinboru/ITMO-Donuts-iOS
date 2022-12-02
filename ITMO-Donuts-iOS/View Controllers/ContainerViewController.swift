//
//  ContainerViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 23.11.2022.
//

import UIKit

protocol ContainerControllerDelegate {
    func didSelectMenuItem(named: SideMenuItem)
}

enum SideMenuItem: String, CaseIterable {
    case about = "About"
    case tape = "Tape"
    case profile = "Profile"
    case cart = "Cart"
}

class ContainerController: UITableViewController {
    public var delegate: ContainerControllerDelegate?
    private let menuItems: [SideMenuItem]
    private let colorBack = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    init(with menuItems: [SideMenuItem]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLoad() {
        tableView.backgroundColor = colorBack
        view.backgroundColor = colorBack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.backgroundColor = colorBack
        cell.contentView.backgroundColor = colorBack
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Relay to delegate about menu item selection
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
}
