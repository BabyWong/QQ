//
//  WWGroup.m
//  WW-QQ好友项目
//
//  Created by hwm on 15/11/13.
//  Copyright © 2015年 WenmeiWong. All rights reserved.
//

#import "WWGroup.h"
#import "WWFriends.h"

@implementation WWGroup

// 类工厂
+ (instancetype)groupWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}

// 构造方法
- (instancetype)initWithDict:(NSDictionary *)dict {
    
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *friendsM = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
             [friendsM addObject:[WWFriends friendsWithDict:dict]];
        }
        self.friends = friendsM;
    }
    
    return self;
}

@end
