//
//  adInfoViewController.swift
//  tableview0524
//
//  Created by 여누 on 5/29/24.
//

import UIKit

class adInfoViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet var adLabel: UILabel!
    
    @IBOutlet var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adLabel.font = .boldSystemFont(ofSize: 24)
        adLabel.textColor = .black
        adLabel.textAlignment = .center
        
        let adtitle = UserDefaults.standard.string(forKey: "adtitle")
        adLabel.text = adtitle
        
        dismissButton.setTitle("닫기", for: .normal)
        
    }
    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
