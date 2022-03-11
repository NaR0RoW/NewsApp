import UIKit

protocol CategoriesTableViewCellDelegate: AnyObject {
    func categoriesTableViewCellDelegate(_ cell: CategoriesTableViewCell, didTapWith viewModel: CategoriesTableViewCellViewModel)
}

final class CategoriesTableViewCell: UITableViewCell {
    weak var delegate: CategoriesTableViewCellDelegate?
    
    private var viewModel: CategoriesTableViewCellViewModel?
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let unsubscribeButton: UIButton = {
        let button = UIButton()
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
    func configureCell(with viewModel: CategoriesTableViewCellViewModel) {
        self.viewModel = viewModel
        categoryImageView.image = viewModel.categoryImage
        categoryLabel.text = viewModel.categoryName
        
        if viewModel.categoryFollowStatus {
            unsubscribeButton.setTitle("Отписаться", for: .normal)
            unsubscribeButton.backgroundColor = .systemBackground
            unsubscribeButton.setTitleColor(.systemGreen, for: .normal)
        } else {
            unsubscribeButton.setTitle("Подписаться", for: .normal)
            unsubscribeButton.backgroundColor = .systemGreen
            unsubscribeButton.setTitleColor(.white, for: .normal)
        }
    }
    
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
        guard let viewModel = viewModel else { return }
        
        var newViewModel = viewModel
        newViewModel.categoryFollowStatus = !viewModel.categoryFollowStatus
        
        delegate?.categoriesTableViewCellDelegate(self, didTapWith: newViewModel)
        
        configureCell(with: newViewModel)
        
        print("Tapped subscribe")
    }
}
