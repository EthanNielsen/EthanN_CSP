//
//  GlobalImpactViewController.swift
//  EthanN_CSP
//
//  Created by Nielsen, Ethan on 11/10/17.
//  Copyright © 2017 Ctech. All rights reserved.
//

import UIKit

class GlobalImpactViewController: UIViewController
{

    @IBOutlet weak var PicRights: UIImageView!
    
    @IBOutlet weak var HumanRights4All: UIImageView!
    
    @IBOutlet weak var RightsApp: UIImageView!
    
    
    @IBOutlet weak var NeedsAddress: UILabel!
    
    @IBOutlet weak var GlobalProblem: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let addressProblem :String = "People are suffering because they don't have human rights, they can't get health care or find assistance because they don't have human rights. This needs to stop so we created this app."
        
        let global :String = "Although we have our human rights other people may not. People in low income areas can't get the nessisary help they need and because of that they either acccept it or die."
        
        
        PicRights.image = #imageLiteral(resourceName: "HumanRights")
        
        NeedsAddress.text = addressProblem
        
        GlobalProblem.text = global
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
