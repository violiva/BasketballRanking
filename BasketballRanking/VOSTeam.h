#import "_VOSTeam.h"
@class VOSClub;

@interface VOSTeam : _VOSTeam {}
// Custom logic goes here.

+(instancetype) teamWithName:(NSString *) name
                        club:(VOSClub *) club
                     context:(NSManagedObjectContext *) context;

@end
