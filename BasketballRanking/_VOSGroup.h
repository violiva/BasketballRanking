// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSGroup.h instead.

@import CoreData;

extern const struct VOSGroupAttributes {
	__unsafe_unretained NSString *name;
} VOSGroupAttributes;

extern const struct VOSGroupRelationships {
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *team;
} VOSGroupRelationships;

@class VOSCategory;
@class VOSTeam;

@interface VOSGroupID : NSManagedObjectID {}
@end

@interface _VOSGroup : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VOSGroupID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) VOSCategory *category;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *team;

- (NSMutableSet*)teamSet;

@end

@interface _VOSGroup (TeamCoreDataGeneratedAccessors)
- (void)addTeam:(NSSet*)value_;
- (void)removeTeam:(NSSet*)value_;
- (void)addTeamObject:(VOSTeam*)value_;
- (void)removeTeamObject:(VOSTeam*)value_;

@end

@interface _VOSGroup (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (VOSCategory*)primitiveCategory;
- (void)setPrimitiveCategory:(VOSCategory*)value;

- (NSMutableSet*)primitiveTeam;
- (void)setPrimitiveTeam:(NSMutableSet*)value;

@end
