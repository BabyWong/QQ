//
//  WWFriendCell.m
//  WW-QQ好友项目
//
//  Created by hwm on 15/11/14.
//  Copyright © 2015年 WenmeiWong. All rights reserved.
//

#import "WWFriendCell.h"

@implementation WWFriendCell

+ (instancetype)friendCellWithTableView:(UITableView *)tableView {
    
    NSString *ID = @"cell";
    WWFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[WWFriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setFriendData:(WWFriends *)friendData {
    _friendData = friendData;
    self.imageView.image = [UIImage imageNamed:friendData.icon];
    self.textLabel.text = friendData.name;
    self.textLabel.textColor = friendData.isVip ? [UIColor orangeColor] : [UIColor blackColor];
    self.detailTextLabel.text = friendData.intro;
    
}



@end
