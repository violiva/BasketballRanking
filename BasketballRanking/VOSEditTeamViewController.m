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

@property (strong, nonatomic) NSMutableArray *arrayYear;

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
    
    self.arrayYear = [[NSMutableArray alloc] initWithCapacity:21];
    for (int ind = 2010; ind <= 2030; ind++){
        [self.arrayYear addObject:[NSString stringWithFormat:@"%d", ind]];
    }
  
    UIPickerView *picker = [UIPickerView new];
    
    picker.delegate = self;
    picker.dataSource = self;
    self.yearView.inputView = picker;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    self.team.name = self.teamView.text;
    self.team.colour = self.colourView.text;
    self.team.year = @([self.yearView.text intValue]);
}

#pragma mark - PickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [self.arrayYear count];
}

-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [self.arrayYear objectAtIndex:row];
}

#pragma mark - PickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    self.yearView.text = [self.arrayYear objectAtIndex:row];
}

#pragma mark - Utils
- (IBAction)hideKeyboard:(id)sender{
    [self.view endEditing:YES];
}

@end
