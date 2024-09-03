//
//  iDineApp.swift
//  iDine
//
//  Created by 인터웍스_맥북 on 8/30/24.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order() // viewModel인 샘!
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
            /*
             최상위 view에서 environmentObject 사용해야 의존성 주입 가능
             만약 contentView가 navigationStack으로 감싸져 있다면
             런타임 중 에러가 발생하여 크래시 발생
             */
        }
    }
}
