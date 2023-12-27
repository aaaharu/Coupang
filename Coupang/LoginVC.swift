//
//  ViewController.swift
//  Coupang
//
//  Created by 김은지 on 12/20/23.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailView: UIView!
    
    
    @IBOutlet weak var passwordView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }

    
    fileprivate func setupUI() {
            print(#fileID, #function, #line, "- UI를 그립니다.")
        // 뷰 외곽선
        emailView.layer.borderColor = UIColor.systemGray3.cgColor
        emailView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.systemGray3.cgColor
        passwordView.layer.borderWidth = 1

    }

}

