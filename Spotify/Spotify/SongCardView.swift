//
//  SongCardView.swift
//  Spotify
//
//  Created by Ammad Gulazr on 10/07/2024.
//

import UIKit

class SongCardView: UIViewController {
    var playbtn: UIImage {
        return UIImage(systemName: "play.circle.fill") ?? UIImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func createHardcodedCard(with metadata: SongMetadata , HomeGreenCoverCo : NSLayoutYAxisAnchor ) {
            // Example hardcoded card setup
            let cardView = UIView()
            cardView.translatesAutoresizingMaskIntoConstraints = false
            cardView.backgroundColor = .clear
            cardView.layer.cornerRadius = 8
            view.addSubview(cardView)
            
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
        playButton.tintColor = UIColor(hex: "#414141")
        
        // Add target action
        playButton.addTarget(self, action: #selector(gotoSongPlayer), for: .touchUpInside)
        
            // Add action for play button if needed
            cardView.addSubview(playButton)
            
            
            // Constraints for card view and subviews
            NSLayoutConstraint.activate([
                // Card View Constraints
                cardView.topAnchor.constraint(equalTo: HomeGreenCoverCo , constant: 20),
                cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
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
                
                playButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -60),
                playButton.trailingAnchor.constraint(equalTo: albumArtImageView.trailingAnchor, constant: -20),
                
            ])
    }
    @objc func gotoSongPlayer(_ sender: UIButton) {
            let selectedSong = songs[sender.tag]
//            print(selectedSong)
            let songPlayerVC = SongPlayer()
            songPlayerVC.song = selectedSong
            navigationController?.pushViewController(songPlayerVC, animated: true)
        }

}
