//
//  AppView.swift
//  SchoolVerse
//
//  Created by Steven Yu on 9/19/22.
//

import SwiftUI
import Resolver

struct AppView: View {
    @InjectedObject var authManager: FirebaseAuthenticationManager
    
    @State private var selection: TabBarItem = .home
    let tabs: [TabBarItem] = [.home, .schedule, .tasks, .clubs, .more]
    
    var body: some View {
        TabBarViewBuilder {
            NavigationStack {
                Text("Home")
            }
            .tabBarItem(tab: TabBarItem.home, selection: selection)
            
            NavigationStack {
                Text("Schedule")
            }
            .tabBarItem(tab: TabBarItem.schedule, selection: selection)
            
            NavigationStack {
                TasksView()
            }
            .tabBarItem(tab: TabBarItem.tasks, selection: selection)
            
            NavigationStack {
                Text("Clubs")
            }
            .tabBarItem(tab: TabBarItem.clubs, selection: selection)
            
            NavigationStack {
                Text("More")
                Button {
                    Task {
                        await authManager.signOut()
                    }
                } label: {
                    Text("Sign Out")
                }

            }
            .tabBarItem(tab: TabBarItem.more, selection: selection)
            
        } tabBar: {
            TabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
    }
}

//struct AppView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppView()
//    }
//}
