//
//  ContentView.swift
//  Todo
//
//  Created by Aslam Thachapalli on 24/04/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn , !viewModel.currentUserId.isEmpty {
            accountView
        }else {
            LogginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            TodoListView(userId: viewModel.currentUserId).tabItem { Label("Home", systemImage: "house")}
            
            ProfileView().tabItem { Label("Profile", systemImage: "person.circle") }
        }
    }
}

#Preview {
    MainView()
}
