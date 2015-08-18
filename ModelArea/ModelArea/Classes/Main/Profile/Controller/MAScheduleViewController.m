//
//  MAScheduleViewController.m
//  ModelArea
//
//  Created by mac on 15/8/7.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAScheduleViewController.h"
#import "MACalendarView.h"

@interface MAScheduleViewController ()

@end

@implementation MAScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = nil;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = [NSString stringWithFormat:@"yyyy年M月"];
    NSString *dateStr = [formatter stringFromDate:date];
    self.title = dateStr;
    
    MACalendarView *calendar = [[MACalendarView alloc] initWithFrame:CGRectMake(0, NavBarHeight, self.view.width, self.view.height)];
    [self.view addSubview:calendar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
