//
//  InternetController.swift
//  EthanN_CSP
//
//  Created by Nielsen, Ethan on 10/26/17.
//  Copyright © 2017 Ctech. All rights reserved.
//

import UIKit

public class InternetMasterViewController : UITableViewController
{
    private (set) lazy var internetTopics : [String]  =
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
    
    private lazy var addresses : [String] = []
    
    private var detailViewController : InternetDetailViewController?
    
    private func setup() -> Void
    {
        //TODO: Replace with your correct links
        addresses = [
        "https://www.google.com/",
        "https://apstudent.collegeboard.org/apcourse/ap-computer-science-principles",
        "http://www.canyonsdistrict.org",
        "https://ctec.canyonsdistrict.org/index.php/programs/ctec-programs",
        "https://www.aboutobjects.com/training/swift-training.html?gclid=CjwKCAiAxarQBRAmEiwA6YcGKMt4NtqrlMpy-PFBCfP7SZkQonMmVqIJs5dIvImYjHqfFTINsRFuqRoCQioQAvD_BwE",
        "https://twitter.com/?lang=en"
        ]
        
        if let splitView = splitViewController
        {
            let currentControllers = splitView.viewControllers
            detailViewController = currentControllers[0] as? InternetDetailViewController
        }
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
    }
    
    //MARK: - Table view data source
    
    override public func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete inmplementation, return the number of sections.
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return internetTopics.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let currentText = internetTopics[indexPath.row]
        cell.textLabel!.text = currentText
        
        return cell
    }
    
    //MARK: Handle the internal transfer
    override public func prepare(for segue: UIStoryboardSegue, sender:Any?)
    {
        if segue.identifier! == "showDetail"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let urlString = addresses[indexPath.row]
                let pageText : String
                
                if indexPath.row == 0
                {
                    //TODO: Replace with your definitions
                    pageText = """
                    URL - The address of a world wide web page.
                    TCP - A set of rules that controls the delivery of data on the Internet.
                    IP - Internet Protocol
                    DNS - Domain Name System, it resolves “human-readable” hostnames.
                    """
                }
                else
                {
                    pageText = internetTopics[indexPath.row]
                }
                
                let controller = segue.destination as!
                    InternetDetailViewController
                
                controller.detailAddress = urlString
                controller.detailText = pageText
                controller.navigationItem.leftBarButtonItem =
                    splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
}
