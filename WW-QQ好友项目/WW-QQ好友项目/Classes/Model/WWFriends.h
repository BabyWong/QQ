//
//  WWFriends.h
//  WW-QQ好友项目
//
//  Created by hwm on 15/11/13.
//  Copyright © 2015年 WenmeiWong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWFriends : NSObject

@property (nonatomic, strong) NSString *icon;

@property (nonatomic, strong) NSString *intro;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign, getter=isVip) BOOL vip;

// 类工厂
+ (instancetype)friendsWithDict:(NSDictionary *)dict;
// 构造方法
- (instancetype)initWithDict:(NSDictionary *)dict;



@end
