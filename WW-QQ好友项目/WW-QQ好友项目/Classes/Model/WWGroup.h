//
//  WWGroup.h
//  WW-QQ好友项目
//
//  Created by hwm on 15/11/13.
//  Copyright © 2015年 WenmeiWong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWGroup : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) NSInteger online;

@property (nonatomic, strong) NSArray *friends;

/* 是否要展开组 */
@property (nonatomic, assign, getter=isOpened) BOOL opened;

// 类工厂
+ (instancetype)groupWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
