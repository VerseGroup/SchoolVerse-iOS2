//
//  RouterView.swift
//  SchoolVerse
//
//  Created by Steven Yu on 9/18/22.
//

import SwiftUI
import Resolver

struct RouterView: View {
    @InjectedObject var authManager: FirebaseAuthenticationManager
    
    @AppStorage("show_onboarding") var showOnboarding: Bool = true
    @AppStorage("show_linking") var showLinking: Bool = false
    
    var body: some View {
        
        if authManager.isAuthenticated {
            if showLinking {
                LinkingView()
            } else {
                AppView()
            }
        } else {
            if showOnboarding {
                OnboardingView(showOnboarding: $showOnboarding)
            } else {
                AuthenticationView()
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView()
    }
}
