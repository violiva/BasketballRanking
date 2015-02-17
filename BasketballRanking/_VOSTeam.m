// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSTeam.m instead.

#import "_VOSTeam.h"

const struct VOSTeamAttributes VOSTeamAttributes = {
	.colour = @"colour",
	.name = @"name",
};

const struct VOSTeamRelationships VOSTeamRelationships = {
	.gamesPlayHome = @"gamesPlayHome",
	.gamesPlayOut = @"gamesPlayOut",
	.group = @"group",
	.players = @"players",
};

@implementation VOSTeamID
@end

@implementation _VOSTeam

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Team" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Team";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Team" inManagedObjectContext:moc_];
}

- (VOSTeamID*)objectID {
	return (VOSTeamID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic colour;

@dynamic name;

@dynamic gamesPlayHome;

- (NSMutableSet*)gamesPlayHomeSet {
	[self willAccessValueForKey:@"gamesPlayHome"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"gamesPlayHome"];

	[self didAccessValueForKey:@"gamesPlayHome"];
	return result;
}

@dynamic gamesPlayOut;

- (NSMutableSet*)gamesPlayOutSet {
	[self willAccessValueForKey:@"gamesPlayOut"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"gamesPlayOut"];

	[self didAccessValueForKey:@"gamesPlayOut"];
	return result;
}

@dynamic group;

- (NSMutableSet*)groupSet {
	[self willAccessValueForKey:@"group"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"group"];

	[self didAccessValueForKey:@"group"];
	return result;
}

@dynamic players;

- (NSMutableSet*)playersSet {
	[self willAccessValueForKey:@"players"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"players"];

	[self didAccessValueForKey:@"players"];
	return result;
}

@end

