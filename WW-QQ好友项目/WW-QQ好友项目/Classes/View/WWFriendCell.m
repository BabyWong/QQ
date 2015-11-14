//
//  WWFriendCell.m
//  WW-QQ好友项目
//
//  Created by hwm on 15/11/14.
//  Copyright © 2015年 WenmeiWong. All rights reserved.
//

#import "WWFriendCell.h"

@interface WWFriendCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UILabel *detailNameLB;

@end

@implementation WWFriendCell

+ (instancetype)friendCellWithTableView:(UITableView *)tableView {
    
//    NSString *ID = @"cell";
//    WWFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (!cell) {
//        cell = [[WWFriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
    WWFriendCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"WWFriendCell" owner:self options:nil] lastObject];
    
    return cell;
}

- (void)setFriendData:(WWFriends *)friendData {
    _friendData = friendData;
//    self.imageView.image = [UIImage imageNamed:friendData.icon];
//    self.textLabel.text = friendData.name;
//    self.textLabel.textColor = friendData.isVip ? [UIColor orangeColor] : [UIColor blackColor];
//    self.detailTextLabel.text = friendData.intro;
    
    self.iconImage.image = [UIImage imageNamed:friendData.icon];
    self.nameLB.text = friendData.name;
    self.nameLB.textColor = friendData.isVip ? [UIColor orangeColor] : [UIColor blackColor];
    self.detailNameLB.text = friendData.intro;
    
}

//+ (void)load {
//    [[NSBundle mainBundle] loadNibNamed:@"WWFriendCell.plist" owner:self options:nil];
//}



@end
