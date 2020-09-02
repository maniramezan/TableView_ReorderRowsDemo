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
    var animal = ["lion","dog","cat","fish"]
    var birds = ["pigeon","crow","cucco","kingfisher"]
    var humans = ["Ritzy","Patrick","Jack"]
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
        if section == 0 {
            return animal.count
        } else if section == 1 {
            return birds.count
        } else {
            return humans.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
        withIdentifier: "demoCell",
        for: indexPath)
        as? DemoTableViewCell
        else { return UITableViewCell() }
        if indexPath.section == 0 {
            cell.nameLabel.text = animal[indexPath.row]
        } else if indexPath.section == 1 {
            cell.nameLabel.text = birds[indexPath.row]
        } else {
            cell.nameLabel.text = humans[indexPath.row]
        }
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
        var product=""
        if sourceIndexPath.section == 0 {
            product = animal[sourceIndexPath.row]
        } else if sourceIndexPath.section == 1 {
            product = birds[sourceIndexPath.row]
        } else {
            product = humans[sourceIndexPath.row]
        }
        /// find the section where cell is being added
        if destinationIndexPath.section == 0 {
            animal.insert(product, at: destinationIndexPath.row)
        }else if sourceIndexPath.section == 1 {
           birds.insert(product, at: destinationIndexPath.row)
        } else {
           humans.insert(product, at: destinationIndexPath.row)
        }
        
        /// remove from source
        if sourceIndexPath.section == 0 {
            animal.remove(at: sourceIndexPath.row)
        } else if sourceIndexPath.section == 1 {
            birds.remove(at: sourceIndexPath.row)
        } else {
            humans.remove(at: sourceIndexPath.row)
        }
    }
}

