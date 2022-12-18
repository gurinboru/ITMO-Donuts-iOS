//
//  ProfileViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 23.11.2022.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {
//    let mainLable = UILabel()
//    let firstNameLable = UITextField()
//    let secondNameLable = UITextField()
//    let emailLable = UITextField()
//    let phoneLable = UITextField()
//    let buttonSend = UIButton()
//    let profileStackView = UIStackView()
//

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserData()
//        print(UserData.username)
//        title = UserData.username
//        configureMainLable()
//        configureStackView()
    }
    
    func getUserData() {
//        let putParametres: [String: Any] = ["username": UserData.username,, "first_name": firstNameLable.text, "second_name": secondNameLable.text, "phone": phoneLable.text]
        let putUrl = "https://donut-profile-service.onrender.com/api/v1/profile/user/" + UserData.username
        let profileURL = URL(string: putUrl)!
        print(profileURL)

        AF.request(profileURL, method: .get, encoding: JSONEncoding.default).responseJSON { [self]
            response in
            switch (response.result) {
            case .success:
                //username.text = response["username"]
                print("------")
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)")
                    let help = utf8Text.split(separator: ",")
                    username.text = String(help[1].split(separator: ":")[1])
                    fullName.text = "Full name: " + String(help[3].split(separator: ":")[1] + help[4].split(separator: ":")[1])
                    balance.text = "Balance: " + String(help[7].split(separator: ":")[1])
                    email.text = String(help[2].split(separator: ":")[1])
                }
            case .failure:
                let buttonAlert = UIAlertController(title: "Неудача", message: "Ошибка загрузки данных, попробуйте снова!", preferredStyle: UIAlertController.Style.alert)
                buttonAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(buttonAlert, animated: true, completion: nil)
                print(Error.self)
            }
        }
    }
    
    @IBAction func openEdit(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileEditViewController") as! ProfileEditViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    //    func configureMainLable() {
//        view.addSubview(mainLable)
//        mainLable.text = UserData.username
//        mainLable.textAlignment = .center
//        mainLable.numberOfLines = 0
//        mainLable.adjustsFontSizeToFitWidth = true
//        mainLable.translatesAutoresizingMaskIntoConstraints = false
//        mainLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
//        mainLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
//        mainLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
//    }
//
//    private func configureStackView() {
//        view.addSubview(profileStackView)
//        profileStackView.axis = .vertical
//        profileStackView.distribution = .fillEqually
//        profileStackView.spacing = 20
//
//        profileDataInput()
//        setStackViewConstarints()
//    }
//
//    private func setStackViewConstarints() {
//        profileStackView.translatesAutoresizingMaskIntoConstraints = false
//        profileStackView.topAnchor.constraint(equalTo: mainLable.bottomAnchor, constant: 30).isActive = true
//        profileStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
//        profileStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
//        profileStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
//    }
//
//    private func profileDataInput() {
//        let firstNameLable = UITextField(frame: CGRect(x: 0, y: 0, width: 341, height: 25))
//        firstNameLable.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
//
//        firstNameLable.textAlignment = .center
//        firstNameLable.borderStyle = .roundedRect
//        firstNameLable.backgroundColor = .gray
//        firstNameLable.placeholder = "I'm a fname label"
//
//        secondNameLable.textAlignment = .center
//        secondNameLable.borderStyle = .roundedRect
//        secondNameLable.backgroundColor = .gray
//        secondNameLable.placeholder = "I'm a sname label"
//
//        emailLable.textAlignment = .center
//        emailLable.borderStyle = .roundedRect
//        emailLable.backgroundColor = .gray
//        emailLable.placeholder = "I'm a email label"
//
//        phoneLable.textAlignment = .center
//        phoneLable.borderStyle = .roundedRect
//        phoneLable.backgroundColor = .gray
//        phoneLable.placeholder = "I'm a phone label"
//
//        buttonSend.layer.cornerRadius = 5.0
//        buttonSend.clipsToBounds = true
//        buttonSend.backgroundColor = UIColor(red: 254.0/255, green: 208.0/255, blue: 110.0/255, alpha: 1.0)
//        buttonSend.setTitle("EDIT", for: .normal)
//        buttonSend.addTarget(self, action: #selector(btnLoginTouchUpInside), for: .touchUpInside)
//        profileStackView.addArrangedSubview(firstNameLable)
//        profileStackView.addArrangedSubview(secondNameLable)
//        profileStackView.addArrangedSubview(emailLable)
//        profileStackView.addArrangedSubview(phoneLable)
//        profileStackView.addArrangedSubview(buttonSend)
//
//
//    }
//
    
//    func btnLoginTouchUpInside() {
//        let putParametres: [String: Any] = ["username": UserData.username, "email": emailLable.text, "first_name": firstNameLable.text, "second_name": secondNameLable.text, "phone": phoneLable.text]
//        let putUrl = "https://donut-profile-service.onrender.com/api/v1/profile/user/" + UserData.username
//        let profileURL = URL(string: putUrl)!
//        print(profileURL)
//
//        AF.request(profileURL, method: .put, parameters: putParametres, encoding: JSONEncoding.default).responseJSON { [self]
//            response in
//            switch (response.result) {
//            case .success:
//                let buttonAlert = UIAlertController(title: "Успех", message: "Ваши данные успешно обновлены!", preferredStyle: UIAlertController.Style.alert)
//                buttonAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                self.present(buttonAlert, animated: true, completion: nil)
//                print(response)
//            case .failure:
//                let buttonAlert = UIAlertController(title: "Неудача", message: "Произошла ошибка, попробуйте снова!", preferredStyle: UIAlertController.Style.alert)
//                buttonAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                self.present(buttonAlert, animated: true, completion: nil)
//                print(Error.self)
//            }
//        }
//    }
}
