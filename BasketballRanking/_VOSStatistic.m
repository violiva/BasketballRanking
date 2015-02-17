// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSStatistic.m instead.

#import "_VOSStatistic.h"

const struct VOSStatisticAttributes VOSStatisticAttributes = {
	.points = @"points",
	.time = @"time",
};

const struct VOSStatisticRelationships VOSStatisticRelationships = {
	.action = @"action",
	.game = @"game",
	.player = @"player",
};

@implementation VOSStatisticID
@end

@implementation _VOSStatistic

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Statistic" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Statistic";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Statistic" inManagedObjectContext:moc_];
}

- (VOSStatisticID*)objectID {
	return (VOSStatisticID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"pointsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"points"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic points;

- (int16_t)pointsValue {
	NSNumber *result = [self points];
	return [result shortValue];
}

- (void)setPointsValue:(int16_t)value_ {
	[self setPoints:@(value_)];
}

- (int16_t)primitivePointsValue {
	NSNumber *result = [self primitivePoints];
	return [result shortValue];
}

- (void)setPrimitivePointsValue:(int16_t)value_ {
	[self setPrimitivePoints:@(value_)];
}

@dynamic time;

@dynamic action;

@dynamic game;

@dynamic player;

@end

