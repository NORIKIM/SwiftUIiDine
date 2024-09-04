//
//  OrderView.swift
//  iDine
//
//  Created by 인터웍스_맥북 on 9/3/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    @State private var showToolBar = true
    
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
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .toolbar {
                EditButton()
            }
            .disabled(order.items.isEmpty)
            .navigationTitle("Order")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
