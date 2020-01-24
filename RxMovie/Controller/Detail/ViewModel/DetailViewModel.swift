//
//  DetailViewModel.swift
//  RxMovie
//
//  Created by Hüseyin Metin on 24.01.2020.
//  Copyright © 2020 HüseyinMetin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class DetailViewModel {
    
    private var item: BehaviorRelay<PopularItem>
    
    public var posterUrl: String?
    public var name: String?
    public var detail: String?
    public var description: String?
    
    
    init(item: PopularItem) {
        self.item = BehaviorRelay<PopularItem>(value: item)
        
        setup()
    }
    
    func setup() {
        item.asObservable()
            .subscribe(onNext: { (i) in
                if let path = i.poster_path {
                    self.posterUrl = path
                }
                self.name = i.name
                self.detail = "\(i.origin_country.joined(separator: ",")) - \(i.first_air_date?.toString ?? "")"
                self.description = i.overview
            })
            .disposed(by: DisposeBag())
    }
    
}
