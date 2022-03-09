import UIKit

final class MainViewController: UIViewController {
    
    private let recentlyNewsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "newspaper.circle.fill"), for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 48.0), forImageIn: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        recentlyNewsButton.addTarget(self, action: #selector(recentlyNewsTapped), for: .touchUpInside)
    }
}

extension MainViewController {
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Главное"
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationController?.navigationBar.addSubview(recentlyNewsButton)
        NSLayoutConstraint.activate([
            recentlyNewsButton.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -16.0),
            recentlyNewsButton.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -12.0),
            recentlyNewsButton.heightAnchor.constraint(equalToConstant: 40.0),
            recentlyNewsButton.widthAnchor.constraint(equalTo: recentlyNewsButton.heightAnchor)
        ])
    }
    
    @objc private func recentlyNewsTapped() {
        print("Button Tapped")
    }
}
