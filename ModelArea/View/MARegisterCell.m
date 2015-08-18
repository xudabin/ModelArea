//
//  MARegisterCell.m
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "MARegisterCell.h"

@interface  MARegisterCell()

@property (weak, nonatomic) IBOutlet UIImageView *image;



@end

@implementation MARegisterCell

+ (UINib *)nib {
    return [UINib nibWithNibName:@"MARegisterCell" bundle:nil];
}

+ (NSString *)ID {
    return @"Cell";
}

- (void)setData:(NSDictionary *)data {
    _data = data;
    
    //NSLog(@"cell data %@", data);
    if (data[@"icon"]) {
        _image.image = [UIImage imageNamed:data[@"icon"]];
        
    }
    
    if (data[@"placeholder"]) {
       _textField.placeholder = data[@"placeholder"];
    }
}

- (void)setText:(NSString *)text {
    _textField.text = text;
}

- (NSString *)text {
    return self.textField.text;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
