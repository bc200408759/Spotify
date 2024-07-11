//
//  HomeScreen.swift
//  Spotify
//
//  Created by Ammad Gulazr on 09/07/2024.
//

import UIKit
import AVFoundation
import Firebase
import FirebaseFirestore


struct SongMetadata: Codable {
    let title: String
    let artist: String
    let albumArt: String
    let audioFile: String
}

class HomeScreen: UIViewController {
    
    
    var songs: [SongMetadata] = []
    

//
//     Load song metadata from JSON
//       lazy var songs: [SongMetadata] = {
//           guard let url = Bundle.main.url(forResource: "songMetadata", withExtension: "json"),
//                 let data = try? Data(contentsOf: url),
//                 let songs = try? JSONDecoder().decode([SongMetadata].self, from: data) else {
//               fatalError("Failed to load or decode song metadata")
//           }
//           return songs
//       }()
    
    var audioPlayer: AVAudioPlayer?
    var returnBtn: UIImage {
        return UIImage(systemName: "arrowshape.backward.circle") ?? UIImage()
    }
    var playbtn: UIImage {
        return UIImage(named: "CustomPlay") ?? UIImage()
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
    var xOffset : Int = 0
    var CalScrollWidth : Int = 0
    let SongCardsScrollView = UIScrollView()
    let SongCardsScrollViewContainer = UIView()
    
    
    
    
    override func viewDidLoad() {
        
        fetchSongsFromFirestore()
        
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F2F2F2")
        print("This is metaDAta : \(self.songs)")
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
        spotifyLogo.contentMode = .scaleAspectFit
        spotifyLogo.image = self.spotifyLogo
        
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
        
        // Createing a wrapper view inside HomeGreenCover for subviews that need to be clipped
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
        //UPWAVE
        
        let UpWave = UIImageView()
        UpWave.translatesAutoresizingMaskIntoConstraints = false
        UpWave.contentMode = .scaleAspectFit
        UpWave.image = self.UpWave
        UpWave.transform = CGAffineTransform(rotationAngle: CGFloat(-60) * CGFloat.pi / 180)
        wrapperView.addSubview(UpWave)
              
        // Set constraints for UpWave within HomeGreenCover
        NSLayoutConstraint.activate([
            UpWave.topAnchor.constraint(equalTo: HomeGreenCover.topAnchor, constant: -45),
            UpWave.trailingAnchor.constraint(equalTo: HomeGreenCover.trailingAnchor, constant: 50),
            UpWave.widthAnchor.constraint(equalToConstant: 165),
            UpWave.heightAnchor.constraint(equalToConstant: 158)
            ])
        
        //GreenHomeCover1
        
        let GreenHomeCover1 = UIImageView()
        GreenHomeCover1.translatesAutoresizingMaskIntoConstraints = false
        GreenHomeCover1.contentMode = .scaleAspectFit
        GreenHomeCover1.image = self.GreenHomeCover1
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
// Creating a scroll view
                
        SongCardsScrollView.translatesAutoresizingMaskIntoConstraints = false
//      SongCardsScrollView.backgroundColor = .black // Set background color to black
        self.view.addSubview(SongCardsScrollView)
        
// Creating a scroll view Container
                
        SongCardsScrollViewContainer.translatesAutoresizingMaskIntoConstraints = false
//      SongCardsScrollViewContainer.backgroundColor = .systemMint
        self.SongCardsScrollView.addSubview(SongCardsScrollViewContainer)
                        
                
        NSLayoutConstraint.activate([
        // Constraints for scroll view
        SongCardsScrollView.topAnchor.constraint(equalTo: HomeGreenCover.bottomAnchor , constant: 20 ),
        SongCardsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        SongCardsScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        SongCardsScrollView.heightAnchor.constraint(equalToConstant: 280),
        SongCardsScrollView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
        // Constraints for scroll view container
        SongCardsScrollViewContainer.topAnchor.constraint(equalTo: SongCardsScrollView.topAnchor),
        SongCardsScrollViewContainer.bottomAnchor.constraint(equalTo: SongCardsScrollView.bottomAnchor),
        SongCardsScrollViewContainer.leadingAnchor.constraint(equalTo: SongCardsScrollView.leadingAnchor),
        SongCardsScrollViewContainer.trailingAnchor.constraint(equalTo: SongCardsScrollView.trailingAnchor),
        SongCardsScrollViewContainer.heightAnchor.constraint(equalTo:SongCardsScrollView.heightAnchor ),
//      SongCardsScrollViewContainer.widthAnchor.constraint(equalTo: SongCardsScrollView.widthAnchor , multiplier: 2),
                ])
//Looping on the Songs Metadata to render Song Cards
        

            }
    
    
    
    @objc func gotoSongPlayer(_ sender: UIButton) {
            let selectedSong = songs[sender.tag]
//        print("This is sender : \(sender.tag)")
            let songPlayerVC = SongPlayer()
            songPlayerVC.song = selectedSong
            navigationController?.pushViewController(songPlayerVC, animated: true)
        }
    @objc func gotoSignInForm(){
        let SignInFormScreen = SignInForm()
        navigationController?.pushViewController(SignInFormScreen, animated: true)
    }
    
    
    
    

    
    
    
    func fetchSongsFromFirestore() {
        let db = Firestore.firestore()
        db.collection("songs").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                var fetchedSongs: [SongMetadata] = []
                for document in querySnapshot!.documents {
                    if let title = document.data()["title"] as? String,
                       let artist = document.data()["artist"] as? String,
                       let albumArt = document.data()["albumArt"] as? String,
                       let audioFile = document.data()["audioFile"] as? String {
                        
                        let song = SongMetadata(title: title, artist: artist, albumArt: albumArt, audioFile: audioFile)
                        fetchedSongs.append(song)
                    }
                }
                self.songs = fetchedSongs
                
                print("Fetched songs: \(self.songs)")
                self.updateUI()
                
            }
        }
        
    }

    
    func updateUI() {
        songs.enumerated().forEach { (index, song) in
            songCardView(with: song, scrollViewTopCo: SongCardsScrollViewContainer.topAnchor, scrollViewLeadingCo : SongCardsScrollViewContainer.leadingAnchor, index: index)
            xOffset += 160
            
        }
        
        xOffset += 20
        // Set the width of the scroll view container dynamically based on the total width required for all cards
        SongCardsScrollViewContainer.widthAnchor.constraint(equalToConstant: CGFloat(xOffset)).isActive = true
        
        func songCardView(with metadata: SongMetadata , scrollViewTopCo : NSLayoutYAxisAnchor , scrollViewLeadingCo : NSLayoutXAxisAnchor , index : Int) {
    //         CardView
                let cardView = UIView()
                cardView.translatesAutoresizingMaskIntoConstraints = false
                cardView.backgroundColor = .clear
                cardView.layer.cornerRadius = 8
                SongCardsScrollViewContainer.addSubview(cardView)
                
                // Album Art Image View
                let albumArtImageView = UIImageView()
                albumArtImageView.translatesAutoresizingMaskIntoConstraints = false
                albumArtImageView.contentMode = .scaleAspectFill
                albumArtImageView.clipsToBounds = true
                albumArtImageView.image = UIImage(named: metadata.albumArt)
                albumArtImageView.layer.cornerRadius = 30
                cardView.addSubview(albumArtImageView)
                
                // Title Label
                let titleLabel = UILabel()
                titleLabel.translatesAutoresizingMaskIntoConstraints = false
                titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
                titleLabel.textColor = .black
                titleLabel.textAlignment = .left
                titleLabel.numberOfLines = 2
                titleLabel.text = metadata.title
                cardView.addSubview(titleLabel)
                
                // Artist Label
                let artistLabel = UILabel()
                artistLabel.translatesAutoresizingMaskIntoConstraints = false
                artistLabel.font = UIFont.systemFont(ofSize: 14)
                artistLabel.textColor = .gray
                artistLabel.textAlignment = .left
                artistLabel.text = metadata.artist
                cardView.addSubview(artistLabel)
                
                // Play Button
                    let playButton = UIButton(type: .system)
                    playButton.translatesAutoresizingMaskIntoConstraints = false
                    playButton.setImage(playbtn, for: .normal)
                    playButton.tintColor = UIColor(hex: "#555555")
                    playButton.backgroundColor = UIColor(hex: "#E6E6E6")
                    playButton.tag = index
                    playButton.layer.cornerRadius = 15
            
                // Add target action
                    playButton.addTarget(self, action: #selector(gotoSongPlayer), for: .touchUpInside)
            
                // Add action for play button if needed
                    cardView.addSubview(playButton)
                
                
                // Constraints for card view and subviews
                    NSLayoutConstraint.activate([
                    // Card View Constraints
                        cardView.topAnchor.constraint(equalTo: scrollViewTopCo , constant: 20),
    //                cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                        cardView.leadingAnchor.constraint(equalTo: scrollViewLeadingCo , constant: CGFloat(20 + xOffset)),  // Adjust leading spacing and xOffset
                        cardView.widthAnchor.constraint(equalToConstant: 140),
                        cardView.heightAnchor.constraint(equalToConstant: 300),
                    
                    // Album Art Image View Constraints
                        albumArtImageView.topAnchor.constraint(equalTo: cardView.topAnchor),
                        albumArtImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
                        albumArtImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
                        albumArtImageView.heightAnchor.constraint(equalToConstant: 200),
                    
                    // Title Label Constraints
                        titleLabel.topAnchor.constraint(equalTo: albumArtImageView.bottomAnchor, constant: 8),
                        titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
                        titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
                    
                    // Artist Label Constraints
                        artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
                        artistLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
                        artistLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
                    
                    // Play Button Constraints
                    
                        playButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -45),
                        playButton.trailingAnchor.constraint(equalTo: albumArtImageView.trailingAnchor, constant: -10),
                        playButton.heightAnchor.constraint(equalToConstant: 30),
                        playButton.widthAnchor.constraint(equalToConstant: 30)
                    
                ])
        }
        
    }
    
}
