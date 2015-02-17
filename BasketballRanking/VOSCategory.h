#import "_VOSCategory.h"

@interface VOSCategory : _VOSCategory {}
// Custom logic goes here.

+(instancetype) categoryWithName:(NSString *) name
                         context:(NSManagedObjectContext *) context;

@end
