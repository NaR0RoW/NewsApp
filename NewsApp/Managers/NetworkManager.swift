import Combine
import Foundation

protocol Requestable {
    var requestTimeOut: Float { get }
    
    func request<T: Codable>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
}

final class NativeRequestable: Requestable {
    var requestTimeOut: Float = 30.0
    
    func request<T>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError> where T: Decodable, T: Encodable {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(req.requestTimeOut ?? requestTimeOut)
        
        guard let url = URL(string: req.url) else {
            // Return a fail publisher if the url is invalid
            return AnyPublisher(Fail<T, NetworkError>(error: NetworkError.badURL("Invalid Url")))
        }
        // We use the dataTaskPublisher from the URLSession which gives us a publisher to play around with.
        return URLSession.shared
            .dataTaskPublisher(for: req.buildURLRequest(with: url))
            .tryMap { output in
                // throw an error if response is nil
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.serverError(code: 0, error: "Server error")
                }
                
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                // return error if json decoding fails
                NetworkError.invalidJSON(String(describing: error))
            }
            .eraseToAnyPublisher()
    }
}

struct NetworkRequest {
    let url: String
    let headers: [String: String]?
    let body: Data?
    let requestTimeOut: Float?
    let httpMethod: HTTPMethod
    
    init(url: String, headers: [String: String]? = nil, reqBody: Encodable? = nil, reqTimeout: Float? = nil, httpMethod: HTTPMethod) {
        self.url = url
        self.headers = headers
        self.body = reqBody?.encode()
        self.requestTimeOut = reqTimeout
        self.httpMethod = httpMethod
    }
    
    init(url: String, headers: [String: String]? = nil, reqBody: Data? = nil, reqTimeout: Float? = nil, httpMethod: HTTPMethod ) {
        self.url = url
        self.headers = headers
        self.body = reqBody
        self.requestTimeOut = reqTimeout
        self.httpMethod = httpMethod
    }
    
    func buildURLRequest(with url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers ?? [:]
        urlRequest.httpBody = body
        
        return urlRequest
    }
}

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum NetworkError: Error, Equatable {
    case badURL(_ error: String)
    case apiError(code: Int, error: String)
    case invalidJSON(_ error: String)
    case unauthorized(code: Int, error: String)
    case badRequest(code: Int, error: String)
    case serverError(code: Int, error: String)
    case noResponse(_ error: String)
    case unableToParseData(_ error: String)
    case unknown(code: Int, error: String)
}

extension Encodable {
    func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return nil
        }
    }
}

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

protocol NewsServiceable {
    func getAllTopCountryHeadlines(country: String) -> AnyPublisher<NewsModel, NetworkError>
    // Instead of using Void I use NoReply for requests that might give 200 with empty response
    func getAllParticularCountryHeadlinesCategories(country: String, category: String) -> AnyPublisher<NewsModel, NetworkError>
}

final class NewsService: NewsServiceable {
    
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
        
        return self.networkRequest.request(request)
    }
    
    func getAllParticularCountryHeadlinesCategories(country: String, category: String) -> AnyPublisher<NewsModel, NetworkError> {
        let endpoint = NewsServiceEndpoints.getAllParticularCountryHeadlinesCategories(country: country, category: category)
        let request = endpoint.createRequest(token: "", environment: self.environment)
        
        return self.networkRequest.request(request)
    }
}
