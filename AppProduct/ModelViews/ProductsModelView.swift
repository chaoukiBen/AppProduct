//
//  ProductsModelView.swift

import Foundation
import Moya
import ObjectMapper

class ProductsModelView {
    
    var tableView = UITableView()
    var products: [Product]?{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    /// Fetching static data from local file response.json
    func fetchingData(){
        /// Create an endPoint for sampleData
        let endpointClosure = { (target: ServerAPI) -> Endpoint<ServerAPI> in
            let url = URL(target: target).absoluteString
            return Endpoint(url: url, sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, task: target.task, httpHeaderFields: target.headers)
        }
        /// Create a provider from our endPoint to get immediately sample Data( Mocked data )
        let provider = MoyaProvider<ServerAPI>(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub)
        
        provider.request(.products) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let JSONData = try moyaResponse.mapJSON()
                    guard let _data = Mapper<data>().map(JSONObject: JSONData) else {
                        return
                    }
                    self.products = _data.products
                } catch { }
            case let .failure(error):
                print(error)
            }
        }
    }

}
