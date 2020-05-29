//
//  SetttingsTab.swift
//  Setting Screen
//
//  Created by Dhanraj Sudhir Chavan on 18/04/20.
//  Copyright © 2020 Dhanraj Chavan. All rights reserved.

import SwiftUI
import UIKit
import MessageUI

struct SetttingsTab: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showSheet = false
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    
    var body: some View {
        NavigationView {
            
            List {
                Section {
                    Button(action: {
                        self.showFeatures()
                    }) {
                        SettingsCell(title: "Features", imgName: "sparkles", clr: .blue)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }
                
                Section {
                    Button(action: {
                        self.writeReview()
                    }) {
                        SettingsCell(title: "Write a Review", imgName: "pencil.and.outline", clr: .blue)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    
                    Button(action: {
                        self.shareWithFriends()
                    }) {
                        SettingsCell(title: "Tell your friends", imgName: "gift", clr: .blue)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }
                
                Section {
                    Button(action: {
                        self.suggestFeature()
                    }) {
                        SettingsCell(title: "Suggest a feature", imgName: "star.circle", clr: .blue)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    
                    Button(action: {
                        self.reportBug()
                    }) {
                        SettingsCell(title: "Report a bug", imgName: "exclamationmark.triangle", clr: .blue)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }
                }.listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
            
            .navigationBarTitle("Settings")
            .sheet(isPresented: $showSheet) {
                MailView(result: self.$result, newSubject: "New Feature Suggestion", newMsgBody: "I am enjoying this app, but I want to suggest a new feature!!!")
            }
            
        }
    }
    
    func showFeatures() {
        print("Show User Features")
    }
    
    func writeReview() {
        print("Go To App Store")
        
        let appURL = URL(string: "https://apps.apple.com/app/id1500146123")!
        
        var components = URLComponents(url: appURL, resolvingAgainstBaseURL: false)
        
        components?.queryItems = [URLQueryItem(name: "action", value: "write-review")]
        
        guard let writeReviewURL = components?.url else {return}
        
        UIApplication.shared.open(writeReviewURL)
    }
    
    func shareWithFriends() {
        print("Yeah! Look At This Bro")
    }
    
    func suggestFeature() {
        print("Hurray! New Suggestion")
        if MFMailComposeViewController.canSendMail() {
            self.showSheet = true
        } else {
            print("Error sending mail")
            // Alert : Unable to send the mail
        }
    }
    
    func reportBug() {
        print("Bug Detected")
    }
}


struct SetttingsTab_Previews: PreviewProvider {
    static var previews: some View {
        SetttingsTab()
    }
}
