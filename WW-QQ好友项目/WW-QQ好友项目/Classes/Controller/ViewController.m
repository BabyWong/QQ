//
//  ViewController.m
//  WW-QQ好友项目
//
//  Created by hwm on 15/11/13.
//  Copyright © 2015年 WenmeiWong. All rights reserved.
//

#import "ViewController.h"
#import "WWGroup.h"
#import "WWFriends.h"
#import "WWFriendCell.h"
#import "WWHeaderView.h"


@interface ViewController ()<UITabBarControllerDelegate, WWheaderViewDelegate>

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
        NSMutableArray *gg = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            [gg addObject:[WWGroup groupWithDict:dict]];
        }
        _groups = gg;

    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 50;
    self.tableView.sectionHeaderHeight = 44;
    
}


#pragma mark - tableView的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    WWGroup *friendsGroup = self.groups[section];
    
    // 打开:row > 0 关闭: row == 0
    return (friendsGroup.opened ? friendsGroup.friends.count : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 创建cell
    WWFriendCell *cell = [WWFriendCell friendCellWithTableView:tableView];
    
    // 传模型
    WWGroup *group = self.groups[indexPath.section];
    WWFriends *friend = group.friends[indexPath.row];
    cell.friendData = friend;
    
    return cell;
    
}

/* 隐藏菜单栏 */
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    WWHeaderView *headerView = [WWHeaderView headerViewWithTableView:tableView];
    WWGroup *group = self.groups[section];
    headerView.group = group;
    
    headerView.delegate = self;
    
    return headerView;
}

#pragma mark - 组头的代理方法
- (void)headerView:(WWHeaderView *)headerView {
    // 刷新数据
    [self.tableView reloadData];
}

@end
