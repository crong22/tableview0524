//
//  TravelTableViewCell.swift
//  tableview0524
//
//  Created by 여누 on 5/26/24.
//

import UIKit

class TravelTableViewCell: UITableViewCell {

    
    @IBOutlet var travelimageView: UIImageView!
    @IBOutlet var mainTitleLabel: UILabel!
    @IBOutlet var smallTitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        mainTitleLabel.font = .boldSystemFont(ofSize: 24)
        mainTitleLabel.numberOfLines = 0
        backgroundColor = .white
        
        smallTitleLabel.font = .systemFont(ofSize: 14)
        smallTitleLabel.textColor = .lightGray
        smallTitleLabel.textAlignment = .left
        
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .lightGray
        dateLabel.textAlignment = .right
        
    }
    
    func configureCell(_ data : Magazine) {
        //날짜변경포맷
        let formatter = DateFormatter()
        
        func String2DateType(string : String) -> Date?{
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_kr")
            formatter.dateFormat = "yyMMdd"
            return formatter.date(from: string)
        }
        
        var string2date = String2DateType(string: data.date)
        formatter.dateFormat = "yy년 MM월 dd일"
        
        mainTitleLabel.text = data.title

        smallTitleLabel.text = data.subtitle

        dateLabel.text = formatter.string(from: string2date!)
        
        let url = URL(string: data.photo_image)
        travelimageView.kf.setImage(with : url)
        travelimageView.layer.cornerRadius = 10
    }
    

}
