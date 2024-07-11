import UIKit
import AVFoundation

class SongPlayer: UIViewController {
    var audioPlayer: AVAudioPlayer?
    var progressTimer: Timer?
    var song: SongMetadata?
    // UI Components
    let timerLabel = UILabel()
    let remainingTimeLabel = UILabel()
    let playbtn = UIImage(systemName: "pause.fill")
    var returnBtn: UIImage {
        return UIImage(systemName: "arrowshape.backward.circle") ?? UIImage()
    }
    let returnbtn = UIButton(type: .system)
    let playButton = UIButton(type: .system)
    let pauseButton = UIButton(type: .system)
    let progressBar = UISlider()
    let TitleLable = UILabel()
    let PlayingNowLable = UILabel()
    let albumArtImageView = UIImageView()
    let ArtistLable = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .clear 
        setupUI(song : song)
        guard let song = song else { return }
        
        
        // Add target action
        returnbtn.addTarget(self, action: #selector(gotoHomeScreen), for: .touchUpInside)
        playAudioFile(named: song.audioFile)
        
        // Add target for the progress bar
            progressBar.addTarget(self, action: #selector(progressBarChanged(_:)), for: .valueChanged)
        
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
        ArtistLable.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        ArtistLable.textAlignment = .center
        ArtistLable.numberOfLines = 0
        ArtistLable.textColor = UIColor(hex: "#404040")
        ArtistLable.setLineHeight(lineHeight: 24)
        view.addSubview(ArtistLable)
        
        // Play button
        
        
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setImage(playbtn, for: .normal)
        playButton.backgroundColor = UIColor(hex: "#42C83C")
        playButton.imageView?.contentMode = .scaleAspectFit
        playButton.contentMode = .scaleAspectFit
        playButton.layer.cornerRadius = 45
        playButton.tintColor = UIColor(hex: "#ffffff")
        view.addSubview(playButton)
            
        
        // Progress slider
        progressBar.minimumValue = 0
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        // Customize progress bar color
        progressBar.minimumTrackTintColor = UIColor(hex: "#434343")
   
        progressBar.thumbTintColor = UIColor(hex: "#5C5C5C")
        
        view.addSubview(progressBar)
            
        // Add timer label
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.font = UIFont.systemFont(ofSize: 14)
        timerLabel.textColor = .black
        timerLabel.text = "0:00"
            view.addSubview(timerLabel)
        // Add remaining timer label
        remainingTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        remainingTimeLabel.font = UIFont.systemFont(ofSize: 14)
        remainingTimeLabel.textColor = .black
        remainingTimeLabel.text = "0:00"
        view.addSubview(remainingTimeLabel)

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
                
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        playButton.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -110),
        playButton.widthAnchor.constraint(equalToConstant: 90),
        playButton.heightAnchor.constraint(equalToConstant: 90),
        
        TitleLable.leadingAnchor.constraint(equalTo: albumArtImageView.leadingAnchor , constant: 0),
        TitleLable.topAnchor.constraint(equalTo: albumArtImageView.bottomAnchor, constant: 20),
           
        ArtistLable.leadingAnchor.constraint(equalTo: TitleLable.leadingAnchor , constant: 0),
        ArtistLable.topAnchor.constraint(equalTo: TitleLable.bottomAnchor, constant: 10),
           
        progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        progressBar.topAnchor.constraint(equalTo: ArtistLable.bottomAnchor, constant: 56),
            
        timerLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 8),
        timerLabel.leadingAnchor.constraint(equalTo: progressBar.leadingAnchor),
        
        remainingTimeLabel.topAnchor.constraint(equalTo: timerLabel.topAnchor, constant: 0),
        remainingTimeLabel.trailingAnchor.constraint(equalTo: progressBar.trailingAnchor, constant: -10)
        ])
        
        }

    @objc func playButtonTapped() {
        
        updatePlayPauseButton()
        if audioPlayer?.isPlaying == true {
            pauseSong()
        } else {
            // Resume playback if audioPlayer is initialized and paused
            if let player = audioPlayer, player.currentTime > 0 {
                player.play()
                startProgressTimer()
            } else {
                playAudioFile(named: "Jhol")
            }
        }
        
    }
    
    func updatePlayPauseButton() {
        if audioPlayer?.isPlaying == true {
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
           
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }

  
    func playAudioFile(named songName: String) {
        guard let url = Bundle.main.url(forResource: songName, withExtension: "mp3") else {
            print("Audio file not found")
            return
        }
        do {
            if audioPlayer == nil {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
            }
            audioPlayer?.play()
            // Set up the progress bar maximum value
            progressBar.maximumValue = Float(audioPlayer?.duration ?? 0)
            // Start a new timer
            startProgressTimer()
            
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }

    func startProgressTimer() {
        // Invalidate the previous timer if any
        progressTimer?.invalidate()
        
        // Start a new timer
        progressTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgressBar), userInfo: nil, repeats: true)
    }
    
    func formatTime(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }

    @objc func updateProgressBar() {
        guard let currentTime = audioPlayer?.currentTime else { return }
        guard let duration = audioPlayer?.duration else { return }
        
        progressBar.value = Float(currentTime)
        timerLabel.text = formatTime(time: currentTime)
        remainingTimeLabel.text = formatTime(time: duration - currentTime)
    }
    
    
    @objc func progressBarChanged(_ sender: UISlider) {
        audioPlayer?.currentTime = TimeInterval(sender.value)
        
        // If the player was paused, start playing
        if audioPlayer?.isPlaying == false {
            audioPlayer?.play()
            startProgressTimer()
        }
    }

    @objc func pauseSong() {
        audioPlayer?.pause()
        progressTimer?.invalidate()
    }
    @objc func sliderValueChanged() {
           if let audioPlayer = audioPlayer {
               audioPlayer.currentTime = TimeInterval(progressBar.value) * audioPlayer.duration
           }
       }
       deinit {
           progressTimer?.invalidate()
       }
    @objc func gotoHomeScreen(){
        let SignInFormScreen = HomeScreen()
        navigationController?.pushViewController(SignInFormScreen, animated: true)
    }
}
