// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSGroup.m instead.

#import "_VOSGroup.h"

const struct VOSGroupAttributes VOSGroupAttributes = {
	.name = @"name",
	.year = @"year",
};

const struct VOSGroupRelationships VOSGroupRelationships = {
	.category = @"category",
	.clasification = @"clasification",
	.game = @"game",
	.teams = @"teams",
};

@implementation VOSGroupID
@end

@implementation _VOSGroup

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Group" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Group";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Group" inManagedObjectContext:moc_];
}

- (VOSGroupID*)objectID {
	return (VOSGroupID*)[super objectID];
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

@dynamic category;

@dynamic clasification;

- (NSMutableSet*)clasificationSet {
	[self willAccessValueForKey:@"clasification"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"clasification"];

	[self didAccessValueForKey:@"clasification"];
	return result;
}

@dynamic game;

- (NSMutableSet*)gameSet {
	[self willAccessValueForKey:@"game"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"game"];

	[self didAccessValueForKey:@"game"];
	return result;
}

@dynamic teams;

- (NSMutableSet*)teamsSet {
	[self willAccessValueForKey:@"teams"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"teams"];

	[self didAccessValueForKey:@"teams"];
	return result;
}

@end

