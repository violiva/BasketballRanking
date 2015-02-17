#import "_VOSAction.h"

@interface VOSAction : _VOSAction {}
// Custom logic goes here.

+(instancetype) actionWithName:(NSString *) name
                        points: points
                       context:(NSManagedObjectContext *) context;

@end
