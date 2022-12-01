//
//  LoginViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Элина Борисова on 20.11.2022.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextArea: UITextField!
    @IBOutlet weak var passwordTextArea: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
                let tapeVC = storyboard.instantiateViewController(withIdentifier: "TapeViewController") as! TapeViewController
                //self.present(tapeVC, animated: true, completion: nil)
                self.navigationController?.pushViewController(tapeVC, animated: true)
                break
            case .failure:
                print(Error.self)
            }
        }
        
//        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let menuViewController = storyboard.instantiateViewController(withIdentifier: "vc") as UIViewController
//        self.present(menuViewController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
