//
//  MenuView.swift
//  EGx
//
//  Created by 少 on 2018/1/25.
//  Copyright © 2018年 少. All rights reserved.
//

import Cocoa
import SnapKit

class MenuView: NSTableRowView {
    let titleLabel = Label(size: 16, color: .mainText)
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }
    
    func setupSubviews() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}
