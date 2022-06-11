//
//  examen2_minayaApp.swift
//  examen2-minaya
//
//  Created by Donatto on 3/06/22.
//

import SwiftUI
import Firebase

class AppDelegate: NSCoder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
      }
}

@main
struct examen2_minayaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            if let user = viewModel.user {
                HomeView(viewModel: viewModel)
            } else {
                ContentView(viewModel: viewModel)
            }
        }
    }
}
