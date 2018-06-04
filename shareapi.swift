//
//  shareapi.swift
//  HealthCare
//
//  Created by Mario Gong on 2018/6/4.
//  Copyright © 2018年 Alex. All rights reserved.
//

import UIKit

import FacebookShare

final class ShareAPIViewController: UITableViewController {
    
    func share<C: ContentProtocol>(_ content: C) {
        var title: String = ""
        var message: String = ""
        
        do {
            try GraphSharer.share(content) { result in
                switch result {
                case .success(let contentResult):
                    title = "Share Success"
                    message = "Succesfully shared: \(contentResult)"
                case .cancelled:
                    title = "Share Cancelled"
                    message = "Sharing was cancelled by user."
                case .failed(let error):
                    title = "Share Failed"
                    message = "Sharing failed with error \(error)"
                }
                let alertController = UIAlertController(nibName: title, bundle: message)
                self.present(alertController, animated: true, completion: nil)
            }
        } catch (let error) {
            title = "Share API Fail"
            message = "Failed to invoke share API with error: \(error)"
            let alertController = UIAlertController(nibName: title, bundle: message)
            present(alertController, animated: true, completion: nil)
        }
    }
}



//--------------------------------------
// MARK: - Photo Content
//--------------------------------------
extension ShareAPIViewController {
    @IBAction func sharePhoto() {
        let photo = Photo(image: UIImage(named: "CalenderDay.view")!, userGenerated: true)
        let content = PhotoShareContent(photos: [photo])
        share(content)
    }
}

}
