//
//  WWHeaderView.m
//  WW-QQ好友项目
//
//  Created by hwm on 15/11/14.
//  Copyright © 2015年 WenmeiWong. All rights reserved.
//

#import "WWHeaderView.h"

@interface WWHeaderView ()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UILabel *countFriends;

@end

@implementation WWHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tabView {
    
    // 访问回收池
    NSString *ID = @"header";
    WWHeaderView *header = (WWHeaderView *)[tabView dequeueReusableCellWithIdentifier:ID];
    if (!header) {
        header = [[WWHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        // 添加组头
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        
        // 左边箭头
        [btn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        // 设置内容居左
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // 增加按钮内容内边距
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        [btn addTarget:self action:@selector(nameViewClick) forControlEvents:UIControlEventTouchUpInside];
        
        // 设置按钮的imageView模式为剧中
        btn.imageView.contentMode = UIViewContentModeCenter;
        // 不要裁剪
        btn.imageView.clipsToBounds = NO;
        
        // 添加按钮
        [self.contentView addSubview:btn];
        self.btn = btn;
        
        
        UILabel *countFriends = [[UILabel alloc] init];
//        countFriends.contentMode = UIViewContentModeRight;
        countFriends.textAlignment = NSTextAlignmentRight;
        countFriends.textColor = [UIColor grayColor];
        [self.contentView addSubview:countFriends];
        self.countFriends = countFriends;
        
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 布局按钮
    self.btn.frame = self.bounds;
    
    // 布局lab
    CGFloat w = 150;
    CGFloat x = self.bounds.size.width - w - 10;
    CGFloat y = 0;
    CGFloat h = self.bounds.size.height;
    
    self.countFriends.frame = CGRectMake(x, y, w, h);
    
    
}

// 模型赋值
- (void)setGroup:(WWGroup *)group {
    
    _group = group;
    
    [self.btn setTitle:group.name forState:UIControlStateNormal];
    
    self.countFriends.text = [NSString stringWithFormat:@"%ld/%lu", (long)group.online, (unsigned long)group.friends.count];
    
}

// 监听
- (void)nameViewClick {
    
    self.group.opened = !self.group.isOpened;
    
    if ([self.delegate respondsToSelector:@selector(headerView:)]) {
        [_delegate headerView:self];
    }
    
}

/*-------- 当一个控件被添加到子控件中就会调用 --------------*/
- (void)didMoveToSuperview {
    
    if (self.group.opened) {
        self.btn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else {
        self.btn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    
}

@end
