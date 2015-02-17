// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSPlayer.h instead.

@import CoreData;

extern const struct VOSPlayerAttributes {
	__unsafe_unretained NSString *dorsal;
	__unsafe_unretained NSString *name;
} VOSPlayerAttributes;

extern const struct VOSPlayerRelationships {
	__unsafe_unretained NSString *photo;
	__unsafe_unretained NSString *statistic;
	__unsafe_unretained NSString *team;
} VOSPlayerRelationships;

@class VOSPhotoContainer;
@class VOSStatistic;
@class VOSTeam;

@interface VOSPlayerID : NSManagedObjectID {}
@end

@interface _VOSPlayer : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VOSPlayerID* objectID;

@property (nonatomic, strong) NSNumber* dorsal;

@property (atomic) int16_t dorsalValue;
- (int16_t)dorsalValue;
- (void)setDorsalValue:(int16_t)value_;

//- (BOOL)validateDorsal:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) VOSPhotoContainer *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *statistic;

- (NSMutableSet*)statisticSet;

@property (nonatomic, strong) VOSTeam *team;

//- (BOOL)validateTeam:(id*)value_ error:(NSError**)error_;

@end

@interface _VOSPlayer (StatisticCoreDataGeneratedAccessors)
- (void)addStatistic:(NSSet*)value_;
- (void)removeStatistic:(NSSet*)value_;
- (void)addStatisticObject:(VOSStatistic*)value_;
- (void)removeStatisticObject:(VOSStatistic*)value_;

@end

@interface _VOSPlayer (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveDorsal;
- (void)setPrimitiveDorsal:(NSNumber*)value;

- (int16_t)primitiveDorsalValue;
- (void)setPrimitiveDorsalValue:(int16_t)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (VOSPhotoContainer*)primitivePhoto;
- (void)setPrimitivePhoto:(VOSPhotoContainer*)value;

- (NSMutableSet*)primitiveStatistic;
- (void)setPrimitiveStatistic:(NSMutableSet*)value;

- (VOSTeam*)primitiveTeam;
- (void)setPrimitiveTeam:(VOSTeam*)value;

@end
