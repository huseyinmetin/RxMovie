//
//  PopularAPI.swift
//  RxMovie
//
//  Created by Hüseyin Metin on 23.01.2020.
//  Copyright © 2020 HüseyinMetin. All rights reserved.
//

import Foundation
import RxSwift

class PopularAPI {
    
    func request() -> Observable<[PopularItem]> {
        
        let methodName = "tv/popular"
        
        return Observable<[PopularItem]>.create { (observer) in
            
            WebService.get(methodName) { (result: Popular) in
                observer.onNext(result.results)
                observer.onCompleted()
            }
            
            return Disposables.create {
                
            }
        }
    }
    
}
