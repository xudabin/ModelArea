//
//  MAInviteCell.m
//  ModelArea
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAInviteCell.h"

static NSString *ID = @"Collection";
static const CGFloat ITEM_SIZE = 50;
static const CGFloat Icon_SIZE = 15;

@interface MAInviteCell () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *inviteButton;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) UIImageView *levelIcon;
@property (weak, nonatomic) NSMutableArray *icons;

@end

@implementation MAInviteCell

+ (instancetype)cellWithTableview:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath{
    MAInviteCell *cell = [tableView dequeueReusableCellWithIdentifier:[MAInviteCell reuseableIdentifier] forIndexPath:indexPath];
    return cell;
}

+ (UINib *)nib {
    return [UINib nibWithNibName:@"MAInviteCell" bundle:nil];
}

+ (NSString *)reuseableIdentifier {
    return @"InviteCell";
}

- (void)awakeFromNib {
    // Initialization code
    self.cornerRadius = ITEM_SIZE*0.5;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    [self.inviteButton addTarget:self action:@selector(clickMore) forControlEvents:UIControlEventTouchUpInside];
    //self.topView.layer.borderWidth = 0.5;
   // self.topView.layer.borderColor = kDEFAULT_GRAYCOLOR.CGColor;
    //[self.topView addLineAtButtonFrom:CGPointMake(0, self.topView.height) to:CGPointMake(self.topView.width, self.topView.height)];
    //[self.topView addLineFrom:CGPointMake(0, self.topView.height) to:CGPointMake(self.topView.width, self.topView.height)];
}

#pragma mark - collection view datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *collection = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    //collection.backgroundColor = kDefaultColor;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ITEM_SIZE, ITEM_SIZE)];
    imageView.image = [UIImage imageNamed:@"c"];
    imageView.layer.cornerRadius = self.cornerRadius;
    imageView.layer.masksToBounds = YES;
    [self.icons addObject:imageView];
    [collection addSubview:imageView];
    
    if (self.showLevel) {
        UIImageView *levelIcon = [[UIImageView alloc] initWithFrame:CGRectMake(ITEM_SIZE*0.7, ITEM_SIZE*0.7, Icon_SIZE, Icon_SIZE)];
        levelIcon.image = [UIImage imageNamed:@"home_level_1"];
        [collection addSubview:levelIcon];
    }
   
    return collection;
}

#pragma mark - collection view delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_delegate respondsToSelector:@selector(cell: didSelectItemAtIndexPath:)]) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:_selectedSection];
        [_delegate cell:self didSelectItemAtIndexPath:path];
    }
}

- (void)clickMore {
    if ([_delegate respondsToSelector:@selector(cell: didClickMoreButton:)]) {
        [_delegate cell:self didClickMoreButton:self.inviteButton];
    }
    
}

- (void)setDidHiddenTimes:(BOOL)didHiddenTimes {
    _didHiddenTimes = didHiddenTimes;
    self.inviteButton.hidden = didHiddenTimes;
}

+ (CGFloat)rowHeight {
    return 100;
}


@end
