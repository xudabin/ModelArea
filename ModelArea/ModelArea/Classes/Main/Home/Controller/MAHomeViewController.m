//
//  MAHomeViewController.m
//  ModelArea
//
//  Created by mac on 15/7/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//
#define kDelicateColor MAColor(251, 139,111,1)
#define kRecommendColor MAColor(252, 217,111,1)

#import "MAHomeViewController.h"
#import "MAHeaderView.h"
#import "MAModelInfoTableViewController.h"
#import "MAMoreModelViewController.h"
#import "MASelectCityViewController.h"
#import "MANavigationController.h"
#import "MJRefresh.h"
#import <CoreLocation/CoreLocation.h>
#import "MAModel.h"
#import "MJExtension.h"
#import "MAModelCell.h"
#import "MAModelCollectionView.h"
#import "MAADSHeaderView.h"
#import "MAPhotographerCell.h"
#import "MADresserCell.h"

//static NSString *identifer = @"Cell";
//static NSString *ID = @"CollectionCell";
static const CGFloat HeaderHeight = 40;

@interface MAHomeViewController ()<CLLocationManagerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    CLLocationManager *_locationManager;
    CLLocation *_currentLocation;
}

//@property (strong, nonatomic) UITableView *tableView;
//@property (strong, nonatomic) NSMutableArray *dataList;
@property (weak, nonatomic) NSString *locality;
@property (weak, nonatomic) UIButton *leftItem;
@property (strong, nonatomic) MAModelCollectionView *collectionView;
@end

@implementation MAHomeViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kTABLEVIEW_BACKGROUND;
    
    self.collectionView = [MAModelCollectionView modelCollectionViewWithFrame:self.view.bounds];
    self.collectionView.delegate = self;
    self.collectionView.dataSource  = self;
    
    [self.collectionView registerNib:[MAModelCell nib] forCellWithReuseIdentifier:[MAModelCell ID]];
    [self.collectionView registerNib:[MAPhotographerCell nib] forCellWithReuseIdentifier:[MAPhotographerCell ID]];
    [self.collectionView registerNib:[MADresserCell nib] forCellWithReuseIdentifier:[MADresserCell ID]];
    
    //注册头视图
    [self.collectionView registerClass:[MAADSHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[MAADSHeaderView ID]];
    [self.collectionView registerClass:[MAHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[MAHeaderView ID]];

    [self.view addSubview:self.collectionView];
    
    //添加下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //NSLog(@"shuagxing");
        //[header endRefreshing];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.collectionView.header = header;
    
    [self setupNavBar];
    
    //定位服务
    _locationManager=[[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.distanceFilter = 1000.0f;
    
    if (IS_IOS_8) {
        [_locationManager requestWhenInUseAuthorization];
    }
    [_locationManager startUpdatingLocation];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectedCity:) name:MACityDidSelectedNotification object:nil];
    
}

- (void)selectedCity:(NSNotification *)notif {
    NSString *city = [notif userInfo][@"city"];
    self.locality = city;
    [self.leftItem setTitle:self.locality forState:UIControlStateNormal];
    [self.leftItem sizeToFit];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_locationManager stopUpdatingLocation];
    
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:MACityDidSelectedNotification object:nil];;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//字典转模型
//- (NSArray *)dataList {
//    if (!_dataList) {
//        _dataList = [NSMutableArray array];
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"model" ofType:@"plist"];
//        NSArray *array = [NSArray arrayWithContentsOfFile:path];
//        for (NSDictionary *dict in array) {
//            MAModel *model = [MAModel objectWithKeyValues:dict];
//            [_dataList addObject:model];
//        }
//    }
//    return _dataList;
//}

#pragma mark - collection view datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    if (section == 1) {
        return 6;
    }
    
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        MAPhotographerCell *photographerCell = [collectionView dequeueReusableCellWithReuseIdentifier:[MAPhotographerCell ID] forIndexPath:indexPath];
        if (indexPath.row == 3) {
            photographerCell.separator.hidden = YES;
        }
        return photographerCell;
    }
    
    if (indexPath.section == 3) {
        MADresserCell *dreseeCell = [collectionView dequeueReusableCellWithReuseIdentifier:[MADresserCell ID] forIndexPath:indexPath];
        return dreseeCell;
    }
    MAModelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[MAModelCell ID] forIndexPath:indexPath];
    //cell.model = self.dataList[indexPath.row];
    return cell;
}

#pragma mark - collection view delegate

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0)
        return UIEdgeInsetsMake(0, kSpacing, 0, kSpacing);
    return UIEdgeInsetsMake(kSpacing, kSpacing, kSpacing, kSpacing);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // NSLog(@"selected at row: %zd", indexPath.row);
    MAModelInfoTableViewController *infoVC = [[MAModelInfoTableViewController alloc]init];
    
    //infoVC.model = self.dataList[indexPath.row];
    [self.navigationController pushViewController:infoVC animated:YES];
    
}

//返回可重用的头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MAADSHeaderView *adHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[MAADSHeaderView ID] forIndexPath:indexPath];
        adHeader.images = @[@"grapher_0.jpg", @"grapher_1.jpg", @"grapher_2.jpg"];
        return adHeader;
    }
    MAHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                            withReuseIdentifier:[MAHeaderView ID] forIndexPath:indexPath];
    //header.backgroundColor = kTABLEVIEW_BACKGROUND;
    if (indexPath.section == 1) {
        header.color = kRecommendColor;
        header.title = @"本周推荐";
        header.imageNamed = @"home_more_yellow_icon";
    }
    [header addTarget:self action:@selector(moreModelAction)];
    return header;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = {self.view.frame.size.width,HeaderHeight};
    if (section == 0) {
        size = CGSizeMake(self.view.width, MAADSHeaderHeight);
    }
    return size;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeZero;
    if (indexPath.section == 1) {
        size = CGSizeMake((self.view.width-kSpacing*3)/2, MAModelCellHeight);
    }
    else {
        size = CGSizeMake(self.view.width, MAPhotographerCellHeight);
    }
    
    return size;
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *curentLocation = [locations lastObject];
    _currentLocation = curentLocation;
    
    NSLog(@"@经度=%f 纬度=%f" , curentLocation.coordinate.longitude, curentLocation.coordinate.latitude);
    
    [self reversetLocation];
}


#pragma mark - Private 

//反地址解析
- (void)reversetLocation {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    if (_currentLocation) {
        [geocoder reverseGeocodeLocation:_currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
            if (placemarks.count >0 ) {
                CLPlacemark *placemark = placemarks[0];
            
                NSString *locality = [placemark.locality substringWithRange:NSMakeRange(0, placemark.locality.length-1)];
                self.locality = locality;
                [self.leftItem setTitle:self.locality forState:UIControlStateNormal];
                [self.leftItem sizeToFit];
                NSLog(@"%@", self.locality);
            }
        }];
        
    }
    
}



- (void)setupNavBar {
    //logo
//    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_logo"]];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:logo];
//    UILabel *myLocality = [UILabel ]
    if (!self.locality) {
        self.locality = @"杭州";
    }
    
    UIButton *leftItem = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [leftItem setImage:[UIImage imageNamed:@"home_selectcity"] forState:UIControlStateNormal];
    [leftItem setTitle:self.locality forState:UIControlStateNormal];
    leftItem.titleLabel.font = MAFONT_SIZE(14);
    leftItem.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftItem addTarget:self action:@selector(selectCity) forControlEvents:UIControlEventTouchUpInside];
    [leftItem setTitleEdgeInsets:UIEdgeInsetsMake(0, -leftItem.currentImage.size.width, 0, leftItem.currentImage.size.width)];
    [leftItem setImageEdgeInsets:UIEdgeInsetsMake(0, leftItem.titleLabel.width+6, 0,  -leftItem.titleLabel.width)];
    self.leftItem = leftItem;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftItem];
    
    UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:@[@"热门", @"周边"]];
    segmented.frame = CGRectMake(0, 0, 120, 30);
    segmented.tintColor = [[UIColor whiteColor] colorWithAlphaComponent:0.85];
    segmented.selectedSegmentIndex = 0;
    self.navigationItem.titleView = segmented;
    
    //self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightItemWithTarget:self action:@selector(presentSearchVC) image:@"home_location_icon" highLighted:@"home_location_icon"];
}

//打开更多界面
- (void)moreModelAction {
    [self.navigationController pushViewController:[[MAMoreModelViewController alloc] init] animated:YES];
}

//打开选择城市界面
- (void)selectCity {
    
    MASelectCityViewController *cityVC = [[MASelectCityViewController alloc] initWithStyle:UITableViewStyleGrouped];
    cityVC.locatedCity = self.locality;
    [self.navigationController pushViewController:cityVC animated:YES];
        
}

//打开选择城市界面
- (void)presentSearchVC {
    
    
    
}



@end
