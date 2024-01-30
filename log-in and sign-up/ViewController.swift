//
//  ViewController.swift
//  log-in and sign-up
//
//  Created by Min Hu on 2024/1/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet weak var checkLabel: UILabel!
    
    var logInState: Bool = true
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    // 選擇 segmentedControl 的動作
    @IBAction func swichLogInOfSignUp(_ sender: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            logInState = true
            checkLabel.textColor = .gray
            textFields[2].isEnabled = false
            textFields[2].backgroundColor = .gray
            textFields[2].text = ""
        } else {
            logInState = false
            checkLabel.textColor = .black
            textFields[2].isEnabled = true
            textFields[2].backgroundColor = .white
        }
    }
    
    // 按下 Button 的動作
    @IBAction func tapButton(_ sender: Any) {
        if logInState == true {
            if textFields[0].text == "" {
                showAlert(type: .emptyAccount)
            } else if textFields[1].text == "" {
                showAlert(type: .emptyPassword)
            } else if textFields[0].text == "appworks_school" && textFields[1].text == "1234" {
                showAlert(type: .loginSuccess)
            } else {
                showAlert(type: .wrongAccountOrPassword)
            }
        } else {
            if textFields[0].text == "" {
                showAlert(type: .emptyAccount)
            } else if textFields[1].text == "" {
                showAlert(type: .emptyPassword)
            } else if textFields[2].text == "" {
                showAlert(type: .emptyCheckPassword)
            } else if textFields[1].text == textFields[2].text {
                showAlert(type: .signupSuccess)
            } else {
                showAlert(type: .wrongCheckPassword)
            }
        }
    }
        
        // UI 配置
        func setUI() {
            segmentedControl.tintColor = .white
            segmentedControl.selectedSegmentTintColor = .black
            segmentedControl.setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected)
            segmentedControl.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            segmentedControl.layer.borderWidth = 1
            segmentedControl.selectedSegmentIndex = 0
            textFields[2].isEnabled = false
            textFields[2].backgroundColor = .gray
            for i in 0...textFields.count - 1 {
                textFields[i].returnKeyType = .next
                textFields[i].delegate = self
            }
            
        }
        // 顯示 alert 視窗
    func showAlert(type: AlertType) {
            let alertTexts = type.alertTexts
        let alert = UIAlertController(title: alertTexts.title, message: alertTexts.message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
}
// 讓 textField 可以填完以後按 Next 就往下一欄填寫
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if logInState == true {
            if textField == textFields[0] {
                return textFields[1].becomeFirstResponder()
            } else {
                return textField.resignFirstResponder()
            }
        } else {
            if textField == textFields[0] {
                return textFields[1].becomeFirstResponder()
            } else if textField == textFields[1] {
                return textFields[2].becomeFirstResponder()
            } else {
                return textField.resignFirstResponder()
            }
            
        }
    }
}
