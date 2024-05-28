//
//  CityTableViewCell.swift
//  tableview0524
//
//  Created by 여누 on 5/27/24.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var starLabel: UILabel!
    @IBOutlet var saveLabel: UILabel!
    
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainLabel.font = .boldSystemFont(ofSize: 17)
        mainLabel.textColor = .black
        mainLabel.textAlignment = .left
        
        subLabel.font = .systemFont(ofSize: 14)
        subLabel.textColor = .darkGray
        subLabel.textAlignment = .left
        
        gradeLabel.font = .systemFont(ofSize: 14)
        gradeLabel.textColor = .darkGray
        gradeLabel.textAlignment = .left
        
        starLabel.font = .systemFont(ofSize: 14)
        starLabel.textColor = .darkGray
        starLabel.textAlignment = .left
        
        saveLabel.font = .systemFont(ofSize: 14)
        saveLabel.textColor = .darkGray
        saveLabel.textAlignment = .left
        
        mainImageView.contentMode = .scaleAspectFill
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mainImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImageView.layer.cornerRadius = 10
    }
    
    func configureCell(_ data : Travel) {
        if data.ad == false{
            //AD가 false인 경우 !
              mainLabel.text = data.title
     
              subLabel.text = data.description

              gradeLabel.text = "\(data.grade ?? 0)점"

              let randomStar = Int.random(in: 1...3000)
              starLabel.text = "(\(randomStar))"

              saveLabel.text = "저장 \(data.save ?? 0)"
          
            let url = URL(string: data.travel_image ?? "nil")
              mainImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "heart"))
        }
    }
}
