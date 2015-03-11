//
//  VOSTeamsInAGroupTableViewCell.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 10/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSTeamsInAGroupTableViewCell.h"
#import "VOSGroup.h"
#import "VOSTeam.h"
#import "VOSClub.h"

@implementation VOSTeamsInAGroupTableViewCell

#pragma mark - Properties
// creamos un setter personalizado
-(void) setGroup:(VOSGroup *)group{
    // guardamos el grupo
    _group = group;
    
    // sincronizamos la vista con el modelo
//    self.teams.text = group.name;

    NSSet *aTeamsSet = self.group.teams;
    NSMutableArray *teamNamesArray = [[NSMutableArray alloc] initWithCapacity:aTeamsSet.count];
    
    for (VOSTeam *team in aTeamsSet) {
        [teamNamesArray addObject:[NSString stringWithFormat:@"%@ / %@", team.club.name, team.name ]];
    }
    self.teams.text = [teamNamesArray componentsJoinedByString:@", \n"];
    
    
    [self setEditing:YES];
}

#pragma mark - Class methods
+(CGFloat)height{
    return 250.0f;
}

+(NSString *)cellId{
    return [self description];
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    
}
    
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/*
#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"Vamos a pantalla selección equipos");

    VOSTeamsListViewController *teamsPicker = [[VOSTeamsListViewController alloc] initWithGroup:self.group];
    [self.navigationController pushViewController:tagPicker
                                         animated:YES];

}
*/
@end
