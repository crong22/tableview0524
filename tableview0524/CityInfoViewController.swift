//
//  CityInfoViewController.swift
//  tableview0524
//
//  Created by 여누 on 5/29/24.
//

import UIKit

class CityInfoViewController: UIViewController {

    @IBOutlet var cityImageView: UIImageView!
    
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var subTitelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityLabel.font = .boldSystemFont(ofSize: 28)
        cityLabel.textColor = .black
        cityLabel.textAlignment = .center
        
        subTitelLabel.font = .systemFont(ofSize: 18)
        subTitelLabel.textColor = .darkGray
        subTitelLabel.textAlignment = .center
        subTitelLabel.numberOfLines = 0

        let cityname = UserDefaults.standard.string(forKey: "cityname")
        let citydescription = UserDefaults.standard.string(forKey: "citydescription")
        let imageurl = UserDefaults.standard.string(forKey: "imageurl")
        
        cityLabel.text = cityname!
        subTitelLabel.text = citydescription!
        
        let url = URL(string: imageurl ?? "nil")
        cityImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "heart"))
        
    }
    override func awakeFromNib() {
//        print(#function)
//        cityLabel.font = .boldSystemFont(ofSize: 28)
//        cityLabel.textColor = .black
//        cityLabel.textAlignment = .center
//        
//        subTitelLabel.font = .systemFont(ofSize: 18)
//        subTitelLabel.textColor = .darkGray
//        subTitelLabel.textAlignment = .center
//        subTitelLabel.numberOfLines = 0
    }
    func configureCell(_ data : Travel) {
//        if data.title == nil {
//            print("nil")
//        }else{
//            cityLabel.text = "\(data.title)"
//        }

//        cityLabel.text = data.title
//     
//        subTitelLabel.text = data.description
//          
//        let url = URL(string: data.travel_image ?? "nil")
//        cityImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "heart"))
    }
}
