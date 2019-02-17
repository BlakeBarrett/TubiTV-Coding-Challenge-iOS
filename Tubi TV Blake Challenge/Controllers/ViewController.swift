//
//  ViewController.swift
//  Tubi TV Blake Challenge
//
//  Created by Blake Barrett on 2/16/19.
//  Copyright © 2019 Blake Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let api = TenorAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        api.search(for: "wink",
                   success: { (values: [TenorResource]?) in
                    print(String(describing: values))
        },
                   failure: { (error) in
                    print(String(describing: error))
        })
    }
}
