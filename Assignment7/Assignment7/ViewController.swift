//
//  ViewController.swift
//  Assignment7
//
//  Created by Enrique on 2019-05-07.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {
    
    let phoneImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        OperationQueue.main.addOperation {
            do {
                self.phoneImageView.image = try UIImage(data: Data(contentsOf: location, options: .uncached))
            } catch {
                print(error)
            }
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        print("Progress -> \(progress)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the ImageView
        view.addSubview(phoneImageView)
        phoneImageView.matchParent()
        
        // Create an url object
        guard let url = URL(string: "https://i.imgur.com/zdwdenZ.png") else { return }
        
        // Create an url session
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        // Create a task (download task)
        let task = session.downloadTask(with: url)
        
        task.resume()
        // Update the UI (main thread)
    }
}

