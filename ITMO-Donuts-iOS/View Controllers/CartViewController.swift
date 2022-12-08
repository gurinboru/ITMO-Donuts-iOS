//
//  CartViewController.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 02.12.2022.
//
import Foundation
import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
//    var itemCartArray: [Cart] = {
//        var blankCart = Cart()
//        blankCart.name = "Donut"
//        return [blankCart]
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
//        collectionView.dataSource = self
//        collectionView.delegate = self
    }
}
//
//extension CartViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return itemCartArray.count
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cartCell", for: indexPath) as? CartCollectionViewCell{
//
//            return itemCell
//        }
//        return UICollectionViewCell()
//    }
//}
