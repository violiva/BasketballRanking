#import "VOSPhotoContainer.h"

@interface VOSPhotoContainer ()

// Private interface goes here.

@end

@implementation VOSPhotoContainer

// Custom logic goes here.
-(UIImage *) image{
    return [UIImage imageWithData:self.photo];
}

-(void) setImage:(UIImage *)image{
    self.photo = UIImageJPEGRepresentation(image, 0.9);
}
@end
