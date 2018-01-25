//
//  MainSplitViewController.swift
//  EGx
//
//  Created by 少 on 2018/1/20.
//  Copyright © 2018年 少. All rights reserved.
//

import Cocoa
import RxSwift

class MainSplitViewController: NSSplitViewController {
    var menuVC: AppMenuViewController!
    var tabVC: NSTabViewController!

    fileprivate let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let first = splitViewItems.first?.viewController as? AppMenuViewController,
            let second = splitViewItems.last?.viewController as? NSTabViewController else {
                return
        }
        menuVC = first
        tabVC = second
        setupBindings()
    }
    
    func setupBindings() {
        menuVC.curMenu
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] menu in
                switch menu {
                case .todo:
                    self?.tabVC.selectedTabViewItemIndex = 1
                default:
                    self?.tabVC.selectedTabViewItemIndex = 0
                }
            })
            .disposed(by: bag)
    }
}
