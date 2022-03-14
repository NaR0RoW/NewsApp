import UIKit

final class AuthBannerView: UIView {
    private let authBannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let authBannerTitle: UILabel = {
        let label = UILabel()
        label.text = "Авторизуйтесь"
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let authBannerSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Чтобы синхронизировать свои подписки"
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
        configureAuthImageView()
        configureAuthTitle()
        configureAuthSubTitle()
    }
    
    private func configureAuthImageView() {
        addSubview(authBannerImageView)
        NSLayoutConstraint.activate([
            authBannerImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15.0),
            authBannerImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15.0),
            authBannerImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15.0),
            authBannerImageView.widthAnchor.constraint(equalTo: authBannerImageView.heightAnchor)
        ])
    }
    
    private func configureAuthTitle() {
        addSubview(authBannerTitle)
        NSLayoutConstraint.activate([
            authBannerTitle.topAnchor.constraint(equalTo: topAnchor, constant: 15.0),
            authBannerTitle.leftAnchor.constraint(equalTo: authBannerImageView.rightAnchor, constant: 15.0),
            authBannerTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -15.0)
        ])
    }
    
    private func configureAuthSubTitle() {
        addSubview(authBannerSubTitle)
        NSLayoutConstraint.activate([
            authBannerSubTitle.topAnchor.constraint(equalTo: authBannerTitle.bottomAnchor, constant: 5.0),
            authBannerSubTitle.leftAnchor.constraint(equalTo: authBannerImageView.rightAnchor, constant: 15.0),
            authBannerSubTitle.rightAnchor.constraint(equalTo: authBannerTitle.rightAnchor, constant: -15.0),
            authBannerSubTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15.0)
        ])
    }
}

