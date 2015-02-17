// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSPhotoContainer.h instead.

@import CoreData;

extern const struct VOSPhotoContainerAttributes {
	__unsafe_unretained NSString *photo;
} VOSPhotoContainerAttributes;

extern const struct VOSPhotoContainerRelationships {
	__unsafe_unretained NSString *player;
} VOSPhotoContainerRelationships;

@class VOSPlayer;

@interface VOSPhotoContainerID : NSManagedObjectID {}
@end

@interface _VOSPhotoContainer : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VOSPhotoContainerID* objectID;

@property (nonatomic, strong) NSData* photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) VOSPlayer *player;

//- (BOOL)validatePlayer:(id*)value_ error:(NSError**)error_;

@end

@interface _VOSPhotoContainer (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhoto;
- (void)setPrimitivePhoto:(NSData*)value;

- (VOSPlayer*)primitivePlayer;
- (void)setPrimitivePlayer:(VOSPlayer*)value;

@end
