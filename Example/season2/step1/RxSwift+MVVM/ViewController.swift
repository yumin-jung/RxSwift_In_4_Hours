//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by iamchiwon on 05/08/2019.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import RxSwift
import SwiftyJSON
import UIKit

let MEMBER_LIST_URL = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"

//class Observable<T> {
//    private let task: (@escaping (T) -> Void) -> Void
//    init(task: @escaping (@escaping (T) -> Void) -> Void) {
//        self.task = task
//    }
//    
//    func subscribe(_ f: @escaping (T) -> Void) {
//        task(f)
//    }
//}

class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var editView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.timerLabel.text = "\(Date().timeIntervalSince1970)"
        }
    }
    
    private func setVisibleWithAnimation(_ v: UIView?, _ s: Bool) {
        guard let v = v else { return }
        UIView.animate(withDuration: 0.3, animations: { [weak v] in
            v?.isHidden = !s
        }, completion: { [weak self] _ in
            self?.view.layoutIfNeeded()
        })
    }
    
    func downloadJson(_ url: String) -> Observable<String?> {
        // 1. 비동기로 생기는 데이터를 Observable로 감싸서 리턴하는 방법
        return Observable.just("Hello World")
//        return Observable.create { emitter in
//            emitter.onNext("Hello World")
//            emitter.onCompleted()
//            return Disposables.create()
//        }
    }

    // MARK: SYNC

    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    @IBAction func onLoad() {
        editView.text = ""
        setVisibleWithAnimation(self.activityIndicator, true)
        
        // 2. Observable로 오는 데이터를 받아서 처리하는 방법
        _ = downloadJson(MEMBER_LIST_URL)
            .subscribe { event in
                switch event {
                case .next:
                    break
                    
                case .error:
                    break
                    
                case .completed:
                    break
                }
        }
    }
}
