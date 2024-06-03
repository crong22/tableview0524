//
//  AdTableViewCell.swift
//  tableview0524
//
//  Created by 여누 on 5/27/24.
//

import UIKit



class AdTableViewCell: UITableViewCell {

    var data : [Travel]?
    @IBOutlet var mainView: UIView!
    @IBOutlet var adTitleLabel: UILabel!
    @IBOutlet var adButton: UIButton!

    @IBOutlet var mainbackView: UIView!
    

    
    override func awakeFromNib() {
        print(#function)
        adTitleLabel.font = .boldSystemFont(ofSize: 17)
        adTitleLabel.textAlignment = .center
        adTitleLabel.numberOfLines = 0
        adTitleLabel.textColor = .black
        
        adButton.tintColor = .black
        adButton.backgroundColor = .white
        adButton.layer.cornerRadius = 10
        
        mainbackView.layer.cornerRadius = 10
    }
    
    func configureAdCell(_ data : Travel) {
        print(#function)
        adTitleLabel.text = data.title
        
        adButton.setTitle("AD", for: .normal)
        
        mainbackView.backgroundColor = data.bgcolor

    }
}
