//
//  MARegisterCell.h
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MARegisterCell : UITableViewCell

@property (strong, nonatomic) NSDictionary *data;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (copy, nonatomic) NSString *text;

+ (UINib *)nib;

+ (NSString *)ID;


@end
