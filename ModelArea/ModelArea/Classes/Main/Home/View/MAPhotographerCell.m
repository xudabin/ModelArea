//
//  MAPhotographerCell.m
//  ModelArea
//
//  Created by mac on 15/8/15.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAPhotographerCell.h"

static const NSInteger count = 3;

@interface MAPhotographerCell ()

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@property (nonatomic, strong) NSMutableArray *photosView;
@end

@implementation MAPhotographerCell

+ (UINib *)nib {
    return [UINib nibWithNibName:@"MAPhotographerCell" bundle:nil];
}

+ (NSString *)ID {
    return @"MAPhotographerCell";
}

//- setupViews {
//    
//}

- (void)awakeFromNib {
    
    self.photosView = [NSMutableArray arrayWithCapacity:count];
    
    //当shouldRasterize设成true时，layer被渲染成一个bitmap，并缓存起来，等下次使用时不会再重新去渲染了
    self.userIcon.layer.shouldRasterize = YES;
    self.userIcon.layer.cornerRadius = self.userIcon.width/2;
    self.userIcon.layer.masksToBounds = YES;
    
    //添加分割线
    UIImageView *separator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"separator_line"]];
    separator.backgroundColor = kDEFAULT_GRAYCOLOR;
    [self.bottomView addSubview:separator];
    self.separator = separator;
    
    //添加图像
    for (NSInteger i=0; i<count; i++) {
        UIImageView *photo = [[UIImageView alloc] init];
//        photo.layer.cornerRadius = 3;
//        photo.layer.masksToBounds = YES;
//        photo.layer.shouldRasterize = YES;
        [self.photosView addObject:photo];
        [self.bottomView addSubview:photo];
        
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.bottomView.width = self.width;
    self.separator.frame = CGRectMake(0, self.bottomView.height-1, self.bottomView.width, 1);
   // NSLog(@"%f", self.width);
    
    CGFloat photoW = (self.bottomView.width-(count+1)*8)/count;
    
    NSString *imageNamed = nil;
    for (NSInteger i=0; i<count; i++) {
        imageNamed = [NSString stringWithFormat:@"grapher_%zd.jpg", i];
        UIImageView *photo = (UIImageView *)self.photosView[i] ;
        photo.frame = CGRectMake(i*(8+photoW)+8, 0, photoW, self.bottomView.height-8);
        photo.image = [UIImage imageNamed:imageNamed];
    }
    
    
}



@end
