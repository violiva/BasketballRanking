#import "VOSStatistic.h"
#import "VOSGame.h"
#import "VOSPlayer.h"
#import "VOSAction.h"

@interface VOSStatistic ()

// Private interface goes here.

@end

@implementation VOSStatistic

// Custom logic goes here.

+(instancetype) statisticWithGame:(VOSGame *) aGame
                           action:(VOSAction *) aAction
                           player:(VOSPlayer *) aPlayer
                           period:(NSNumber *) period
                           points:(NSNumber *) points
                             time:(NSString *) time
                     context:(NSManagedObjectContext *) context{
    
    VOSStatistic * stat = [self insertInManagedObjectContext:context];
    stat.game = aGame;
    stat.action = aAction;
    stat.player = aPlayer;
    stat.period = period;
    stat.points = points;
    stat.time = time;
    
    return stat;
}

@end
