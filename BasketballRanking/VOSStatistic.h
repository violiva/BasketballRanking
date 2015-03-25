#import "_VOSStatistic.h"

@interface VOSStatistic : _VOSStatistic {}
// Custom logic goes here.

+(instancetype) statisticWithGame:(VOSGame *) aGame
                           action:(VOSAction *) aAction
                           player:(VOSPlayer *) aPlayer
                           period:(NSNumber *) period
                           points:(NSNumber *) points
                             time:(NSString *) time
                          context:(NSManagedObjectContext *) context;

@end
