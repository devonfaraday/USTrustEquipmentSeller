//
//  CreateListingInputViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 10/4/18.
//  Copyright © 2018 Christian McMullin. All rights reserved.
//

import UIKit

class CreateListingInputViewController: UIViewController {

    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var previousButton: UIButton!
    
    weak var createListingDelegate: CreateListingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func previousButtonTapped(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
