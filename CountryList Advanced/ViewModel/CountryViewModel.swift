//
//  CountryViewModel.swift
//  CountryList Advanced
//
//  Created by Reza Kashkoul on 1/12/1400 AP.
//

import Foundation
import RxSwift
import RxAlamofire

class CountryViewModel: NSObject {
    
    let tableRows = PublishSubject<[Country]>()
    let disposeBag = DisposeBag()
    
    func fetchData() {
        NetworkLayer.shared.fetchData { response in
            switch response {
            case .success(let countries):
                print(countries)
                self.tableRows.onNext(countries)
            case .failure:
                print("error type")
            }
        }
    }
    
    func filterList(text: String, list: [Country])->([Country]) {
        guard !text.isEmpty else {return list}
        return list.filter({$0.name.official.contains(text)})
    }
}
