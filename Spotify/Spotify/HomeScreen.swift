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
    var GreenHomeCover1: UIImage {
        return UIImage(named: "GreenHomeCoverImage") ?? UIImage()
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
        HomeGreenCover.heightAnchor.constraint(equalToConstant: 120),
                   
               ])
        
        
        // Create a wrapper view inside HomeGreenCover for subviews that need to be clipped
               let wrapperView = UIView()
               wrapperView.translatesAutoresizingMaskIntoConstraints = false
               wrapperView.clipsToBounds = true // Set to true to clip subviews
               HomeGreenCover.addSubview(wrapperView)
               
               // Set constraints for wrapperView
               NSLayoutConstraint.activate([
                   wrapperView.leadingAnchor.constraint(equalTo: HomeGreenCover.leadingAnchor),
                   wrapperView.trailingAnchor.constraint(equalTo: HomeGreenCover.trailingAnchor),
                   wrapperView.topAnchor.constraint(equalTo: HomeGreenCover.topAnchor),
                   wrapperView.bottomAnchor.constraint(equalTo: HomeGreenCover.bottomAnchor)
               ])
        
        
        
        
        
        //        UPWAVE
        
              let UpWave = UIImageView()
              UpWave.translatesAutoresizingMaskIntoConstraints = false
              UpWave.contentMode = .scaleAspectFit // Adjust content mode as needed
              UpWave.image = self.UpWave // Use self.UpWaveImage to refer to the computed property
              UpWave.transform = CGAffineTransform(rotationAngle: CGFloat(28) * CGFloat.pi / 180)

            wrapperView.addSubview(UpWave)
              
              // Set constraints for UpWave within HomeGreenCover
              NSLayoutConstraint.activate([
                  UpWave.topAnchor.constraint(equalTo: HomeGreenCover.topAnchor, constant: -45),
                  UpWave.trailingAnchor.constraint(equalTo: HomeGreenCover.trailingAnchor, constant: 50),
                  UpWave.widthAnchor.constraint(equalToConstant: 165),
                  UpWave.heightAnchor.constraint(equalToConstant: 158)
              ])
        
        //        GreenHomeCover1
        
              let GreenHomeCover1 = UIImageView()
        GreenHomeCover1.translatesAutoresizingMaskIntoConstraints = false
        GreenHomeCover1.contentMode = .scaleAspectFit // Adjust content mode as needed
        GreenHomeCover1.image = self.GreenHomeCover1 // Use self.UpWaveImage to refer to the computed property
       

        HomeGreenCover.addSubview(GreenHomeCover1)
              
              // Set constraints for UpWave within HomeGreenCover
              NSLayoutConstraint.activate([
                GreenHomeCover1.bottomAnchor.constraint(equalTo: HomeGreenCover.bottomAnchor, constant: 1),
                GreenHomeCover1.trailingAnchor.constraint(equalTo: HomeGreenCover.trailingAnchor, constant: -30),
                GreenHomeCover1.widthAnchor.constraint(equalToConstant: 325),
                GreenHomeCover1.heightAnchor.constraint(equalToConstant: 183)
              ])
        
        //HomeGreenCoverLable1
        let HomeGreenCoverLable1 = UILabel()
        HomeGreenCoverLable1.translatesAutoresizingMaskIntoConstraints = false
        HomeGreenCoverLable1.text = " New Album"
        HomeGreenCoverLable1.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        HomeGreenCoverLable1.textAlignment = .center
        HomeGreenCoverLable1.textColor = UIColor(hex: "#FBFBFB")
        HomeGreenCover.addSubview(HomeGreenCoverLable1)
        
        NSLayoutConstraint.activate([
            HomeGreenCoverLable1.topAnchor.constraint(equalTo: HomeGreenCover.topAnchor, constant: 21),
            HomeGreenCoverLable1.leadingAnchor.constraint(equalTo: HomeGreenCover.leadingAnchor, constant: 19),
        
        ])
        
        
        //HomeGreenCoverLable2
        let HomeGreenCoverLable2 = UILabel()
        HomeGreenCoverLable2.translatesAutoresizingMaskIntoConstraints = false
        HomeGreenCoverLable2.text = "Happier Than Ever"
        HomeGreenCoverLable2.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        HomeGreenCoverLable2.numberOfLines = 0
        HomeGreenCoverLable2.textAlignment = .left
        HomeGreenCoverLable2.textColor = UIColor(hex: "#FBFBFB")
        HomeGreenCover.addSubview(HomeGreenCoverLable2)
        
        NSLayoutConstraint.activate([
            HomeGreenCoverLable2.topAnchor.constraint(equalTo: HomeGreenCoverLable1.bottomAnchor, constant: 5),
            HomeGreenCoverLable2.leadingAnchor.constraint(equalTo: HomeGreenCoverLable1.leadingAnchor, constant: 0),
            HomeGreenCoverLable2.widthAnchor.constraint(equalToConstant: 166)
        ])
        
        
        //HomeGreenCoverLable3
        let HomeGreenCoverLable3 = UILabel()
        HomeGreenCoverLable3.translatesAutoresizingMaskIntoConstraints = false
        HomeGreenCoverLable3.text = "Billie Eilish"
        HomeGreenCoverLable3.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        HomeGreenCoverLable3.textAlignment = .left
        HomeGreenCoverLable3.textColor = UIColor(hex: "#FBFBFB")
        HomeGreenCover.addSubview(HomeGreenCoverLable3)
        
        NSLayoutConstraint.activate([
            HomeGreenCoverLable3.topAnchor.constraint(equalTo: HomeGreenCoverLable2.bottomAnchor, constant: 5),
            HomeGreenCoverLable3.leadingAnchor.constraint(equalTo: HomeGreenCoverLable2.leadingAnchor, constant: 0),
           
        
        ])
        
        
        

        
    }
    @objc func gotoSignInForm(){
        let SignInFormScreen = SignInForm()
        navigationController?.pushViewController(SignInFormScreen, animated: true)
    }

   

}
