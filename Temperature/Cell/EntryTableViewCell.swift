//
//  TableViewCell.swift
//  Temperature
//
//  Created by Admin on 17.06.2020.
//  Copyright © 2020 Lezya Alexander. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBAction func deleteButton(_ sender: DeleteButton) {
        cellDelegate?.customCellTappedDelete(self)
    }
    
    var cellDelegate: CustomCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with model: EntryModel) {
        temperatureLabel.text = model.temperature
        dateLabel.text = model.date
    }
    
}
