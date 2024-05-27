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
        return num * 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }else if section == 1 {
            return 1
        }else if section == 2  {
            return 2
        }else if section == 3 {
            return 1
        }else if section == 4 {
            return 4
        }else if section == 5 {
            return 1
        }else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("순서 \(indexPath.section)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        let data = list[indexPath.row]
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
            print(list[indexPath.row].ad)
            if list[indexPath.row].ad == true{
                cell.adTitleLabel.text = data.title
                cell.adTitleLabel.font = .boldSystemFont(ofSize: 17)
                cell.adTitleLabel.textAlignment = .center
                cell.adTitleLabel.numberOfLines = 0
                cell.adTitleLabel.textColor = .black
                
                cell.adButton.setTitle("AD", for: .normal)
                cell.adButton.tintColor = .black
                cell.adButton.backgroundColor = .white
                cell.adButton.layer.cornerRadius = 10
            }
        }else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
            if list[indexPath.row].ad == true{
                cell.adTitleLabel.text = data.title
                cell.adTitleLabel.font = .boldSystemFont(ofSize: 17)
                cell.adTitleLabel.textAlignment = .center
                cell.adTitleLabel.numberOfLines = 0
                cell.adTitleLabel.textColor = .black
                
                cell.adButton.setTitle("AD", for: .normal)
                cell.adButton.tintColor = .black
                cell.adButton.backgroundColor = .white
                cell.adButton.layer.cornerRadius = 10
            }
        }else if indexPath.section == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
            if list[indexPath.row].ad == true{
                cell.adTitleLabel.text = data.title
                cell.adTitleLabel.font = .boldSystemFont(ofSize: 17)
                cell.adTitleLabel.textAlignment = .center
                cell.adTitleLabel.numberOfLines = 0
                cell.adTitleLabel.textColor = .black
                
                cell.adButton.setTitle("AD", for: .normal)
                cell.adButton.tintColor = .black
                cell.adButton.backgroundColor = .white
                cell.adButton.layer.cornerRadius = 10
            }
        }else{
            //print("22323232323233233")
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
        }
        return cell
    }
}
