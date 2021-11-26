//
//  ViewController.swift
//  Vk
//
//  Created by Александр Чигрин on 23.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyBoardGesture = UITapGestureRecognizer(target: self,action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyBoardGesture)
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
    
    // MARK: - Actions
    @IBAction func loginButton(_ sender: Any) {
        let name = nameInput.text!
        let password = passwordInput.text!
        
        if name == "admin" && password == "admin" {
            print("Success")
        } else {
            print("Incorrect login or password")
        }
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

