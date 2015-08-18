//
//  MAUploadPhotoCell.m
//  ModelArea
//
//  Created by mac on 15/8/12.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAUploadPhotoCell.h"
#import "UIButton+Extention.h"

@interface MAUploadPhotoCell ()
@property (weak, nonatomic) IBOutlet UIButton *uploadButton;

@end

@implementation MAUploadPhotoCell

+ (UINib *)nib {
    return [UINib nibWithNibName:@"MAUploadPhotoCell" bundle:nil];
}

+ (instancetype)cellWithTableview:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:[MAUploadPhotoCell reuseableIdentifier] forIndexPath:indexPath];
}

- (void)awakeFromNib {
    // Initialization code
    [self.uploadButton centerImageAndTitle];
    self.uploadButton.tag = MAUploadPhotoCellButtonTypePickImage;
    [self.uploadButton addTarget:self action:@selector(pickImage) forControlEvents:UIControlEventTouchUpInside];
}

+ (NSString *)reuseableIdentifier {
    return @"MAUploadPhotoCell";
}

+ (CGFloat)rowHeight {
    return 243;
}

- (void)pickImage {
    if ([self.delegate respondsToSelector:@selector(uploadPhotoCell: didClickButton:)]) {
        [self.delegate uploadPhotoCell:self didClickButton:MAUploadPhotoCellButtonTypePickImage];
        
    }
}

@end
