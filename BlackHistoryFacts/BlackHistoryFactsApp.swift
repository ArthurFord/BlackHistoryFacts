//
//  BlackHistoryFactsApp.swift
//  BlackHistoryFacts
//
//  Created by Arthur Ford on 11/14/21.
//

import SwiftUI
import GoogleMobileAds

@main
struct BlackHistoryFactsApp: App {
    
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "cadc080d594071b42627879437d7fbcb" ]
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
