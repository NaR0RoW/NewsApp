import UIKit

struct CategoriesModel {
    let categoryImage: UIImage
    let categoryName: String
    let categoryFollowStatus: Bool
}

let categoriesData: [CategoriesModel] = [
    CategoriesModel(categoryImage: UIImage(named: "Buisness")!, categoryName: "Бизнес", categoryFollowStatus: false),
    CategoriesModel(categoryImage: UIImage(named: "Entertainment")!, categoryName: "Развлечения", categoryFollowStatus: true),
    CategoriesModel(categoryImage: UIImage(named: "General")!, categoryName: "Общее", categoryFollowStatus: true),
    CategoriesModel(categoryImage: UIImage(named: "Health")!, categoryName: "Здоровье", categoryFollowStatus: true),
    CategoriesModel(categoryImage: UIImage(named: "Science")!, categoryName: "Наука", categoryFollowStatus: true),
    CategoriesModel(categoryImage: UIImage(named: "Sports")!, categoryName: "Спорт", categoryFollowStatus: true),
    CategoriesModel(categoryImage: UIImage(named: "Technology")!, categoryName: "Технологии", categoryFollowStatus: true)
]
