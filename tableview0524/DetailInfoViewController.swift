//
//  DetailInfoViewController.swift
//  tableview0524
//
//  Created by 여누 on 5/27/24.
//

import UIKit
import Kingfisher

class DetailInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var list = TravelInfo().travel
    var adlist : [Travel] = []
    var num = 0
    var notNum = 0
    @IBOutlet var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.rowHeight = 100
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        likeNum()

        //만든 cell을 가져온다.
        let xib = UINib(nibName: "CityTableViewCell", bundle: nil)
        detailTableView.register(xib, forCellReuseIdentifier: "CityTableViewCell")
        
        let xib2 = UINib(nibName: "AdTableViewCell", bundle: nil)
        detailTableView.register(xib2, forCellReuseIdentifier: "AdTableViewCell")
    }

    func likeNum(){
        
        for i in 0..<list.count {
            if list[i].ad == true {
                num += 1
            }else {
                notNum += 1
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = list[indexPath.row]
        //print(data.ad)
            if data.ad == true{
                print("2323232323233")
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
                cell1.adTitleLabel.text = data.title
                cell1.adTitleLabel.font = .boldSystemFont(ofSize: 17)
                cell1.adTitleLabel.textAlignment = .center
                cell1.adTitleLabel.numberOfLines = 0
                cell1.adTitleLabel.textColor = .black
                
                cell1.adButton.setTitle("AD", for: .normal)
                cell1.adButton.tintColor = .black
                cell1.adButton.backgroundColor = .white
                cell1.adButton.layer.cornerRadius = 10
                var red = CGFloat.random(in: 0...1)
                var green = CGFloat.random(in: 0...1)
                var blue = CGFloat.random(in: 0...1)

                cell1.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
                cell1.mainView.layer.cornerRadius = 15
                return cell1
            }else{
                //print("22323232323233233")
                let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
                
                cell.mainLabel.text = data.title
                cell.mainLabel.font = .boldSystemFont(ofSize: 17)
                cell.mainLabel.textColor = .black
                cell.mainLabel.textAlignment = .left
                
                cell.subLabel.text = data.description
                cell.subLabel.font = .systemFont(ofSize: 14)
                cell.subLabel.textColor = .darkGray
                cell.subLabel.textAlignment = .left
                
                cell.gradeLabel.text = "\(data.grade ?? 0)점"
                cell.gradeLabel.font = .systemFont(ofSize: 14)
                cell.gradeLabel.textColor = .darkGray
                cell.gradeLabel.textAlignment = .left
                
                var randomStar = Int.random(in: 1...3000)
                cell.starLabel.text = "(\(randomStar))"
                cell.starLabel.font = .systemFont(ofSize: 14)
                cell.starLabel.textColor = .darkGray
                cell.starLabel.textAlignment = .left
                
                cell.saveLabel.text = "저장 \(data.save ?? 0)"
                cell.saveLabel.font = .systemFont(ofSize: 14)
                cell.saveLabel.textColor = .darkGray
                cell.saveLabel.textAlignment = .left
                
                let url = URL(string: data.travel_image ?? "nil")
                cell.mainImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "heart"))
                cell.mainImageView.contentMode = .scaleAspectFill
                cell.mainImageView.layer.cornerRadius = 10
                return cell
            }
        
    }
}
