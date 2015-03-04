//
//  VOSEditCategoryViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 3/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSEditCategoryViewController.h"
#import "VOSCategory.h"

#define uno 1
#define dos 2

@interface VOSEditCategoryViewController ()

@property (strong, nonatomic) NSArray *arrayPicker;
@property (strong, nonatomic) NSArray *arrayPeriods;
@property (strong, nonatomic) NSArray *arrayTime;

@end

@implementation VOSEditCategoryViewController

#pragma mark - Init
-(id) initWithModel: (VOSCategory *) aModel{
    
    if ( self = [super initWithNibName:nil
                                bundle:nil]){
        _cat = aModel;
    }
    return self;
}

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    self.arrayPicker = [[NSArray alloc] initWithObjects:nil]; // Esta referenacia la utilizamos para apuntar al array Seleccionado
    self.arrayPeriods = [[NSArray alloc] initWithObjects:@"2",@"4",@"6",nil];
    self.arrayTime = [[NSArray alloc] initWithObjects:@"8",@"10",@"12",nil];

    self.pickerSetting.delegate = self;
    self.pickerSetting.hidden = YES;

    self.categoryNameView.text = self.cat.name;
    self.periodLbl.text = [NSString stringWithFormat:@"%@", self.cat.period];
    self.minutesLbl.text = [NSString stringWithFormat:@"%@", self.cat.timePeriod];
    
    [self.periodsView setTitle:[NSString stringWithFormat:@"%@", self.cat.period] forState:UIControlStateNormal];
    [self.minutesView setTitle:[NSString stringWithFormat:@"%@", self.cat.timePeriod] forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    self.cat.name = self.categoryNameView.text;
    self.cat.period = @([self.periodLbl.text intValue]);
    self.cat.timePeriod = @([self.minutesLbl.text intValue]);
}

#pragma mark - PickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
 
    return [self.arrayPicker count];
}


#pragma mark - PickerViewDelegate
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    return [self.arrayPicker objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (idPicker == uno){
        self.periodLbl.text = [self.arrayPicker objectAtIndex:row];
        [self.periodsView setTitle:[self.arrayPicker objectAtIndex:row] forState:UIControlStateNormal];
    }else{
        self.minutesLbl.text = [self.arrayPicker objectAtIndex:row];
        [self.minutesView setTitle:[self.arrayPicker objectAtIndex:row] forState:UIControlStateNormal];
    }
}

#pragma mark - Utils
- (IBAction)hideKeyboard:(id)sender{
    [self.view endEditing:YES];

    self.pickerSetting.hidden = NO;

    // esta llamada no pasa por el método shouldReturn directamente va al didEndEditing.
    // validateValue:forKey:Error: son métodos de NSManagedObject y sería ahí donde habría que implementar los métodos de validación.
}

// Metodo para que desaparezca el pickerview cuando pulsas fuera de el
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)eve
{
    if ( !self.pickerSetting.hidden) {
        self.pickerSetting.hidden = YES;
    }
    
}

- (IBAction)settingPeriods:(id)sender {
    self.pickerSetting.hidden = NO;
    idPicker = uno;
    self.arrayPicker = self.arrayPeriods;
    [self.pickerSetting reloadAllComponents];
}

- (IBAction)settingMinutes:(id)sender {
    self.pickerSetting.hidden = NO;
    idPicker = dos;
    self.arrayPicker = self.arrayTime;
    [self.pickerSetting reloadAllComponents];
}

@end
