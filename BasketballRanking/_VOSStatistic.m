// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSStatistic.m instead.

#import "_VOSStatistic.h"

const struct VOSStatisticAttributes VOSStatisticAttributes = {
	.period = @"period",
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

	if ([key isEqualToString:@"periodValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"period"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"pointsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"points"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic period;

- (int16_t)periodValue {
	NSNumber *result = [self period];
	return [result shortValue];
}

- (void)setPeriodValue:(int16_t)value_ {
	[self setPeriod:@(value_)];
}

- (int16_t)primitivePeriodValue {
	NSNumber *result = [self primitivePeriod];
	return [result shortValue];
}

- (void)setPrimitivePeriodValue:(int16_t)value_ {
	[self setPrimitivePeriod:@(value_)];
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

