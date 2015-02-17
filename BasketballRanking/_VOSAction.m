// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSAction.m instead.

#import "_VOSAction.h"

const struct VOSActionAttributes VOSActionAttributes = {
	.name = @"name",
	.points = @"points",
};

const struct VOSActionRelationships VOSActionRelationships = {
	.statistic = @"statistic",
};

@implementation VOSActionID
@end

@implementation _VOSAction

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Action" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Action";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Action" inManagedObjectContext:moc_];
}

- (VOSActionID*)objectID {
	return (VOSActionID*)[super objectID];
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

@dynamic name;

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

@dynamic statistic;

- (NSMutableSet*)statisticSet {
	[self willAccessValueForKey:@"statistic"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"statistic"];

	[self didAccessValueForKey:@"statistic"];
	return result;
}

@end

