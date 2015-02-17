// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSCategory.h instead.

@import CoreData;

extern const struct VOSCategoryAttributes {
	__unsafe_unretained NSString *name;
} VOSCategoryAttributes;

extern const struct VOSCategoryRelationships {
	__unsafe_unretained NSString *group;
} VOSCategoryRelationships;

@class VOSGroup;

@interface VOSCategoryID : NSManagedObjectID {}
@end

@interface _VOSCategory : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VOSCategoryID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *group;

- (NSMutableSet*)groupSet;

@end

@interface _VOSCategory (GroupCoreDataGeneratedAccessors)
- (void)addGroup:(NSSet*)value_;
- (void)removeGroup:(NSSet*)value_;
- (void)addGroupObject:(VOSGroup*)value_;
- (void)removeGroupObject:(VOSGroup*)value_;

@end

@interface _VOSCategory (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveGroup;
- (void)setPrimitiveGroup:(NSMutableSet*)value;

@end
