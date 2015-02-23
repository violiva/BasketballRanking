#import "VOSGroup.h"

@interface VOSGroup ()

// Private interface goes here.

@end

@implementation VOSGroup

// Custom logic goes here.
+(instancetype) groupWithName:(NSString *) name
                         year:(NSNumber *) year
                     category:(VOSCategory *) categ
                      context:(NSManagedObjectContext *) context{
    
    VOSGroup * gr = [self insertInManagedObjectContext:context];
    gr.name = name;
    gr.year = year;
    gr.category = categ;
    
    return gr;
}

#pragma mark - Util
-(NSArray *) observableKeys{
    return @[VOSGroupAttributes.name,
             VOSGroupRelationships.category];
}

@end
