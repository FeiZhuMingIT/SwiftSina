/**

1703838926
App Secret：b18e1dd34b044c34754e531f1294e052
回调地址:http://baidu.com/
*/
import UIKit
import AFNetworking
class GZAFNetWordTool: AFHTTPSessionManager {
    //创建单例
    static let sharedInstance: GZAFNetWordTool = {
        let urlString = "https://api.weibo.com/"
        //修改编码格式
        let tool = GZAFNetWordTool(baseURL: NSURL(string: urlString))
        //请求序列化处理器，可接受的类型
        tool.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tool
    }()
    // MARK: - OAtuh授权
    /// 申请应用时分配的AppKey
    private let client_id = "2283739048"

    /// 申请应用时分配的AppSecret
    private let client_secret = "c456852b3458051f87c1baae734e0dc5"

    /// 请求的类型，填写authorization_code
     private let grant_type = "authorization_code"
    /// 回调地址
    let redirect_uri = "http://baidu.com/"
    // 申请数据 home_timeline 应该可以写在外面
    let home_timeline = "2/statuses/home_timeline.json"
    // OAtuhURL地址
    func oauthRUL() -> NSURL {
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(client_id)&redirect_uri=\(redirect_uri)"
        return NSURL(string: urlString)!
    }
    /**
        调用网络工具类去加载access token
    */



    //使用闭包回调
    // MARK: - 加载AccessToken
    /// 加载AccessToken
      func loadAccessToken(code: String, finshed: (result: [String: AnyObject]?, error: NSError?) -> Void) {
        let urlString = "oauth2/access_token"
        //字典
        let parameters = [
            "client_id": client_id,
            "client_secret": client_secret,
            "grant_type": grant_type,
            "code": code,
            "redirect_uri": redirect_uri
        ]
        POST(urlString, parameters: parameters, success: { (_, result) -> Void in
            finshed(result: result as? [String: AnyObject], error: nil)
            print("\(result)")
            }) { (_, error:NSError) -> Void in
                finshed(result: nil, error: error)
                print("\(error)")
        }
    }

//    https://api.weibo.com/2/statuses/home_timeline.json
}
