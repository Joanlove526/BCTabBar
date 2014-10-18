/**
 *  封装的网络请求 支持ASI 和 最新的AFN 支持不依赖第三方框架的本地缓存
 */

#import <Foundation/Foundation.h>

typedef void (^BaseHttpToolSucess)(NSDictionary * json);
typedef void (^BaseHttpToolFailur)(NSError *error);

@interface BaseHttpTool : NSObject

/**
 *  POST 请求
 *  底层封装AFN 和 ASI 网络请求 需要用哪个打开拿个就可以了
 *
 *  @param url        url
 *  @param parameters 参数
 *  @param sucess     成功后的回调
 *  @param failur     失败后的回调
 */
+(void)postWithUrl:(NSString *)url parameters:(NSDictionary *)parameters sucess:(BaseHttpToolSucess)sucess failur:(BaseHttpToolFailur)failur;

/**
 *  GET 请求
 *  底层封装AFN 和 ASI 网络请求 需要用哪个打开拿个就可以了
 *
 *  @param url        url
 *  @param parameters 参数
 *  @param sucess     成功后的回调
 *  @param failur     失败后的回调
 */
+(void)getWithUrl:(NSString *)url parameters:(NSDictionary *)parameters sucess:(BaseHttpToolSucess)sucess failur:(BaseHttpToolFailur)failur;

@end
