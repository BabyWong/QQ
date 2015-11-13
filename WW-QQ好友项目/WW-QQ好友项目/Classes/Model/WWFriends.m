//
//  WWFriends.m
//  WW-QQ好友项目
//
//  Created by hwm on 15/11/13.
//  Copyright © 2015年 WenmeiWong. All rights reserved.
//

#import "WWFriends.h"

@implementation WWFriends

// 类工厂
+ (instancetype)friendsWithDict:(NSDictionary *)dict {

    return [[self alloc] initWithDict:dict];
}

// 构造方法
- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}

@end
