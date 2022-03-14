import UIKit

final class ProfileTableViewCell: UITableViewCell {
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .label
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let moreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .label
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileTableViewCell {
    func configureCell(with viewModel: ProfileTableViewCellViewModel) {
        profileImageView.image = viewModel.profileImage
        profileLabel.text = viewModel.profileName
    }
    
    private func configureView() {
        contentView.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15.0),
            profileImageView.widthAnchor.constraint(equalToConstant: contentView.frame.size.height / 1.5),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor)
        ])
        
        contentView.addSubview(profileLabel)
        NSLayoutConstraint.activate([
            profileLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 15.0)
        ])
        
        contentView.addSubview(moreImageView)
        NSLayoutConstraint.activate([
            moreImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            moreImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15.0)
        ])
    }
}
