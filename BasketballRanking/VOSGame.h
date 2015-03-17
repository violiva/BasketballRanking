#import "_VOSGame.h"

@interface VOSGame : _VOSGame {}
// Custom logic goes here.

+(instancetype) gameWithDate:(NSDate *) aDate
                       group:(VOSGroup *) aGroup
                    awayTeam:(VOSTeam *) visitorTeam
                    homeTeam:(VOSTeam *) localTeam
                     context:(NSManagedObjectContext *) context;

+(instancetype) gameWithDate:(NSDate *) aDate
                     context:(NSManagedObjectContext *) context;

+(instancetype) gameWithGroup:(VOSGroup *) aGroup
                      context:(NSManagedObjectContext *) context;
   
@end
