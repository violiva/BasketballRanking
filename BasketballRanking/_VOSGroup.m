// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSGroup.m instead.

#import "_VOSGroup.h"

const struct VOSGroupAttributes VOSGroupAttributes = {
	.name = @"name",
};

const struct VOSGroupRelationships VOSGroupRelationships = {
	.category = @"category",
	.team = @"team",
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

	return keyPaths;
}

@dynamic name;

@dynamic category;

@dynamic team;

- (NSMutableSet*)teamSet {
	[self willAccessValueForKey:@"team"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"team"];

	[self didAccessValueForKey:@"team"];
	return result;
}

@end

