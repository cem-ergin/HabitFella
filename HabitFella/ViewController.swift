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
        
        if (realm == nil){
            realm = try! Realm()
        }
        
        for habit in realm!.objects(Habit.self) {
            habits.append(habit)
        }
        
        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        self.view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = true
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view)
        }
        
        let navigationItem = UINavigationItem(title: "Home Page")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(navigateAddHabitView))
        navigationBar.setItems([navigationItem], animated: true)
        
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.bottom.left.right.equalTo(0)
        }
    }
    
    @objc func navigateAddHabitView() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.textLabel!.text = habits[indexPath.row].name
        return cell
    }
}
