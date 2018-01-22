//
//  Navigator.swift
//  EGx
//
//  Created by 少 on 2018/1/22.
//  Copyright © 2018年 少. All rights reserved.
//

import Foundation
import Cocoa
import RxCocoa

class Navigator {
    lazy private var defaultStoryboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
    
    // MARK: - segues list
//    enum Segue {
//        case listTimeline(Driver<TwitterAccount.AccountStatus>, ListIdentifier)
//        case listPeople(Driver<TwitterAccount.AccountStatus>, ListIdentifier)
//        case personTimeline(Driver<TwitterAccount.AccountStatus>, username: String)
//    }
//
//    // MARK: - invoke a single segue
//    func show(segue: Segue, sender: NSViewController) {
//        switch segue {
//        case .listTimeline(let account, let list):
//            //show the combined timeline for the list
//            let vm = ListTimelineViewModel(account: account, list: list)
//            if let replaceableSender = (sender.parent as? NSSplitViewController)?.childViewControllers.last {
//                show(target: ListTimelineViewController.createWith(navigator: self, storyboard: sender.storyboard ?? defaultStoryboard, viewModel: vm), sender: replaceableSender)
//            } else {
//                show(target: ListTimelineViewController.createWith(navigator: self, storyboard: sender.storyboard ?? defaultStoryboard, viewModel: vm), sender: sender)
//            }
//
//        case .listPeople(let account, let list):
//            //show the list of user accounts in the list
//            let vm = ListPeopleViewModel(account: account, list: list)
//            show(target: ListPeopleViewController.createWith(navigator: self, storyboard: sender.storyboard ?? defaultStoryboard, viewModel: vm), sender: sender)
//
//        case .personTimeline(let account, username: let username):
//            //show a given user timeline
//            if let replaceableSender = (sender.parent as? NSSplitViewController)?.childViewControllers.last {
//                let vm = PersonTimelineViewModel(account: account, username: username)
//                show(target: PersonTimelineViewController.createWith(navigator: self, storyboard: sender.storyboard ?? defaultStoryboard, viewModel: vm), sender: replaceableSender)
//            }
//
//        }
//    }
//
//    private func show(target: NSViewController, sender: NSViewController) {
//        if let split = sender as? NSSplitViewController {
//            split.addChildViewController(target)
//        }
//
//        if let split = sender.parent as? NSSplitViewController,
//            let index = split.childViewControllers.index(of: sender) {
//            split.childViewControllers.replaceSubrange(index...index, with: [target])
//        }
//    }
}
