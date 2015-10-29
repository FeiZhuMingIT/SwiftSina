//
//  GZLoginView.swift
//  SwiftSina
//
//  Created by wzz on 15/10/28.
//  Copyright © 2015年 wzz. All rights reserved.
//

import UIKit

protocol GZLoginViewDelegate: NSObjectProtocol {
    // 两个代理方法
    func loginViewLoginBtnClick()
    func loginViewRegisterBtnClick()
}

class GZLoginView: UIView {

    weak var loginViewDelegate: GZLoginViewDelegate?

    //添加子控件
     func setLoginView(iconImage: String, subImage: String, title: String) {

        subView.image = UIImage(named: subImage)
        addSubview(subView)

        addSubview(coverView)

        iconView.image = UIImage(named: iconImage)
        addSubview(iconView)

        titleLabel.text = title
        addSubview(titleLabel)

        addSubview(loginBtn)

        addSubview(registerBtn)



        //布局
        iconView.translatesAutoresizingMaskIntoConstraints = false
        subView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        registerBtn.translatesAutoresizingMaskIntoConstraints = false
        coverView.translatesAutoresizingMaskIntoConstraints = false

        // subView
        //x
        addConstraint(NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        // y
        addConstraint(NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))

        // iconView 添加约束
        //x
        addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        //y
        addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))

        //titleLabel
        //x
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        //top 
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 50))
        //width
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 240))

        //loginBtn
        //left
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: titleLabel, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0))
        //width
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))
        //height
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 30))
        //top
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: titleLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))

        //registerBtn
        //top
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: titleLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        //width
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))
        //height
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 30))
        //right
         addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: titleLabel, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0))

        //coverImageView
        //x
        addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        // y
        addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        //width 
        addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        //bottom
        addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: registerBtn, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: -16))
    }

    // 布局
    override func layoutSubviews() {
        super.layoutSubviews()

        //loop

    }

    // MARK -懒加载
    lazy  var iconView: UIImageView = {
       let iconView = UIImageView()
        iconView.sizeToFit()
        return iconView
    }()

    lazy  var subView: UIImageView = {
        let subView = UIImageView()
        subView.sizeToFit()
        return subView
        }()

    lazy  var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.sizeToFit()
        titleLabel.textColor = UIColor.grayColor()
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
        return titleLabel
        }()

    lazy  var loginBtn: UIButton = {
        let loginBtn = UIButton()
        loginBtn.setTitle("登陆", forState: UIControlState.Normal)
        loginBtn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        loginBtn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        loginBtn.addTarget(self, action: "loginBtnDidClick", forControlEvents: UIControlEvents.TouchUpInside)
        return loginBtn
        }()

    lazy  var registerBtn: UIButton = {
        let registerBtn = UIButton()
        registerBtn.setTitle("注册", forState: UIControlState.Normal)
        registerBtn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        registerBtn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        registerBtn.addTarget(self, action: "regesterBtnDidClick", forControlEvents: UIControlEvents.TouchUpInside)
        return registerBtn
        }()

    lazy var coverView: UIImageView = {
        let coverView = UIImageView()
        coverView.image = UIImage(named: "visitordiscover_feed_mask_smallicon")
        return coverView
    }()
    // MARK 按钮点击事件
    func loginBtnDidClick() {
        loginViewDelegate?.loginViewLoginBtnClick()
    }
    func regesterBtnDidClick() {
        loginViewDelegate?.loginViewRegisterBtnClick()
    }

    // MARK 增加动画效果 transform.rotation
    func addLoopBaseAnimation() {
        let baseAim = CABasicAnimation(keyPath: "transform.rotation")
        baseAim.toValue = 2 * M_PI
        baseAim.duration = 20
        baseAim.removedOnCompletion = false
        baseAim.repeatCount = MAXFLOAT
        subView.layer.addAnimation(baseAim, forKey: "subViewAnima")
    }

    /// 暂停旋转
    func pauseAnimation() {
        let pauseTime = subView.layer.convertTime(CACurrentMediaTime(), fromLayer: nil)
        //设置动画速度为0
        subView.layer.speed = 0
        //设置偏移动画
        subView.layer.timeOffset = pauseTime
    }
    /// 回复旋转
    func starAnimation() {
        let pauseTime = subView.layer.timeOffset
        //设置动画速度为1
        subView.layer.speed = 1
        subView.layer.timeOffset = 0
        subView.layer.beginTime = 0
        let timeSincePause = subView.layer.convertTime(CACurrentMediaTime(), fromLayer: nil) - pauseTime

        subView.layer.beginTime = timeSincePause
    }
}
