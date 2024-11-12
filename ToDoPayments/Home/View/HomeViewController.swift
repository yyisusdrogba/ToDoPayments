//
//  HomeViewController.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 06/11/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    let proubeArray: [ModelPaymentCard] = [
        ModelPaymentCard(image: "xbox.logo", name: "Game pass", category: "Entertainment", price: "179", paymentLimit: "12/12/2000", paymentForPerson: nil),
        ModelPaymentCard(image: "playstation.logo", name: "12345678912345678912345678912", category: "technology and comunication", price: "20,000", paymentLimit: "12/12/2000", paymentForPerson: nil),
        ModelPaymentCard(image: "carrot", name: "pago de el pastel", category: "feeding", price: "300", paymentLimit: "12/23/2000", paymentForPerson: nil)
    ]
    
    let menuButton: UIButton = {
        let menuButton = UIButton(type: .system)
        menuButton.setImage(UIImage(systemName: "filemenu.and.selection"), for: .normal)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        let entertainment = UIAction(title: "Entertainment", image: UIImage(systemName: "arcade.stick.console")) { action in
            print("actionOne:\(action)")
        }
        let menu = UIMenu(image: UIImage(systemName: ""), children: HomeDataManager().getActionsForButton())
        menuButton.menu = menu
        menuButton.showsMenuAsPrimaryAction = true
        menuButton.tintColor = .black
        return menuButton
    }()
    
    let paymentButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(addPayment), for: .touchUpInside)
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        return button
    }()
    
    let verticalStack: UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.backgroundColor = .blue
        return verticalStack
    }()
    
    let horizontalStack: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.axis = .horizontal
        horizontalStack.backgroundColor = .brown
        horizontalStack.distribution = .fillEqually
        return horizontalStack
    }()
    
    let tableView: UITableView  = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .green
        tableView.register(PaymentsHomeTableViewCell.self, forCellReuseIdentifier: "PaymentsHomeTableViewCell")
        return tableView
    }()

    override func viewDidLoad() {
        initComponents()
    }
    
    private func initComponents() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
        view.addSubview(verticalStack)
        verticalStack.addArrangedSubview(horizontalStack)
        horizontalStack.addArrangedSubview(UIView())
        horizontalStack.addArrangedSubview(menuButton)
        horizontalStack.addArrangedSubview(paymentButton)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            horizontalStack.topAnchor.constraint(equalTo: verticalStack.topAnchor),
            horizontalStack.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: verticalStack.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: horizontalStack.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            menuButton.heightAnchor.constraint(equalToConstant: 40),
            menuButton.widthAnchor.constraint(equalToConstant: 40),
            
            paymentButton.heightAnchor.constraint(equalToConstant: 40),
            paymentButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func addPayment() {
        
    }
}

extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return proubeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentsHomeTableViewCell") as! PaymentsHomeTableViewCell
        let model = proubeArray[indexPath.row]
        cell.configure(model: model)
        return cell
    }
   
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}


struct proubeTableCell {
    let name: String
}
