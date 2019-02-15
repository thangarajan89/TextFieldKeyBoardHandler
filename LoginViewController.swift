
import UIKit
class LoginViewController: UIViewController {

    @IBOutlet weak var rememberMeButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var pswTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    let textFieldCornerRadius: CGFloat = 5.0
    let rememberMeCornerRadius: CGFloat = 3.0
    let brownColor = UIColor(red: 91/255.0, green: 73/255.0, blue: 73/255.0, alpha: 1.0)
    let padding: CGFloat = 15.0
    let keyboardHeight: CGFloat = 250.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupUIElements()
    }
    
    func setupUIElements() {
        self.setBorder(usernameTextField)
        self.setBorder(pswTextField)
        self.rememberMeButton.layer.cornerRadius = rememberMeCornerRadius
        self.rememberMeButton.layer.borderWidth = 1.0
        self.rememberMeButton.layer.borderColor = brownColor.cgColor
        self.rememberMeButton.backgroundColor = UIColor.clear
        self.loginButton.layer.cornerRadius = textFieldCornerRadius
        rememberMeButton.backgroundColor = UIColor.lightGray
    }
    
    func setBorder(_ textfield: UITextField) {
        textfield.layer.cornerRadius = textFieldCornerRadius
        textfield.layer.borderWidth = 1.5
        textfield.layer.borderColor = brownColor.cgColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: textfield.frame.size.height))
        textfield.leftView = paddingView
        textfield.leftViewMode = UITextField.ViewMode.always
        textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "",
                                                               attributes: [NSAttributedString.Key.foregroundColor: brownColor])
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func rememberMeAction(_ sender: UIButton) {
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

extension LoginViewController: UITextFieldDelegate {
    //let keyboardHeight: CGFloat = 250.0
    func getYPosition(_ subView: UIView) -> CGFloat {
        let frame = self.view.convert(subView.frame, from: self.view)
        let normalHeight = self.view.frame.height - keyboardHeight
        if (frame.origin.y > normalHeight) {
            let y = frame.origin.y - normalHeight
            return y
        }
        return 0
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let yAxis = self.getYPosition(textField)
        UIView.animate(withDuration: 0.5) {
            self.view.frame = CGRect(x: 0, y: -yAxis, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 0.5) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
        return true
    }
}
