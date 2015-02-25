#import "VOSPhotoContainer.h"

@interface VOSPhotoContainer ()

// Private interface goes here.

@end

@implementation VOSPhotoContainer

-(instancetype)photoWithImage:(UIImage *) image context:(NSManagedObjectContext *) context{
    
    VOSPhotoContainer * photo = [NSEntityDescription insertNewObjectForEntityForName:[VOSPhotoContainer entityName]
                                                              inManagedObjectContext:context];
    
    if (image == nil ){
        photo.photo = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Silueta_Jugador"
                                                              withExtension:@"jpg"]];
    }else{
        photo.photo = UIImageJPEGRepresentation(image, 0.9);
    }
    
    return photo;
}

// Custom logic goes here.
-(UIImage *) image{
    return [UIImage imageWithData:self.photo];
}

-(void) setImage:(UIImage *)image{
    self.photo = UIImageJPEGRepresentation(image, 0.9);
}
@end
