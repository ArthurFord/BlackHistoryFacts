//
//  GADViewRepresentable.swift
//  BlackHistoryFacts
//
//  Created by Arthur Ford on 11/21/21.
//

import SwiftUI
import GoogleMobileAds
import UIKit

final private class BannerVC: UIViewControllerRepresentable  {
    
    private var adID: String {
        get {
                // find file
            guard let filePath = Bundle.main.path(forResource: "BHF-PList", ofType: "plist") else {
                fatalError("Couldn't find file 'BHF-PList.plist'.")
            }
                // find key
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "AD_ID") as? String else {
                fatalError("Couldn't find key 'AD_ID' in 'BHF-PList.plist'.")
            }
            return value
        }
    }
    
    
    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: GADAdSizeBanner)
        
        let viewController = UIViewController()
        view.adUnitID = adID
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: GADAdSizeBanner.size)
        view.load(GADRequest())
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct Banner:View{
    var body: some View{
        HStack{
            Spacer()
            BannerVC().frame(width: 320, height: 50, alignment: .center)
            Spacer()
        }
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner()
    }
}
