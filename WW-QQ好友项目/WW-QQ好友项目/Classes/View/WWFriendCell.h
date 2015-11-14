//
//  WWFriendCell.h
//  WW-QQ好友项目
//
//  Created by hwm on 15/11/14.
//  Copyright © 2015年 WenmeiWong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WWFriends.h"

@interface WWFriendCell : UITableViewCell


// 类工厂
+ (instancetype)friendCellWithTableView:(UITableView *)tableView;



@property (nonatomic, strong) WWFriends *friendData;

@end
