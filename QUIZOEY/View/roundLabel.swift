//
//  roundLabel.swift
//  QUIZOEY
//
//  Created by El nino Cholo on 2020/09/10.
//  Copyright © 2020 El nino Cholo. All rights reserved.
//

import UIKit

class roundlabel :UILabel
{
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func drawText(in rect: CGRect) {
//        let newrect = rect.insetBy(dx: 8.0, dy: 8.0)
//        super.drawText(in: newrect)
//    }
}
