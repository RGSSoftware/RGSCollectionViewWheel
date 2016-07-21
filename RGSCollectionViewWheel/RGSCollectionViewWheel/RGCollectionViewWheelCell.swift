//
//  RGCollectionViewWheelCell.swift
//  RGSCollectionViewWheel
//
//  Created by PC on 7/20/16.
//  Copyright © 2016 Randel Smith rs@randelsmith.com. All rights reserved.
//

import UIKit

class RGCollectionVieWheelwCell: UICollectionViewCell {
    
    private weak var scrollView: UIScrollView!
//    var card: CardPresentable?
    private var rotation: CGFloat {
        guard let _scrollView = scrollView else { return 0 }
        guard let _superView = _scrollView.superview else { return 0 }
        let position = _superView.convertPoint(self.center, fromView: scrollView)
        let superViewCenterX = CGRectGetMidX(_superView.frame)
        return ((position.x - superViewCenterX) / superViewCenterX) / 18
    }
    private var centerY: CGFloat {
        let height = CGRectGetHeight(scrollView.frame)
        var y = rotation
        if rotation < 0.0 {
            y *= -1
            y *= (rotation * -1)
        } else {
            y *= rotation
        }
        return ((y * height) / 0.03) + (height / 2.5)
    }
    
    deinit {
        scrollView.removeObserver(self, forKeyPath: "contentOffset")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        scrollView.removeObserver(self, forKeyPath: "contentOffset")
    //        if let _imageURLString = card?.imageURLString {
    //            imageView.cancelImageLoadForImageURL(_imageURLString)
    //        }
    //        imageView.image = nil
    //        label.text = nil
    }
    
    func configureForCardInScrollView(scrollView: UIScrollView) {
        
//        self.card = card
        self.scrollView = scrollView
        self.scrollView.addObserver(self, forKeyPath: "contentOffset", options: .New, context: nil)
        
//        imageView.loadImageAtURL(card.imageURLString, withDefaultImage: card.placeholderImage)
        
        self.transform = CGAffineTransformMakeRotation(rotation)
        center.y = centerY
        
//        label.attributedText = NSAttributedString(string: card.titleText, attributes: ShadowAttributes.forLabelSoft)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        self.transform = CGAffineTransformMakeRotation(rotation)
        center.y = centerY
        
    }
    
}
