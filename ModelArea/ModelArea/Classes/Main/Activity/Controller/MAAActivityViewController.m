//
//  MAAActivityViewController.m
//  ModelArea
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAAActivityViewController.h"
#import "MADDynamicViewController.h"

static const CGFloat ButtonW = 50;
static const CGFloat BackViewH = 24;

@interface MAAActivityViewController () <UIScrollViewDelegate> {
    CGFloat _curentOffsetX;
}

@property (nonatomic, weak) UIView *backgroundView;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation MAAActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    scrollView.contentSize = CGSizeMake( 2*self.view.width, 0);
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
   
    scrollView.backgroundColor = kDEFAULT_GRAYCOLOR;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    

    UIViewController *controlller2 = [[UIViewController alloc] init];
    controlller2.view.backgroundColor = [UIColor blueColor];
    controlller2.view.frame = CGRectMake(self.view.width, 0, self.view.width, scrollView.height);
    [scrollView addSubview:controlller2.view];
    [self addChildViewController:controlller2];

    
    MADDynamicViewController *dynamicVC = [[MADDynamicViewController alloc] init];
    dynamicVC.view.frame = CGRectMake(0, 0, self.view.width, scrollView.height);
    [scrollView addSubview:dynamicVC.view];
    [self addChildViewController:dynamicVC];
    
    //NSLog(@"self: %f, other: %f", scrollView.contentSize.height, controlller1.view.height);
}

- (void)setupNav {

    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2*ButtonW, 44)];
    //titleView.backgroundColor = [UIColor redColor];
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, (44-BackViewH)/2, ButtonW, 24)];
    backgroundView.backgroundColor = [kDefaultTextColor colorWithAlphaComponent:0.9];
    backgroundView.layer.cornerRadius = 4;
    backgroundView.layer.masksToBounds = YES;
    [titleView addSubview:backgroundView];
    self.backgroundView = backgroundView;
    
    self.buttons = [NSMutableArray arrayWithCapacity:2];
    for (int i=0; i<2; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(i*ButtonW, 0, ButtonW, 44);
        button.tag = i + 1;
        [button setTitle:@"附近" forState:UIControlStateNormal];
        button.titleLabel.font = MAFONT_SIZE(15);
        [button setTitleColor:kDefaultTextColor forState:UIControlStateNormal];
        [button setTitleColor:kDefaultColor forState:UIControlStateSelected];
        [button addTarget:self action:@selector(scrollToPage:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            button.selected = YES;
        }
        [titleView addSubview:button];
        [self.buttons addObject:button];
    }
    
    self.navigationItem.titleView = titleView;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat offsetY = scrollView.contentOffset.y;
    
    NSLog(@"offsetY: %f", offsetY);
    
    NSInteger currentPage = offsetX / self.view.width + 0.5;

    
    NSLog(@"offsetX: %f----currentOffset: %zd", offsetX, _curentOffsetX);


    CGFloat tansformX = (offsetX-_curentOffsetX) * (ButtonW / self.view.width);
     //NSLog(@"sapcing:%f", offsetX-_curentOffsetX);

    self.backgroundView.transform = CGAffineTransformTranslate(self.backgroundView.transform, tansformX, 0);
    
    _curentOffsetX = offsetX;
    [self buttonSelectedStatusWithTag:currentPage];
}

- (void)scrollToPage:(UIButton *)sender {
    [self buttonSelectedStatusWithTag:sender.tag-1];
    if (sender.tag == 1) {
        //[self.scrollView scrollRectToVisible:CGRectZero animated:YES];
        self.scrollView.contentOffset = CGPointMake(0, -64);
        //self.backgroundView.transform = CGAffineTransformIdentity;
    }
    else {
        self.scrollView.contentOffset = CGPointMake(self.view.width, -64);
        
    }
   
}

- (void)buttonSelectedStatusWithTag:(NSInteger)tag {
    UIButton *selectedButton = self.buttons[tag];
    selectedButton.selected = YES;
    
    NSInteger otherTag = tag > 0 ? tag -1 : tag + 1;

    UIButton *otherButton = self.buttons[otherTag];
    otherButton.selected = !selectedButton.selected;
    //CGFloat tansformX
    //self.backgroundView.transform = CGAffineTransformTranslate(self.backgroundView.transform, tansformX, 0);
}


@end












