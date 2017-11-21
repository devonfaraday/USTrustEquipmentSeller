//
//  CompanyProfileViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class CompanyProfileViewController: UIViewController {

    /* Outlets */
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var einNumber: UITextField!
    
    /* Button Outlets */
    @IBOutlet weak var saveEditButton: UIButton!
    @IBOutlet weak var administratorSettingsButton: UIButton!
    @IBOutlet weak var companyListingsButton: UIButton!
    @IBOutlet weak var addImageButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
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
    
    @IBAction func addImageButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func saveEditButtonTapped(_ sender: Any) {
    }
    
    
    
}
