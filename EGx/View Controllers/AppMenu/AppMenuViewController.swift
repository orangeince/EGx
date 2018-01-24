//
//  AppMenuViewController.swift
//  EGx
//
//  Created by 少 on 2018/1/20.
//  Copyright © 2018年 少. All rights reserved.
//

import Foundation
import Cocoa
import Moya
import RxSwift
import RxCocoa
import Kingfisher
import SnapKit

class AppMenuViewController: NSViewController {
    @IBOutlet weak var imageView: NSImageView! {
        didSet {
            imageView.wantsLayer = true
            imageView.backgroundColor = .clear
            imageView.layer?.cornerRadius = 30
            imageView.layer?.masksToBounds = true
            imageView.layer?.borderColor = NSColor.white.cgColor
            imageView.layer?.borderWidth = 2
        }
    }
    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var tableContainer: NSScrollView!
    @IBOutlet weak var tableView: NSTableView! {
        didSet {
            tableView.headerView = nil
            tableView.backgroundColor = .white
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    let provider = MoyaProvider<GitLabService>()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(hex: "#FAFAFA").cgColor
        
        
        let profile = provider.rx.request(.accout)
            .model(User.self)
            .asObservable()
            .share()
        
        profile
            .map { $0.name }
            .bind(to: nameLabel.rx.text)
            .disposed(by: bag)
        
        profile
            .map { $0.avatarUrl.url }
            .subscribe(onNext: { [weak self] avatar in
                self?.imageView.kf.setImage(with: avatar)
            })
            .disposed(by: bag)
    }
}

extension AppMenuViewController: NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "menu"), owner: self) as? MenuView
        if cell == nil {
            cell = MenuView()
            cell?.identifier = NSUserInterfaceItemIdentifier(rawValue: "menu")
        }
        
        switch row {
        case 0:
            cell?.titleLabel.title = "Dashboard"
        case 1:
            cell?.titleLabel.title = "Todo"
        case 2:
            cell?.titleLabel.title = "MR"
        default:
            cell?.titleLabel.title = "Menu「\(row)」"
        }
        return cell

    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 64
    }
}

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
    
//    override func drawSelection(in dirtyRect: NSRect) {
//        guard selectionHighlightStyle != .none else { return }
//        let selectionRect = NSInsetRect(bounds, 2.5, 2.5)
//        NSColor.highLight.setFill()
//        let path = NSBezierPath(roundedRect: selectionRect, xRadius: 6, yRadius: 6)
//        path.fill()
//        path.stroke()
//    }

}
