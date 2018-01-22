//
//  AppMenuViewController.swift
//  EGx
//
//  Created by 少 on 2018/1/20.
//  Copyright © 2018年 少. All rights reserved.
//

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
    
    let provider = MoyaProvider<GitLabService>()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(hex: "#FAFAFA").cgColor
        
//        provider.rx.request(.accout)
//            .subscribe(onSuccess: { (response) in
//                print(response)
//            }) { (error) in
//                print(error)
//        }
//        .disposed(by: bag)
        
        provider.rx.request(.accout)
            .model(User.self)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] user in
                self?.imageView.kf.setImage(with: user.avatarUrl.url)
                self?.nameLabel.stringValue = user.username
            }) { error in
                print(error)
            }
            .disposed(by: bag)
    }

}
