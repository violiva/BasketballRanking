// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSGame.m instead.

#import "_VOSGame.h"

const struct VOSGameAttributes VOSGameAttributes = {
	.date = @"date",
	.localization = @"localization",
};

const struct VOSGameRelationships VOSGameRelationships = {
	.awayTeam = @"awayTeam",
	.homeTeam = @"homeTeam",
	.statistic = @"statistic",
};

@implementation VOSGameID
@end

@implementation _VOSGame

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Game";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Game" inManagedObjectContext:moc_];
}

- (VOSGameID*)objectID {
	return (VOSGameID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic date;

@dynamic localization;

@dynamic awayTeam;

@dynamic homeTeam;

@dynamic statistic;

- (NSMutableSet*)statisticSet {
	[self willAccessValueForKey:@"statistic"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"statistic"];

	[self didAccessValueForKey:@"statistic"];
	return result;
}

@end

