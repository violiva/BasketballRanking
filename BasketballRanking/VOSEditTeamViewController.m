//
//  VOSEditTeamViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 24/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSEditTeamViewController.h"
#import "VOSTeam.h"

@interface VOSEditTeamViewController ()

@end

@implementation VOSEditTeamViewController

-(id) initWithModel: (VOSTeam *) aModel{
    
    if ( self = [super initWithNibName:nil
                                bundle:nil]){
        _team = aModel;
        self.title = aModel.name;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.teamView.text = self.team.name;
    self.colourView.text = self.team.colour;
    self.yearView.text = [NSString stringWithFormat:@"%@", self.team.year];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    self.team.name = self.teamView.text;
    self.team.colour = self.colourView.text;
    self.team.year = @([self.yearView.text intValue]);
}

@end
