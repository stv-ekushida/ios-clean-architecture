//
//  Event.swift
//  ios-clean-architecture
//
//  Created by Kushida　Eiji on 2016/12/14.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import Foundation

final class Event: Notifier {
    
    enum Notification: String {
        case photoListDidLoad
    }
}
