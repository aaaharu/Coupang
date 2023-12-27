//
//  MyVC.swift
//  Coupang
//
//  Created by 김은지 on 12/27/23.
//

import UIKit

class MyVC: UIViewController {

    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    
    private var customSegmentedControl: CustomSegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
       makeCustomSegmentControl()
        // 선택된 세그먼트 이벤트 처리
        customSegmentedControl.onSegmentChanged = { selectedIndex in
                    print("선택된 세그먼트: \(selectedIndex)")
                }
    }
    
    fileprivate func setupUI() {
            print(#fileID, #function, #line, "- <# 주석 #>")
  

        
       
        
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
                 customSegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                 customSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                 customSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                 customSegmentedControl.heightAnchor.constraint(equalToConstant: 150) // 원하는 높이 설정
             ])
    }
  

}
