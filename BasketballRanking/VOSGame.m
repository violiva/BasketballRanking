#import "VOSGame.h"
#import "VOSGroup.h"
#import "VOSTeam.h"

@interface VOSGame ()

// Private interface goes here.

@end

@implementation VOSGame

// Custom logic goes here.
+(instancetype) gameWithDate:(NSDate *) aDate
                       group:(VOSGroup *) aGroup
                    awayTeam:(VOSTeam *) visitorTeam
                    homeTeam:(VOSTeam *) localTeam
                     context:(NSManagedObjectContext *) context{
    
    VOSGame *game = [self insertInManagedObjectContext:context];
    game.date = aDate;
    game.group = aGroup;
    game.awayTeam = visitorTeam;
    game.homeTeam = localTeam;
    
    return game;
}

+(instancetype) gameWithDate:(NSDate *) aDate
                     context:(NSManagedObjectContext *) context{

    return [self gameWithDate:aDate
                        group:nil
                     awayTeam:nil
                     homeTeam:nil
                      context:context];
    
}

+(instancetype) gameWithGroup:(VOSGroup *) aGroup
                      context:(NSManagedObjectContext *) context{
    
    return [self gameWithDate:[NSDate date]
                        group:aGroup
                     awayTeam:nil
                     homeTeam:nil
                      context:context];
}

@end
