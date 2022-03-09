import UIKit

final class CategoriesTableViewCell: UITableViewCell {
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Авто"
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let unsubscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отписаться", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.layer.cornerRadius = 6.0
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
        unsubscribeButton.addTarget(self, action: #selector(tapUnsubscribe), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoriesTableViewCell {
    private func setupView() {
        contentView.addSubview(categoryImageView)
        NSLayoutConstraint.activate([
            categoryImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15.0),
            categoryImageView.widthAnchor.constraint(equalToConstant: contentView.frame.size.height - 5.0),
            categoryImageView.heightAnchor.constraint(equalTo: categoryImageView.widthAnchor)
        ])
        
        contentView.addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryLabel.leftAnchor.constraint(equalTo: categoryImageView.rightAnchor, constant: 15.0)
        ])
        
        contentView.addSubview(unsubscribeButton)
        NSLayoutConstraint.activate([
            unsubscribeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            unsubscribeButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15.0),
            unsubscribeButton.widthAnchor.constraint(equalToConstant: 125.0),
            unsubscribeButton.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    @objc private func tapUnsubscribe() {
        print("Tapped subscribe")
    }
}
