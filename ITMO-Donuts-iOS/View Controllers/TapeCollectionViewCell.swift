//
//  TapeCollectionViewCell.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 19.12.2022.
//

import UIKit

class TapeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet weak var ddescription: UILabel!
    
    


    
    func configure(name n: String, descr d: String, img p: String) {
        name.text = n
        ddescription.text = d
        
        let url = URL(string: p)
        let data = try? Data(contentsOf: url!)
        cellImage.image = UIImage(data: data!)
    }

        
}
