//
//  zonkedTransitionThree.swift
//  astonishedTransitions
//
//  Created by Amadeu Cavalcante on 5/14/15.
//  Copyright (c) 2015 AmimationsLite. All rights reserved.
//

import UIKit

class zonkedTransitionThree:  NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    
    private var presenting = true
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        

        
        let offScreenFall = CGAffineTransformMakeTranslation(0, container.frame.height)
        let offScreenUp = CGAffineTransformMakeTranslation(0, -container.frame.height)
        
        
        toView.transform = offScreenUp
        

        
        container.backgroundColor = self.presenting ? toView.backgroundColor : fromView.backgroundColor
        
        
        container.addSubview(toView)
        container.addSubview(fromView)
        
        
        let duration = self.transitionDuration(transitionContext)
        
       
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            
            
            fromView.transform = self.presenting ? offScreenFall : offScreenUp
            toView.transform = CGAffineTransformIdentity
            toView.alpha = 1
            fromView.alpha = 1
            container.backgroundColor =  toView.backgroundColor
            }, completion: { finished in
                
                // tell our transitionContext object that we've finished animating
                transitionContext.completeTransition(true)
                
        })
        
    }
    
    // return how many seconds the transiton animation will take
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1.75
    }
    
    // MARK: UIViewControllerTransitioningDelegate protocol methods
    
    // return the animataor when presenting a viewcontroller
    // remmeber that an animator (or animation controller) is any object that aheres to the UIViewControllerAnimatedTransitioning protocol
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // these methods are the perfect place to set our `presenting` flag to either true or false - voila!
        self.presenting = true
        return self
    }
    
    // return the animator used when dismissing from a viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }

   
}
