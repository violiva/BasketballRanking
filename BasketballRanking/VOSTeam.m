#import "VOSTeam.h"
#import "VOSClub.h"

@interface VOSTeam ()

// Private interface goes here.

@end

@implementation VOSTeam

// Custom logic goes here.
+(instancetype) teamWithName:(NSString *) name
                        club:(VOSClub *) club
                     context:(NSManagedObjectContext *) context{

    VOSTeam * team = [self insertInManagedObjectContext:context];
    team.name = name;
    team.club = club;
    return team;
}

@end
