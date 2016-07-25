//
//  AppToolsDataBase.h
//  Demo
//
//  Created by 白宇翔 on 16/7/22.
//  Copyright © 2016年 白宇翔. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AppToolBlock) (id result);
typedef void(^AFNFailure) (id result);

@interface AppToolsDataBase : NSObject

+ (void)getLocalDataWithURL:(NSString *)url andSuccessBlock:(AppToolBlock)appBlock andErrot:(AFNFailure)failuerBlock;
@end
