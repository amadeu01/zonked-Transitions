//
//  zonkedTransitionsSeven.swift
//  astonishedTransitions
//
//  Created by Danilo Becke on 15/05/15.
//  Copyright (c) 2015 AmimationsLite. All rights reserved.
//

import UIKit

class zonkedTransitionsSeven: NSObject , UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    private var presenting = true
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        
        
        let animatedImageView = UIImageView(frame: container.bounds)
        animatedImageView.animationImages = [UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-1 (arrastado)")! as AnyObject ,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-2 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-3 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-4 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-5 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-6 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-7 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-8 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-9 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-10 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-11 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-12 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-13 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-14 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-15 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-16 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-17 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-18 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-19 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-20 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-21 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-22 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-23 (arrastado)")! as AnyObject,UIImage(named: "tumblr_n47d7f7uFv1rt5pgzo1_400-24 (arrastado)")! as AnyObject]
        animatedImageView.animationDuration = 1.0
        animatedImageView.animationRepeatCount = 0
        
        container.addSubview(toView)
        container.addSubview(fromView)
        
        
        animatedImageView.startAnimating()
        container.addSubview(animatedImageView)
        
        let duration = self.transitionDuration(transitionContext)
        
        
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: nil, animations: {
            
            fromView.alpha = 0
            toView.alpha = 1

            
            
            }, completion: { finished in
                
                //  finished animating
                transitionContext.completeTransition(true)
                
        })
        
        
//        animatedImageView.removeFromSuperview()
        
        
        
        container.backgroundColor = self.presenting ? toView.backgroundColor : fromView.backgroundColor
        
        
        
        
        
        
        
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
