//
//  AdsViewController.swift
//  Messenger
//
//  Created by victor manzanero on 28/04/21.
//  Copyright © 2021 ASN GROUP LLC. All rights reserved.
//

import GoogleMobileAds
import UIKit

class AdsViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var bannerView: GADBannerView!

    override func viewDidLoad() {
      super.viewDidLoad()
      bannerView.delegate = self
      bannerView.adUnitID = Constants.AdMobAdUnitID
      bannerView.rootViewController = self
      bannerView.load(GADRequest())
    }

    // MARK: - GADBannerViewDelegate
    // Called when an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
      print(#function)
    }

    // Called when an ad request failed.
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: NSError) {
      print("\(#function): \(error.localizedDescription)")
    }

    // Called just before presenting the user a full screen view, such as a browser, in response to
    // clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
      print(#function)
    }

    // Called just before dismissing a full screen view.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
      print(#function)
    }

    // Called just after dismissing a full screen view.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
      print(#function)
    }

    // Called just before the application will background or exit because the user clicked on an
    // ad that will launch another application (such as the App Store).
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
      print(#function)
    }

}
