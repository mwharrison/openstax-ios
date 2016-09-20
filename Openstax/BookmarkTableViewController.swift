//
//  BookmarkTableViewController.swift
//  Openstax
//
//  Created by Michael Harrison on 8/30/16.
//  Copyright © 2016 Openstax. All rights reserved.
//

import UIKit

class BookmarkTableViewController: UITableViewController {

    var bookmarks : NSMutableArray = []
    //var bookmarksLoaded :NSArray = []
    var bookmarkURL : String = ""
    
    func loadBookmarks() {
        bookmarks.removeAllObjects()
        var bookmarksLoaded = UserDefaults.standard.object(forKey: "bookmarks")
        // if there are bookmarks, load them into the bookmarks array so we can edit them
        if(bookmarksLoaded != nil) {
            for tempBookmark in bookmarksLoaded as! NSArray {
                bookmarks.add(tempBookmark)
            }
            bookmarksLoaded = nil
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadBookmarks()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkTableViewCell", for: indexPath) as! BookmarkTableViewCell
        
        let bookmark = bookmarks[indexPath.row] as! [String:String]
        
        cell.bookTitleLabel.text = bookmark["bookName"]
        cell.bookSectionLabel.text = bookmark["bookSection"]
        
        // Use the outlet in our custom class to get a reference to the UIImage in the cell
        if(bookmark["bookName"] == "College Algebra") {
            cell.bookImage.image = UIImage(named: "algebra.png")
        }else if(bookmark["bookName"] == "Algebra and Trigonometry"){
            cell.bookImage.image = UIImage(named: "algebra_trig.png")
        }else if(bookmark["bookName"] == "Anatomy & Physiology"){
            cell.bookImage.image = UIImage(named: "anatomy.png")
        }else if(bookmark["bookName"] == "Biology"){
            cell.bookImage.image = UIImage(named: "biology.png")
        }else if(bookmark["bookName"] == "Concepts of Biology"){
            cell.bookImage.image = UIImage(named: "biology_concepts.png")
        }else if(bookmark["bookName"] == "Calculus Volume 1"){
            cell.bookImage.image = UIImage(named: "calculus_1.jpg")
        }else if(bookmark["bookName"] == "Calculus Volume 2"){
            cell.bookImage.image = UIImage(named: "calculus_2.jpg")
        }else if(bookmark["bookName"] == "Calculus Volume 3"){
            cell.bookImage.image = UIImage(named: "calculus_3.jpg")
        }else if(bookmark["bookName"] == "Principles of Economics"){
            cell.bookImage.image = UIImage(named: "economics.png")
        }else if(bookmark["bookName"] == "Microeconomics"){
            cell.bookImage.image = UIImage(named: "microecon.png")
        }else if(bookmark["bookName"]!.hasPrefix("Principles of Microeconomics for AP")){
            cell.bookImage.image = UIImage(named: "microecon_ap.png")
        }else if(bookmark["bookName"] == "Macroeconomics"){
            cell.bookImage.image = UIImage(named: "macroecon.png")
        }else if(bookmark["bookName"]!.hasPrefix("Principles of Macroeconomics for AP")){
            cell.bookImage.image = UIImage(named: "macroecon_ap.png")
        }else if(bookmark["bookName"] == "College Physics"){
            cell.bookImage.image = UIImage(named: "physics.png")
        }else if(bookmark["bookName"]!.hasPrefix("College Physics For AP")){
            cell.bookImage.image = UIImage(named: "physics_ap.png")
        }else if(bookmark["bookName"] == "Prealgebra"){
            cell.bookImage.image = UIImage(named: "prealgebra.jpeg")
        }else if(bookmark["bookName"] == "Precalculus"){
            cell.bookImage.image = UIImage(named: "precalculus.png")
        }else if(bookmark["bookName"] == "Introduction to Sociology 2e"){
            cell.bookImage.image = UIImage(named: "sociology.png")
        }else if(bookmark["bookName"] == "Introductory Statistics"){
            cell.bookImage.image = UIImage(named: "statistics.png")
        }else if(bookmark["bookName"] == "U.S. History"){
            cell.bookImage.image = UIImage(named: "us_history.png")
        }else if(bookmark["bookName"] == "Chemistry"){
            cell.bookImage.image = UIImage(named: "chemistry.png")
        }else if(bookmark["bookName"] == "Psychology"){
            cell.bookImage.image = UIImage(named: "psychology.png")
        }else{
            print("Textbook not implemented")
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bookmark = bookmarks[indexPath.row] as! [String:String]
        bookmarkURL = bookmark["url"] as String!
        
        performSegue(withIdentifier: "webView", sender: self)
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source - clear NSUserDefaults and repopulate
            bookmarks.removeObject(at: indexPath.row)
            UserDefaults.standard.removeObject(forKey: "bookmarks")
            UserDefaults.standard.set(bookmarks, forKey: "bookmarks")
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "webView") {
            let svc = segue.destination as! WebViewController;
            svc.bookmarkURL = self.bookmarkURL
        }
    }

}
