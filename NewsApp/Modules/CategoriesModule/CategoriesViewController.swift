import UIKit

final class CategoriesViewController: UIViewController {
    
    private lazy var categoriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(CategoriesTableViewCell.self)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupCategoriesTableView()
    }
}

extension CategoriesViewController {
    private func setupView() {
        categoriesTableView.backgroundColor = .systemBackground
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Категории"
    }
    
    private func setupCategoriesTableView() {
        view.addSubview(categoriesTableView)
        NSLayoutConstraint.activate([
            categoriesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            categoriesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            categoriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            categoriesTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 17
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as CategoriesTableViewCell
        
        return cell
    }
}

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58.0
    }
}
