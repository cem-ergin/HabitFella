//
//  AddHabitViewController.swift
//  HabitFella
//
//  Created by Cem Ergin on 02/10/2022.
//

import UIKit
import SnapKit
import RealmSwift

class AddHabitViewController: UIViewController {
    var navigationBar: UINavigationBar!
    var box: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        box = UIView(frame: CGRect(x: 10, y: 10, width: 250, height: 250))
        self.view.addSubview(box)
        box.backgroundColor = .red
        box.snp.makeConstraints { make in
            make.centerX.equalTo(100)
            make.centerY.equalTo(100)
        }
        
        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        self.view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = true
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view)
        }
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true

        
        let navigationItem = UINavigationItem(title: "Home Page")
        navigationBar.setItems([navigationItem], animated: true)
        
    }
}
