#import "VOSClasification.h"
#import "VOSGroup.h"
#import "VOSTeam.h"

@interface VOSClasification ()

// Private interface goes here.

@end

@implementation VOSClasification

// Custom logic goes here.
+(instancetype) clasificiationWithGroup:(VOSGroup *) group
                                   team:(VOSTeam *) team
                                context:(NSManagedObjectContext *) context{
    
    VOSClasification * clasif = [self insertInManagedObjectContext:context];
    clasif.group = group;
    clasif.team = team;

    clasif.dif  = 0;
    clasif.gamesLost  = 0;
    clasif.gamesPlayed = 0;
    clasif.gamesTied = 0;
    clasif.gamesWon = 0;
    clasif.pointsAgainst = 0;
    clasif.pointsForUs = 0;
    clasif.totalPoints = 0;
    
    return clasif;
}

+(instancetype) clasificiationWithGroup:(VOSGroup *) group
                                context:(NSManagedObjectContext *) context{
    return [self clasificiationWithGroup:group
                                    team:nil
                                 context:context];
}

@end
