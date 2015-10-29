//
//  GZTabBarVc.swift
//  SwiftSina
//
//  Created by wzz on 15/10/28.
//  Copyright © 2015年 wzz. All rights reserved.
//

/// bug 导航控制器出不来 fuck
import UIKit

class GZTabBarVc: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavTabBarAppence()

        //添加五个自控制器
        let homeVc = GZHomeTableViewVc()
        self.addChildController(homeVc, image: "tabbar_home", title: "主页")

        let discoverVc = GZDiscoverTableViewVc()
        self.addChildController(discoverVc, image: "tabbar_discover", title: "发现")

        let addVc = UIViewController()
        self.addChildController(addVc, image: "", title: "f")

        let messageVc = GZMessageTabbleViewVc()
        self.addChildController(messageVc, image: "tabbar_message_center", title: "信息")

        let profileVc = GZProfileTableViewVc()
        self.addChildController(profileVc, image: "tabbar_profile", title: "我")


    }
    // 因为在viewDidLoad里面添加无效所以在这里加了
    override func viewDidAppear(animated: Bool) {

        super.viewDidAppear(animated)
        //添加了一个按钮让他覆盖掉原来普通控制器
        let addBtn = UIButton()
        addBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        addBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted);
        addBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        addBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        addBtn.addTarget(self, action: "addBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        //btn.frame
        let addBtnW = tabBar.bounds.size.width / CGFloat(5)
        addBtn.frame = CGRectMake(addBtnW * 2, 0, addBtnW, tabBar.bounds.size.height)
        tabBar.addSubview(addBtn);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func addChildController(controller: UIViewController, image: String, title: String) {
        controller.tabBarItem.image = UIImage(named: image)
        controller.tabBarItem.title = title;
        let nav = UINavigationController(rootViewController: controller)
        addChildViewController(nav)
    }


    /// 按钮被点击的方法
    //这里前面不能加private 不然就调用了私有方法会奔溃
     func addBtnClick() {
        print("来了这里")
    }
    
    func setNavTabBarAppence() {
        let tarBar = UINavigationBar.appearance()
        tarBar.tintColor = UIColor.orangeColor()
        tarBar.backgroundColor = UIColor.whiteColor()
    }
















}
