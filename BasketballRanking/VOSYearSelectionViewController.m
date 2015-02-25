//
//  VOSYearSelectionViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 23/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSYearSelectionViewController.h"

@interface VOSYearSelectionViewController ()

@end

@implementation VOSYearSelectionViewController
@synthesize pickerView;
@synthesize elementsPicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    // Init the data array.
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger year = [components year];
    
    elementsPicker = [[NSMutableArray alloc] init];
    for (int i = year-5; i< year+5; i++){
        [elementsPicker addObject:@(i)];
    }
    
    // Calculate the screen's width.
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    float pickerWidth = screenWidth * 3 / 4;
    
    // Calculate the starting x coordinate.
    float xPoint = screenWidth / 2 - pickerWidth / 2;
    
    // Init the picker view.
    pickerView = [[UIPickerView alloc] init];
    
    // Set the delegate and datasource. Don't expect picker view to work
    // correctly if you don't set it.
    [pickerView setDataSource: self];
    [pickerView setDelegate: self];
    
    // Set the picker's frame. We set the y coordinate to 50px.
    [pickerView setFrame: CGRectMake(xPoint, 50.0f, pickerWidth, 200.0f)];
    
    // Before we add the picker view to our view, let's do a couple more
    // things. First, let the selection indicator (that line inside the
    // picker view that highlights your selection) to be shown.
    pickerView.showsSelectionIndicator = YES;
    
    // Allow us to pre-select the third option in the pickerView.
    [pickerView selectRow:4 inComponent:0 animated:YES];
    
    // OK, we are ready. Add the picker in our view.
    [self.view addSubview: pickerView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Picker Data Source Methed
// Number of components.
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [elementsPicker count];
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [elementsPicker objectAtIndex: row];
}

// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"You selected this: %@", [elementsPicker objectAtIndex: row]);
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    // Get the text of the row.
    NSString *rowItem = [elementsPicker objectAtIndex: row];
    
    // Create and init a new UILabel.
    // We must set our label's width equal to our picker's width.
    // We'll give the default height in each row.
    UILabel *lblRow = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [self.pickerView bounds].size.width, 44.0f)];
    
    // Center the text.
    [lblRow setTextAlignment:NSTextAlignmentCenter];
    
    // Make the text color red.
    [lblRow setTextColor: [UIColor redColor]];
    [lblRow setFont:[UIFont fontWithName:@"Dosis Book" size:20.0]];
    
    // Add the text.
    [lblRow setText:rowItem];
    
    // Clear the background color to avoid problems with the display.
    [lblRow setBackgroundColor:[UIColor clearColor]];
    
    // Return the label.
    return lblRow;
}
@end