//
//  VOSYearSelectionViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 23/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VOSYearSelectionViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSMutableArray *elementsPicker;

@end
