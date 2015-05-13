//
//  zonkedTransitionsOne.swift
//  astonishedTransitions
//
//  Created by Amadeu Cavalcante on 5/11/15.
//  Copyright (c) 2015 AmimationsLite. All rights reserved.
//

import UIKit

class zonkedTransitionsOne: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    private var presenting = true;
    var time: NSTimeInterval = 0.0;
    var delay: NSTimeInterval = 0.0;
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // container - where the animation will play
        // fromView - ViewController's view from where the animation is coming from
        // toView = ViewController's view to where the animation is going to
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        
        println("Mudei")
        
        
        // play the animation
        let duration = self.transitionDuration(transitionContext)
        let option = UIViewAnimationOptions.CurveEaseIn
        
        UIView.animateWithDuration(duration, delay: self.delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: option, animations: {
            
            toView?.transform = CGAffineTransformIdentity
            
            }, completion: { finished in
                
                transitionContext.completeTransition(true)
        })
        
    
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        if time == 0 {
            return 1.75
        }
        
        return self.time
    }
    
    func  animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        self.presenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
   
}
