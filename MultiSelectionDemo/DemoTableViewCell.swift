//
//  DemoTableViewCell.swift
//  MultiSelectionDemo
//
//  Created by Mac_Admin on 02/09/20.
//  Copyright © 2020 Mac_Admin. All rights reserved.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    class ViewModel {
        enum State {
            case none
            case selected
            case deselected
        }
        let value: String
        var state: State
        
        init(value: String, state: State = .none) {
            self.value = value
            self.state = state
        }
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var viewModel: ViewModel? = nil {
        didSet {
            updateContent()
        }
    }
    
    func updateViewModel<T>(value: T, on keyPath: WritableKeyPath<ViewModel, T>) {
        viewModel?[keyPath: keyPath] = value
        updateContent()
    }
    
    override var isSelected: Bool {
        didSet {
            guard
                let viewModel = viewModel,
                viewModel.state != .none
            else {
                return
            }
            updateViewModel(value: isSelected ? .selected : .deselected, on: \.state)
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(false, animated: animated)
    }
    
    private func clear() {
        nameLabel.text = ""
        iconImageView.image = nil
    }
    
    private func updateContent() {
        guard let viewModel = viewModel else {
            clear()
            return
        }
        
        nameLabel.text = viewModel.value
        switch viewModel.state {
        case .none:
            iconImageView.isHidden = true
        case .deselected:
            iconImageView.image = UIImage(systemName: "checkmark.circle")
            iconImageView.isHidden = false
        case .selected:
            iconImageView.image = UIImage(systemName: "checkmark.circle.fill")
            iconImageView.isHidden = false
        }
    }
}
