//
//  ShapeFactory.swift
//  FactoryDesignPatternDemo
//
//  Created by Kyle Chen on 2022/7/15.
//

import Foundation
import Cocoa

let defaultHeight = 200

let defaultColor = NSColor.white

protocol HelperViewFactoryProtocol {
    
    func configure()
    
    func position()
    
    func display()
    
}

fileprivate class Square: HelperViewFactoryProtocol {
    
    let height:Int
    
    let parentView:NSView
    
    let view:NSView
    
    init(parentView:NSView){
        
        self.height = defaultHeight
        
        self.parentView = parentView
        
        self.view = NSView()
        
    }
    
    func configure() {
        
        let frame = CGRect(x: 0, y: 0, width: self.height, height: self.height)
        
        self.view.frame = frame
        
        self.view.wantsLayer = true
        
        self.view.layer?.backgroundColor = defaultColor.cgColor
    }
    
    func position() {
        
        
        
    }
    
    func display() {
        
        self.configure()
        
        self.position()
        
        self.parentView.addSubview(self.view)
        
    }
    
}

fileprivate class Circle: Square {
    
    override func configure(){
        
        super.configure()
        
        self.view.wantsLayer = true
        
        self.view.layer?.cornerRadius = self.view.frame.width / 2
        
        self.view.layer?.masksToBounds = true
        
    }
}

fileprivate class Rectangle: Square {
    
    override func configure(){
        
        super.configure()
        
        let frame = CGRect(x: 0, y: 0, width: self.height + self.height/2, height: self.height)
        
        self.view.frame = frame
        
        self.view.wantsLayer = true
        
        self.view.layer?.backgroundColor = defaultColor.cgColor
        
    }
}

enum Shapes {
    case square
    case circle
    case rectangle
}

class ShapeFactory{
    
    let parentView:NSView
    
    init(parentView:NSView){
        
        self.parentView = parentView
        
    }
    
    func create(shape:Shapes) -> HelperViewFactoryProtocol{
        
        switch shape {
        case .square:
            return Square(parentView: self.parentView)
        case .circle:
            return Circle(parentView: self.parentView)
        case .rectangle:
            return Rectangle(parentView: self.parentView)
        }
        
    }
    
}

func createFactory(shape:Shapes,view:NSView){
    
    let shapeFactory = ShapeFactory(parentView: view)
    
    shapeFactory.create(shape: shape).display()
    
}
