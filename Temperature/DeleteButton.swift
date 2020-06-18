//
//  ButtonDelete.swift
//  Temperature
//
//  Created by Admin on 17.06.2020.
//  Copyright © 2020 Lezya Alexander. All rights reserved.
//

import UIKit

class DeleteButton: UIButton {
    
    let color = UIColor(red: 0.751, green: 0.756, blue: 0.787, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        self.setTitleColor(color, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7 )
        
    }
}
