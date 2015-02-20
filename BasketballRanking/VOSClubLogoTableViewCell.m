//
//  VOSClubLogoTableViewCell.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 19/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSClubLogoTableViewCell.h"
#import "VOSClub.h"
#import "VOSLogo.h"

@implementation VOSClubLogoTableViewCell


#pragma mark - Properties
-(void) setClub:(VOSClub *)club{
    //guardamos la nota
    _club = club;
    
    // sincronizamos los datos de la nota con la vista
    if ( club.logo.image ){
        self.logoClub.image = club.logo.image;
    }
}

#pragma mark - Class Methods
+(CGFloat)height{
    return 320.0f;
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
