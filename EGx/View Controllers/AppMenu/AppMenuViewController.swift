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
    @IBOutlet weak var tableContainer: NSScrollView! {
        didSet {
            //tableContainer
            
        }
    }
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
//            .observeOn(MainScheduler.instance)
//            .subscribe(onSuccess: { [weak self] user in
//                self?.imageView.kf.setImage(with: user.avatarUrl.url)
//                self?.nameLabel.stringValue = user.username
//            }) { error in
//                print(error)
//            }
//            .disposed(by: bag)
    }
}

extension AppMenuViewController: NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "s"), owner: self) as? NSTextField
        if cell == nil {
            cell = NSTextField()
            cell?.identifier = NSUserInterfaceItemIdentifier(rawValue: "s")
        }
        cell?.stringValue = String(row)
        return cell

    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 40
    }
}

class MenuView: NSView {
    let titleLabel = Label(size: 12, color: .mainText)
    
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
    }
}
