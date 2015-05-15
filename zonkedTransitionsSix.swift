//
//  zonkedTransitionsSix.swift
//  astonishedTransitions
//
//  Created by Amadeu Cavalcante on 5/14/15.
//  Copyright (c) 2015 AmimationsLite. All rights reserved.
//

import UIKit

class zonkedTransitionsSix: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    private var presenting = true
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        
        
        
        let offScreenRight = UIViewAnimationOptions.TransitionFlipFromRight
        let offScreenLeft = UIViewAnimationOptions.TransitionFlipFromLeft
        
        
        
        
        container.backgroundColor = self.presenting ? toView.backgroundColor : fromView.backgroundColor
        
        
        

        var view: ( to: UIView , from: UIView )
        
        if presenting {
            view.to = toView
            view.from = container
        } else {
            view.from = fromView
            view.to = toView
        }

        let duration = self.transitionDuration(transitionContext)
        
        
    
        UIView.transitionFromView(view.from, toView: view.to , duration: duration, options: presenting ? offScreenRight : offScreenLeft, completion: {
            finished in transitionContext.completeTransition(true)
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
