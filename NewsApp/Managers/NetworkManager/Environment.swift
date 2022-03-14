import Foundation

enum Environment: String, CaseIterable {
    case allTopCountryHeadlines
    case allParticularCountryHeadlinesCategories
}

extension Environment {
    var purchaseServiceBaseUrl: String {
        switch self {
        case .allTopCountryHeadlines, .allParticularCountryHeadlinesCategories:
            return "https://newsapi.org/v2/top-headlines?"
        }
    }
}
