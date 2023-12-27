//
//  MyVC.swift
//  Coupang
//
//  Created by 김은지 on 12/27/23.
//

import UIKit

class MyVC: UIViewController, UICollectionViewDelegate, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    private var currentSegmentIndex = 0
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    private var customSegmentedControl: CustomSegmentedControl!
    private var collectionArray: [String] = []
    
    private var firstTableViewArray: [String] = []
    
    private var secondTableViewArray: [String] = []
    
    private var thirdTableViewArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
       fetchCollectionViewData()
        fetchTableViewData()
       makeCustomSegmentControl()
        // 선택된 세그먼트 이벤트 처리
        customSegmentedControl.onSegmentChanged = { [ weak self ]selectedIndex in
                    print("선택된 세그먼트: \(selectedIndex)")
            self?.currentSegmentIndex = selectedIndex
            self?.myTableView.reloadData()
            }
        
        
    }
    
    fileprivate func setupUI() {
            print(#fileID, #function, #line, "- <# 주석 #>")
  
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myTableView.delegate = self
        myTableView.dataSource = self
        
       
        
    }
    
    fileprivate func fetchCollectionViewData() {
            print(#fileID, #function, #line, "- <# 주석 #>")
        
        let dataArray = ["생활", "코디", "여가", "반려생활"]
        collectionArray.append(contentsOf: dataArray)
        myCollectionView.reloadData()
        
    }
    
    fileprivate func fetchTableViewData() {
        print(#fileID, #function, #line, "- <# 주석 #>")
    
    let firstDataArray = ["트래킹", "전시", "데이트", "일상"]
    let secondDataArray = ["아리랑", "아라리요", "아리랑고개", "넘어간다"]
    
    firstTableViewArray.append(contentsOf: firstDataArray)
        secondTableViewArray.append(contentsOf: secondDataArray)
    myTableView.reloadData()
    
}
    fileprivate func makeCustomSegmentControl() {
            print(#fileID, #function, #line, "- <# 주석 #>")
        
        // CustomSegmentedControl 초기화
             customSegmentedControl = CustomSegmentedControl()
             customSegmentedControl.configure(with: ["첫 번째", "두 번째", "세 번째"]) // 세그먼트 타이틀 설정
             view.addSubview(customSegmentedControl)

             // 레이아웃 설정
             customSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
             NSLayoutConstraint.activate([
                customSegmentedControl.topAnchor.constraint(equalTo: self.myCollectionView.bottomAnchor, constant: 10),
                 customSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                customSegmentedControl.widthAnchor.constraint(equalToConstant: 130),
                 customSegmentedControl.heightAnchor.constraint(equalToConstant: 150) // 원하는 높이 설정
             ])
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           myTableView.topAnchor.constraint(equalTo: myCollectionView.bottomAnchor, constant: 10),
            myTableView.leadingAnchor.constraint(equalTo: customSegmentedControl.trailingAnchor, constant: 0),
           myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
  

}

extension MyVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(#fileID, #function, #line, "- collectionData Array: \(collectionArray.count)")
        
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell {
            
            cell.titleLabel.text = collectionArray[indexPath.row]
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    
    
}

extension MyVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 현재 세그먼트 인덱스에 따른 데이터 배열의 크기 반환
        
        if currentSegmentIndex == 0 {
            return firstTableViewArray.count
        } else if currentSegmentIndex == 1 {
            return secondTableViewArray.count
        }
        
         return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 현재 세그먼트 인덱스에 따른 데이터로 셀 구성
        print(#fileID, #function, #line, "- 선택된 세그먼트: \(currentSegmentIndex)")
        
        if let cell = myTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            if currentSegmentIndex == 0 {
                cell.titleLabel.text = firstTableViewArray[indexPath.row]
            } else if currentSegmentIndex == 1 {
                cell.titleLabel.text = secondTableViewArray[indexPath.row]
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    
}
