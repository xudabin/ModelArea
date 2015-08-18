//
//  MAButtonBroup.h
//  
//
//  Created by mac on 15/8/4.
//
//

#import <UIKit/UIKit.h>

@class MAButtonBroup;
@protocol MAButtonBroupDelegate <NSObject>

@optional
- (void)buttonGroup:(MAButtonBroup *)view clickedAtTag:(NSInteger)tag;

@end

@interface MAButtonBroup : UIView

@property (strong, nonatomic) UILabel *fansText;
@property (strong, nonatomic) UILabel *fellowerText;

@property (strong, nonatomic) NSDictionary *data;

@property (weak, nonatomic) id<MAButtonBroupDelegate> delegate;

@end
