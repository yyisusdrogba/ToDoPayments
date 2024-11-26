//
//  PaymentsHomeTableViewCell.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 08/11/24.
//

import UIKit

class PaymentsHomeTableViewCell: UITableViewCell {
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .black
        return image
    }()
    
    let name: UILabel = {
        let text = UILabel()
        text.textColor = .red
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 3
        text.font = .systemFont(ofSize: 16)
        return text
    }()
    
    let price: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let paymentLimit: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 2
        return label
    }()
    
    let category: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 3
        return label
    }()
    
    let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        stack.spacing = 10
        return stack
    }()
    
    let verticalStackFirstItems: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 6
        return stack
    }()
    
    let verticalStackSecondItems: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()
    
    let verticalStackThirdItems: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initComponents () {
        
        addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(verticalStackFirstItems)
        horizontalStack.addArrangedSubview(verticalStackSecondItems)
        horizontalStack.addArrangedSubview(verticalStackThirdItems)
        
        verticalStackFirstItems.addArrangedSubview(image)
        verticalStackSecondItems.addArrangedSubview(name)
        verticalStackSecondItems.addArrangedSubview(price)
        verticalStackThirdItems.addArrangedSubview(paymentLimit)
        verticalStackThirdItems.addArrangedSubview(category)
        
        
        NSLayoutConstraint.activate([
            
            verticalStackFirstItems.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalStackSecondItems.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalStackThirdItems.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            
            horizontalStack.topAnchor.constraint(equalTo: topAnchor),
            horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            verticalStackSecondItems.widthAnchor.constraint(equalTo: horizontalStack.widthAnchor, multiplier: 0.4),
            verticalStackThirdItems.widthAnchor.constraint(equalTo: horizontalStack.widthAnchor, multiplier: 0.4),
            
            image.heightAnchor.constraint(equalToConstant: 40),
            image.widthAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    func configure(model: ModelPaymentCard) {
        image.image = UIImage(systemName: model.image)
        name.text = "Pay name: \(model.name)"
        price.text = "Amount: \(model.price)"
        paymentLimit.text = "Payment limit: \(model.dateLimit)"
        category.text = "Category: \(model.category)"
    }
    
}
