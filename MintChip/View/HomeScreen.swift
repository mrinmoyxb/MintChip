//
//  HomeScreen.swift
//  MintChip
//
//  Created by Mrinmoy Borah on 04/05/24.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    Text("Overview")
                        .font(.title)
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(Color.appBackground)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.appIcon, .primary)
                    
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}
