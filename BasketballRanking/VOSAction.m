#import "VOSAction.h"

@interface VOSAction ()

// Private interface goes here.

@end

@implementation VOSAction

// Custom logic goes here.
+(instancetype) actionWithName:(NSString *) name
                        points: points
                       context:(NSManagedObjectContext *) context{
    
    VOSAction * act = [self insertInManagedObjectContext:context];
    act.name = name;
    act.points = points;
    
    return act;
    
}

@end
