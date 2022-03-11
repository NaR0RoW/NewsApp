import UIKit

final class ProfileViewController: UIViewController {
    
    private lazy var profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(ProfileTableViewCell.self)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupProfileTableView()
    }
}

extension ProfileViewController {
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Профиль"
    }
    
    private func setupProfileTableView() {
        view.addSubview(profileTableView)
        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            profileTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ProfileTableViewCell
        
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58.0
    }
}
