//
//  MADynamicTableViewCell.h
//  ModelArea
//
//  Created by mac on 15/7/27.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DUserCellFrame;

@interface MADDynamicTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *photoImageView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *detailTxetLabel;
@property(nonatomic,strong)UIButton *detailPhotoButton;
@property(nonatomic,strong)UIButton *loveButton;
@property(nonatomic,strong)UIButton *commentButton;
@property(nonatomic,strong)UILabel *commentLabel;
@property(nonatomic,strong)UIView *view;
@property(nonatomic,strong)UILabel *loveLabel;
@property (nonatomic, strong) DUserCellFrame *userCellFrame;
@property(nonatomic,strong) UILabel *detailCommentLabel;
@property (nonatomic,strong) UIButton * kitNumButton;
@property(nonatomic,strong) UILabel *kitNumLabel;
@end
