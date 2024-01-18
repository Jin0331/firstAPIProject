//
//  LanguageTableViewCell.swift
//  SeSACNetwor
//
//  Created by JinwooLee on 1/17/24.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {

    @IBOutlet var tableTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellDesign()
    }
}

extension LanguageTableViewCell {
    func configureCellDesign() {
        tableTextLabel.font = .boldSystemFont(ofSize: 20)
        tableTextLabel.textAlignment = .left
    }
    
    func setCellText(cell : [String : String]) {
        for (_, value) in cell {
            tableTextLabel.text = value
        }
    }
}

