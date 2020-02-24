//
//  ViewController.swift
//  Assignment_Task1
//
//  Created by YashraJ Gujar on 24/02/20.
//  Copyright © 2020 YashraJ. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {
    
    private var APIData : JSON?
    
    let noOfItemsinARow : CGFloat = 1
    var cellGap : CGFloat = 10
    var sectionLRGap :CGFloat = 10
    var gapCalculation : CGFloat = 0

    @IBOutlet weak var collectionViewRef: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionViewRef.delegate = self
        collectionViewRef.dataSource = self
        
        gapCalculation = (noOfItemsinARow - 1 ) * cellGap// 2 - 1 * 10 = 10
        gapCalculation = gapCalculation + (sectionLRGap * 2) // 10 + 10*2 = 30
        
        collectionViewRef.register(UINib(nibName: "collectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCell")
        
        getPhotoData()
        
    }
    
    func getPhotoData() {
        let url = "http://demo8716682.mockable.io/cardData"
        guard let urlSting : URL = URL(string: url) else {return}
        
        let headers : HTTPHeaders = [
            "Accept" : "application/json"
        ]
        let parameters : Parameters = [:]
        
        Alamofire.request(urlSting, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.result.isSuccess {
                
                 let datas : JSON = JSON(response.result.value!)
                     print("JSON Data is :", datas)
                     self.APIData = datas
                     print("JSON Data is :",self.APIData)
                     DispatchQueue.main.async {
                         
                         self.collectionViewRef.reloadData()
                     }
                   
            } else if response.result.isFailure {
                
                print("Not connected to the internet")
                //SVProgressHUD.showError(withStatus: "Check Internet Connection.")
                
            
        }
        
        
    }

}
    
    
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return APIData?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! collectionViewCell
         let name : String = "\(APIData?[indexPath.row]["name"] ?? "")"
        cell.nameLabel.text = name
        
        let age : String = "\(APIData?[indexPath.row]["age"] ?? "")"
        cell.ageLabel.text = age
        
        let location : String = "\(APIData?[indexPath.row]["location"] ?? "")"
        cell.locationLabel.text = location
        
        let imagePath = "\(APIData?[indexPath.row]["url"] ?? "")"
        
        let imageURL = URL(string: imagePath)
        cell.imageViewRef.sd_setImage(with: imageURL, completed: nil)
        
        return cell
    }
}
extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - gapCalculation)/noOfItemsinARow, height: ((collectionView.frame.size.width - gapCalculation)/noOfItemsinARow)-250)
    }


}
