//
//  CartViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 02.12.2022.
//
import Foundation
import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var costs: UILabel!
    @IBOutlet weak var positions: UILabel!
    var dataSource = Donuts().donuts
    var order = ""
    var cost = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getData()
    }
    
    @IBAction func buyDonuts(_ sender: Any) {
        if (UserData.balance >= cost) {
            UserData.balance -= cost
            let buttonAlert = UIAlertController(title: "Успех!", message: "Осталось вредств: " + String(UserData.balance), preferredStyle: UIAlertController.Style.alert)
            buttonAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(buttonAlert, animated: true, completion: nil)
        } else {
            let buttonAlert = UIAlertController(title: "Ошибка!", message: "Недостаточно средств" + String(UserData.balance), preferredStyle: UIAlertController.Style.alert)
            buttonAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(buttonAlert, animated: true, completion: nil)
        }
    }
    
    func getData() {
        for number in UserData.cartDonuts {
            order += String(number)
            order += " "
            cost += dataSource[number].price
        }
        positions.text = order
        costs.text = String(cost)
    }
}
