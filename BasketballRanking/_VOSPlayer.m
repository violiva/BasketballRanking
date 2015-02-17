// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSPlayer.m instead.

#import "_VOSPlayer.h"

const struct VOSPlayerAttributes VOSPlayerAttributes = {
	.dorsal = @"dorsal",
	.name = @"name",
};

const struct VOSPlayerRelationships VOSPlayerRelationships = {
	.photo = @"photo",
	.statistic = @"statistic",
	.team = @"team",
};

@implementation VOSPlayerID
@end

@implementation _VOSPlayer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Player";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Player" inManagedObjectContext:moc_];
}

- (VOSPlayerID*)objectID {
	return (VOSPlayerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"dorsalValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"dorsal"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic dorsal;

- (int16_t)dorsalValue {
	NSNumber *result = [self dorsal];
	return [result shortValue];
}

- (void)setDorsalValue:(int16_t)value_ {
	[self setDorsal:@(value_)];
}

- (int16_t)primitiveDorsalValue {
	NSNumber *result = [self primitiveDorsal];
	return [result shortValue];
}

- (void)setPrimitiveDorsalValue:(int16_t)value_ {
	[self setPrimitiveDorsal:@(value_)];
}

@dynamic name;

@dynamic photo;

@dynamic statistic;

- (NSMutableSet*)statisticSet {
	[self willAccessValueForKey:@"statistic"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"statistic"];

	[self didAccessValueForKey:@"statistic"];
	return result;
}

@dynamic team;

@end

