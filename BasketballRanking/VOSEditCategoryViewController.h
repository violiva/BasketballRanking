//
//  VOSEditCategoryViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 3/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@class UIKit;
@class VOSCategory;

@interface VOSEditCategoryViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) VOSCategory * cat;

@property (weak, nonatomic) IBOutlet UITextField *categoryNameView;
@property (weak, nonatomic) IBOutlet UITextField *periodsView;
@property (weak, nonatomic) IBOutlet UITextField *minutesView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerSetting;

- (IBAction)hideKeyboard:(id)sender;

-(id) initWithModel: (VOSCategory *) aModel;

@end


