//
//  SignUpViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Элина Борисова on 20.11.2022.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {

    @IBOutlet weak var loginArea: UITextField!
    @IBOutlet weak var firstPassArea: UITextField!
    @IBOutlet weak var secondPassArea: UITextField!
    var help: String = ""
//    var reicevedData = Any()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    static func jsonToString(json: Any) -> String{
        do {
            let data1 = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            let convertedString = String(data: data1, encoding: String.Encoding.utf8) as NSString? ?? ""
            debugPrint(convertedString)
            return convertedString as String
        } catch let myJSONError {
            debugPrint(myJSONError)
            return "bad request"
        }
    }
    
    @IBAction func actionRegister(_ sender: UIButton) {
        if (firstPassArea.text == secondPassArea.text) {
            var help = false
            let regURL = URL(string: "https://itmo-donuts-auth.onrender.com/api/v1/auth/registration")!
            let parameters: [String: Any] = ["name": loginArea.text, "password": firstPassArea.text, "confirm_password": secondPassArea.text]
            
            AF.request(regURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
                response in
                switch (response.result) {
                case .success:
                    help = true
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
