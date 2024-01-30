//
//  Content.swift
//  log-in and sign-up
//
//  Created by Min Hu on 2024/1/29.
//

import Foundation

struct AlertText {
    let title: String
    let message: String    
}


enum AlertType {
    case emptyAccount
    case emptyPassword
    case emptyCheckPassword
    case wrongAccountOrPassword
    case wrongCheckPassword
    case signupSuccess
    case loginSuccess
    
    var alertTexts: AlertText {
        switch self {
        case .emptyAccount:
            return AlertText(title: "Error", message: "Account should not be empty.")
        case .emptyPassword:
            return AlertText(title: "Error", message: "Password should not be empty.")
        case .emptyCheckPassword:
            return AlertText(title: "Error", message: "Check Password should not be empty.")
        case .wrongAccountOrPassword:
            return AlertText(title: "Error", message: "Login fail")
        case .wrongCheckPassword:
            return AlertText(title: "Error", message: "Signup fail")
        case .signupSuccess:
            return AlertText(title: "Welcome", message: "Signup success ")
        case .loginSuccess:
            return AlertText(title: "Welcome Back", message: "Login success")
        }
    }
}
