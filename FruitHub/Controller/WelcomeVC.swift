//
//  ViewController.swift
//  FruitHub
//
//  Created by Vijay Parmar on 28/08/23.
//

import UIKit

class WelcomeVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    //MARK: - IntialSetup
    private func initialSetup(){
        
        if #available(iOS 11.0, *) {
            scrollview.contentInsetAdjustmentBehavior = .never
        }
        
    }
    
    //MARK: - Button Actions
    @IBAction func btnActionTapContinue(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "InitialInfoVC")as? InitialInfoVC{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

