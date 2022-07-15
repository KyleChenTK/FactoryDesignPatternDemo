//
//  ViewController.swift
//  FactoryDesignPatternDemo
//
//  Created by Kyle Chen on 2022/7/15.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    @IBAction func square(_ sender: Any) {
        
        createFactory(shape: .square, view: self.view)
        
    }
    
    @IBAction func circle(_ sender: Any) {
        
        createFactory(shape: .circle, view: self.view)
        
    }
    
    @IBAction func rectangle(_ sender: Any) {
        
        createFactory(shape: .rectangle, view: self.view)
        
    }
    
}

