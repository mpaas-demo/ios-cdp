//
//  DemoViewController.m
//  MPCdpDemo_plugin
//
//  Created by shifei.wkp on 2019/08/05.
//  Copyright © 2019 Alibaba. All rights reserved.
//

#import "DemoViewController.h"
#import "MPCdpDemoVC.h"
#import <mPaas/MPLiteSettingService.h>

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Demo";
    self.view.backgroundColor = AU_COLOR_CLIENT_BG1;
    
    CGFloat hMargin = 0.05 * self.view.width;
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.font = [UIFont systemFontOfSize:14];
    dateLabel.textColor = [UIColor grayColor];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:[NSDate date]];
    NSArray *week = @[@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
    dateLabel.text = [NSString stringWithFormat:@"%ld年%ld月%ld日 %@", components.year, components.month, components.day, week[components.weekday - 1]];
    [self.view addSubview:dateLabel];
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(hMargin);
        make.top.mas_equalTo(self.mas_topLayoutGuide).offset(30);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Hello MPaaS!";
    label.font = [UIFont systemFontOfSize:30];
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(dateLabel.mas_left);
        make.top.mas_equalTo(dateLabel.mas_bottom).offset(10);
    }];
    
    AUButton *button = [AUButton buttonWithStyle:AUButtonStyle1 title:@"进入Demo" target:self action:@selector(enterDemo:)];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(hMargin);
        make.right.mas_equalTo(self.view.mas_right).offset(-hMargin);
        make.top.mas_equalTo(label.mas_bottom).offset(50);
        make.height.mas_offset(44);
    }];
}

- (void)enterDemo:(id)sender {
    MPCdpDemoVC *vc = [MPCdpDemoVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 通知 Launcher 已经展示
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotificationLauncherDidAppear" object:nil];
}


@end
