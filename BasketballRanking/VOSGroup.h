#import "_VOSGroup.h"
#import "VOSCategory.h"

@interface VOSGroup : _VOSGroup {}
// Custom logic goes here.

+(instancetype) groupWithName:(NSString *) name
                     category:(VOSCategory *) categ
                      context:(NSManagedObjectContext *) context;


@end
