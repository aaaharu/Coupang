//
//  MyVC.swift
//  Coupang
//
//  Created by 김은지 on 12/27/23.
//

import UIKit

class MyVC: UIViewController, UICollectionViewDelegate, UITableViewDelegate {

    

    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var fifthBtn: UIButton!
    @IBOutlet weak var forthBtn: UIButton!
    @IBOutlet weak var sixthBtn: UIButton!
    
    
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
        
        firstBtn.layer.cornerRadius = 13
        firstBtn.layer.borderColor = UIColor.lightGray.cgColor
        firstBtn.layer.borderWidth = 1
        
        secondBtn.layer.cornerRadius = 13
        secondBtn.layer.borderColor = UIColor.lightGray.cgColor
        secondBtn.layer.borderWidth = 1
        
        thirdBtn.layer.cornerRadius = 13
        thirdBtn.layer.borderColor = UIColor.lightGray.cgColor
        thirdBtn.layer.borderWidth = 1
        
        forthBtn.layer.cornerRadius = 13
        forthBtn.layer.borderColor = UIColor.lightGray.cgColor
        forthBtn.layer.borderWidth = 1
        
        fifthBtn.layer.cornerRadius = 13
        fifthBtn.layer.borderColor = UIColor.lightGray.cgColor
        fifthBtn.layer.borderWidth = 1
        
        sixthBtn.layer.cornerRadius = 13
        sixthBtn.layer.borderColor = UIColor.lightGray.cgColor
        sixthBtn.layer.borderWidth = 1
        
        
        
        
    }
    
    fileprivate func fetchCollectionViewData() {
            print(#fileID, #function, #line, "- <# 주석 #>")
        
        let dataArray = ["생활", "코디", "여가", "반려생활", "매거진"]
        collectionArray.append(contentsOf: dataArray)
        myCollectionView.reloadData()
        
    }
    
    fileprivate func fetchTableViewData() {
        print(#fileID, #function, #line, "- <# 주석 #>")
    
    let firstDataArray = ["트래킹", "전시", "데이트", "일상", "아우터", "이너", "언더웨어", "원피스", "치마", "바지"]
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
        
        switch currentSegmentIndex {
        case 0:
            return firstTableViewArray.count
        case 1:
            return secondTableViewArray.count
        default:
            return 0
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 현재 세그먼트 인덱스에 따른 데이터로 셀 구성
        print(#fileID, #function, #line, "- 선택된 세그먼트: \(currentSegmentIndex)")
        
        if let cell = myTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            
            cell.titleLabel.text = tableViewCell(currentSegmentIndex: currentSegmentIndex, indexPath: indexPath)
            
            return cell
        }
        return UITableViewCell()
    }
    
    fileprivate func tableViewCell(currentSegmentIndex: Int, indexPath: IndexPath) -> String {
        print(#fileID, #function, #line, "- <# 주석 #>")
        
        switch currentSegmentIndex {
            
        case 0:
            return firstTableViewArray[indexPath.row]
        case 1:
            return secondTableViewArray[indexPath.row]
        default:
            return ""
        }
    }
    
}
