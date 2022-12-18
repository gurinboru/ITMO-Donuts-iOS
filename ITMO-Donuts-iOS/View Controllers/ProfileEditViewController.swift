//
//  ProfileEditViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 18.12.2022.
//

import UIKit
import Alamofire

class ProfileEditViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveProfileData(_ sender: Any) {
        let putParametres: [String: Any] = ["username": UserData.username, "email": email.text, "first_name": firstName.text, "second_name": lastName.text, "phone": phone.text]
        let putUrl = "https://donut-profile-service.onrender.com/api/v1/profile/user/" + UserData.username
        let profileURL = URL(string: putUrl)!
        print(profileURL)

        AF.request(profileURL, method: .put, parameters: putParametres, encoding: JSONEncoding.default).responseJSON { [self]
            response in
            switch (response.result) {
            case .success:
                let buttonAlert = UIAlertController(title: "Успех", message: "Ваши данные успешно обновлены!", preferredStyle: UIAlertController.Style.alert)
                buttonAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(buttonAlert, animated: true, completion: nil)
                print(response)
            case .failure:
                let buttonAlert = UIAlertController(title: "Неудача", message: "Произошла ошибка, попробуйте снова!", preferredStyle: UIAlertController.Style.alert)
                buttonAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(buttonAlert, animated: true, completion: nil)
                print(Error.self)
            }
        }
    }
}
