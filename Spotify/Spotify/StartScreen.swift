
////  StartScreen.swift
////  Spotify
////
////  Created by Ammad Gulazr on 09/07/2024.

import UIKit

class StartScreen: UIViewController {
    
 
    var spotifyLogo: UIImage {
        return UIImage(named: "SpotifyHome") ?? UIImage()
    }
    
    var DownWave: UIImage {
        return UIImage(named: "DownWave") ?? UIImage()
    }
    var HomeCover: UIImage {
        return UIImage(named: "HomeCover") ?? UIImage()
    }
    var UpWave: UIImage {
        return UIImage(named: "UpWave") ?? UIImage()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F2F2F2")
        
        

        navigationController?.navigationBar.tintColor = .clear // used transparent bacground to make default back button disappar
        
        
        

//        DownWave
        let DownWave = UIImageView()
        DownWave.translatesAutoresizingMaskIntoConstraints = false
        DownWave.contentMode = .scaleAspectFit // Adjust content mode as needed
        DownWave.image = self.DownWave // Use self.spotifyLogo to refer to the computed property
        DownWave.transform =  CGAffineTransform(rotationAngle: CGFloat(10) * CGFloat.pi / 180)
        view.addSubview(DownWave)
        
        NSLayoutConstraint.activate([
            DownWave.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100),
            DownWave.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 200),
          
            DownWave.widthAnchor.constraint(equalToConstant: 500),
            DownWave.heightAnchor.constraint(equalToConstant: 480)
        ])
     
// HomeCover
        let HomeCover = UIImageView()
        HomeCover.translatesAutoresizingMaskIntoConstraints = false
        HomeCover.contentMode = .scaleAspectFit // Adjust content mode as needed
        HomeCover.image = self.HomeCover // Use self.spotifyLogo to refer to the computed property
        HomeCover.transform =  CGAffineTransform(rotationAngle: CGFloat(0) * CGFloat.pi / 180)
        view.addSubview(HomeCover)
        
        NSLayoutConstraint.activate([
            HomeCover.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30),
            HomeCover.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -5),
            HomeCover.widthAnchor.constraint(equalToConstant: 452),
            HomeCover.heightAnchor.constraint(equalToConstant: 573)
        ])
//        UPWAVE
                let UpWave = UIImageView()
        UpWave.translatesAutoresizingMaskIntoConstraints = false
        UpWave.contentMode = .scaleAspectFit // Adjust content mode as needed
        UpWave.image = self.UpWave // Use self.spotifyLogo to refer to the computed property
        UpWave.transform =  CGAffineTransform(rotationAngle: CGFloat(-10) * CGFloat.pi / 180)
                view.addSubview(UpWave)
                
                NSLayoutConstraint.activate([
                    UpWave.topAnchor.constraint(equalTo: view.topAnchor, constant: -170),
                    UpWave.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100),
                  
                    UpWave.widthAnchor.constraint(equalToConstant: 364),
                    UpWave.heightAnchor.constraint(equalToConstant: 350)
                ])
        
        
        
        

        // Spotify Logo
        let spotifyLogo = UIImageView()
        spotifyLogo.translatesAutoresizingMaskIntoConstraints = false
        spotifyLogo.contentMode = .scaleAspectFit // Adjust content mode as needed
        spotifyLogo.image = self.spotifyLogo // Use self.spotifyLogo to refer to the computed property
        
        view.addSubview(spotifyLogo)
        
        NSLayoutConstraint.activate([
            spotifyLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            spotifyLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            spotifyLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
           
        ])
        
        //Home Label
        let HomeLable = UILabel()
        HomeLable.translatesAutoresizingMaskIntoConstraints = false
        HomeLable.text = " Enjoy Listening To Music"
        HomeLable.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        HomeLable.textAlignment = .center
        HomeLable.textColor = UIColor(hex: "#383838")
        view.addSubview(HomeLable)
        
        NSLayoutConstraint.activate([
            HomeLable.topAnchor.constraint(equalTo: spotifyLogo.bottomAnchor, constant: 50),
            HomeLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            HomeLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        //Home Lable2
        let HomeLable2 = UILabel()
        HomeLable2.translatesAutoresizingMaskIntoConstraints = false
        HomeLable2.text = " Spotify is a proprietary Swedish audio streaming and media services provider"
        HomeLable2.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        HomeLable2.textAlignment = .center
        HomeLable2.numberOfLines = 0
        HomeLable2.textColor = UIColor(hex: "#797979")
        HomeLable2.setLineHeight(lineHeight: 24)
        view.addSubview(HomeLable2)
        
        NSLayoutConstraint.activate([
            HomeLable2.topAnchor.constraint(equalTo: HomeLable.bottomAnchor, constant: 30),
            HomeLable2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            HomeLable2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        
        // Create Sign In Button
               let RegisterButton = UIButton(type: .system)
               RegisterButton.translatesAutoresizingMaskIntoConstraints = false
               RegisterButton.setTitle("Register", for: .normal)
               RegisterButton.titleLabel?.font = UIFont.systemFont(ofSize: 19)
               RegisterButton.setTitleColor(.white, for: .normal)
               RegisterButton.backgroundColor = UIColor(hex: "#42C83C") // Set background color
               RegisterButton.layer.cornerRadius = 30 // Rounded corners
               
               view.addSubview(RegisterButton)
               
               // Create Sign Up Button
               let signInButton = UIButton(type: .system)
               signInButton.translatesAutoresizingMaskIntoConstraints = false
               signInButton.setTitle("Sign in", for: .normal)
               signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 19)
               signInButton.setTitleColor(.black, for: .normal)
        signInButton.addTarget(self, action: #selector(gotoSignInScreen), for: .touchUpInside)
               signInButton.layer.cornerRadius = 30 // Rounded corners
               
               view.addSubview(signInButton)
        
        // Bring Sign In and Sign Up buttons to the front
                view.bringSubviewToFront(RegisterButton)
                view.bringSubviewToFront(signInButton)
            
        
        
        // Center constraints
              NSLayoutConstraint.activate([
                  // Register Button Constraints
                  RegisterButton.topAnchor.constraint(equalTo: HomeLable2.bottomAnchor, constant: 35), // Place below HomeLable2 with 35px margin
                  RegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -85), // Center button horizontally with offset
                  RegisterButton.widthAnchor.constraint(equalToConstant: 147), // Adjust width as needed
                  RegisterButton.heightAnchor.constraint(equalToConstant: 73), // Adjust height as needed
                  
                  // Sign In Button Constraints
                  signInButton.topAnchor.constraint(equalTo: HomeLable2.bottomAnchor, constant: 35), // Align top with RegisterButton
                  signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 85), // Center button horizontally with offset
                  signInButton.widthAnchor.constraint(equalToConstant: 147), // Adjust width as needed
                  signInButton.heightAnchor.constraint(equalToConstant: 73) // Adjust height as needed
              ])
          
        
        
        

        
    }
    
    //GOTO SignIn screen function

    @objc func gotoSignInScreen(){
        let SignInFormScreen = SignInForm()
        navigationController?.pushViewController(SignInFormScreen, animated: true)
    }
}





// Extension to convert hex color string to UIColor
extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

//Extension for linehight in lable
extension UILabel {
    func setLineHeight(lineHeight: CGFloat) {
        guard let labelText = text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight - font.lineHeight
        paragraphStyle.alignment = textAlignment
        
        let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        
        attributedText = attributedString
    }
}
