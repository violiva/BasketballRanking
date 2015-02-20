@import UIKit;
#import "_VOSLogo.h"

@interface VOSLogo : _VOSLogo {}
// Custom logic goes here.

@property (nonatomic, strong) UIImage * image;

-(instancetype)logoWithImage:(UIImage *) image context:(NSManagedObjectContext *) context;

@end
