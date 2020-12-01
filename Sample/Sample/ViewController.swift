//
//  ViewController.swift
//  Sample
//
//  Created by lchinigioli on 01/12/2020.
//  Copyright © 2020 kgsoft. All rights reserved.
//

import UIKit
import ZxcvbnSwift

class ViewController: UIViewController {
    @IBOutlet var container: UIStackView! {
        didSet {
            container.axis = .vertical
        }
    }

    lazy var passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.placeholder = "Type a password here"
        field.addTarget(self, action: #selector(passwordDidChange(_:)), for: .editingChanged)
        field.rightViewMode = .always
        field.rightView = self.meterView
        field.borderStyle = .roundedRect
        return field
    }()

    lazy var meterView = DBPasswordStrengthMeterView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.container.addArrangedSubview(passwordField)
    }

    @objc func passwordDidChange(_ textField: UITextField) {
        guard let password = textField.text else { return }
        self.meterView.scorePassword(password)
    }
}
