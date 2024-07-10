import UIKit
import AVFoundation

class SongPlayer: UIViewController {
    var audioPlayer: AVAudioPlayer?
    var timer: Timer?

    // UI Components
    var returnBtn: UIImage {
        return UIImage(systemName: "arrowshape.backward.circle") ?? UIImage()
    }
    let returnbtn = UIButton(type: .system)
    
    let playButton = UIButton(type: .system)
    let pauseButton = UIButton(type: .system)
    let progressSlider = UISlider()
    let TitleLable = UILabel()
    let PlayingNowLable = UILabel()
    let albumArtImageView = UIImageView()
    let ArtistLable = UILabel()
    var song: SongMetadata?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .clear // used transparent bacground to make default back button disappar
        setupUI(song : song)
        
        // Add target action
        returnbtn.addTarget(self, action: #selector(gotoHomeScreen), for: .touchUpInside)
        playAudioFile(named: "Jhol")
    }
    
    func setupUI(song : SongMetadata?) {
        
        print("Playing song:  by \(song!.artist)")
        
        // Return Button
                
        returnbtn.translatesAutoresizingMaskIntoConstraints = false
        returnbtn.setImage(returnBtn, for: .normal)
        returnbtn.tintColor = UIColor(hex: "#414141")
        view.addSubview(returnbtn)
                
        // PlayingNowLable
        PlayingNowLable.translatesAutoresizingMaskIntoConstraints = false
        PlayingNowLable.text = "Now Playing"
        PlayingNowLable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        PlayingNowLable.textAlignment = .center
        PlayingNowLable.numberOfLines = 0
        PlayingNowLable.textColor = .black
        PlayingNowLable.setLineHeight(lineHeight: 24)
        view.addSubview(PlayingNowLable)
        
        // Album Art Image View
       
        albumArtImageView.translatesAutoresizingMaskIntoConstraints = false
        albumArtImageView.contentMode = .scaleAspectFill
        albumArtImageView.clipsToBounds = true
        if let song = song{ albumArtImageView.image = UIImage(named: song.albumArt) }
        albumArtImageView.layer.cornerRadius = 30
        view.addSubview(albumArtImageView)
        
        //Title Lable
        
        TitleLable.translatesAutoresizingMaskIntoConstraints = false
        if let song = song { TitleLable.text = " \(song.title)"} else { print("No song selected")}
        TitleLable.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        TitleLable.textAlignment = .center
        TitleLable.numberOfLines = 0
        TitleLable.textColor = .black
        TitleLable.setLineHeight(lineHeight: 24)
        view.addSubview(TitleLable)
        
        //Artist Lable
        
        ArtistLable.translatesAutoresizingMaskIntoConstraints = false
        if let song = song { ArtistLable.text = " \(song.artist)"} else { print("No Artist selected")}
        ArtistLable.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        ArtistLable.textAlignment = .center
        ArtistLable.numberOfLines = 0
        ArtistLable.textColor = UIColor(hex: "#404040")
        ArtistLable.setLineHeight(lineHeight: 24)
        view.addSubview(ArtistLable)
        
        // Play button
        
        playButton.setTitle("Play", for: .normal)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playButton)
            
        // Pause button
        
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pauseButton)
            
        // Progress slider
        progressSlider.minimumValue = 0
        progressSlider.translatesAutoresizingMaskIntoConstraints = false
        progressSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        view.addSubview(progressSlider)
            
        // Layout constraints
        NSLayoutConstraint.activate([
                
        returnbtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
        returnbtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
        returnbtn.widthAnchor.constraint(equalToConstant: 32),
        returnbtn.heightAnchor.constraint(equalToConstant: 32),
                
        PlayingNowLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        PlayingNowLable.topAnchor.constraint(equalTo: returnbtn.topAnchor, constant: 5),

        albumArtImageView.topAnchor.constraint(equalTo: PlayingNowLable.topAnchor , constant: 50),
        albumArtImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 27),
        albumArtImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -27),
        albumArtImageView.heightAnchor.constraint(equalToConstant: 362),
                
//        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        
//        pauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        pauseButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 20),
                
        TitleLable.leadingAnchor.constraint(equalTo: albumArtImageView.leadingAnchor , constant: 0),
        TitleLable.topAnchor.constraint(equalTo: albumArtImageView.bottomAnchor, constant: 20),
           
        ArtistLable.leadingAnchor.constraint(equalTo: TitleLable.leadingAnchor , constant: 0),
        ArtistLable.topAnchor.constraint(equalTo: TitleLable.bottomAnchor, constant: 14),
           
        progressSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        progressSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        progressSlider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
            ])
        
        }

    func playAudioFile(named SongName: String) {
        guard let url = Bundle.main.url(forResource: SongName, withExtension: "mp3") else {
            print("Audio file not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    @objc func updateSlider() {
        if let audioPlayer = audioPlayer {
                let currentTime = Float(audioPlayer.currentTime)
                let duration = Float(audioPlayer.duration)
                
                // Update progress slider value based on current time and duration
                progressSlider.value = currentTime / duration  // Update time label with current time
               
            }
       }
    
    @objc func playButtonTapped() {
            if audioPlayer?.isPlaying == false {
                audioPlayer?.play()
            }
        }
        
        @objc func pauseButtonTapped() {
            if audioPlayer?.isPlaying == true {
                audioPlayer?.pause()
            }
        }
    
    @objc func sliderValueChanged() {
           if let audioPlayer = audioPlayer {
               audioPlayer.currentTime = TimeInterval(progressSlider.value) * audioPlayer.duration
           }
       }
       
       deinit {
           timer?.invalidate()
       }
    @objc func gotoHomeScreen(){
        let SignInFormScreen = HomeScreen()
        navigationController?.pushViewController(SignInFormScreen, animated: true)
    }
}
