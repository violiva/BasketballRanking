#import "_VOSClub.h"

@interface VOSClub : _VOSClub {}
// Custom logic goes here.

+(instancetype) clubWithName:(NSString *) name
                     context:(NSManagedObjectContext *) context;


@end
