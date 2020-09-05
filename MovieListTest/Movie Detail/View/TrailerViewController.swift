//
//  TrailerViewController.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 05/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import UIKit
import WebKit
import AVFoundation

class TrailerViewController: UIViewController {

    @IBOutlet weak var trailerVideo: WKWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var key: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.youtube.com/watch?v=\(key!)&autoplay=1")
        
        trailerVideo.load(URLRequest(url: url!))
        
        NotificationCenter.default.addObserver(
            forName: UIWindow.didBecomeVisibleNotification,
            object: self.view.window,
            queue: nil
        ) { notification in
            self.loadingIndicator.stopAnimating()
        }

        NotificationCenter.default.addObserver(
            forName: UIWindow.didBecomeHiddenNotification,
            object: self.view.window,
            queue: nil
        ) { notification in
            self.dismiss(animated: true, completion: nil)
        }
    }
    

}
