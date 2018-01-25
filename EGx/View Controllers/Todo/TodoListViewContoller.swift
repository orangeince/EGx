//
//  TodoListViewContoller.swift
//  EGx
//
//  Created by 少 on 2018/1/25.
//  Copyright © 2018年 少. All rights reserved.
//

import Cocoa

class TodoListViewContoller: NSViewController {
    @IBOutlet weak var tableView: NSTableView! {
        didSet {
            tableView.headerView = nil
            tableView.backgroundColor = .white
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension TodoListViewContoller: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "menu"), owner: self) as? MenuView
        if cell == nil {
            cell = MenuView()
            cell?.identifier = NSUserInterfaceItemIdentifier(rawValue: "menu")
        }
        cell?.titleLabel.title = AppMenu.dashboard.rawValue
        return cell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 120
    }
}
