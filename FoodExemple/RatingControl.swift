//
//  RatingControl.swift
//  FoodExemple
//
//  Created by junior on 20/08/16.
//  Copyright © 2016 junior. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    var rating=0{
        didSet{
            setNeedsLayout()
        }
    }
    var ratingsButton = [UIButton]()
    let spacing = 5
    let startCount = 4
    
    let filledStar = UIImage(named: "filled_star")
    let emptyStar = UIImage(named: "star")
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        for _ in 0...startCount{
        
            let button = UIButton ( frame: CGRect (x: 0, y:0 , width: 44, height: 44))
        
            
            button.addTarget(self, action: "ratingTapButton:", forControlEvents: .TouchDown)
        
            button.setImage(emptyStar, forState: .Normal)
            button.setImage(filledStar, forState: .Selected)
            button.setImage(filledStar, forState: [.Highlighted,.Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            ratingsButton += [button]
            addSubview(button)
        }
        
    }
   
    
    override func layoutSubviews() {
        var buttonFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        for (index, button) in ratingsButton.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (44 + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    func ratingTapButton(button: UIButton){
        rating = ratingsButton.indexOf(button)! + 1
    
        updateButtonSelectionStates()
    }
   
    
    func updateButtonSelectionStates() {

        for (index, button) in ratingsButton.enumerate(){
            button.selected = index < rating
        }
    }
    
    override func intrinsicContentSize () -> CGSize {
        
        return CGSize ( width : 240 , height : 44 )
    }
}
