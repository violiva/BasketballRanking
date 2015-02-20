// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSLogo.h instead.

@import CoreData;

extern const struct VOSLogoAttributes {
	__unsafe_unretained NSString *photoData;
} VOSLogoAttributes;

extern const struct VOSLogoRelationships {
	__unsafe_unretained NSString *club;
} VOSLogoRelationships;

@class VOSClub;

@interface VOSLogoID : NSManagedObjectID {}
@end

@interface _VOSLogo : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VOSLogoID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) VOSClub *club;

//- (BOOL)validateClub:(id*)value_ error:(NSError**)error_;

@end

@interface _VOSLogo (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (VOSClub*)primitiveClub;
- (void)setPrimitiveClub:(VOSClub*)value;

@end
