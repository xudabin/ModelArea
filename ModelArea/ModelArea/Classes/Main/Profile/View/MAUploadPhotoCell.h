//
//  MAUploadPhotoCell.h
//  ModelArea
//
//  Created by mac on 15/8/12.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MAUploadPhotoCellButtonType) {
    MAUploadPhotoCellButtonTypePickImage, //选择图片
    MAUploadPhotoCellButtonTypeUpload   //确认上传
};

@class MAUploadPhotoCell;
@protocol MAUploadPhotoCellDelegate <NSObject>

@optional
- (void)uploadPhotoCell:(MAUploadPhotoCell *)cell didClickButton:(MAUploadPhotoCellButtonType)type;

@end

@interface MAUploadPhotoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (nonatomic, weak) id<MAUploadPhotoCellDelegate> delegate;

+ (UINib *)nib;
+ (instancetype)cellWithTableview:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath ;
+ (CGFloat)rowHeight;
+ (NSString *)reuseableIdentifier;

@end
