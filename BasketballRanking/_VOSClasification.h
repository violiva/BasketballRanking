// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSClasification.h instead.

@import CoreData;

extern const struct VOSClasificationAttributes {
	__unsafe_unretained NSString *dif;
	__unsafe_unretained NSString *gamesLost;
	__unsafe_unretained NSString *gamesPlayed;
	__unsafe_unretained NSString *gamesTied;
	__unsafe_unretained NSString *gamesWon;
	__unsafe_unretained NSString *pointsAgainst;
	__unsafe_unretained NSString *pointsForUs;
	__unsafe_unretained NSString *totalPoints;
} VOSClasificationAttributes;

extern const struct VOSClasificationRelationships {
	__unsafe_unretained NSString *group;
	__unsafe_unretained NSString *team;
} VOSClasificationRelationships;

@class VOSGroup;
@class VOSTeam;

@interface VOSClasificationID : NSManagedObjectID {}
@end

@interface _VOSClasification : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VOSClasificationID* objectID;

@property (nonatomic, strong) NSNumber* dif;

@property (atomic) int16_t difValue;
- (int16_t)difValue;
- (void)setDifValue:(int16_t)value_;

//- (BOOL)validateDif:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* gamesLost;

@property (atomic) int16_t gamesLostValue;
- (int16_t)gamesLostValue;
- (void)setGamesLostValue:(int16_t)value_;

//- (BOOL)validateGamesLost:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* gamesPlayed;

@property (atomic) int16_t gamesPlayedValue;
- (int16_t)gamesPlayedValue;
- (void)setGamesPlayedValue:(int16_t)value_;

//- (BOOL)validateGamesPlayed:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* gamesTied;

@property (atomic) int16_t gamesTiedValue;
- (int16_t)gamesTiedValue;
- (void)setGamesTiedValue:(int16_t)value_;

//- (BOOL)validateGamesTied:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* gamesWon;

@property (atomic) int16_t gamesWonValue;
- (int16_t)gamesWonValue;
- (void)setGamesWonValue:(int16_t)value_;

//- (BOOL)validateGamesWon:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* pointsAgainst;

@property (atomic) int16_t pointsAgainstValue;
- (int16_t)pointsAgainstValue;
- (void)setPointsAgainstValue:(int16_t)value_;

//- (BOOL)validatePointsAgainst:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* pointsForUs;

@property (atomic) int16_t pointsForUsValue;
- (int16_t)pointsForUsValue;
- (void)setPointsForUsValue:(int16_t)value_;

//- (BOOL)validatePointsForUs:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* totalPoints;

@property (atomic) int16_t totalPointsValue;
- (int16_t)totalPointsValue;
- (void)setTotalPointsValue:(int16_t)value_;

//- (BOOL)validateTotalPoints:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) VOSGroup *group;

//- (BOOL)validateGroup:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) VOSTeam *team;

//- (BOOL)validateTeam:(id*)value_ error:(NSError**)error_;

@end

@interface _VOSClasification (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveDif;
- (void)setPrimitiveDif:(NSNumber*)value;

- (int16_t)primitiveDifValue;
- (void)setPrimitiveDifValue:(int16_t)value_;

- (NSNumber*)primitiveGamesLost;
- (void)setPrimitiveGamesLost:(NSNumber*)value;

- (int16_t)primitiveGamesLostValue;
- (void)setPrimitiveGamesLostValue:(int16_t)value_;

- (NSNumber*)primitiveGamesPlayed;
- (void)setPrimitiveGamesPlayed:(NSNumber*)value;

- (int16_t)primitiveGamesPlayedValue;
- (void)setPrimitiveGamesPlayedValue:(int16_t)value_;

- (NSNumber*)primitiveGamesTied;
- (void)setPrimitiveGamesTied:(NSNumber*)value;

- (int16_t)primitiveGamesTiedValue;
- (void)setPrimitiveGamesTiedValue:(int16_t)value_;

- (NSNumber*)primitiveGamesWon;
- (void)setPrimitiveGamesWon:(NSNumber*)value;

- (int16_t)primitiveGamesWonValue;
- (void)setPrimitiveGamesWonValue:(int16_t)value_;

- (NSNumber*)primitivePointsAgainst;
- (void)setPrimitivePointsAgainst:(NSNumber*)value;

- (int16_t)primitivePointsAgainstValue;
- (void)setPrimitivePointsAgainstValue:(int16_t)value_;

- (NSNumber*)primitivePointsForUs;
- (void)setPrimitivePointsForUs:(NSNumber*)value;

- (int16_t)primitivePointsForUsValue;
- (void)setPrimitivePointsForUsValue:(int16_t)value_;

- (NSNumber*)primitiveTotalPoints;
- (void)setPrimitiveTotalPoints:(NSNumber*)value;

- (int16_t)primitiveTotalPointsValue;
- (void)setPrimitiveTotalPointsValue:(int16_t)value_;

- (VOSGroup*)primitiveGroup;
- (void)setPrimitiveGroup:(VOSGroup*)value;

- (VOSTeam*)primitiveTeam;
- (void)setPrimitiveTeam:(VOSTeam*)value;

@end
