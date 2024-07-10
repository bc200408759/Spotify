import UIKit

class SongCardView: UIView {
    
    // Properties for UI elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2 // Allows multiple lines if needed
        return label
    }()

    private let artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()

    private let albumArtImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8 // Rounded corners for aesthetics
        return imageView
    }()

    private let playButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        button.tintColor = .systemGreen
        // Add target and action for play button if needed
        return button
    }()
    
    // Initialization and setup methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Add subviews and set up constraints
        addSubview(albumArtImageView)
        addSubview(titleLabel)
        addSubview(artistLabel)
        addSubview(playButton)
        
        
        // Set up Auto Layout constraints
           NSLayoutConstraint.activate([
               // Album Art Image View Constraints
               albumArtImageView.topAnchor.constraint(equalTo: topAnchor),
               albumArtImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
               albumArtImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
               albumArtImageView.heightAnchor.constraint(equalToConstant: 120), // Adjust height as needed
               
               // Title Label Constraints
               titleLabel.topAnchor.constraint(equalTo: albumArtImageView.bottomAnchor, constant: 8),
               titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
               titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
               
               // Artist Label Constraints
               artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
               artistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
               artistLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
               
               // Play Button Constraints
               playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
               playButton.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 8),
               playButton.widthAnchor.constraint(equalToConstant: 29),
               playButton.heightAnchor.constraint(equalToConstant: 29)
           ])
        
        
        // Debug prints
               print("SongCardView setupViews() called")
               print("Constraints activated")
        
    }
    
    // Configure method to set data
    func configure(with metadata: SongMetadata) {
        titleLabel.text = metadata.title
        artistLabel.text = metadata.artist
        albumArtImageView.image = UIImage(named: metadata.albumArt)
        // Set up play button action if needed
        // Example: playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        // Debug prints
              print("SongCardView configured with song: \(metadata.title)")
    }
    
    // Action method for play button if needed
    @objc private func playButtonTapped() {
        // Implement play button action
        // Debug prints
              print("Play button tapped")
    }
}
