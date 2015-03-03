// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSCategory.h instead.

@import CoreData;

extern const struct VOSCategoryAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *period;
	__unsafe_unretained NSString *timePeriod;
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

@property (nonatomic, strong) NSNumber* period;

@property (atomic) int16_t periodValue;
- (int16_t)periodValue;
- (void)setPeriodValue:(int16_t)value_;

//- (BOOL)validatePeriod:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* timePeriod;

@property (atomic) int16_t timePeriodValue;
- (int16_t)timePeriodValue;
- (void)setTimePeriodValue:(int16_t)value_;

//- (BOOL)validateTimePeriod:(id*)value_ error:(NSError**)error_;

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

- (NSNumber*)primitivePeriod;
- (void)setPrimitivePeriod:(NSNumber*)value;

- (int16_t)primitivePeriodValue;
- (void)setPrimitivePeriodValue:(int16_t)value_;

- (NSNumber*)primitiveTimePeriod;
- (void)setPrimitiveTimePeriod:(NSNumber*)value;

- (int16_t)primitiveTimePeriodValue;
- (void)setPrimitiveTimePeriodValue:(int16_t)value_;

- (NSMutableSet*)primitiveGroup;
- (void)setPrimitiveGroup:(NSMutableSet*)value;

@end
