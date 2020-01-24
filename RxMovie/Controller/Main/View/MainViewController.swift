//
//  MainViewController.swift
//  RxMovie
//
//  Created by Hüseyin Metin on 23.01.2020.
//  Copyright © 2020 HüseyinMetin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = MainViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
        viewModel.dataSource
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, model, cell in
                cell.textLabel?.text = model.name
                cell.detailTextLabel?.text = "\(model.vote_average ?? 0)"
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(PopularItem.self)
            .map {
                return self.viewModel.getDetailViewController(item: $0)
            }
            .subscribe(onNext: { [unowned self] (detailViewController) in
                self.navigationController?.pushViewController(detailViewController, animated: true)
            })
            .disposed(by: disposeBag)
    }

}
