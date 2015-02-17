// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSCategory.m instead.

#import "_VOSCategory.h"

const struct VOSCategoryAttributes VOSCategoryAttributes = {
	.name = @"name",
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

	return keyPaths;
}

@dynamic name;

@dynamic group;

- (NSMutableSet*)groupSet {
	[self willAccessValueForKey:@"group"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"group"];

	[self didAccessValueForKey:@"group"];
	return result;
}

@end

