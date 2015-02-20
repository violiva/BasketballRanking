// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSTeam.m instead.

#import "_VOSTeam.h"

const struct VOSTeamAttributes VOSTeamAttributes = {
	.colour = @"colour",
	.name = @"name",
	.year = @"year",
};

const struct VOSTeamRelationships VOSTeamRelationships = {
	.clasification = @"clasification",
	.club = @"club",
	.gamesPlayHome = @"gamesPlayHome",
	.gamesPlayOut = @"gamesPlayOut",
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

	if ([key isEqualToString:@"yearValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"year"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic colour;

@dynamic name;

@dynamic year;

- (int16_t)yearValue {
	NSNumber *result = [self year];
	return [result shortValue];
}

- (void)setYearValue:(int16_t)value_ {
	[self setYear:@(value_)];
}

- (int16_t)primitiveYearValue {
	NSNumber *result = [self primitiveYear];
	return [result shortValue];
}

- (void)setPrimitiveYearValue:(int16_t)value_ {
	[self setPrimitiveYear:@(value_)];
}

@dynamic clasification;

- (NSMutableSet*)clasificationSet {
	[self willAccessValueForKey:@"clasification"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"clasification"];

	[self didAccessValueForKey:@"clasification"];
	return result;
}

@dynamic club;

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

@dynamic players;

- (NSMutableSet*)playersSet {
	[self willAccessValueForKey:@"players"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"players"];

	[self didAccessValueForKey:@"players"];
	return result;
}

@end

