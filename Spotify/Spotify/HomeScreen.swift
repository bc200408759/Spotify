//
//  HomeScreen.swift
//  Spotify
//
//  Created by Ammad Gulazr on 09/07/2024.
//

import UIKit

class HomeScreen: UIViewController {

    var returnBtn: UIImage {
        return UIImage(systemName: "arrowshape.backward.circle") ?? UIImage()
    }
    
    var spotifyLogo: UIImage {
        return UIImage(named: "spotify") ?? UIImage()
    }
    
    var UpWave: UIImage {
        return UIImage(named: "UpWave") ?? UIImage()
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
                returnbtn.addTarget(self, action: #selector(gotoSignInForm), for: .touchUpInside)
                
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
        
        
        // Create the container view
               let HomeGreenCover = UIView()
               HomeGreenCover.translatesAutoresizingMaskIntoConstraints = false
               HomeGreenCover.backgroundColor = UIColor(hex: "#42C83C") // Green background
        HomeGreenCover.layer.cornerRadius = 30
               
               view.addSubview(HomeGreenCover)
               
               // Set constraints
               NSLayoutConstraint.activate([
                   HomeGreenCover.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   HomeGreenCover.topAnchor.constraint(equalTo: spotifyLogo.bottomAnchor, constant: 20),
                   HomeGreenCover.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
                   HomeGreenCover.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
                   HomeGreenCover.heightAnchor.constraint(equalToConstant: 120)
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
       
        
        
    }
    @objc func gotoSignInForm(){
        let SignInFormScreen = SignInForm()
        navigationController?.pushViewController(SignInFormScreen, animated: true)
    }

   

}
