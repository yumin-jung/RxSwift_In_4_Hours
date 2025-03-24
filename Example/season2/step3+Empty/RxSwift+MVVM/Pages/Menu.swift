//
//  Menu.swift
//  RxSwift+MVVM
//
//  Created by yumin on 3/24/25.
//  Copyright © 2025 iamchiwon. All rights reserved.
//

import Foundation

// Moodel : View를 위한 Model. 즉 ViewModel
struct Menu {
    var id: Int
    var name: String
    var price: Int
    var count: Int
}

extension Menu {
    static func fromMenuItems(id: Int, item: MenuItem) -> Menu {
        return Menu(id: id, name: item.name, price: item.price, count: 0)
    }
}
