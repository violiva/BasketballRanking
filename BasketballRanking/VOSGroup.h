#import "_VOSGroup.h"
#import "VOSCategory.h"

@interface VOSGroup : _VOSGroup {}
// Custom logic goes here.

+(instancetype) groupWithName:(NSString *) name
                         year:(NSNumber *) year
                     category:(VOSCategory *) category
                      context:(NSManagedObjectContext *) context;


@end
