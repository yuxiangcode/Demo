//
//  Model.m
//  Demo
//
//  Created by 白宇翔 on 16/7/22.
//  Copyright © 2016年 白宇翔. All rights reserved.
//

#import "YXModel.h"

@implementation YXModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"description"]) {
        self.descriPtion = value;
    }
    
}
@end
