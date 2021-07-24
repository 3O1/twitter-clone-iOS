//
//  LandingButton.swift
//  Twitter
//
//  Created by James on 7/23/21.
//

import UIKit

final class LandingButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHeight(55)
        layer.cornerRadius = 30
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
