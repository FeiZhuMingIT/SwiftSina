/*:

 数据:
App Key：2283739048
App Secret：c456852b3458051f87c1baae734e0dc5

账号: 15811718271
密码: 332272qjrz




*/

import UIKit
import SVProgressHUD
class GZOauthViewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //增加一个按钮
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: "close")
        webView.delegate = self
        //增加一个webView
        view.addSubview(webView)
        let afTools = GZAFNetWordTool.sharedInstance
        let url = afTools.oauthRUL()
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
        
    }

//    func backBtnDidClikc() {
//        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    lazy var webView: UIWebView = {
        let webView = UIWebView()
        webView.frame = self.view.bounds
        return webView
    }()


    func close() {
        SVProgressHUD.dismiss()
        dismissViewControllerAnimated(true, completion: nil)
    }
}


extension GZOauthViewVC: UIWebViewDelegate {
    // 开始加载请求
    func webViewDidStartLoad(webView: UIWebView) {
       SVProgressHUD.showWithStatus("正在玩命加载...", maskType: SVProgressHUDMaskType.Black)
    }
    //加载请求完毕
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    // 询问加载 
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        // 觉得地址、请求的全部地址
        //urlStringLhttps://api.weibo.com/oauth2/authorize?client_id=1703838926&redirect_uri=http://www.baidu.com/
        let urlString = request.URL!.absoluteString
//        print("urlStringL\(urlString)")
        //如果加载的不是回调地址 hasPrefixw尾部是否包含的地址
        if !urlString.hasPrefix(GZAFNetWordTool.sharedInstance.redirect_uri) {
            return true
        }

        // 如果点击的是确定或者取消
        // 问号后面的代码 query
        if let query = request.URL?.query {

            let codeString = "code="
            //如果头部是这个表示成功
            if query.hasPrefix(codeString) {
                //swift 转一下好
                let nsQuery = query as NSString
                // 截取code的值
                let code = nsQuery.substringFromIndex(codeString.characters.count)
                print(code)
                loadAccessToken(code)
            } else {
                
            }
        }
        return false
    }
    func loadAccessToken(code: String) {
        GZAFNetWordTool.sharedInstance.loadAccessToken(code) { (result, error) -> Void in
            if error != nil || result == nil {
                SVProgressHUD.showErrorWithStatus("网络不给力...", maskType: SVProgressHUDMaskType.Black)
                print("\(result)")
                // 延迟关闭. dispatch_after 没有提示,可以拖oc的dispatch_after来修改
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
                    self.close()
                })

                return
            }

            let account = GZUserAccount(dict: result!)

            // 保存到沙盒
            account.saveAccount()

            print("account:\(account)")

            SVProgressHUD.dismiss()
        }
    }


}

