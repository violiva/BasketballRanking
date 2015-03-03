// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSStatistic.h instead.

@import CoreData;

extern const struct VOSStatisticAttributes {
	__unsafe_unretained NSString *period;
	__unsafe_unretained NSString *points;
	__unsafe_unretained NSString *time;
} VOSStatisticAttributes;

extern const struct VOSStatisticRelationships {
	__unsafe_unretained NSString *action;
	__unsafe_unretained NSString *game;
	__unsafe_unretained NSString *player;
} VOSStatisticRelationships;

@class VOSAction;
@class VOSGame;
@class VOSPlayer;

@interface VOSStatisticID : NSManagedObjectID {}
@end

@interface _VOSStatistic : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VOSStatisticID* objectID;

@property (nonatomic, strong) NSNumber* period;

@property (atomic) int16_t periodValue;
- (int16_t)periodValue;
- (void)setPeriodValue:(int16_t)value_;

//- (BOOL)validatePeriod:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* points;

@property (atomic) int16_t pointsValue;
- (int16_t)pointsValue;
- (void)setPointsValue:(int16_t)value_;

//- (BOOL)validatePoints:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* time;

//- (BOOL)validateTime:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) VOSAction *action;

//- (BOOL)validateAction:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) VOSGame *game;

//- (BOOL)validateGame:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) VOSPlayer *player;

//- (BOOL)validatePlayer:(id*)value_ error:(NSError**)error_;

@end

@interface _VOSStatistic (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitivePeriod;
- (void)setPrimitivePeriod:(NSNumber*)value;

- (int16_t)primitivePeriodValue;
- (void)setPrimitivePeriodValue:(int16_t)value_;

- (NSNumber*)primitivePoints;
- (void)setPrimitivePoints:(NSNumber*)value;

- (int16_t)primitivePointsValue;
- (void)setPrimitivePointsValue:(int16_t)value_;

- (NSDate*)primitiveTime;
- (void)setPrimitiveTime:(NSDate*)value;

- (VOSAction*)primitiveAction;
- (void)setPrimitiveAction:(VOSAction*)value;

- (VOSGame*)primitiveGame;
- (void)setPrimitiveGame:(VOSGame*)value;

- (VOSPlayer*)primitivePlayer;
- (void)setPrimitivePlayer:(VOSPlayer*)value;

@end
