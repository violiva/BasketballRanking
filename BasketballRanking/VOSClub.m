#import "VOSClub.h"
#import "VOSLogo.h"

@interface VOSClub ()

// Private interface goes here.

@end

@implementation VOSClub

// Custom logic goes here.

+(instancetype) clubWithName:(NSString *) name
                     context:(NSManagedObjectContext *) context{

    VOSClub * club = [self insertInManagedObjectContext:context];
    club.name = name;
    club.address = nil;
    club.logo.photoData = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Photo_not_available"
                                                                     withExtension:@"jpg"]];
    return club;
}

#pragma mark - Util
-(NSArray *) observableKeys{
    return @[VOSClubAttributes.name,
             VOSClubRelationships.teams];
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
