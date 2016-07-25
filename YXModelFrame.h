//
//  YXModelFrame.h
//  Demo
//
//  Created by 白宇翔 on 16/7/22.
//  Copyright © 2016年 白宇翔. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@class YXModel;

@interface YXModelFrame : NSObject
/**
 * title frame
 */
@property (nonatomic, assign, readonly) CGRect titleF;
/**
 * descrit frame
 */
@property (nonatomic, assign, readonly) CGRect descritF;
/**
 * picture frame
 */
@property (nonatomic, assign, readonly) CGRect pictureF;
/**
 * cell height
 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@property (nonatomic, strong)YXModel *model;

@end
