//
//  ViewController.swift
//  Assignment_Task1
//
//  Created by YashraJ Gujar on 24/02/20.
//  Copyright © 2020 YashraJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionViewRef: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionViewRef.delegate = self
        collectionViewRef.dataSource = self
    }


}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

