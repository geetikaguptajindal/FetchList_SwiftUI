//
//  FetchList_SwiftUIApp.swift
//  FetchList_SwiftUI
//
//  Created by Geetika Gupta on 26/09/23.
//

import SwiftUI

@main
struct FetchList_SwiftUIApp: App {
    
    init() {
        // init base navigation bar changes
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(red: 1/255.0, green: 193/255.0, blue: 59/255.0, alpha: 1)
        UIBarButtonItem.appearance().tintColor = .white
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().standardAppearance = navBarAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

