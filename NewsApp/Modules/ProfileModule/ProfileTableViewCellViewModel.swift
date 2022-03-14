import UIKit

struct ProfileTableViewCellViewModel {
    let profileImage: UIImage
    let profileName: String
    
    init(with model: ProfileModel) {
        profileImage = model.profileImage
        profileName = model.profileName
    }
}
