//
//  ServerAPI.swift

import Foundation
import Moya

enum ServerAPI {
    case products
}

extension ServerAPI: TargetType{
    
    var baseURL: URL { return URL(string: "https://www.server.com/api/products")! }
    
    var path: String {
        switch self {
        case .products:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .products:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        switch self {
        case .products:
            guard let url = Bundle.main.url(forResource: "response", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                    return Data()
            }
            return data
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    var task: Task {
        switch self {
        case .products:
            return .requestPlain
        }
    }
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
