//
//  TravelTableViewController.swift
//  tableview0524
//
//  Created by 여누 on 5/26/24.
//

import UIKit
import Kingfisher

var travellist = MagazineInfo().magazine


class TravelTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 500

    }
    
    //셀의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travellist.count
    }

    //셀의 속성
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Swift Type Casting
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
        let data = travellist[indexPath.row]
        
        let formatter = DateFormatter()
        func String2DateType(string : String) -> Date?{
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_kr")
            formatter.dateFormat = "yyMMdd"
            
            return formatter.date(from: string)
        }
        print("11111: \(data.date)")
        var string2date = String2DateType(string: data.date)
        formatter.dateFormat = "yy년 MM월 dd일"
        
        cell.mainTitleLabel.text = data.title
        cell.mainTitleLabel.font = .boldSystemFont(ofSize: 24)
        cell.mainTitleLabel.numberOfLines = 0
        cell.backgroundColor = .white
       
        cell.smallTitleLabel.text = data.subtitle
        cell.smallTitleLabel.font = .systemFont(ofSize: 14)
        cell.smallTitleLabel.textColor = .lightGray
        cell.smallTitleLabel.textAlignment = .left
        
        cell.dateLabel.text = formatter.string(from: string2date!)
        cell.dateLabel.font = .systemFont(ofSize: 14)
        cell.dateLabel.textColor = .lightGray
        cell.dateLabel.textAlignment = .right
        
        print(cell.mainTitleLabel.text!)
        // checkmark.square.fill
        
       // cell.titleLabel
//
//        cell.subtitleLabel.text = data.money.formatted()
//        cell.subtitleLabel.font = .systemFont(ofSize: 14)
//        cell.subtitleLabel.textColor = .darkGray
//
        
        // image url 주소
        let url = URL(string: data.photo_image)
        print("urlurlurlurlurlurl\(url!)")
        cell.travelimageView.kf.setImage(with : url)
        cell.travelimageView.layer.cornerRadius = 10
//        let name = data.star ? "star.fill" : "star"
//        let image = UIImage(systemName: name)
//        cell.starButton.setImage(image, for: .normal)
//        cell.starButton.tag = indexPath.row
//        cell.starButton.tintColor = .black
//        cell.starButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
//        
//        let name2 = data.check ? "checkmark.square.fill" : "checkmark.square"
//        let image2 = UIImage(systemName: name2)
//        cell.checkButton.setImage(image2, for: .normal)
//        cell.checkButton.tag = indexPath.row
//        cell.checkButton.tintColor = .black
//        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
//
        return cell
    }
    
}
