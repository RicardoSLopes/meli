//
//  CloseButton.swift
//  Meli
//
//  Created by Ricardo Santana on 19/05/24.
//

import UIKit

class CloseButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.setCloseButtonStyle()
    }
}
