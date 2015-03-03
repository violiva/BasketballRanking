// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSCategory.m instead.

#import "_VOSCategory.h"

const struct VOSCategoryAttributes VOSCategoryAttributes = {
	.name = @"name",
	.period = @"period",
	.timePeriod = @"timePeriod",
};

const struct VOSCategoryRelationships VOSCategoryRelationships = {
	.group = @"group",
};

@implementation VOSCategoryID
@end

@implementation _VOSCategory

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Category";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Category" inManagedObjectContext:moc_];
}

- (VOSCategoryID*)objectID {
	return (VOSCategoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"periodValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"period"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"timePeriodValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"timePeriod"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic name;

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

@dynamic timePeriod;

- (int16_t)timePeriodValue {
	NSNumber *result = [self timePeriod];
	return [result shortValue];
}

- (void)setTimePeriodValue:(int16_t)value_ {
	[self setTimePeriod:@(value_)];
}

- (int16_t)primitiveTimePeriodValue {
	NSNumber *result = [self primitiveTimePeriod];
	return [result shortValue];
}

- (void)setPrimitiveTimePeriodValue:(int16_t)value_ {
	[self setPrimitiveTimePeriod:@(value_)];
}

@dynamic group;

- (NSMutableSet*)groupSet {
	[self willAccessValueForKey:@"group"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"group"];

	[self didAccessValueForKey:@"group"];
	return result;
}

@end

