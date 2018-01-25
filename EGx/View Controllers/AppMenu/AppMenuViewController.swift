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

enum AppMenu: String {
    case dashboard = "Dashboard"
    case todo = "Todo"
    case mr = "MR"
}

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
    let menus: [AppMenu] = [.dashboard, .todo, .mr]
    
    let provider = MoyaProvider<GitLabService>()
    fileprivate let _menuSubject = PublishSubject<AppMenu>()
    var curMenu: Observable<AppMenu> {
        return _menuSubject.asObservable()
    }
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bg0

        if let first = menus.first {
            _menuSubject.onNext(first)
        }
    }
    
    func setupBindings() {
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
        return menus.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "menu"), owner: self) as? MenuView
        if cell == nil {
            cell = MenuView()
            cell?.identifier = NSUserInterfaceItemIdentifier(rawValue: "menu")
        }
        cell?.titleLabel.title = menus[row].rawValue
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 64
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard let table = notification.object as? NSTableView,
            table.selectedRow >= 0 else { return }
        _menuSubject.onNext(menus[table.selectedRow])
    }
    
}


