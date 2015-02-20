// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSClub.m instead.

#import "_VOSClub.h"

const struct VOSClubAttributes VOSClubAttributes = {
	.address = @"address",
	.name = @"name",
};

const struct VOSClubRelationships VOSClubRelationships = {
	.logo = @"logo",
	.teams = @"teams",
};

@implementation VOSClubID
@end

@implementation _VOSClub

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Club" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Club";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Club" inManagedObjectContext:moc_];
}

- (VOSClubID*)objectID {
	return (VOSClubID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic address;

@dynamic name;

@dynamic logo;

@dynamic teams;

- (NSMutableSet*)teamsSet {
	[self willAccessValueForKey:@"teams"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"teams"];

	[self didAccessValueForKey:@"teams"];
	return result;
}

@end

