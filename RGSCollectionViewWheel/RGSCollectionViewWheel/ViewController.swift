//
//  ViewController.swift
//  RGSCollectionViewWheel
//
//  Created by PC on 7/20/16.
//  Copyright © 2016 Randel Smith rs@randelsmith.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 1000
        layout.itemSize = CGSizeMake(200, 300)
        
        let midX = CGRectGetMidX(UIScreen.mainScreen().bounds)
        let halfItemWidth : CGFloat = 200 / 2
        let left = midX - halfItemWidth
        let right = left
        layout.sectionInset = UIEdgeInsets(top: 0, left: left, bottom: 0, right: right)
        
        self.collectionView.collectionViewLayout = layout
        
//        collectionView.addObserver(self, forKeyPath: "contentOffset", options: .New, context: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UICollectionViewDelegate {
    
}

extension ViewController : UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        guard let cell = cell as? RGCollectionVieWheelwCell else { fatalError("Expected to display a `JFCardSelectionCell`.") }
        
        cell.configureForCardInScrollView(collectionView)
        
    }

}




