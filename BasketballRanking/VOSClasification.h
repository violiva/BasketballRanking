#import "_VOSClasification.h"
@class VOSGroup;
@class VOSTeam;

@interface VOSClasification : _VOSClasification {}
// Custom logic goes here.

+(instancetype) clasificationWithGroup:(VOSGroup *) group
                                  team:(VOSTeam *) team
                         context:(NSManagedObjectContext *) context;

+(instancetype) clasificationWithGroup:(VOSGroup *) group
                               context:(NSManagedObjectContext *) context;

@end
