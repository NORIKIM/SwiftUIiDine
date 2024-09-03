//
//  OrderView.swift
//  iDine
//
//  Created by 인터웍스_맥북 on 9/3/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                Section {
                    NavigationLink("Place Order") {
                        Text("Check out")
                    }
                }
            }
            .navigationTitle("Order")
        }
    }
}

struct OrderView_previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
