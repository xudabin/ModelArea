//
//  MAModelCellCollectionViewCell.m
//  ModelArea
//
//  Created by mac on 15/7/25.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MAModelCell.h"
#import "MAModel.h"

@interface MAModelCell ()
//@property (weak, nonatomic) IBOutlet UIImageView *image;
//@property (weak, nonatomic) IBOutlet UILabel *userLab;
//@property (weak, nonatomic) IBOutlet UILabel *addressLab;
//@property (weak, nonatomic) IBOutlet UILabel *priceLab;


@end

@implementation MAModelCell

+ (UINib *)nib {
    return [UINib nibWithNibName:@"MAModelCell" bundle:nil];
}

+ (NSString *)ID {
    return @"CollectionCell";
}

- (void)awakeFromNib {
    // Initialization code
//    self.layer.cornerRadius = 5;
//    self.layer.masksToBounds = YES;
    //self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)setModel:(MAModel *)model {
    _model = model;
    
    self.imageView.image = [UIImage imageNamed:model.image];
    self.name.text = model.name;
    self.address.text = model.address;
 
}

@end
