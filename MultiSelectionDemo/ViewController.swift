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
        0: [
            DemoTableViewCell.ViewModel(value: "lion"),
            DemoTableViewCell.ViewModel(value: "dog"),
            DemoTableViewCell.ViewModel(value: "cat"),
            DemoTableViewCell.ViewModel(value: "fish")
        ],
        1: [
            DemoTableViewCell.ViewModel(value: "pigeon", state: .deselected),
            DemoTableViewCell.ViewModel(value: "crow", state: .deselected),
            DemoTableViewCell.ViewModel(value: "cucco", state: .deselected),
            DemoTableViewCell.ViewModel(value: "kingfisher", state: .deselected)
        ],
        2: [
            DemoTableViewCell.ViewModel(value: "Ritzy", state: .deselected),
            DemoTableViewCell.ViewModel(value: "Patrick", state: .deselected),
            DemoTableViewCell.ViewModel(value: "Jack", state: .deselected)
        ]
    ]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isEditing = true
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "demoCell",
                for: indexPath) as? DemoTableViewCell,
            let product = dataSource[indexPath.section]?[indexPath.row]
        else {
            return UITableViewCell()
        }
        
        cell.viewModel = product
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 0 ? true : false
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section != 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            indexPath.section != 0,
            let cell = tableView.cellForRow(at: indexPath) as? DemoTableViewCell,
            cell.viewModel?.state == .deselected
        else {
            return
        }
        
        cell.isSelected = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard
            indexPath.section != 0,
            let cell = tableView.cellForRow(at: indexPath) as? DemoTableViewCell,
            cell.viewModel?.state == .selected
        else {
            return
        }
        
        cell.isSelected = false
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
        guard let product = dataSource[sourceIndexPath.section]?[sourceIndexPath.row] else {
            return
        }
        
        /// find the section where cell is being added
        dataSource[sourceIndexPath.section]?.insert(product, at: destinationIndexPath.row)
        
        /// remove from source
        dataSource[sourceIndexPath.section]?.remove(at: sourceIndexPath.row)
    }
}

