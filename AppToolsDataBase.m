//
//  AppToolsDataBase.m
//  Demo
//
//  Created by 白宇翔 on 16/7/22.
//  Copyright © 2016年 白宇翔. All rights reserved.
//

#import "AppToolsDataBase.h"
#import "AFNetworking.h"

@implementation AppToolsDataBase

+ (void)getLocalDataWithURL:(NSString *)url andSuccessBlock :(AppToolBlock)appBlock andErrot:(AFNFailure)failuerBlock {
    AFHTTPSessionManager * session = [AFHTTPSessionManager manager];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html",nil];
  
    [session GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        appBlock(responseObject);
        NSLog(@"recevie");
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failuerBlock(error);
        NSLog(@"Not receive");
    }];


}

@end
