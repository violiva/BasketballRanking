// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSClub.h instead.

@import CoreData;

extern const struct VOSClubAttributes {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *name;
} VOSClubAttributes;

extern const struct VOSClubRelationships {
	__unsafe_unretained NSString *logo;
	__unsafe_unretained NSString *teams;
} VOSClubRelationships;

@class VOSLogo;
@class VOSTeam;

@interface VOSClubID : NSManagedObjectID {}
@end

@interface _VOSClub : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VOSClubID* objectID;

@property (nonatomic, strong) NSString* address;

//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) VOSLogo *logo;

//- (BOOL)validateLogo:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *teams;

- (NSMutableSet*)teamsSet;

@end

@interface _VOSClub (TeamsCoreDataGeneratedAccessors)
- (void)addTeams:(NSSet*)value_;
- (void)removeTeams:(NSSet*)value_;
- (void)addTeamsObject:(VOSTeam*)value_;
- (void)removeTeamsObject:(VOSTeam*)value_;

@end

@interface _VOSClub (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (VOSLogo*)primitiveLogo;
- (void)setPrimitiveLogo:(VOSLogo*)value;

- (NSMutableSet*)primitiveTeams;
- (void)setPrimitiveTeams:(NSMutableSet*)value;

@end
