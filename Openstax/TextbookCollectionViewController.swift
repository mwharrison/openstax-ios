//
//  TextbookCollectionViewController.swift
//  Openstax
//
//  Created by Michael Harrison on 3/30/16.
//  Copyright © 2016 Openstax. All rights reserved.
//

import UIKit

class TextbookCollectionViewController: UICollectionViewController {
    
    let reuseIdentifier = "TextbookCell"
    var textbooks = ["Algebra",
                     "Algebra and Trigonometry",
                     "Anatomy and Physiology",
                     "Biology",
                     "Concepts of Biology",
                     "Calculus 1",
                     "Calculus 2",
                     "Calculus 3",
                     "Economics",
                     "Principles of Microeconomics",
                     "Principles of Microeconomics AP",
                     "Principles of Macroeconomics",
                     "Principles of Macroeconomics AP",
                     "Physics",
                     "Physics AP",
                     "Prealgebra",
                     "Precalculus",
                     "Sociology",
                     "Statistics",
                     "US History",
                     "Chemistry",
                     "Psychology"
    ]
    
    var bookID:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(TextbookCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "webView") {
            let svc = segue.destination as! WebViewController;
            svc.bookID = self.bookID
        }
    }
 

    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textbooks.count
    }
    
    // make a cell for each cell index path
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TextbookCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UIImage in the cell
        if(textbooks[(indexPath as NSIndexPath).item] == "Algebra") {
            cell.imageView.image = UIImage(named: "algebra.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Algebra and Trigonometry"){
            cell.imageView.image = UIImage(named: "algebra_trig.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Anatomy and Physiology"){
            cell.imageView.image = UIImage(named: "anatomy.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Biology"){
            cell.imageView.image = UIImage(named: "biology.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Concepts of Biology"){
            cell.imageView.image = UIImage(named: "biology_concepts.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Calculus 1"){
            cell.imageView.image = UIImage(named: "calculus_1.jpg")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Calculus 2"){
            cell.imageView.image = UIImage(named: "calculus_2.jpg")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Calculus 3"){
            cell.imageView.image = UIImage(named: "calculus_3.jpg")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Economics"){
            cell.imageView.image = UIImage(named: "economics.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Principles of Microeconomics"){
            cell.imageView.image = UIImage(named: "microecon.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Principles of Microeconomics AP"){
            cell.imageView.image = UIImage(named: "microecon_ap.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Principles of Macroeconomics"){
            cell.imageView.image = UIImage(named: "macroecon.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Principles of Macroeconomics AP"){
            cell.imageView.image = UIImage(named: "macroecon_ap.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Physics"){
            cell.imageView.image = UIImage(named: "physics.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Physics AP"){
            cell.imageView.image = UIImage(named: "physics_ap.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Prealgebra"){
            cell.imageView.image = UIImage(named: "prealgebra.jpeg")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Precalculus"){
            cell.imageView.image = UIImage(named: "precalculus.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Sociology"){
            cell.imageView.image = UIImage(named: "sociology.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Statistics"){
            cell.imageView.image = UIImage(named: "statistics.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "US History"){
            cell.imageView.image = UIImage(named: "us_history.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Chemistry"){
            cell.imageView.image = UIImage(named: "chemistry.png")
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Psychology"){
            cell.imageView.image = UIImage(named: "psychology.png")
        }else{
            print("Textbook not implemented")
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // handle tap events and move to webview with bookID set
        if(textbooks[(indexPath as NSIndexPath).item] == "Algebra") {
            bookID = "mwjClAV_"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Algebra and Trigonometry"){
            bookID = "E6wQevFf"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Anatomy and Physiology"){
            bookID = "FPtK1zmh"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Biology"){
            bookID = "GFy_h8cu"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Concepts of Biology"){
            bookID = "s8Hh0oOc"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Calculus 1"){
            bookID = "i4nRcikn"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Calculus 2"){
            bookID = "HTmjSAcf"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Calculus 3"){
            bookID = "oxzXkyFi"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Economics"){
            bookID = "aWGdK2jw"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Principles of Microeconomics"){
            bookID = "6i8iXmBj"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Principles of Microeconomics AP"){
            bookID = "yjROLWcx"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Principles of Macroeconomics"){
            bookID = "QGHIMgmO"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Principles of Macroeconomics AP"){
            bookID = "MwdgVOwd"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Physics"){
            bookID = "Ax2o07Ul"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Physics AP"){
            bookID = "jQSmhtXo"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Prealgebra"){
            bookID = "yqV9q0HH"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Precalculus"){
            bookID = "_VPq4foj"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Sociology"){
            bookID = "AgQDEnLI"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Statistics"){
            bookID = "MBiUQmmY"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "US History"){
            bookID = "p7ovuIkl"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Chemistry"){
            bookID = "havxkyvS"
        }else if(textbooks[(indexPath as NSIndexPath).item] == "Psychology"){
            bookID = "Sr8Ev5Og"
        }else{
            print("Textbook not implemented")
        }
        
        performSegue(withIdentifier: "webView", sender: self)
        
    }

}
