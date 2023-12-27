//
//  ExtensionView.swift
//  Coupang
//
//  Created by 김은지 on 12/27/23.
//

import UIKit

class CustomSegmentedControl: UIView {
    
    
    private var buttons: [UIButton] = []
    private var selectedIndex: Int = 0
    

    // 이벤트 처리 클로저
    var onSegmentChanged: ((Int) -> Void)?

    
    func configure(with titles: [String]) {
        for title in titles {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            // 버튼 스타일 설정
            buttons.append(button)
            addSubview(button)
            
            
        }
        
        setupActions()
       
        
    }
    
    // 버튼 수직으로
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let buttonHeight = bounds.height / CGFloat(buttons.count)
        for (index, button) in buttons.enumerated() {
            button.frame = CGRect(x: 0, y: buttonHeight * CGFloat(index), width: bounds.width, height: buttonHeight)
        }
    }
    
    private func setupActions() {
           for (index, button) in buttons.enumerated() {
               button.addTarget(self, action: #selector(segmentTapped(_:)), for: .touchUpInside)
               button.tag = index
           }
       }
    
    @objc private func segmentTapped(_ sender: UIButton) {
           selectedIndex = sender.tag
        onSegmentChanged?(selectedIndex)
           // 선택된 세그먼트에 대한 시각적 강조 처리
        updateButtonStyles()
       }
    
    fileprivate func updateButtonStyles() {
        for (index, button) in buttons.enumerated() {
            button.backgroundColor = index == selectedIndex ? .systemCyan : .clear
        }
    }

    
    
    
    
}
