//
//  ViewController.swift
//  WLXUtils
//
//  Created by wlx0412 on 08/25/2020.
//  Copyright (c) 2020 wlx0412. All rights reserved.
//

import UIKit
import WLXUtils

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.backgroundColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }

    @IBAction func toNext(_ sender: Any) {
        UIViewController.pushToViewController(UIViewController())
    }
}

