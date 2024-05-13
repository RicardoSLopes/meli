//
//  SearchBar.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import UIKit

class SearchBar: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.setBarStyle()
    }
}
