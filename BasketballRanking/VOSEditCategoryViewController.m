//
//  VOSEditCategoryViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 3/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSEditCategoryViewController.h"
#import "VOSCategory.h"

@interface VOSEditCategoryViewController ()

@property (strong, nonatomic) NSMutableArray *arrayPeriods;
@property (strong, nonatomic) NSMutableArray *arrayTime;

@end

@implementation VOSEditCategoryViewController

#pragma mark - Init
-(id) initWithModel: (VOSCategory *) aModel{
    
    if ( self = [super initWithNibName:nil
                                bundle:nil]){
        _cat = aModel;
        self.title = aModel.name;
    }
    return self;
}

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    self.categoryNameView.text = self.cat.name;
    self.periodsView.text = [NSString stringWithFormat:@"%@", self.cat.period];
    self.minutesView.text = [NSString stringWithFormat:@"%@", self.cat.timePeriod];
    
    self.arrayPeriods = [[NSMutableArray alloc] initWithArray:@[ @"2", @"4", @"6" ]];
    UIPickerView *pickerPeriod = [UIPickerView new];
    pickerPeriod.delegate = self;
    pickerPeriod.dataSource = self;
    self.periodsView.inputView = pickerPeriod;

    self.arrayTime = [[NSMutableArray alloc] initWithArray:@[ @"8", @"10", @"12" ]];
    UIPickerView *pickerTime = [UIPickerView new];
    pickerTime.delegate = self;
    pickerTime.dataSource = self;
    self.minutesView.inputView = pickerTime;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    self.cat.name = self.categoryNameView.text;
    self.cat.period = @([self.periodsView.text intValue]);
    self.cat.timePeriod = @([self.minutesView.text intValue]);
}

#pragma mark - PickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
 
    if (component == 0) {
        return [self.arrayPeriods count];
    }
    return [self.arrayTime count];
}


#pragma mark - PickerViewDelegate
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    if (component == 0) {
        return [self.arrayPeriods objectAtIndex:row];
    }
    return [self.arrayTime objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.periodsView.text = [self.arrayPeriods objectAtIndex:row];
    if (component == 0)
    {
        self.periodsView.text = [self.arrayPeriods objectAtIndex:row];
    } else {
        self.minutesView.text = [self.arrayTime objectAtIndex:row];
    }
}

#pragma mark - Utils
- (IBAction)hideKeyboard:(id)sender{
    [self.view endEditing:YES];
    // esta llamada no pasa por el método shouldReturn directamente va al didEndEditing.
    // validateValue:forKey:Error: son métodos de NSManagedObject y sería ahí donde habría que implementar los métodos de validación.
}

@end
