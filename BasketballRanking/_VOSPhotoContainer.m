// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSPhotoContainer.m instead.

#import "_VOSPhotoContainer.h"

const struct VOSPhotoContainerAttributes VOSPhotoContainerAttributes = {
	.photo = @"photo",
};

const struct VOSPhotoContainerRelationships VOSPhotoContainerRelationships = {
	.player = @"player",
};

@implementation VOSPhotoContainerID
@end

@implementation _VOSPhotoContainer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhotoContainer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

- (VOSPhotoContainerID*)objectID {
	return (VOSPhotoContainerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photo;

@dynamic player;

@end

