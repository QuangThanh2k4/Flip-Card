//
//  CardCollectionViewCell.swift
//  flipcard
//
//  Created by Quang Thanh on 22/08/2022.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImgaeView: UIImageView!
    
    
    var card:Card?
    
    func configureCell(card:Card) {
        
        self.card = card
        
        frontImageView.image = UIImage(named: card.imageName)
        
        if card .isMatched == true {
            backImgaeView.alpha = 0
            frontImageView.alpha = 0
            return
        }
        else {
            backImgaeView.alpha = 1
            frontImageView.alpha = 1
        }
            
            
            
        if card.isFlipped == true {
            
            flipUp(speed: 0)
        }
        else {
            flipDown(speed: 0, delay: 0)
        }
    }
    
    
    func flipUp(speed:TimeInterval = 0.3) {
        UIView.transition(from: backImgaeView, to: frontImageView, duration: 0.3, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        card?.isFlipped = true
    }
    
    func flipDown(speed:TimeInterval = 0.3, delay:TimeInterval = 0.5) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.transition(from: self.frontImageView, to: self.backImgaeView, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        }
        
        card?.isFlipped = false
    }
    
    func remove() {
        backImgaeView.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            
            self.frontImageView.alpha = 0
            
        }, completion: nil)
    }
}

