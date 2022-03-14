import UIKit

struct ProfileModel {
    let profileImage: UIImage
    let profileName: String
}

let profileData: [ProfileModel] = [
    ProfileModel(profileImage: UIImage(systemName: "bookmark.square")!, profileName: "Избранное"),
    ProfileModel(profileImage: UIImage(systemName: "doc.on.doc")!, profileName: "Отображения новостей"),
    ProfileModel(profileImage: UIImage(systemName: "arrow.up.right.square")!, profileName: "Отображение котировок"),
    ProfileModel(profileImage: UIImage(systemName: "moon.stars")!, profileName: "Внешний вид"),
    ProfileModel(profileImage: UIImage(systemName: "bell")!, profileName: "Уведомления"),
    ProfileModel(profileImage: UIImage(systemName: "square.and.arrow.up")!, profileName: "Поделиться приложением"),
    ProfileModel(profileImage: UIImage(systemName: "tray.full")!, profileName: "Ваши подписки"),
    ProfileModel(profileImage: UIImage(systemName: "mail")!, profileName: "Обратная связь"),
    ProfileModel(profileImage: UIImage(systemName: "folder")!, profileName: "О приложении")
]
