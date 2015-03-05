#import "VOSClub.h"
#import "VOSLogo.h"

@interface VOSClub ()

// Private interface goes here.

@end

@implementation VOSClub

+(instancetype) clubWithName:(NSString *) name
                     context:(NSManagedObjectContext *) context{

    VOSClub * club = [self insertInManagedObjectContext:context];
    club.name = name;
    club.address = nil;
    club.logo.photoData = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Photo_not_available"
                                                                     withExtension:@"jpg"]];
    return club;
}

@end
