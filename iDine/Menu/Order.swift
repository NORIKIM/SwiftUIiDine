//
//  Order.swift
//  iDine
//
//  Created by 인터웍스_맥북 on 9/3/24.
//

import SwiftUI

// ObservableObject = 공유 자원임을 명시
class Order: ObservableObject {
    @Published var items = [MenuItem]()
    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    
    func add(item: MenuItem) {
        items.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
