@import UIKit;
#import "_VOSPhotoContainer.h"

@interface VOSPhotoContainer : _VOSPhotoContainer {}
// Custom logic goes here.

@property (nonatomic, strong) UIImage * image;

-(instancetype)photoWithImage:(UIImage *) image context:(NSManagedObjectContext *) context;

@end
