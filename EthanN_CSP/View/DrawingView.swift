//
//  DrawingView.swift
//  EthanN_CSP
//
//  Created by Nielsen, Ethan on 12/5/17.
//  Copyright © 2017 Ctech. All rights reserved.
//

import UIKit

class DrawingView: UIView
{
    override public func draw(_ rect: CGRect)
    {
        // Drawing code
        drawStickFigure().stroke()
        drawTurtle()
        drawHappyTree()
    }
 
    private func drawStickFigure() -> UIBezierPath
    {
        let stickFigure = UIBezierPath()
        
        UIColor.blue.setStroke()
        stickFigure.lineWidth = 3.0
        
        stickFigure.addArc(withCenter: CGPoint(x: 200, y: 200),
                           radius: CGFloat(20),
                           startAngle: CGFloat(0),
                           endAngle: CGFloat(2) * CGFloat.pi,
                           clockwise: true)
        stickFigure.move(to: CGPoint(x: 200,y: 220))
        stickFigure.addLine(to: CGPoint (x: 200, y: 270))
        stickFigure.move(to: CGPoint(x: 180, y: 240))
        stickFigure.addLine(to: CGPoint (x: 220, y: 240))
        stickFigure.move(to: CGPoint(x: 200, y: 270))
        stickFigure.addLine(to: CGPoint (x: 180, y: 300))
        stickFigure.move(to: CGPoint(x: 200, y: 270))
        stickFigure.addLine(to: CGPoint (x: 220, y: 300))
        
        // Don't enable this code
//        stickFigure.move(to: CGPoint(x: 200,y: 180))
//        stickFigure.addLine(to: CGPoint (x: 200, y: -600))
//        stickFigure.move(to: CGPoint(x: 200, y: 240))
//        stickFigure.addLine(to: CGPoint (x: 20, y: 666))
//        stickFigure.move(to: CGPoint(x: 20, y: 600))
//        stickFigure.addLine(to: CGPoint (x: 200, y: 300))
//        stickFigure.move(to: CGPoint(x: 20, y: 200))
//        stickFigure.addLine(to: CGPoint (x: 20, y: -666))
//        stickFigure.move(to: CGPoint(x: 125, y: 180))
//        stickFigure.addLine(to: CGPoint (x: 125, y: -666))
        
        return stickFigure
    }
    
    //STUPID STUFF
    public func stupidDraw() -> UIBezierPath
    {
        let stupidLines = UIBezierPath()
        
        UIColor.green.setStroke()
        stupidLines.lineWidth = 10.0
        
        stupidLines.move(to: CGPoint(x: 250,y: 23))
        stupidLines.addLine(to: CGPoint (x: 200, y: 10))
        stupidLines.move(to: CGPoint(x: 180, y: 100))
        stupidLines.addLine(to: CGPoint (x: 220, y: 100))
        stupidLines.move(to: CGPoint(x: 200, y: 100))
        stupidLines.addLine(to: CGPoint (x: 180, y: 20))
        stupidLines.move(to: CGPoint(x: 2, y: 239))
        stupidLines.addLine(to: CGPoint (x: 257, y: 23))
        
        return stupidLines
    }
    
    
    public func drawHappyTree() -> Void
    {
        let HotDog = UIBezierPath()
        
        HotDog.move(to: CGPoint(x: 80, y: 50))
        HotDog.addLine(to: CGPoint(x: 120, y: 150))
        HotDog.addLine(to: CGPoint(x: 40, y: 150))
        HotDog.lineWidth = 2.0
        UIColor(patternImage: UIImage(named: "HotDog")!).setFill()
        HotDog.fill()
        HotDog.stroke()
        HotDog.close()
        
        let happyTree = UIBezierPath()
        
        UIColor.green.setFill()
        happyTree.move(to: CGPoint(x: 110, y: 150))
        happyTree.addLine(to: CGPoint(x: 150, y: 200))
        happyTree.addLine(to: CGPoint(x: 10, y: 200))
        happyTree.addLine(to: CGPoint(x: 50, y: 150))
        happyTree.close()
        happyTree.stroke()
        happyTree.fill()
        happyTree.move(to: CGPoint(x: 80, y: 200))
        happyTree.addLine(to: CGPoint(x: 80, y: 250))
        happyTree.lineWidth = 6.0
        happyTree.stroke()
    }
    
    private func drawTurtle() -> Void
    {
        let logo = UIBezierPath()
        UIColor.white.setFill()
        logo.move(to: CGPoint(x: 50, y: 250))
        logo.addLine(to: CGPoint(x: 100, y: 300))
        logo.addLine(to: CGPoint(x: 50, y: 350))
        logo.close()
        logo.fill()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
