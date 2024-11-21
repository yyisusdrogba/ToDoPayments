//
//  ImageCollectionViewCell.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 14/11/24.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let image =  UIImageView()
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
        
        NSLayoutConstraint.activate([
            
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 40),
            image.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(symbol: String){
        image.image = UIImage(systemName: symbol)
    }
}
