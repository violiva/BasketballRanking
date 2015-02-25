//
//  VOSPhotoViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 25/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@class UIKit;
@class VOSPlayer;

@interface VOSPhotoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

- (IBAction)takePhoto:(id)sender;
- (IBAction)deletePhoto:(id)sender;


-(id)initWithModel:(VOSPlayer *) model;

@end
