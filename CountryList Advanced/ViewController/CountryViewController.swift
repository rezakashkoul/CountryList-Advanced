//
//  ViewController.swift
//  CountryList Advanced
//
//  Created by Reza Kashkoul on 1/12/1400 AP.
//

import UIKit
import RxSwift
import RxCocoa

class CountryViewController: UIViewController {

    @IBOutlet weak var searchField: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = CountryViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        bindView()
        loadData()
    }
    
    func loadData() {
        viewModel.fetchData()
    }
    
    func bindView() {
        let text = searchField.rx.text
            .orEmpty
            .distinctUntilChanged()
        
        Observable.combineLatest(text, viewModel.tableRows) {[weak self] (searchText, list)-> [Country] in
            return self!.viewModel.filterList(text: searchText, list: list)
        }
        .bind(to: tableView.rx.items(cellIdentifier: "TableViewCell", cellType: TableViewCell.self)) {(row, item, cell) in
            cell.countryLabel.text = item.name.official
        }.disposed(by: disposeBag)
    }

}

