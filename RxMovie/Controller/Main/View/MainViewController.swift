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
    
    private var refreshController: UIRefreshControl!
    
    private var viewModel = MainViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureRefreshController()
        setup()
    }
    
    func setup() {
        tableView.refreshControl = refreshController
        
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

    func configureRefreshController() {
        refreshController = UIRefreshControl()
        refreshController.rx.controlEvent(UIControl.Event.valueChanged)
            .subscribe(onNext: { [weak self] in
                self?.refreshController.endRefreshing()
            })
            .disposed(by: disposeBag)
    }
}
