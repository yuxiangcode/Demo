//
//  Model.h
//  Demo
//
//  Created by 白宇翔 on 16/7/22.
//  Copyright © 2016年 白宇翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXModel : NSObject
@property (nonatomic, copy) NSString *title; // 标题
@property (nonatomic, copy)NSString *descriPtion; // 描述
@property (nonatomic, copy) NSString *imageHref; // 图片
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)modelWithDict:(NSDictionary *)dict;
@end
