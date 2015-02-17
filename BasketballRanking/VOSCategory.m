#import "VOSCategory.h"

@interface VOSCategory ()

// Private interface goes here.

@end

@implementation VOSCategory

// Custom logic goes here.
+(instancetype) categoryWithName:(NSString *) name
                         context:(NSManagedObjectContext *) context{
    
    VOSCategory * cat = [self insertInManagedObjectContext:context];
    cat.name = name;
    
    return cat;
}

#pragma mark - Util
-(NSArray *) observableKeys{
    return @[VOSCategoryAttributes.name,
             VOSCategoryRelationships.group];
}


/*
 #pragma mark - KVO
 -(void) observeValueForKeyPath:(NSString *)keyPath
 ofObject:(id)object
 change:(NSDictionary *)change
 context:(void *)context{
 
 // sólo me interesa saber que algo ha cambiado
 self.modificationDate = [NSDate date];
 }
 */
@end
