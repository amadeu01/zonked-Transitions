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
        
        //toView.transform = offScreenLeft
        //fromView.transform = offScreenLeft
        //container.transform = offScreenLeft
        let toViewCGPoint = CGPoint(x:container.frame.width/2, y: 0)
        let fromViewCGPoint = CGPoint(x: container.frame.width/2, y: 0 )
        
        
        //
        
        toView.layer.position = toViewCGPoint
        fromView.layer.position = fromViewCGPoint
        
        //add to container
        
        container.addSubview(toView)
        container.addSubview(fromView)
        
        // play the animation
        let duration = self.transitionDuration(transitionContext)
        let option = UIViewKeyframeAnimationOptions.CalculationModePaced
        //alpha
        toView.alpha = 0.0
        
        UIView.animateKeyframesWithDuration(duration, delay: self.delay, options: option, animations: {
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.8)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.8)
                toView.transform = offScreenRight
                fromView.transform = offScreenRight
                toView.alpha = 0.1
                fromView.alpha = 0.8
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.7)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.7)
                toView.transform = offScreenLeft
                fromView.transform = offScreenLeft
                toView.alpha = 0.2
                fromView.alpha = 0.7
            })
            
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.6)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.6)
                toView.transform = offScreenRight
                fromView.transform = offScreenRight
                toView.alpha = 0.3
                fromView.alpha = 0.6
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.5)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.5)
                toView.transform = offScreenLeft
                fromView.transform = offScreenLeft
                
                toView.alpha = 0.4
                fromView.alpha = 0.5
            })
            
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.4)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.4)
                toView.transform = offScreenRight
                fromView.transform = offScreenRight
                toView.alpha = 0.5
                fromView.alpha = 0.4
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.3)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.3)
                toView.transform = offScreenLeft
                fromView.transform = offScreenLeft
                
                toView.alpha = 0.6
                fromView.alpha = 0.3
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.2)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.2)
                toView.transform = offScreenRight
                fromView.transform = offScreenRight
                toView.alpha = 0.7
                fromView.alpha = 0.2
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.15)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.15)
                toView.transform = offScreenLeft
                fromView.transform = offScreenLeft
                
                toView.alpha = 0.8
                fromView.alpha = 0.15
            })
            
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.1)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.1)
                toView.transform = offScreenRight
                fromView.transform = offScreenRight
                toView.alpha = 0.9
                fromView.alpha = 0.1
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                
                var offScreenRight = CGAffineTransformMakeRotation((π/3)*0.05)
                var offScreenLeft = CGAffineTransformMakeRotation((-π/3)*0.05)
                toView.transform = offScreenLeft
                fromView.transform = offScreenLeft
                
                toView.alpha = 1
                fromView.alpha = 0.05
            })


            
            toView.transform = CGAffineTransformIdentity
            fromView.transform = CGAffineTransformIdentity
            
            toView.alpha = 1
            fromView.alpha = 0.0
            
            
            }, completion: { finished in
                
                transitionContext.completeTransition(true)
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
