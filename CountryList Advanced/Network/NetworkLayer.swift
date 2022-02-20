//
//  NetworkLayer.swift
//  CountryList Advanced
//
//  Created by Reza Kashkoul on 1/12/1400 AP.
//

import RxAlamofire
import RxSwift

enum MyError: Error {
    case generalError
    case timeOut
}

class NetworkLayer {
    
    let disposeBag = DisposeBag()
    static let shared = NetworkLayer()
    
    func fetchData(comletion: @escaping (Result<[Country], MyError>)->()) {
        let url = "https://restcountries.com/v3.1/all"
        baseRequest(type: [Country].self, url: url, comletion: comletion)
    }
    
    func baseRequest<T: Decodable>(type: T.Type, url: String, comletion: @escaping (Result<T, MyError>)->()) {
        RxAlamofire.requestData(.get, url).subscribe(onNext: {(response, json) in
            do {
                let result = try JSONDecoder().decode(type, from: json)
                comletion(.success(result))
            } catch {
                comletion(.failure(.generalError))
                print("error")
            }
        }, onError: {err in
            print(err.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
}
