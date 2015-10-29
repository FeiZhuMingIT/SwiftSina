//
//  GZUserAccount.swift
//  SwiftSina
//
//  Created by wzz on 15/10/29.
//  Copyright © 2015年 wzz. All rights reserved.
//

import UIKit
/*
iOS保存数据的方式:
1.plist
2.偏好设置
3.归档
4.sqlite
5.CoreData
*/

class GZUserAccount: NSObject,NSCoding {

    /// 用于调用access_token，接口获取授权后的access token
    var access_token: String?
    var expires_in: NSTimeInterval = 0 {
        didSet {
            expires_date = NSDate(timeIntervalSinceNow: expires_in)
            print("expires_date:\(expires_date)")
        }
    }

    /// 当前授权用户的UID
    var uid: String?

     var expires_date: NSDate?

    init(dict: [String: AnyObject]) {

        super.init()
        // 将字典里面的每一个key的值赋值给对应的模型属性
        setValuesForKeysWithDictionary(dict)
    }

    // 当字典里面的key在模型里面没有对应的属性
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    //当用户赋值的时候调用
    override var description: String {
        return "access_token:\(access_token), expires_in:\(expires_in), uid:\(uid): expires_date:\(expires_date)"
    }

    // MARK: -归档和解档
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeDouble(expires_in, forKey: "expires_in")
        aCoder.encodeObject(uid, forKey: "uid")
        //保存数据是否达到有效期
        aCoder.encodeObject(expires_date, forKey: "expires_date")
    }

    //MARK: -解档
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        expires_in = aDecoder.decodeDoubleForKey("expires_in")
        uid = aDecoder.decodeObjectForKey("uid") as? String
        expires_date = aDecoder.decodeObjectForKey("expires_date") as? NSDate
    }
    // 类方法访问属性需要将属性定义成 static
    // 对象方法访问static属性需要类名.属性名称
    static let accountPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! + "/Account.plist"
    // MARK: -保存对象
    func saveAccount() {
        NSKeyedArchiver.archiveRootObject(self, toFile: GZUserAccount.accountPath)
    }
}
