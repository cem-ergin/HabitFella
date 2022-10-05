//
//  ViewController.swift
//  HabitFella
//
//  Created by Cem Ergin on 14/06/2022.

import UIKit
import SnapKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var navigationBar: UINavigationBar!
    var tableView: UITableView!
    var realm: Realm?
    var habits: [Habit]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realmConfig()
    
        if (realm == nil){
            realm = try! Realm()
        }
        
        for habit in realm!.objects(Habit.self) {
            habits.append(habit)
        }
        
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController!.navigationBar.isTranslucent = true

        navigationItem.title = "Home Page"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(navigateAddHabitView))

        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
//            make..equalTo(navigationController!.navigationBar.snp.bottom)
            make.top.bottom.left.right.equalTo(0)
        }
    }
    
    @objc func navigateAddHabitView() {
        let addHabitViewController = AddHabitViewController()
        addHabitViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(addHabitViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.textLabel!.text = habits[indexPath.row].name
        return cell
    }
        
    fileprivate func realmConfig() {
        let config = Realm.Configuration(
            schemaVersion: 3
        )
        
        Realm.Configuration.defaultConfiguration = config
    }
}
