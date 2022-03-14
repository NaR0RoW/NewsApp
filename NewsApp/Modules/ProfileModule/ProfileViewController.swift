import UIKit

final class ProfileViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    let subscribeBannerView = SubscribeBannerView()
    let authBannerView = AuthBannerView()
    
    // DI?
    private var profileCellModel = [ProfileCellModel]()
    
    private lazy var profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(ProfileTableViewCell.self)
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        profileCellModel.append(.favorites(models: []))
        profileCellModel.append(.settings(models: []))
        profileCellModel.append(.information(models: []))
    }
}

extension ProfileViewController {
    private func configureView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Профиль"
        
        configureScrollView()
        configureSubscribeBannerView()
        configureAuthView()
        configureProfileTableView()
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureSubscribeBannerView() {
        scrollView.addSubview(subscribeBannerView)
        NSLayoutConstraint.activate([
            subscribeBannerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15.0),
            subscribeBannerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            subscribeBannerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15.0),
            subscribeBannerView.heightAnchor.constraint(equalToConstant: view.frame.width / 2.1)
        ])
    }
    
    private func configureAuthView() {
        scrollView.addSubview(authBannerView)
        NSLayoutConstraint.activate([
            authBannerView.topAnchor.constraint(equalTo: subscribeBannerView.bottomAnchor, constant: 15.0),
            authBannerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15.0),
            authBannerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15.0),
            authBannerView.heightAnchor.constraint(equalToConstant: view.frame.width / 4)
        ])
    }
    
    private func configureProfileTableView() {
        scrollView.addSubview(profileTableView)
        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: authBannerView.bottomAnchor, constant: 30.0),
            profileTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileTableView.heightAnchor.constraint(equalToConstant: 650.0),
            profileTableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}

// Don't really like this solution
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch profileCellModel[section] {
        case .favorites:
            return 1
        case .settings:
            return 4
        case .information:
            return 4
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return profileCellModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ProfileTableViewCell
        
        switch profileCellModel[indexPath.section] {
        case .favorites:
            cell.configureCell(with: ProfileTableViewCellViewModel(with: profileData[0]))
        case .settings:
            cell.configureCell(with: ProfileTableViewCellViewModel(with: profileData[indexPath.row + 1]))
        case .information:
            cell.configureCell(with: ProfileTableViewCellViewModel(with: profileData[indexPath.row + 5]))
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch profileCellModel[section] {
        case .favorites, .settings, .information:
            return profileCellModel[section].description
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped: ", indexPath.row)
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58.0
    }
}

enum ProfileCellModel: CaseIterable {
    static var allCases: [ProfileCellModel] {
        return [.favorites(models: []), settings(models: []), information(models: [])]
    }
    
    case favorites(models: [ProfileModel])
    case settings(models: [ProfileModel])
    case information(models: [ProfileModel])
    
    var description: String {
        switch self {
        case .favorites:
            return ""
        case .settings:
            return "НАСТРОЙКИ"
        case .information:
            return "ИНФОРМАЦИЯ"
        }
    }
}
