//
//  ContentView.swift
//  Setting Screen
//
//  Created by Dhanraj Sudhir Chavan on 18/04/20.
//  Copyright © 2020 Dhanraj Chavan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeTab().tabItem({
                Image(systemName: "house")
                    .font(.title)
                Text("Home")
            })
            
            SetttingsTab().tabItem({
                Image(systemName: "gear")
                    .font(.title)
                Text("Settings")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
