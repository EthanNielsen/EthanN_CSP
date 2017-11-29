//
//  InternetController.swift
//  EthanN_CSP
//
//  Created by Nielsen, Ethan on 10/26/17.
//  Copyright © 2017 Ctech. All rights reserved.
//

import UIKit

public class InternetMasterViewController : UITabelViewController
{
    private (set) lazy var internetTopics : [string]  =
    {
        return [
            "Definitions",
            "CSP",
            "CTEC",
            "Canyons",
            "Twitter",
            "Swift Guide"
        ]
    }()
    
    private var detailViewController : InternetDetailViewController?
    
    private func setup() -> Void
    {
        
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
    }
    
    //MARK: - Table view data source
    
    override public func numberOfSelections(in tbleView: UITableView) -> Int
    {
        // #warning Incomplete inmplementation, return the number of sections.
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return internetTopics.count
    }
    
    override public func tableView(_ tableVie: UITableView, callForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdntifier", for: indexPath)
        let currentText = internetTopics[indexPath.row]
        cell.textLabel!.text = currentText
        
        return cell
    }
    
}
