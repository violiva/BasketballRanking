#import "_VOSClasification.h"
@class VOSGroup;
@class VOSTeam;

@interface VOSClasification : _VOSClasification {}
// Custom logic goes here.

+(instancetype) clasificiationWithGroup:(VOSGroup *) group
                                   team:(VOSTeam *) team
                         context:(NSManagedObjectContext *) context;

+(instancetype) clasificiationWithGroup:(VOSGroup *) group
                                context:(NSManagedObjectContext *) context;

@end
