//
//  AlgorithmsController.swift
//  EthanN_CSP
//
//  Created by Nielsen, Ethan on 10/26/17.
//  Copyright © 2017 Ctech. All rights reserved.
//

import UIKit

public class AlgorithmsController: UIViewController
{
    // MARK: Data members
    
    @IBOutlet weak var algorithmText: UILabel!
    
    private func setupAlgorithm() -> Void
    {
        var algorithmSteps : [String] = []
        
        //TODO: Define algorithm and all steps
        let algorithm :String = "These are the insructiono create a project in Java using Eclipse and Github \n"
        let stepOne :String = "Create new Xcode project"
        let stepTwo :String = "Pick what project you want"
        let stepThree :String = "Name your project"
        let stepFour :String = "Navigate to which folder you want to put your project in"
        let stepFive :String = "Create a GitHub repository"
        let stepSix :String = "Link the GitHub repository to the project"
        let stepSeven :String = "Undo commit"
        let stepEight :String = "Write code in project"
        let stepNine :String = "Commit to GitHub"
        let stepTen :String = "Push to origin"
    
        algorithmSteps = [stepOne, stepTwo, stepThree, stepFour, stepFive, stepSix, stepSeven, stepEight, stepNine, stepTen]
        
        let attributesDictionary = [NSAttributedStringKey.font : algorithmText.font]
        let fullAttributedString = NSMutableAttributedString(string: algorithm, attributes: attributesDictionary)
        
        for step in algorithmSteps
        {
            let bullet :String = "~"
            let formattedStep :String = "\n\(bullet) \(step)"
            let attributedStringStep : NSMutableAttributedString =
                NSMutableAttributedString(string: formattedStep)
            let paragraphStyle = createParagraphStyle()
            
            attributedStringStep.addAttributes([NSAttributedStringKey.paragraphStyle : paragraphStyle], range: NSMakeRange(0,attributedStringStep.length))
            
            fullAttributedString.append(attributedStringStep)
        }
        
        algorithmText.attributedText = fullAttributedString
        
    }
        
        
        private func createParagraphStyle() -> NSParagraphStyle
        {
            let paragraphStyle : NSMutableParagraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.defaultTabInterval = 15
            paragraphStyle.firstLineHeadIndent = 20
            paragraphStyle.headIndent = 35
            
            return paragraphStyle
        }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        setupAlgorithm()
    }
    
    override public func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
