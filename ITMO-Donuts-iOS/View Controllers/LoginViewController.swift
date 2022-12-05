//
//  LoginViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Элина Борисова on 20.11.2022.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextArea: UITextField!
    @IBOutlet weak var passwordTextArea: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextArea.delegate = self
        self.passwordTextArea.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return nameTextArea.resignFirstResponder()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func actionSignIn(_ sender: Any) {
        let loginURL = URL(string: "https://itmo-donuts-auth.onrender.com/api/v1/auth/login")!
        let parameters: [String: Any] = ["name": nameTextArea.text, "password": passwordTextArea.text]
        
        AF.request(loginURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
            response in
            switch (response.result) {
            case .success:
                print(response)
                print("Inside")
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let tapeVC = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
                //self.present(tapeVC, animated: true, completion: nil)
                self.navigationController?.pushViewController(tapeVC, animated: true)
                break
            case .failure:
                print(Error.self)
            }
        }
    }
}
