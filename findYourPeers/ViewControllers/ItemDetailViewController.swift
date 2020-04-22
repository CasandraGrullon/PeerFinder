//
//  ItemDetailViewController.swift
//  findYourPeers
//
//  Created by casandra grullon on 4/21/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import AVFoundation

class ItemDetailViewController: UIViewController {
    
    let itemDetailView = ItemDetailView()
    
    override func loadView() {
        view = itemDetailView
    }
    
    public var item: Item
    
    init(_ item: Item) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private var images = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.itemDetailView.itemsCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        images = item.itemImages
        setUpCollectionView()
        updateUI()
    }
    
    private func updateUI() {
        itemDetailView.itemName.text = "\(item.itemName)"
        itemDetailView.sellerName.text = "Seller: \(item.sellerName)"
        itemDetailView.priceLabel.text = "Price: \(item.itemPrice)"
        itemDetailView.conditionLabel.text = "Condition: \(item.itemCondition)"
        itemDetailView.descriptionLabel.text = "\(item.itemDescription)"
        itemDetailView.imageView.kf.setImage(with: URL(string: item.itemImages.first ?? ""))
    }
    
    private func setUpCollectionView(){
        itemDetailView.itemsCollectionView.delegate = self
        itemDetailView.itemsCollectionView.dataSource = self
        itemDetailView.itemsCollectionView.register(ItemDetailCell.self, forCellWithReuseIdentifier: "itemDetailCell")
    }
    
}

extension ItemDetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 1
        let maxWidth = CGFloat(80)
        let numberOfItems: CGFloat = 1
        let totalSpace: CGFloat = numberOfItems * itemSpacing
        let itemWidth: CGFloat = (maxWidth - totalSpace) / numberOfItems
        
        return CGSize(width: itemWidth, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemDetailCell", for: indexPath) as? ItemDetailCell else {
            fatalError("could not downcast to ItemDetailCell")
        }
        
        let image = images[indexPath.row]
        cell.configureCell(for: image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = images[indexPath.row]
        itemDetailView.imageView.kf.setImage(with: URL(string: image))
    }
    
}
