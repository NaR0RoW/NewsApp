import Foundation

typealias Headers = [String: String]

// if you wish you can have multiple services like this in a project
enum NewsServiceEndpoints {
    
    // Organise all the end points here for clarity
    case getAllTopCountryHeadlines(country: String)
    case getAllParticularCountryHeadlinesCategories(country: String, category: String)
    
    // gave a default timeout but can be different for each.
    var requestTimeOut: Int {
        return 20
    }
    
    // specify the type of HTTP request
    var httpMethod: HTTPMethod {
        switch self {
        case .getAllTopCountryHeadlines, .getAllParticularCountryHeadlinesCategories:
            return .GET
        }
    }
    
    // compose the NetworkRequest
    func createRequest(token: String, environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"] = "application/json"
        headers["Authorization"] = "Bearer \(token)"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: httpMethod)
    }
    
    // encodable request body for POST
    var requestBody: Encodable? {
        switch self {
        case .getAllTopCountryHeadlines, .getAllParticularCountryHeadlinesCategories:
            return nil
        }
    }
    
    // compose urls for each request
    func getURL(from environment: Environment) -> String {
        let baseUrl = environment.purchaseServiceBaseUrl
        
        switch self {
        case .getAllTopCountryHeadlines(let country):
            return "\(baseUrl)country=\(country)"
            
        case .getAllParticularCountryHeadlinesCategories(let country, let category):
            return "\(baseUrl)country=\(country)&category=\(category)"
        }
    }
}
