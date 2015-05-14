//
//  zonkedTransitionsTwo.swift
//  astonishedTransitions
//
//  Created by Amadeu Cavalcante on 5/13/15.
//  Copyright (c) 2015 AmimationsLite. All rights reserved.
//

import UIKit

class zonkedTransitionsTwo: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
   
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
        
        let π = CGFloat (M_PI)
        
        var offScreenRight = CGAffineTransformMakeRotation(π/3)
        var offScreenLeft = CGAffineTransformMakeRotation(-π/3)
        
        fromView.layer.anchorPoint = CGPointMake( 0.5 , 0 )
        toView.layer.anchorPoint = CGPointMake( 0.5 , 0 )
        
        toView.transform = offScreenLeft
        fromView.transform = offScreenLeft
        
        let toViewCGPoint = CGPoint(x:160, y: 0)
        let fromViewCGPoint = CGPoint(x: 160, y: 0 )
        
        toView.alpha = 0.0
        
        // play the animation
        let duration = self.transitionDuration(transitionContext)
        let option = UIViewAnimationOptions.CurveEaseIn
        
        UIView.animateKeyframesWithDuration(duration, delay: self.delay, options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: {
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/10, animations: {
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.9)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.9)
                toView.transform = offScreenRight
                fromView.transform = offScreenRight
                toView.alpha = 0.1
                fromView.alpha = 0.9
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/10, animations: {
            
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.8)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.8)
                toView.transform = offScreenLeft
                fromView.transform = offScreenLeft
              
                toView.alpha = 0.2
                fromView.alpha = 0.8
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/10, animations: {
                
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.7)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.7)
                toView.transform = offScreenRight
                fromView.transform = offScreenRight
                
                toView.alpha = 0.3
                fromView.alpha = 0.7
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/10, animations: {
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.6)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.6)
                toView.transform = offScreenLeft
                fromView.transform = offScreenLeft
                
                toView.alpha = 0.4
                fromView.alpha = 0.6
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/10, animations: {
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.5)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.5)
                toView.transform = offScreenRight
                fromView.transform = offScreenRight
                
                toView.alpha = 0.5
                fromView.alpha = 0.5
            })
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
