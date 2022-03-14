import Combine
import Foundation

protocol NewsServiceable {
    func getAllTopCountryHeadlines(country: String) -> AnyPublisher<NewsModel, NetworkError>
    // Instead of using Void I use NoReply for requests that might give 200 with empty response
    func getAllParticularCountryHeadlinesCategories(country: String, category: String) -> AnyPublisher<NewsModel, NetworkError>
}

final class NewsManager: NewsServiceable {
    private var networkRequest: Requestable
    private var environment: Environment = .allTopCountryHeadlines
    
    // inject this for testability
    init(networkRequest: Requestable, environment: Environment) {
        self.networkRequest = networkRequest
        self.environment = environment
    }
    
    func getAllTopCountryHeadlines(country: String) -> AnyPublisher<NewsModel, NetworkError> {
        let endpoint = NewsServiceEndpoints.getAllTopCountryHeadlines(country: country)
        let request = endpoint.createRequest(token: "", environment: self.environment)
        
        return networkRequest.request(request)
    }
    
    func getAllParticularCountryHeadlinesCategories(country: String, category: String) -> AnyPublisher<NewsModel, NetworkError> {
        let endpoint = NewsServiceEndpoints.getAllParticularCountryHeadlinesCategories(country: country, category: category)
        let request = endpoint.createRequest(token: "", environment: self.environment)
        
        return networkRequest.request(request)
    }
}
