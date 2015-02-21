//
//  VOSActionTableViewCell.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 17/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSActionTableViewCell.h"
#import "VOSAction.h"

@implementation VOSActionTableViewCell 

#pragma mark - Properties
// creamos un setter personalizado
-(void) setAction:(VOSAction *)action{
    // guardamos la nota
    _action = action;
    
    // sincronizamos la vista con la nota
    self.actionNameView.text = action.name;
    
    [self setEditing:YES];
}

#pragma mark - Class methods
+(CGFloat)height{
    return 60.0f;
}

+(NSString *)cellId{
    return [self description];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
