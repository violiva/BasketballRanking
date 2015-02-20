#import "VOSLogo.h"

@interface VOSLogo ()

// Private interface goes here.

@end

@implementation VOSLogo
-(instancetype)logoWithImage:(UIImage *) image context:(NSManagedObjectContext *) context{
    
    VOSLogo * logo = [NSEntityDescription insertNewObjectForEntityForName:[VOSLogo entityName]
                                                   inManagedObjectContext:context];
    
    logo.photoData = UIImageJPEGRepresentation(image, 0.9);
    
    return logo;
    
}

-(UIImage *) image{
    return [UIImage imageWithData:self.photoData];
}

-(void) setImage:(UIImage *)image{
    self.photoData = UIImageJPEGRepresentation(image, 0.9);
}
@end
