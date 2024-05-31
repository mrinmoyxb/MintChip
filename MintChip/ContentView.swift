//
//  ContentView.swift
//  MintChip
//
//  Created by Mrinmoy Borah on 03/05/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: TransactionsViewModel = TransactionsViewModel()
    var body: some View {
        HomeScreen()
            .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
