//
//  InitialInfoVC.swift
//  FruitHub
//
//  Created by Vijay Parmar on 28/08/23.
//

import UIKit

class InitialInfoVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var txtFirstName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    
    //MARK: - Initial Setup
    private func initialSetup(){
        if #available(iOS 11.0, *) {
            scrollview.contentInsetAdjustmentBehavior = .never
        }
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    //MARK: - Button Actions
    @IBAction func btnActionTapStart(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "HomeVC")as? HomeVC{
            vc.vmHome.firestName = txtFirstName.text ?? "John"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
