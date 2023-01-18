//
//  NetworkService.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import Foundation
import Alamofire
import RxSwift

final class NetworkService {
    func request(endPoint: Requestable) -> Single<Data> {
        return Single.create { observer in
            
            guard let request = endPoint.urlRequest else {
                let error = NetworkError.requestFailed
                observer(.failure(error))
                
                return Disposables.create { AF.session.invalidateAndCancel() }
            }
           
            AF.request(request)
                .validate(statusCode: 200..<300)
                .response { response in
                    guard let data = response.data else {
                        let error = NetworkError.dataEmpty
                        observer(.failure(error))
                        return
                    }
                    observer(.success(data))
                }
            
            return Disposables.create {}
        }
    }
}
