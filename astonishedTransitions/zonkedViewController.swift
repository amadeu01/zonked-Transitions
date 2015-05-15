//
//  zonkedViewController.swift
//  astonishedTransitions
//
//  Created by Amadeu Cavalcante on 5/15/15.
//  Copyright (c) 2015 AmimationsLite. All rights reserved.
//

import UIKit

class zonkedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // label
        let newLabel: UILabel = UILabel()
        newLabel.text = "Custom A\nHas been presented"
        newLabel.numberOfLines = 2
        newLabel.textColor = UIColor.blackColor()
        newLabel.frame = CGRect(x: 0 , y: 0 , width: 250, height: 80)
        newLabel.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 100)
        newLabel.font = newLabel.font.fontWithSize(25)
        
        //button
        let newView = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        newView.center = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
        newView.setTitle("Press to go back !", forState: UIControlState.Normal)
        newView.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.95)
        newView.addTarget(self, action: "dismissView", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.80)
        
        self.view.addSubview(newLabel)
        self.view.addSubview(newView)
        
    }
    
    func dismissView() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
