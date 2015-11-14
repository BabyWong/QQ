//
//  WWHeaderView.h
//  WW-QQ好友项目
//
//  Created by hwm on 15/11/14.
//  Copyright © 2015年 WenmeiWong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WWGroup.h"

@class WWHeaderView;

@protocol WWheaderViewDelegate <NSObject>

@optional
- (void)headerView:(WWHeaderView *)headerView;

@end

@interface WWHeaderView : UITableViewHeaderFooterView

// 类工厂
+ (instancetype)headerViewWithTableView:(UITableView *)tabView;

// 自定义构造
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;


// 模型
@property (nonatomic, strong) WWGroup *group;

@property (nonatomic, weak) id<WWheaderViewDelegate> delegate;


@end
