//
//  AdTableViewCell.swift
//  tableview0524
//
//  Created by 여누 on 5/27/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {

    @IBOutlet var mainView: UIView!
    @IBOutlet var adTitleLabel: UILabel!
    @IBOutlet var adButton: UIButton!

    override func awakeFromNib() {
        adTitleLabel.font = .boldSystemFont(ofSize: 17)
        adTitleLabel.textAlignment = .center
        adTitleLabel.numberOfLines = 0
        adTitleLabel.textColor = .black
        
        adButton.tintColor = .black
        adButton.backgroundColor = .white
        adButton.layer.cornerRadius = 10
        
        mainView.layer.cornerRadius = 15
    }
    
    func configureAdCell(_ data : Travel) {
        adTitleLabel.text = data.title
        
        adButton.setTitle("AD", for: .normal)

        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)

        backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        mainView.layer.cornerRadius = 15
    }
}
