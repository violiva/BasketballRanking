// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSLogo.m instead.

#import "_VOSLogo.h"

const struct VOSLogoAttributes VOSLogoAttributes = {
	.photoData = @"photoData",
};

const struct VOSLogoRelationships VOSLogoRelationships = {
	.club = @"club",
};

@implementation VOSLogoID
@end

@implementation _VOSLogo

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Logo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Logo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Logo" inManagedObjectContext:moc_];
}

- (VOSLogoID*)objectID {
	return (VOSLogoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic club;

@end

