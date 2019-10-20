//
//  AlamofireHTTPClient.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Alamofire

struct AlamofireHTTPClient: HTTPClient {
    
    func perform(request: HTTPRequest,
                 completion: @escaping (_ response: Data?, _ error: Error?) -> Void) {
                
        let headers = request.headers != nil ? HTTPHeaders(request.headers!) : nil
        
        AF.request(request.endpoint,
                   method: request.method.alamofireMethod,
                   parameters: request.parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .validate()
            .responseJSON { (response) in
                self.debugLog(request: request, response: response)
                switch response.result {
                case .success(_): completion(response.data, nil)
                case .failure(let error):
                    if let data = response.data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        completion(nil, try? decoder.decode(PopcornError.self, from: data))
                    } else {
                        completion(nil, error)
                    }
                }
        }
    }
    
    private func debugLog(request: HTTPRequest, response: AFDataResponse<Any>) {
        print("------------------------------------------------------------------")
        if let headers = request.headers {
            print("[Headers]: ")
            dump(headers)
        }
        print("[Parameter]: ")
        dump(request.parameters ?? [:])
        
        debugPrint(response)
        print("------------------------------------------------------------------")
    }
}

extension HTTPMethod {

    /// Alamofire HTTP method.
    var alamofireMethod: Alamofire.HTTPMethod {
        switch self {
        case .get: return Alamofire.HTTPMethod.get
        case .post: return Alamofire.HTTPMethod.post
        case .delete: return Alamofire.HTTPMethod.delete
        case .put: return Alamofire.HTTPMethod.put
        case .patch: return Alamofire.HTTPMethod.patch
        }
    }

}

