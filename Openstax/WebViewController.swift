//
//  WebViewController.swift
//  Openstax
//
//  Created by Michael Harrison on 1/28/16.
//  Copyright © 2016 Openstax. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webViewPortal: UIWebView!
    var bookID:String = ""
    var bookmarkURL:String = ""
    
    var bookmarks : NSMutableArray = []
    var bookmarksLoaded = UserDefaults.standard.object(forKey: "bookmarks")
    
    let userDefaults = UserDefaults.standard
    
    var ibookLinks: [String:String] = [
        "Anatomy & Physiology": "https://itunes.apple.com/us/book/anatomy-and-physiology/id899593383?mt=13",
        "Biology": "https://itunes.apple.com/us/book/biology/id738245107?mt=13",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if there are bookmarks, load them into the bookmarks array so we can append to it if required
        if(bookmarksLoaded != nil) {
            for tempBookmark in bookmarksLoaded as! NSArray {
                bookmarks.add(tempBookmark)
            }
        }
        
        let bookmarkButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(addBookmark))
        let iBookButton = UIBarButtonItem(title: "iBook", style: .plain, target: self, action: #selector(openIBook))
        navigationItem.rightBarButtonItems = [bookmarkButton, iBookButton]
        
        if (bookID != ""){
            let url =  URL(string: "http://cnx.org/contents/\(bookID)/?minimal=true")!
            let requestObj = URLRequest(url: url)
            webViewPortal.loadRequest(requestObj)
        }
        if (bookmarkURL != ""){
            let url = URL(string: bookmarkURL)!
            let requestObj = URLRequest(url: url)
            webViewPortal.loadRequest(requestObj)
        }
    }
    
    func openIBook() {
        let pageTitle = webViewPortal.stringByEvaluatingJavaScript(from: "document.title")
        let bookInfo = pageTitle?.components(separatedBy: " - ")
        let bookName = (bookInfo?[1])! as String
        
        let iBookLink = ibookLinks[bookName] ?? "None"
        if iBookLink != "None" {
            UIApplication.shared.openURL(URL(string: iBookLink)!)
        }
        
        
    }
    
    func addBookmark() {
        let currentURL = webViewPortal.stringByEvaluatingJavaScript(from: "window.location.href")
        let pageTitle = webViewPortal.stringByEvaluatingJavaScript(from: "document.title")
        let bookInfo = pageTitle?.components(separatedBy: " - ")
        
        let bookmark = [
            "url": currentURL! as String,
            "bookName": (bookInfo?[1])! as String,
            "bookSection": (bookInfo?[0])! as String,
        ]
        if bookmarks.contains(bookmark) {
            let alert = UIAlertController(title: "Bookmark Already Added", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            bookmarks.add(bookmark)
            
            userDefaults.set(bookmarks, forKey: "bookmarks")
            
            let alert = UIAlertController(title: "Bookmark Added", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }

}

