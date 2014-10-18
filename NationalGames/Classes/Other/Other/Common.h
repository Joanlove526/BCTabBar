// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 2.获得RGB颜色
#define IWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 3.自定义Log
#ifdef DEBUG
#define LLog(...) NSLog(__VA_ARGS__)
#else
#define LLog(...)
#endif

// 4.图片处理分类
#import "UIImage+BC.h"

// 5.导航栏左右变分类
#import "UIBarButtonItem+BC.h"

// 6.UIView扩展分类
#import "UIView+BC.h"

// 7.全局背景色
#define MRQGlobalBg UIColorFromRGB(0xEEEEEE)

// 8.RGB
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 9.自己封装的网络请求框架
#import "BaseHttpTool.h"

// 10.字典转模型
//#import "MJExtension.h"

// 11.图片缓存下载框架
//#import "UIImageView+WebCache.h"

// 12.刷新框架
//#import "MJRefresh.h"

//13.侧边栏
//#import "RESideMenu.h"

//14.BaseHttpUrl 生产环境和开放环境
#define KBaseHttpTool @"http://www.baidu.com"

//15.ShareSDK头文件
//#import <ShareSDK/ShareSDK.h>

//16.全局单利
#import "Singleton.h"

//17.是否为4inch
#define fourInch ([UIScreen mainScreen].bounds.size.height == 568)

//18.网络判断
//#import "Reachability.h"


