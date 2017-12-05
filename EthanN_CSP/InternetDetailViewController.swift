//
//  InternetDetailViewController.swift
//  EthanN_CSP
//
//  Created by Nielsen, Ethan on 11/29/17.
//  Copyright © 2017 Ctech. All rights reserved.
//

import UIKit
import WebKit

public class InternetDetailViewController : UIViewController
{
    //MARK: GUI Controls
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var webViewer: WKWebView!
    
    var detailAddress : String?
    {
        // MARK: Udate the detail view when a value is changed.
        didSet
        {
            configureDetailView()
        }
    }
    
    var detailText : String?
    {
        // MARK: Update the detail view when a value is changed.
        didSet
        {
            configureDetailView()
        }
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        configureDetailView()
        // Do any additional setup after loading the view.
    }
    
    private func configureDetailView() -> Void
    {
        if detailAddress != nil
        {
            if let currentWebView = webViewer
            {
                let currentURL = URL(string: detailAddress!)
                let currentWebRequest = URLRequest(url: currentURL!)
                currentWebView.load(currentWebRequest)
            }
        }
        else
        {
            if let currentWebView = webViewer
            {
                let currentURL = URL(string: "https://www.cnn.com")
                currentWebView.load(URLRequest(url:currentURL!))
            }
        }
        
        if detailText != nil
        {
            if let currentText = textView
            {
                currentText.text = detailText
            }
        }
        else
        {
            if let currentText = textView
            {
                currentText.text = "Ethan's CSP app internet screen :D"
            }
        }
    }
}
