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
{
    int idPicker;
}

@property (nonatomic, strong) VOSCategory * cat;

@property (weak, nonatomic) IBOutlet UITextField *categoryNameView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerSetting;
@property (weak, nonatomic) IBOutlet UIButton *periodsView;
@property (weak, nonatomic) IBOutlet UIButton *minutesView;
@property (weak, nonatomic) IBOutlet UILabel *minutesLbl;
@property (weak, nonatomic) IBOutlet UILabel *periodLbl;

- (IBAction)hideKeyboard:(id)sender;
- (IBAction)settingPeriods:(id)sender;
- (IBAction)settingMinutes:(id)sender;

-(id) initWithModel: (VOSCategory *) aModel;

@end


