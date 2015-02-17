// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSAction.h instead.

@import CoreData;

extern const struct VOSActionAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *points;
} VOSActionAttributes;

extern const struct VOSActionRelationships {
	__unsafe_unretained NSString *statistic;
} VOSActionRelationships;

@class VOSStatistic;

@interface VOSActionID : NSManagedObjectID {}
@end

@interface _VOSAction : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VOSActionID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* points;

@property (atomic) int16_t pointsValue;
- (int16_t)pointsValue;
- (void)setPointsValue:(int16_t)value_;

//- (BOOL)validatePoints:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *statistic;

- (NSMutableSet*)statisticSet;

@end

@interface _VOSAction (StatisticCoreDataGeneratedAccessors)
- (void)addStatistic:(NSSet*)value_;
- (void)removeStatistic:(NSSet*)value_;
- (void)addStatisticObject:(VOSStatistic*)value_;
- (void)removeStatisticObject:(VOSStatistic*)value_;

@end

@interface _VOSAction (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSNumber*)primitivePoints;
- (void)setPrimitivePoints:(NSNumber*)value;

- (int16_t)primitivePointsValue;
- (void)setPrimitivePointsValue:(int16_t)value_;

- (NSMutableSet*)primitiveStatistic;
- (void)setPrimitiveStatistic:(NSMutableSet*)value;

@end
