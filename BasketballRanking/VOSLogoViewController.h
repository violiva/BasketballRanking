//
//  VOSLogoViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 19/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VOSClub.h"
// #import "VOSLogo.h"

@interface VOSLogoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *logoView;

- (IBAction)takePhoto:(id)sender;
- (IBAction)deletePhoto:(id)sender;


-(id)initWithModel:(VOSClub *) model;

@end
