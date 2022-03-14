import UIKit

final class VideoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
}

extension VideoViewController {
    private func configureView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Видео"
    }
}
