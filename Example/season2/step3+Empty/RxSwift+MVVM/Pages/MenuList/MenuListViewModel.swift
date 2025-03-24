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
    
    var menus: [Menu] = [
        Menu(name: "튀김1", price: 100, count: 0),
        Menu(name: "튀김1", price: 100, count: 0),
        Menu(name: "튀김1", price: 100, count: 0),
        Menu(name: "튀김1", price: 100, count: 0),
    ]
    
    var itemsCount: Int = 5
    
    // Subject
    var totalPrice: PublishSubject<Int> = PublishSubject()
}
