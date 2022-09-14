//
//  ViewController.swift
//  3.ForgotPassword
//
//  Created by Quang Thanh on 09/09/2022.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var btntapped: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        }
        private func initialSetup() {
    
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:
        #selector(hideKeyboard)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification :)),
        name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:
        UIResponder.keyboardWillHideNotification, object: nil)
        }
        
    @objc private func hideKeyboard() {
    self.view.endEditing(true)
    }
    @objc private func keyboardWillShow(notification: NSNotification) {
    if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
    NSValue {
    let keyboardHeight = keyboardFrame.cgRectValue.height
    let bottomSpace = self.view.frame.height - (btntapped.frame.origin.y + btntapped.frame.height)
    self.view.frame.origin.y -= keyboardHeight - bottomSpace + 10
    }
    }
    @objc private func keyboardWillHide() {
    self.view.frame.origin.y = 0
    }
    deinit {
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification,
    object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification,
    object: nil)
    }
    }
        
        
