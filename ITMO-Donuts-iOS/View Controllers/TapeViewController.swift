//
//  TapeViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 23.11.2022.
//

import UIKit

class TapeViewController: UICollectionViewController {
    //weak var delegate: TapeViewControllerDelegate?
    
    let dataSource = Donuts().donuts
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tape"
        view.backgroundColor = .purple
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if let donutCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TapeCell", for: indexPath) as? TapeCollectionViewCell {
            donutCell.configure(name: dataSource[indexPath.row].title, descr: dataSource[indexPath.row].description, img: dataSource[indexPath.row].picture)
            cell = donutCell

            cell.contentView.layer.cornerRadius = 25.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true;

            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false;
            cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select donut: \(dataSource[indexPath.row].title)")
    }
}
