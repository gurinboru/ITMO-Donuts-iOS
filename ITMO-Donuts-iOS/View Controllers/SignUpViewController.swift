//
//  SignUpViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Элина Борисова on 20.11.2022.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginTextArea: UITextField!
    @IBOutlet weak var firstPassTextArea: UITextField!
    @IBOutlet weak var secondPassTextArea: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginTextArea.delegate = self;
        self.firstPassTextArea.delegate = self;
        self.secondPassTextArea.delegate = self;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return loginTextArea.resignFirstResponder()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func actionRegister(_ sender: UIButton) {
        if (firstPassTextArea.text == secondPassTextArea.text) {
            let regURL = URL(string: "https://itmo-donuts-auth.onrender.com/api/v1/auth/registration")!
            let parameters: [String: Any] = ["name": loginTextArea.text, "password": firstPassTextArea.text, "confirm_password": secondPassTextArea.text]
            
            AF.request(regURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
                response in
                switch (response.result) {
                case .success:
                    print(response)
                    debugPrint("Inside")
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
}
