//
//  VOSCategoryTableViewCell.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 16/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VOSCategory;

@interface VOSCategoryTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *categoryName;
@property (nonatomic, strong) VOSCategory *category;

+(CGFloat)height;
+(NSString *)cellId;

@end
