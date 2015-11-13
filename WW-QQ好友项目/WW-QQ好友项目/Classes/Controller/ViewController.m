//
//  ViewController.m
//  WW-QQ好友项目
//
//  Created by hwm on 15/11/13.
//  Copyright © 2015年 WenmeiWong. All rights reserved.
//

#import "ViewController.h"
#import "WWGroup.h"
#import "WWFriendCell.h"
#import "WWHeaderView.h"


@interface ViewController ()<UITabBarControllerDelegate, UITableViewDataSource>

// 模型

@property (nonatomic, strong) NSMutableArray *groups;

@end

@implementation ViewController

- (NSMutableArray *)groups {
    if (!_groups) {
        
        // 解析plist
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        // 字典转模型
        for (NSDictionary *dict in array) {
            [_groups addObject:[WWGroup groupWithDict:dict]];
        }
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 30;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    WWGroup *friendsGroup = self.groups[section];
    
    return (friendsGroup.opened ? friendsGroup.friends.count : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString *ID = @"cell";
    WWFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    return nil;
}

@end
