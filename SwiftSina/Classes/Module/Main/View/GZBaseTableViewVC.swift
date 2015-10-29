//
//  GZBaseTableViewVC.swift
//  SwiftSina
//
//  Created by wzz on 15/10/28.
//  Copyright © 2015年 wzz. All rights reserved.
//

import UIKit

class GZBaseTableViewVC: UITableViewController {

    override func loadView() {
        setLoginView()


    }

    func setLoginView() {
       let loginView = GZLoginView()
        if self is GZHomeTableViewVc {
            loginView.setLoginView("visitordiscover_feed_image_house", subImage: "visitordiscover_feed_image_smallicon", title: "主页,新特性1234567")

            //增加动画
            loginView.addLoopBaseAnimation()
            //监听应用退到后台
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "DidEnterBackground", name: UIApplicationDidEnterBackgroundNotification, object: nil)
            //监听应用加入到前台
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "didBecomeActive", name: UIApplicationDidBecomeActiveNotification, object: nil)
        } else if self is GZDiscoverTableViewVc {
            loginView.setLoginView("visitordiscover_image_message", subImage: "", title: "发现，新特性789810321")
        } else if self is GZMessageTabbleViewVc {
            loginView.setLoginView("visitordiscover_image_message", subImage: "", title: "信息，靠靠靠。sdadas")
        } else if self is GZProfileTableViewVc {
            loginView.setLoginView("visitordiscover_image_profile", subImage: "", title: "我,shishidadada")
        }

        loginView.backgroundColor = UIColor(white: 237.0/255.0, alpha: 1)
        loginView.loginViewDelegate = self
        view = loginView

    }


    override func viewDidLoad() {
        super.viewDidLoad()
        //增加两个按钮
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登陆", style: UIBarButtonItemStyle.Plain, target: self, action: "loginBtnDidClick")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: "registerBtnDidClick")

    }

    // 两个按钮的点击事件
    func loginBtnDidClick() {
        //弹出登陆界面
        let webVc = GZOauthViewVC()
        self.navigationController!.presentViewController(UINavigationController(rootViewController: webVc), animated: true, completion: nil)
    }

    func registerBtnDidClick() {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }





    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }

    // MARK 监听应用动画
    func DidEnterBackground() {
        (view as! GZLoginView).pauseAnimation()
    }

    func didBecomeActive() {
        (view as! GZLoginView).starAnimation()

    }
}


/// 继承loginView打理
extension GZBaseTableViewVC: GZLoginViewDelegate {
    func loginViewRegisterBtnClick() {
        registerBtnDidClick()
    }

    func loginViewLoginBtnClick() {
        loginBtnDidClick()
    }
}
