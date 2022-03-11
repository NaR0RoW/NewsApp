import UIKit

struct CategoriesTableViewCellViewModel {
    let categoryImage: UIImage
    let categoryName: String
    var categoryFollowStatus: Bool
    
    init(with model: CategoriesModel) {
        categoryImage = model.categoryImage
        categoryName = model.categoryName
        categoryFollowStatus = model.categoryFollowStatus
    }
}
