import UIKit

final class SubscribeBannerView: UIView {
    private let subscribeBannerTitle: UILabel = {
        let label = UILabel()
        label.text = "Активируйте подписку"
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let subscribeBannerSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Получите доступ ко всем платным материалам и функциям приложения. Без рекламы."
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let subscribeContinueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6.0
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let subscribeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Calendar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureUI()
        configureSubviews()
    }
    
    private func configureUI() {
        backgroundColor = UIColor(white: 0.99, alpha: 1.0)
        layer.cornerRadius = 10.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = .zero
        layer.shadowRadius = 10.0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureSubviews() {
        configureSubscribeBannerTitle()
        configureSubscribeBannerSubTitle()
        configureSubscribeContinueButton()
        configureSubscribeImageView()
    }
    
    private func configureSubscribeBannerTitle() {
        addSubview(subscribeBannerTitle)
        NSLayoutConstraint.activate([
            subscribeBannerTitle.topAnchor.constraint(equalTo: topAnchor, constant: 15.0),
            subscribeBannerTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 15.0),
            subscribeBannerTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -15.0)
        ])
    }
    
    private func configureSubscribeBannerSubTitle() {
        addSubview(subscribeBannerSubTitle)
        NSLayoutConstraint.activate([
            subscribeBannerSubTitle.topAnchor.constraint(equalTo: subscribeBannerTitle.bottomAnchor, constant: 10.0),
            subscribeBannerSubTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 15.0),
            subscribeBannerSubTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -15.0)
        ])
    }
    
    private func configureSubscribeContinueButton() {
        addSubview(subscribeContinueButton)
        NSLayoutConstraint.activate([
            subscribeContinueButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15.0),
            subscribeContinueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15.0),
            subscribeContinueButton.widthAnchor.constraint(equalToConstant: 150.0)
        ])
    }
    
    private func configureSubscribeImageView() {
        addSubview(subscribeImageView)
        NSLayoutConstraint.activate([
            subscribeImageView.leftAnchor.constraint(equalTo: subscribeContinueButton.rightAnchor, constant: 15.0),
            subscribeImageView.rightAnchor.constraint(equalTo: rightAnchor),
            subscribeImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            subscribeImageView.heightAnchor.constraint(equalToConstant: 110.0)
        ])
    }
}
