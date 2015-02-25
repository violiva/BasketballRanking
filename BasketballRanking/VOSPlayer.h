#import "_VOSPlayer.h"
@class VOSTeam;

@interface VOSPlayer : _VOSPlayer {}
// Custom logic goes here.

+(instancetype) playerWithName:(NSString *) name
                        team:(VOSTeam *) team
                     context:(NSManagedObjectContext *) context;


@end
