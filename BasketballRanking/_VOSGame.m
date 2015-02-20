// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSGame.m instead.

#import "_VOSGame.h"

const struct VOSGameAttributes VOSGameAttributes = {
	.date = @"date",
	.localization = @"localization",
	.pointHome = @"pointHome",
	.pointVisit = @"pointVisit",
};

const struct VOSGameRelationships VOSGameRelationships = {
	.awayTeam = @"awayTeam",
	.group = @"group",
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

	if ([key isEqualToString:@"pointHomeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"pointHome"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"pointVisitValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"pointVisit"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic date;

@dynamic localization;

@dynamic pointHome;

- (int16_t)pointHomeValue {
	NSNumber *result = [self pointHome];
	return [result shortValue];
}

- (void)setPointHomeValue:(int16_t)value_ {
	[self setPointHome:@(value_)];
}

- (int16_t)primitivePointHomeValue {
	NSNumber *result = [self primitivePointHome];
	return [result shortValue];
}

- (void)setPrimitivePointHomeValue:(int16_t)value_ {
	[self setPrimitivePointHome:@(value_)];
}

@dynamic pointVisit;

- (int16_t)pointVisitValue {
	NSNumber *result = [self pointVisit];
	return [result shortValue];
}

- (void)setPointVisitValue:(int16_t)value_ {
	[self setPointVisit:@(value_)];
}

- (int16_t)primitivePointVisitValue {
	NSNumber *result = [self primitivePointVisit];
	return [result shortValue];
}

- (void)setPrimitivePointVisitValue:(int16_t)value_ {
	[self setPrimitivePointVisit:@(value_)];
}

@dynamic awayTeam;

@dynamic group;

@dynamic homeTeam;

@dynamic statistic;

- (NSMutableSet*)statisticSet {
	[self willAccessValueForKey:@"statistic"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"statistic"];

	[self didAccessValueForKey:@"statistic"];
	return result;
}

@end

