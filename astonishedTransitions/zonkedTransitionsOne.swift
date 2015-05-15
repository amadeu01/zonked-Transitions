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
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let offLeft = CGAffineTransformMakeTranslation(-container.frame.width - 50 , 0)
        
        
        
        // play the animation
        let duration = self.transitionDuration(transitionContext)
        let option = UIViewKeyframeAnimationOptions.CalculationModeLinear
        
        let stick = UIImageView(image: UIImage(named: "stick-push"))
        stick.frame = CGRect(x: container.frame.width, y: container.frame.height/2 - 20, width: 50, height: 41)
        let stickPulling = UIImageView(image: UIImage(named: "stick-pulling"))
        stickPulling.frame = CGRect(x: container.frame.width, y: container.frame.height/2 - 20, width: 50, height: 41)
        
        
        
//        toView.transform = CGAffineTransformMakeTranslation(container.frame.width, 0)
//        stick.transform = CGAffineTransformMakeTranslation(container.frame.width, 0)
        toView.transform = offLeft
        stickPulling.transform = offLeft
        container.backgroundColor = UIColor.whiteColor()
        container.addSubview(fromView)
        container.addSubview(stick)
        container.addSubview(stickPulling)
        container.addSubview(toView)
        
        
        UIView.animateKeyframesWithDuration(duration, delay: self.delay, options: option, animations: {
        
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 5/12, animations: {
            //setting alpha
            
                fromView.transform = offLeft
                stick.transform = offLeft
                
            })
            UIView.addKeyframeWithRelativeStartTime(5/12, relativeDuration: 5/12, animations: {
                
                toView.transform = CGAffineTransformIdentity
                stickPulling.transform = CGAffineTransformIdentity
                
            })
            UIView.addKeyframeWithRelativeStartTime(10/12, relativeDuration: 2/12, animations: {
                //setting alpha
                toView.alpha = 1
                stick.alpha = 0.0
            })
            
            
            }, completion: { finished in
                
                transitionContext.completeTransition(true)
                fromView.transform = CGAffineTransformIdentity
        })
        
    
        
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        if time == 0 {
            return 4.75
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
