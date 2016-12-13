//
//  Notifier.swift
//  ios-clean-architecture
//
//  Created by Kushida　Eiji on 2016/12/14.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import Foundation

protocol Notifier {
    associatedtype Notification: RawRepresentable
}

extension Notifier where Notification.RawValue == String {
    
    //RawValueをString型に変換する
    fileprivate static func nameFor(notification: Notification) -> String {
        return "\(notification.rawValue)"
    }
    // 登録用のラッパーメソッド
    static func addObserver(observer: AnyObject,
                            selector: Selector,
                            notification: Notification) {
        let name = nameFor(notification: notification)
        
        NotificationCenter.default.addObserver(observer,
                                               selector: selector,
                                               name: NSNotification.Name(rawValue: name),
                                               object: nil)
    }
    
    // 通知用のラッパーメソッド
    static func postNotification(notification: Notification,
                                 object: AnyObject? = nil,
                                 userInfo: [String : Any]? = nil) {
        
        let name = nameFor(notification: notification)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: name),
                                        object: object,
                                        userInfo: userInfo)
    }
    
    // 削除用のラッパーメソッド
    static func removeObserver(observer: AnyObject,
                               notification: Notification,
                               object: Any? = nil) {
        
        let name = nameFor(notification: notification)
        
        NotificationCenter.default.removeObserver(observer,
                                                  name: NSNotification.Name(rawValue: name),
                                                  object: object)
    }
}
