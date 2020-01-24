//
//  MainViewModel.swift
//  RxMovie
//
//  Created by Hüseyin Metin on 23.01.2020.
//  Copyright © 2020 HüseyinMetin. All rights reserved.
//

import UIKit

class MainViewModel {
    
    public var dataSource: Observable<[PopularItem]> {
        return PopularAPI().request()
    }
    
    func getDetailViewController(item: PopularItem) -> DetailViewController {
        let detalViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        detalViewController.item = item
        return detalViewController
    }
}
