//
//  ProfileViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 23.11.2022.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {
    let mainLable = UILabel()
    let firstNameLable = UITextField()
    let secondNameLable = UITextField()
    let emailLable = UITextField()
    let phoneLable = UITextField()
    let buttonSend = UIButton()
    let profileStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserData.username)
        title = UserData.username

        configureMainLable()
        configureStackView()
    }
    
    func configureMainLable() {
        view.addSubview(mainLable)
        mainLable.text = UserData.username
        mainLable.textAlignment = .center
        mainLable.numberOfLines = 0
        mainLable.adjustsFontSizeToFitWidth = true
        mainLable.translatesAutoresizingMaskIntoConstraints = false
        mainLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        mainLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        mainLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    private func configureStackView() {
        view.addSubview(profileStackView)
        profileStackView.axis = .vertical
        profileStackView.distribution = .fillEqually
        profileStackView.spacing = 20
        
        profileDataInput()
        setStackViewConstarints()
    }
    
    private func setStackViewConstarints() {
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
        profileStackView.topAnchor.constraint(equalTo: mainLable.bottomAnchor, constant: 30).isActive = true
        profileStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        profileStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        profileStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
    }
    
    private func profileDataInput() {
//        let firstNameLable = UITextField(frame: CGRect(x: 0, y: 0, width: 341, height: 25))
//        firstNameLable.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
//        let firstNameLable = UITextField()
        firstNameLable.textAlignment = .center
        firstNameLable.borderStyle = .roundedRect
        firstNameLable.backgroundColor = .gray
        firstNameLable.placeholder = "I'm a fname label"
        
        secondNameLable.textAlignment = .center
        secondNameLable.borderStyle = .roundedRect
        secondNameLable.backgroundColor = .gray
        secondNameLable.placeholder = "I'm a sname label"

        emailLable.textAlignment = .center
        emailLable.borderStyle = .roundedRect
        emailLable.backgroundColor = .gray
        emailLable.placeholder = "I'm a email label"

        phoneLable.textAlignment = .center
        phoneLable.borderStyle = .roundedRect
        phoneLable.backgroundColor = .gray
        phoneLable.placeholder = "I'm a phone label"

        buttonSend.layer.cornerRadius = 5.0
        buttonSend.clipsToBounds = true
        buttonSend.backgroundColor = UIColor(red: 254.0/255, green: 208.0/255, blue: 110.0/255, alpha: 1.0)
        buttonSend.setTitle("EDIT", for: .normal)
        buttonSend.addTarget(self, action: #selector(btnLoginTouchUpInside), for: .touchUpInside)
        profileStackView.addArrangedSubview(firstNameLable)
        profileStackView.addArrangedSubview(secondNameLable)
        profileStackView.addArrangedSubview(emailLable)
        profileStackView.addArrangedSubview(phoneLable)
        profileStackView.addArrangedSubview(buttonSend)
    }
    
    @objc
    func btnLoginTouchUpInside() {
        let putParametres: [String: Any] = ["username": UserData.username, "email": emailLable.text, "first_name": firstNameLable.text, "second_name": secondNameLable.text, "phone": phoneLable.text]
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
