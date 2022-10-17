//
//  PlaceCollectionViewCell.swift
//  GoToPOM☆
//
//  Created by 石丸剣心 on 2022/10/13.
//

import UIKit

class PlaceCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func setUpCell(text: String) {
        
        placeLabel.text = text
        
    }

}
