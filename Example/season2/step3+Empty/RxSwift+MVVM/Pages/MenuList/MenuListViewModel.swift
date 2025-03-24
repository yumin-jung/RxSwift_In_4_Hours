//
//  MenuListViewModel.swift
//  RxSwift+MVVM
//
//  Created by yumin on 3/24/25.
//  Copyright © 2025 iamchiwon. All rights reserved.
//

import Foundation
import RxSwift

class MenuListViewModel {
    var menuObservable = BehaviorSubject<[Menu]>(value: [])
    
    lazy var itemsCount = menuObservable.map {
        $0.map { $0.count }.reduce(0, +)
    }
    
    lazy var totalPrice = menuObservable.map {
        $0.map { $0.price * $0.count }.reduce(0, +)
    }
    
    init() {
        let menus: [Menu] = [
            Menu(name: "튀김1", price: 100, count: 0),
            Menu(name: "튀김1", price: 100, count: 0),
            Menu(name: "튀김1", price: 100, count: 0),
            Menu(name: "튀김1", price: 100, count: 0),
        ]
        
        menuObservable.onNext(menus)
    }
}
