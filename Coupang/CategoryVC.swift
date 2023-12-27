//
//  CategoryVC.swift
//  Coupang
//
//  Created by 김은지 on 12/27/23.
//

import UIKit

class CategoryVC: UIViewController, UICollectionViewDelegate {

    
    fileprivate var myCVData: [String] = []
    
    @IBOutlet weak var searchButton: UIButton!

    @IBOutlet weak var bagButton: UIButton!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    
        appendCVlist() // 배열 추가
        
        
        
      
    }
    
    fileprivate func setupUI() {
            print(#fileID, #function, #line, "-  주석 ")
        
        searchButton.frame = CGRectMake(0, 0, 20, 30)
        
        bagButton.frame = CGRectMake(0, 0, 30, 30)
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false

     
        
    }
    
    
    fileprivate func appendCVlist() {
            print(#fileID, #function, #line, "- <# 주석 #>")
        let addArray = ["라이프", "뷰티", "오락", "스타일링"]
        myCVData.append(contentsOf: addArray)
        myCollectionView.reloadData()
    }



}

extension CategoryVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return myCVData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? CollectionViewCell {
            
            cell.myLabel?.text = myCVData[indexPath.row]

            
            return cell
        }
    
       
        return UICollectionViewCell()
        
    }
    
    
    
}
