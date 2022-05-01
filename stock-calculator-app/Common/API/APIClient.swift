//
//  APIClient.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 29.04.2022..
//

import Foundation
import Alamofire
import RxSwift

class APIClient {
    static let shared = APIClient()
    let decoder = JSONDecoder()
    
    private init() {}
    
    func performRequest<T: APIRequest>(_ request: T) -> Single<T.ResponseType> {
        return Single<T.ResponseType>.create { single -> Disposable in
            AF.request(request)
                .validate()
                .responseDecodable(decoder: self.decoder) { (response: DataResponse<T.ResponseType, AFError>) in
                    switch response.result {
                    case .success(let value):
                        single(.success(value))
                    case .failure(let afError):
                        do {
                            let errorResponse = try self.decoder.decode(Model.ErrorResponse.self, from: response.data ?? Data())
                            single(.error(errorResponse))
                        } catch {
                            single(.error(afError))
                        }
                    }
                }
            return Disposables.create()
        }
    }
}
