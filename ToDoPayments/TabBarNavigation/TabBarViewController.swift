//
//  TabBarViewController.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 06/11/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let homeViewController = HomeViewController()
    let recordViewController = RecordViewController()
    let graphViewController = GraphViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurateTabBar()
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func configurateTabBar() {
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        homeViewController.title = "Home"
        recordViewController.tabBarItem.image = UIImage(systemName: "newspaper")
        recordViewController.title = "Record"
        graphViewController.tabBarItem.image = UIImage(systemName: "dollarsign.gauge.chart.lefthalf.righthalf")
        graphViewController.title = "Graph"
        
        setViewControllers([UINavigationController(rootViewController: homeViewController),UINavigationController(rootViewController: recordViewController), UINavigationController(rootViewController: graphViewController)], animated: true)
    }
    
}
