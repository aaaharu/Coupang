//
//  VerticalSegmentVC.swift
//  Coupang
//
//  Created by 김은지 on 12/27/23.
//

import UIKit
import PagingKit

class VerticalSegmentVC: UIViewController {

    var menuViewController: PagingMenuViewController!
      var contentViewController: PagingContentViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
            menuViewController = vc
        } else if let vc = segue.destination as? PagingContentViewController {
            contentViewController = vc
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            print(#fileID, #function, #line, "- <# 주석 #>")
        
        
        menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
           menuViewController.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
     
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
