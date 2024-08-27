//
//  MintChipApp.swift
//  MintChip
//
//  Created by Mrinmoy Borah on 03/05/24.
//

import SwiftUI

@main
struct MintChipApp: App {
    
    @StateObject var transactionVM = TransactionsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionVM)
        }
    }
}
