//
//  ViewController.swift
//  MultiSelectionDemo
//
//  Created by Mac_Admin on 02/09/20.
//  Copyright © 2020 Mac_Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    /// Datasource
    var dataSource = [
        0: ["lion","dog","cat","fish"],
        1: ["pigeon","crow","cucco","kingfisher"],
        2: ["Ritzy","Patrick","Jack"]
    ]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isEditing = true
        //tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "demoCell",
                for: indexPath)
                as? DemoTableViewCell
        else { return UITableViewCell() }
        cell.nameLabel.text = dataSource[indexPath.section]?[indexPath.row]
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Animals"
        } else if section == 1 {
            return "Birds"
        } else {
            return "Humans"
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        ///Find the cell which is being moved
        let product = dataSource[sourceIndexPath.section]?[sourceIndexPath.row] ?? ""
        
        /// find the section where cell is being added
        dataSource[sourceIndexPath.section]?.insert(product, at: destinationIndexPath.row)
        
        /// remove from source
        dataSource[sourceIndexPath.section]?.remove(at: sourceIndexPath.row)
    }
}

