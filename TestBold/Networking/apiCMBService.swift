import Foundation
import Alamofire
import SwiftyJSON

class ApiCMBService {
    
    private let sessionManager: Session
    public var headers = [ "Content-Type":"application/json"]
    
    var urlRequested = ""
    var httpMethodRequested:HTTPMethod? = nil
    var paramsRequested:Parameters? = nil
    var headersRequested:HTTPHeaders? = nil
    private static var sharedApiManager: ApiCMBService = {
        let apiManager = ApiCMBService(sessionManager: Session())
        
        return apiManager
    }()
    
    // MARK: - Accessors
    class func shared() -> ApiCMBService {
        return sharedApiManager
    }
    
    // MARK: - Initialization
    
    private init(sessionManager: Session) {
        self.sessionManager = sessionManager
    }
    
    
    func request(_ url: String, httpMethod: HTTPMethod, params : Parameters?, headers: HTTPHeaders?, completion: @escaping (Result<JSON, Error>) -> Void) {
        
        sessionManager.request(url, method: httpMethod, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {
            case .success:
                if let unwrappedResponse = response.response {
                    let statusCode = unwrappedResponse.statusCode
                    if let data = response.data, let json = try? JSON.init(data: data) {
                        self.showRequestAndResponse(url, headers?.dictionary, params, json)
                        if statusCode == 401
                        {
                            self.sessionManager.cancelAllRequests()
                        }
                        else
                        {
                            completion(.success(json))
                        }
                    }
                    
                }
                
            case .failure(let error):
                
                completion(.failure(error))
            }
        }
    }
    
    func showRequestAndResponse(_ url: String,_ headerss: [String : Any]?, _ params: [String : Any]?, _ json: JSON?){
        
        print("URL: \(url)")
        
        if let request = params?.prettyPrintedJSON {
            print("REQUEST: \(request)")
        }
        
        if let headers = headerss?.prettyPrintedJSON {
            print("HEADERS: \(headers)")
        }
        
        if let response = json {
            print("RESPONSE: \(response)")
        }
    }
    
}

