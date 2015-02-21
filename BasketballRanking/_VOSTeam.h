// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSTeam.h instead.

@import CoreData;

extern const struct VOSTeamAttributes {
	__unsafe_unretained NSString *colour;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *year;
} VOSTeamAttributes;

extern const struct VOSTeamRelationships {
	__unsafe_unretained NSString *clasification;
	__unsafe_unretained NSString *club;
	__unsafe_unretained NSString *gamesPlayHome;
	__unsafe_unretained NSString *gamesPlayOut;
	__unsafe_unretained NSString *group;
	__unsafe_unretained NSString *players;
} VOSTeamRelationships;

@class VOSClasification;
@class VOSClub;
@class VOSGame;
@class VOSGame;
@class VOSGroup;
@class VOSPlayer;

@interface VOSTeamID : NSManagedObjectID {}
@end

@interface _VOSTeam : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VOSTeamID* objectID;

@property (nonatomic, strong) NSString* colour;

//- (BOOL)validateColour:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* year;

@property (atomic) int16_t yearValue;
- (int16_t)yearValue;
- (void)setYearValue:(int16_t)value_;

//- (BOOL)validateYear:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *clasification;

- (NSMutableSet*)clasificationSet;

@property (nonatomic, strong) VOSClub *club;

//- (BOOL)validateClub:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *gamesPlayHome;

- (NSMutableSet*)gamesPlayHomeSet;

@property (nonatomic, strong) NSSet *gamesPlayOut;

- (NSMutableSet*)gamesPlayOutSet;

@property (nonatomic, strong) NSSet *group;

- (NSMutableSet*)groupSet;

@property (nonatomic, strong) NSSet *players;

- (NSMutableSet*)playersSet;

@end

@interface _VOSTeam (ClasificationCoreDataGeneratedAccessors)
- (void)addClasification:(NSSet*)value_;
- (void)removeClasification:(NSSet*)value_;
- (void)addClasificationObject:(VOSClasification*)value_;
- (void)removeClasificationObject:(VOSClasification*)value_;

@end

@interface _VOSTeam (GamesPlayHomeCoreDataGeneratedAccessors)
- (void)addGamesPlayHome:(NSSet*)value_;
- (void)removeGamesPlayHome:(NSSet*)value_;
- (void)addGamesPlayHomeObject:(VOSGame*)value_;
- (void)removeGamesPlayHomeObject:(VOSGame*)value_;

@end

@interface _VOSTeam (GamesPlayOutCoreDataGeneratedAccessors)
- (void)addGamesPlayOut:(NSSet*)value_;
- (void)removeGamesPlayOut:(NSSet*)value_;
- (void)addGamesPlayOutObject:(VOSGame*)value_;
- (void)removeGamesPlayOutObject:(VOSGame*)value_;

@end

@interface _VOSTeam (GroupCoreDataGeneratedAccessors)
- (void)addGroup:(NSSet*)value_;
- (void)removeGroup:(NSSet*)value_;
- (void)addGroupObject:(VOSGroup*)value_;
- (void)removeGroupObject:(VOSGroup*)value_;

@end

@interface _VOSTeam (PlayersCoreDataGeneratedAccessors)
- (void)addPlayers:(NSSet*)value_;
- (void)removePlayers:(NSSet*)value_;
- (void)addPlayersObject:(VOSPlayer*)value_;
- (void)removePlayersObject:(VOSPlayer*)value_;

@end

@interface _VOSTeam (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveColour;
- (void)setPrimitiveColour:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSNumber*)primitiveYear;
- (void)setPrimitiveYear:(NSNumber*)value;

- (int16_t)primitiveYearValue;
- (void)setPrimitiveYearValue:(int16_t)value_;

- (NSMutableSet*)primitiveClasification;
- (void)setPrimitiveClasification:(NSMutableSet*)value;

- (VOSClub*)primitiveClub;
- (void)setPrimitiveClub:(VOSClub*)value;

- (NSMutableSet*)primitiveGamesPlayHome;
- (void)setPrimitiveGamesPlayHome:(NSMutableSet*)value;

- (NSMutableSet*)primitiveGamesPlayOut;
- (void)setPrimitiveGamesPlayOut:(NSMutableSet*)value;

- (NSMutableSet*)primitiveGroup;
- (void)setPrimitiveGroup:(NSMutableSet*)value;

- (NSMutableSet*)primitivePlayers;
- (void)setPrimitivePlayers:(NSMutableSet*)value;

@end
