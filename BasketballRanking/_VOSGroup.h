// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSGroup.h instead.

@import CoreData;

extern const struct VOSGroupAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *year;
} VOSGroupAttributes;

extern const struct VOSGroupRelationships {
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *game;
	__unsafe_unretained NSString *teams;
} VOSGroupRelationships;

@class VOSCategory;
@class VOSGame;
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

@property (nonatomic, strong) NSNumber* year;

@property (atomic) int16_t yearValue;
- (int16_t)yearValue;
- (void)setYearValue:(int16_t)value_;

//- (BOOL)validateYear:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) VOSCategory *category;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *game;

- (NSMutableSet*)gameSet;

@property (nonatomic, strong) NSSet *teams;

- (NSMutableSet*)teamsSet;

@end

@interface _VOSGroup (GameCoreDataGeneratedAccessors)
- (void)addGame:(NSSet*)value_;
- (void)removeGame:(NSSet*)value_;
- (void)addGameObject:(VOSGame*)value_;
- (void)removeGameObject:(VOSGame*)value_;

@end

@interface _VOSGroup (TeamsCoreDataGeneratedAccessors)
- (void)addTeams:(NSSet*)value_;
- (void)removeTeams:(NSSet*)value_;
- (void)addTeamsObject:(VOSTeam*)value_;
- (void)removeTeamsObject:(VOSTeam*)value_;

@end

@interface _VOSGroup (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSNumber*)primitiveYear;
- (void)setPrimitiveYear:(NSNumber*)value;

- (int16_t)primitiveYearValue;
- (void)setPrimitiveYearValue:(int16_t)value_;

- (VOSCategory*)primitiveCategory;
- (void)setPrimitiveCategory:(VOSCategory*)value;

- (NSMutableSet*)primitiveGame;
- (void)setPrimitiveGame:(NSMutableSet*)value;

- (NSMutableSet*)primitiveTeams;
- (void)setPrimitiveTeams:(NSMutableSet*)value;

@end
