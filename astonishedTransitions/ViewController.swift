//
//  ViewController.swift
//  astonishedTransitions
//
//  Created by Amadeu Cavalcante on 5/11/15.
//  Copyright (c) 2015 AmimationsLite. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    let transitionManagers = [zonkedTransitionsOne(), zonkedTransitionsTwo(), zonkedTransitionThree(),zonkedTransitionsFour(),zonkedTransitionsFive(),zonkedTransitionsSix(),zonkedTransitionsSeven()]
    
    let items = ["Animation 1","Animation 2", "Animation 3","Animation 4","Animation 5","Animation 6","Animation 7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let toViewController = zonkedViewController()
        toViewController.view.backgroundColor = UIColor.grayColor()
        toViewController.transitioningDelegate = transitionManagers[indexPath.row] as? UIViewControllerTransitioningDelegate
        self.presentViewController( toViewController, animated: true, completion: nil)
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    

}

