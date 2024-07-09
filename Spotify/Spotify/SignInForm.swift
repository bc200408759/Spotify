////
////  SignInForm.swift
////  Spotify
////
////  Created by Ammad Gulazr on 09/07/2024.
////

import UIKit

class SignInForm: UIViewController {
    
    var returnBtn: UIImage {
        return UIImage(systemName: "arrowshape.backward.circle") ?? UIImage()
    }
    
    var spotifyLogo: UIImage {
        return UIImage(named: "spotify") ?? UIImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F2F2F2")
        

        
        // Return Button
                let returnbtn = UIButton(type: .system)
                returnbtn.translatesAutoresizingMaskIntoConstraints = false
                returnbtn.setImage(returnBtn, for: .normal)
                returnbtn.tintColor = UIColor(hex: "#414141")
                
                // Add target action
                returnbtn.addTarget(self, action: #selector(gotoStartScreen), for: .touchUpInside)
                
                view.addSubview(returnbtn)
                
                NSLayoutConstraint.activate([
                    returnbtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
                    returnbtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
                    returnbtn.widthAnchor.constraint(equalToConstant: 32),
                    returnbtn.heightAnchor.constraint(equalToConstant: 32)
                ])
        
        
        
        
        
        // Spotify Logo
        let spotifyLogo = UIImageView()
        spotifyLogo.translatesAutoresizingMaskIntoConstraints = false
        spotifyLogo.contentMode = .scaleAspectFit // Adjust content mode as needed
        spotifyLogo.image = self.spotifyLogo // Use self.spotifyLogo to refer to the computed property
        
        view.addSubview(spotifyLogo)
        
        NSLayoutConstraint.activate([
            spotifyLogo.topAnchor.constraint(equalTo: returnbtn.topAnchor, constant: 0),
            spotifyLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            spotifyLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            spotifyLogo.widthAnchor.constraint(equalToConstant: 108),
            spotifyLogo.heightAnchor.constraint(equalToConstant: 33)
        ])
        
        //Sign in Label
        let SignInLabel = UILabel()
        SignInLabel.translatesAutoresizingMaskIntoConstraints = false
        SignInLabel.text = "Sign In"
        SignInLabel.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        SignInLabel.textAlignment = .center
        view.addSubview(SignInLabel)
        
        NSLayoutConstraint.activate([
            SignInLabel.topAnchor.constraint(equalTo: spotifyLogo.bottomAnchor, constant: 108),
            SignInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            SignInLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Support Label with Link
        let supportLabel = UILabel()
        supportLabel.translatesAutoresizingMaskIntoConstraints = false
        let supportText = "If you need any support, "
        let linkText = "click here"
        let attributedString = NSMutableAttributedString(string: supportText + linkText)
        
        // Make "click here" clickable
        let linkRange = (supportText + linkText).nsRange(of: linkText)
        attributedString.addAttribute(.link, value: "https://spotify.com", range: linkRange)
        attributedString.addAttribute(.foregroundColor, value:UIColor(hex: "#42C83C"),range:linkRange)
        print(attributedString)
        supportLabel.attributedText = attributedString
        supportLabel.textAlignment = .center
        supportLabel.numberOfLines = 0 // Allow multiple lines if needed
        view.addSubview(supportLabel)
        
        NSLayoutConstraint.activate([
            supportLabel.topAnchor.constraint(equalTo: SignInLabel.bottomAnchor, constant: 50),
            supportLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            supportLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Enable user interaction for clickable link
        supportLabel.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapOnLink(_:)))
        supportLabel.addGestureRecognizer(tapGestureRecognizer)
        
        
        // Username Text Field
                let usernameField = UITextField()
                usernameField.translatesAutoresizingMaskIntoConstraints = false
                var borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        

                usernameField.placeholder = "Enter Username Or Email"
                usernameField.borderStyle = .roundedRect
                view.addSubview(usernameField)
                
        
        usernameField.layer.borderColor = borderColor.cgColor
        usernameField.layer.borderWidth = 1.0
        usernameField.layer.cornerRadius = 30.0// Optional: round corners for aesthetics
        
        // Set padding
        var paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 27, height: usernameField.frame.height))
        usernameField.leftView = paddingView
        usernameField.leftViewMode = .always
        
        // Disable default border style and ensure clear background
        usernameField.borderStyle = .none
        usernameField.backgroundColor = .clear
        
                NSLayoutConstraint.activate([
                    usernameField.topAnchor.constraint(equalTo: supportLabel.bottomAnchor, constant: 44),
                    usernameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                    usernameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                    usernameField.heightAnchor.constraint(equalToConstant: 80),
                    
                ])
        
        
        
        // password Text Field
                let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
                borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        

        password.placeholder = "Enter Password"
        password.borderStyle = .roundedRect
                view.addSubview(password)
                
        
        password.layer.borderColor = borderColor.cgColor
        password.layer.borderWidth = 1.0
        password.layer.cornerRadius = 30.0// Optional: round corners for aesthetics
        
        // Set padding
        paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 27, height: usernameField.frame.height))
        password.leftView = paddingView
        password.leftViewMode = .always
        
        // Disable default border style and ensure clear background
        password.borderStyle = .none
        password.backgroundColor = .clear
        
                NSLayoutConstraint.activate([
                    password.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 14),
                    password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                    password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                    password.heightAnchor.constraint(equalToConstant: 80),
                    
                ])
        
//        Forget password lable
        
        let ForgetLable = UILabel()
        ForgetLable.translatesAutoresizingMaskIntoConstraints = false
        ForgetLable.text = "Forget Password"
        ForgetLable.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        ForgetLable.textAlignment = .center
        view.addSubview(ForgetLable)
        
        NSLayoutConstraint.activate([
            ForgetLable.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20),
            ForgetLable.leadingAnchor.constraint(equalTo: password.leadingAnchor, constant: 27),
            
        ])
        
//        SIgnIn Button
        
        // Button
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Sign In", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor(hex: "#42C83C")
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(gotoHomeScreen), for: .touchUpInside)
            button.layer.cornerRadius = 30.0 // Optional: round corners for aesthetics
           // button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
            
            view.addSubview(button)
            
            // Add constraints for button
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: ForgetLable.bottomAnchor, constant: 20),
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.widthAnchor.constraint(equalToConstant: view.frame.size.width-80),
                button.heightAnchor.constraint(equalToConstant: 80)
            ])
        
        
        
        // Break Line with Label
        let breakLineView = UIView()
        breakLineView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(breakLineView)
        
        let leftLine = UIView()
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        leftLine.backgroundColor = UIColor(hex: "#B0B0B0")
        breakLineView.addSubview(leftLine)
        
        let rightLine = UIView()
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        rightLine.backgroundColor = UIColor(hex: "#B0B0B0")
        breakLineView.addSubview(rightLine)
        
        let breakLineLabel = UILabel()
        breakLineLabel.translatesAutoresizingMaskIntoConstraints = false
        breakLineLabel.text = "or"
        breakLineLabel.textColor = UIColor(hex: "#383838")
        breakLineLabel.textAlignment = .center
        breakLineView.addSubview(breakLineLabel)
        
        NSLayoutConstraint.activate([
            breakLineView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            breakLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            breakLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            breakLineView.heightAnchor.constraint(equalToConstant: 20),
            
            leftLine.leadingAnchor.constraint(equalTo: breakLineView.leadingAnchor),
            leftLine.trailingAnchor.constraint(equalTo: breakLineLabel.leadingAnchor, constant: -10),
            leftLine.centerYAnchor.constraint(equalTo: breakLineView.centerYAnchor),
            leftLine.heightAnchor.constraint(equalToConstant: 1),
            
            rightLine.leadingAnchor.constraint(equalTo: breakLineLabel.trailingAnchor, constant: 10),
            rightLine.trailingAnchor.constraint(equalTo: breakLineView.trailingAnchor),
            rightLine.centerYAnchor.constraint(equalTo: breakLineView.centerYAnchor),
            rightLine.heightAnchor.constraint(equalToConstant: 1),
            
            breakLineLabel.centerXAnchor.constraint(equalTo: breakLineView.centerXAnchor),
            breakLineLabel.centerYAnchor.constraint(equalTo: breakLineView.centerYAnchor)
        ])
        
       
        
        // Google Logo
        let googleLogo = UIImageView()
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
        googleLogo.contentMode = .scaleAspectFit
        googleLogo.image = UIImage(named: "google") // Ensure the image is added to your assets
       // googleLogo.backgroundColor = .red
        view.addSubview(googleLogo)

        // Apple Logo
        let appleLogo = UIImageView()
        appleLogo.translatesAutoresizingMaskIntoConstraints = false
        appleLogo.contentMode = .scaleAspectFit
        appleLogo.image = UIImage(named: "apple") // Ensure the image is added to your assets
       // appleLogo.backgroundColor = .red
        view.addSubview(appleLogo)

        // Constraints for logos
        NSLayoutConstraint.activate([
            googleLogo.bottomAnchor.constraint(equalTo: breakLineView.bottomAnchor, constant: 70),
            googleLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
            googleLogo.widthAnchor.constraint(equalToConstant: 27.99),
            googleLogo.heightAnchor.constraint(equalToConstant: 28.64),

            
            appleLogo.bottomAnchor.constraint(equalTo: googleLogo.bottomAnchor, constant: 0),
//            appleLogo.bottomAnchor.constraint(equalTo: breakLineView.bottomAnchor),
            appleLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
            appleLogo.widthAnchor.constraint(equalToConstant: 29),
           appleLogo.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        
        
        // "Not a member? Register now" Label
        let registerLabel = UILabel()
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        let registerText = "Not a member? "
        let registerLinkText = "Register now"
        let registerAttributedString = NSMutableAttributedString(string: registerText + registerLinkText)

        // Make "Register now" clickable
        let registerLinkRange = (registerText + registerLinkText).nsRange(of: registerLinkText)
        registerAttributedString.addAttribute(.link, value: "https://your-register-url.com", range: registerLinkRange)
        registerAttributedString.addAttribute(.foregroundColor, value: UIColor(hex: "#62CD5D"), range: registerLinkRange) // Set link color

        registerLabel.attributedText = registerAttributedString
        registerLabel.textAlignment = .center
        registerLabel.numberOfLines = 0 // Allow multiple lines if needed
        view.addSubview(registerLabel)

        // Constraints for registerLabel
        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: googleLogo.bottomAnchor, constant: 50),
            registerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
    
    @objc func handleTapOnLink(_ gesture: UITapGestureRecognizer) {
           guard let url = URL(string: "https://your-support-url.com") else { return }
           UIApplication.shared.open(url, options: [:], completionHandler: nil)
       }
    
    
    
    @objc func gotoStartScreen(){
        let SignInFormScreen = StartScreen()
        navigationController?.pushViewController(SignInFormScreen, animated: true)
    }
    
    @objc func gotoHomeScreen(){
        let SignInFormScreen = HomeScreen()
        navigationController?.pushViewController(SignInFormScreen, animated: true)
    }
    
}
// Extension to get NSRange for Swift String
extension String {
    func nsRange(of subString: String) -> NSRange {
        let nsString = self as NSString
        return nsString.range(of: subString)
    }
}

