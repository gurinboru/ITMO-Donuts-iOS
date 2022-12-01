//
//  SignUpViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Элина Борисова on 20.11.2022.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {

    @IBOutlet weak var loginTextArea: UITextField!
    @IBOutlet weak var firstPassTextArea: UITextField!
    @IBOutlet weak var secondPassTextArea: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
                    let tapeVC = storyboard.instantiateViewController(withIdentifier: "TapeViewController") as! TapeViewController
                    //self.present(tapeVC, animated: true, completion: nil)
                    self.navigationController?.pushViewController(tapeVC, animated: true)
                    break
                case .failure:
                    print(Error.self)
                }
            }
        }
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
