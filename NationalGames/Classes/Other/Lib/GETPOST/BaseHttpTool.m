
#import "BaseHttpTool.h"
#import "Reachability.h"
//#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "AFNetworking.h"

@implementation BaseHttpTool

+(void)postWithUrl:(NSString *)url parameters:(NSDictionary *)parameters sucess:(BaseHttpToolSucess)sucess failur:(BaseHttpToolFailur)failur
{
    // ASI 网络请求
//    [self requestWithMethod:@"POST" url:url parameters:parameters sucess:sucess failur:failur];
    
    // 1.创建GET请求
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];

    // 2.发送请求
    [mgr GET:url parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         if (sucess) {
             sucess(responseObject);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failur) {
             failur(error);
         }
     }];
}

+(void)getWithUrl:(NSString *)url parameters:(NSDictionary *)parameters sucess:(BaseHttpToolSucess)sucess failur:(BaseHttpToolFailur)failur
{    
    // ASI 网络请求
    //    [BaseHttpTool requestWithMethod:@"GET" url:url parameters:parameters sucess:sucess failur:failur];
    
    // 1.创建POST请求
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    // 2.发送请求
    [mgr POST:url parameters:parameters
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          if (sucess) {
              sucess(responseObject);
          }
          NSLog(@"responseObject ----  %@      -%@",responseObject,[responseObject class]);
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          if (failur) {
              failur(error);
          }
          NSLog(@"-- error  %@",operation);
      }];
}

+(void)requestWithMethod:(NSString *)method url:(NSString *)url parameters:(NSDictionary *)parameters sucess:(BaseHttpToolSucess)sucess failur:(BaseHttpToolFailur)failur
{
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
    // 忽略安全证书
    [request setValidatesSecureCertificate:NO];
    [request setRequestMethod:method];
    
    //设置表单提交项
    for(id key in parameters)
    {
        [request setPostValue:[parameters objectForKey:key] forKey:key];
    }
    /**
     *  后端需要 每个项目情况不同 根据不同需求 更改
     */
//    NSString *codes;
//    NSUserDefaults *us=[NSUserDefaults standardUserDefaults];
//    if ([us objectForKey:@"httpcode"]) {
//        codes=[us objectForKey:@"httpcode"];
//    }else{
//        codes=[NSString stringWithFormat:@"\\$\\@-%d%d-SEXUALIFEHAIWANG",arc4random_uniform(100000),arc4random_uniform(100000)];
//        [us setValue:codes forKey:@"httpcode"];
//        [us synchronize];
//    }
//    [request setPostValue:codes forKey:@"CODE"];

    [request setDelegate:self];

    //请求执行完会调用block中的代码
    
//    __unsafe_unretained ASIFormDataRequest *request1 = request;
    __weak typeof(request) request1 = request;
    
    [request setCompletionBlock:^{
        
        NSData *data = [request1 responseData];
        NSDictionary *datassin = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        if (sucess) {
            sucess(datassin);
//            NSLog(@"sucess=====%@",codes);
        }
    }];

    //如果出现异常会执行block中的代码
    [request setFailedBlock:^{
        if (failur) {
            failur(failur);
//            NSLog(@"failur ===== %@",failur);
        }
    }];

    [request startAsynchronous];
}

@end
