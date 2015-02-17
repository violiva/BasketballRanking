// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSGame.h instead.

@import CoreData;

extern const struct VOSGameAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *localization;
} VOSGameAttributes;

extern const struct VOSGameRelationships {
	__unsafe_unretained NSString *awayTeam;
	__unsafe_unretained NSString *homeTeam;
	__unsafe_unretained NSString *statistic;
} VOSGameRelationships;

@class VOSTeam;
@class VOSTeam;
@class VOSStatistic;

@interface VOSGameID : NSManagedObjectID {}
@end

@interface _VOSGame : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VOSGameID* objectID;

@property (nonatomic, strong) NSDate* date;

//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* localization;

//- (BOOL)validateLocalization:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) VOSTeam *awayTeam;

//- (BOOL)validateAwayTeam:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) VOSTeam *homeTeam;

//- (BOOL)validateHomeTeam:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *statistic;

- (NSMutableSet*)statisticSet;

@end

@interface _VOSGame (StatisticCoreDataGeneratedAccessors)
- (void)addStatistic:(NSSet*)value_;
- (void)removeStatistic:(NSSet*)value_;
- (void)addStatisticObject:(VOSStatistic*)value_;
- (void)removeStatisticObject:(VOSStatistic*)value_;

@end

@interface _VOSGame (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;

- (NSString*)primitiveLocalization;
- (void)setPrimitiveLocalization:(NSString*)value;

- (VOSTeam*)primitiveAwayTeam;
- (void)setPrimitiveAwayTeam:(VOSTeam*)value;

- (VOSTeam*)primitiveHomeTeam;
- (void)setPrimitiveHomeTeam:(VOSTeam*)value;

- (NSMutableSet*)primitiveStatistic;
- (void)setPrimitiveStatistic:(NSMutableSet*)value;

@end
