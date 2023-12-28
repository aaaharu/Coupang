//
//  CollectionViewCell.swift
//  Coupang
//
//  Created by 김은지 on 12/27/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentCell: UIView!
    
    @IBOutlet weak var imageView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            print(#fileID, #function, #line, "- <# 주석 #>")
        
        self.layer.cornerRadius = 10
        self.imageView.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
    }
}
