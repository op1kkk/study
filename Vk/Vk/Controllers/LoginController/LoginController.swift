//
//  ViewController.swift
//  Vk
//
//  Created by Александр Чигрин on 23.11.2021.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var vkLabel: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pointOne: UILabel!
    @IBOutlet weak var pointTwo: UILabel!
    @IBOutlet weak var pointThree: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingLoad()
        loadingPoints()
        
        let hideKeyBoardGesture = UITapGestureRecognizer(target: self,action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyBoardGesture)
        //runAnimate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWasShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillBeHidden(notification: )),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        DispatchQueue.main.asyncAfter(deadline:.now() + 5.0, execute: {
           self.performSegue(withIdentifier: "log",sender: self)
        })
        let checkResult = checkUserData()
        if !checkResult {
            showLoginError()
        }
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let login = nameInput.text,
            let password = passwordInput.text else {return false}
            
            if login == "admin" && password == "1234" {
                loadingPoints()
                return true
            } else {
                return false
            }
        }
        
    func showLoginError() {
        let alert = UIAlertController(title: "Error", message: "Wrong name or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        }
    
    // MARK: - Actions
    @IBAction func loginButton(_ sender: Any) {
        
    }
    
    @objc func hideKeyboard() {
        scrollView.endEditing(true)
    }
    
    @objc func keyBoardWasShow(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }

    @objc func keyBoardWillBeHidden(notification: Notification) {
        let contentInset = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}

//extension LoginController {
//    func runAnimate() {
//        UIView.animate(withDuration: 0.2, delay: 0, options: [.repeat, .autoreverse], animations: {
//            self.vkLabel.frame.origin.y -= 100
//        })
//    }
//}

extension LoginController {
    func loadingPoints() {
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [.autoreverse, .repeat]) {
            self.pointOne.alpha = 1
        } completion: { success in
            
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.autoreverse, .repeat]) {
            self.pointTwo.alpha = 1
        } completion: { success in
            
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [.autoreverse, .repeat]) {
            self.pointThree.alpha = 1
        } completion: { success in
            
        }
    }
    
    func settingLoad() {
        pointOne.layer.masksToBounds = true
        pointOne.layer.cornerRadius = 15
        pointOne.alpha = 0
        pointTwo.layer.masksToBounds = true
        pointTwo.layer.cornerRadius = 15
        pointTwo.alpha = 0
        pointThree.layer.masksToBounds = true
        pointThree.layer.cornerRadius = 15
        pointThree.alpha = 0
    }
}
