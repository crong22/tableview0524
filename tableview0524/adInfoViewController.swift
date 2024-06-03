//
//  adInfoViewController.swift
//  tableview0524
//
//  Created by 여누 on 5/29/24.
//

import UIKit

class adInfoViewController: UIViewController {
    // 1단계 값을 받을 것을 만들어준다
    var data : Travel?
    
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
        
        mainView.backgroundColor = data?.bgcolor
        
        dismissButton.setTitle("닫기", for: .normal)
//        let backcolor = UserDefaults.standard.string(forKey: "backcolor")
//        mainView.backgroundColor = backcolor
        
    }
    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
