# zxcvbn-swift
This is a swift compatible implementation of the password strength checker [zxcvbn](https://github.com/dropbox/zxcvbn) and a relies on the one specific contribution aimed for iOS. Check it out [here](https://github.com/dropbox/zxcvbn-ios).
`zxcvbn-swift` is easier to integrate since it's compabile with Carthage and (hopefully soon) SPM. 

# Installation
At this time, this is compatible with Carthage only. Simply add it to your Cartfile as below.
```
github https://github.com/scr037/zxcvbn-swift
```

# Usage
One to use `zxcvbn-swift` is to use `DBPasswordStrengthMeter`. This is a built-in component from the [original implementation](https://github.com/dropbox/zxcvbn-ios): 

``` swift
import ZxcvbnSwift

lazy var meterView = DBPasswordStrengthMeterView()

lazy var passwordField: UITextField = {
    let field = UITextField()
    field.isSecureTextEntry = true
    field.autocorrectionType = .no
    field.autocapitalizationType = .none
    field.placeholder = "Type a password here"
    field.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: .editingChanged)
    field.rightViewMode = .always
    field.rightView = self.meterView
    field.borderStyle = .roundedRect
    return field
}()

// You can add a target to your editing text field or implement
// your preferred method from UITextFieldDelegate.
@objc func textFieldEditingDidChange(_ textField: UITextField) {
    guard let password = textField.text else { return }
    self.meterView.scorePassword(password)
}

```

If you prefer creating a custom UI component for diplaying your password strength, you can use `DBZxcvbn` straight away:

``` swift
import ZxcvbnSwift

lazy var let checker = DBZxcvbn()

{ ... }

// You can add a target to your editing text field or implement
// your preferred method from UITextFieldDelegate.
@objc func textFieldEditingDidChange(_ textField: UITextField) {
    guard let password = textField.text else { return }
    self.meterView.scorePassword(password)
    let strength = checker.passwordStrength(password)
    // Score is an Int32 representation between 0 and 4. 
    // You can easily display this result within a UIProgressView 
    // by multiplying for a 0.25 factor.
    notifyPasswordStrength(strength?.score)
}
```
