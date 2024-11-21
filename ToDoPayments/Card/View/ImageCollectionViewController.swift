//
//  ImageCollectionViewController.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 14/11/24.
//

import UIKit

protocol ImageSelectionProtocol {
    func imageSelected (image: UIImage)
}

class ImageCollectionViewController: UIViewController {

    var imageSelectionProtocol: ImageSelectionProtocol?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "imageCollectionViewCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.layer.cornerRadius = 10
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300),
            collectionView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {

//        guard let superview = view.superview else { return }
//
//        
//        NSLayoutConstraint.activate([
//
//            view.widthAnchor.constraint(equalToConstant: 300),
//                        view.heightAnchor.constraint(equalToConstant: 400),
//            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
//            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
//        ])
//        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
        guard let superview = view.superview else { return }
        
//        NSLayoutConstraint.activate([
//            view.widthAnchor.constraint(equalToConstant: 300),
//                        view.heightAnchor.constraint(equalToConstant: 400),
//            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
//            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
//            
//        ])
        
    }
}


extension ImageCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        SymbolsOrImagesCard.collectionSymbols.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        let model = SymbolsOrImagesCard.collectionSymbols[indexPath.row]
        cell.configure(symbol: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemSelected =  UIImage(systemName: SymbolsOrImagesCard.collectionSymbols[indexPath.item])!
        imageSelectionProtocol?.imageSelected(image: itemSelected)
        dismiss(animated: true)
    }
}
