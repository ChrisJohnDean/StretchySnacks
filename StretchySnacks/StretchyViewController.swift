//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Chris Dean on 2018-03-30.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

import UIKit

class StretchyViewController: UIViewController {
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerView: UIView!
    
    var plusButtonSelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func plusIconAction(_ sender: Any) {
        
        if plusButtonSelected {
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
                self.heightConstraint.constant = 44
                self.view.layoutIfNeeded()
                self.plusButtonSelected = false
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
                self.heightConstraint.constant = 200
                self.view.layoutIfNeeded()
                self.plusButtonSelected = true
            }, completion: nil)
        }
        
    }
}

