//
//  MARegionViewController.m
//  ModelArea
//
//  Created by mac on 15/8/15.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MARegionViewController.h"

static NSString *ID = @"Cell";

@interface MARegionViewController ()

@end

@implementation MARegionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    self.dataList = @[ @{ @"province": @"北京", @"city": @[ @"三里屯", @"三里屯", @"三里屯" ]},
                       @{ @"province": @"上海", @"city": @[ @"三里屯", @"三里屯", @"三里屯" ] },
                       @{ @"province": @"浙江", @"city": @[ @"三里屯", @"三里屯", @"三里屯" ] },
                       @{ @"province": @"广东", @"city": @[ @"三里屯", @"三里屯", @"三里屯" ]},
                    ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *cities = self.dataList[section];
    NSArray *array = cities[@"city"];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    NSDictionary *dict = self.dataList[indexPath.section];
    NSArray *cities = dict[@"city"];
    cell.textLabel.text = cities[indexPath.row];
    cell.textLabel.font = MAFONT_SIZE(15);
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *dict = self.dataList[section];
    NSString *province = dict[@"province"];
    return province;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 'A'; i<='Z'; i++) {
        [array addObject:[NSString stringWithFormat:@"%c", i]];
    }
    
    return array;
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString*)title atIndex:(NSInteger)index
{
    return (index+1==26)?0:(index+1);
}

@end
