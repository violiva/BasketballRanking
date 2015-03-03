// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSClasification.m instead.

#import "_VOSClasification.h"

const struct VOSClasificationAttributes VOSClasificationAttributes = {
	.dif = @"dif",
	.gamesLost = @"gamesLost",
	.gamesPlayed = @"gamesPlayed",
	.gamesTied = @"gamesTied",
	.gamesWon = @"gamesWon",
	.pointsAgainst = @"pointsAgainst",
	.pointsForUs = @"pointsForUs",
	.totalPoints = @"totalPoints",
};

const struct VOSClasificationRelationships VOSClasificationRelationships = {
	.group = @"group",
	.team = @"team",
};

@implementation VOSClasificationID
@end

@implementation _VOSClasification

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Clasification" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Clasification";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Clasification" inManagedObjectContext:moc_];
}

- (VOSClasificationID*)objectID {
	return (VOSClasificationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"difValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"dif"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"gamesLostValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"gamesLost"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"gamesPlayedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"gamesPlayed"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"gamesTiedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"gamesTied"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"gamesWonValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"gamesWon"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"pointsAgainstValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"pointsAgainst"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"pointsForUsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"pointsForUs"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"totalPointsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"totalPoints"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic dif;

- (int16_t)difValue {
	NSNumber *result = [self dif];
	return [result shortValue];
}

- (void)setDifValue:(int16_t)value_ {
	[self setDif:@(value_)];
}

- (int16_t)primitiveDifValue {
	NSNumber *result = [self primitiveDif];
	return [result shortValue];
}

- (void)setPrimitiveDifValue:(int16_t)value_ {
	[self setPrimitiveDif:@(value_)];
}

@dynamic gamesLost;

- (int16_t)gamesLostValue {
	NSNumber *result = [self gamesLost];
	return [result shortValue];
}

- (void)setGamesLostValue:(int16_t)value_ {
	[self setGamesLost:@(value_)];
}

- (int16_t)primitiveGamesLostValue {
	NSNumber *result = [self primitiveGamesLost];
	return [result shortValue];
}

- (void)setPrimitiveGamesLostValue:(int16_t)value_ {
	[self setPrimitiveGamesLost:@(value_)];
}

@dynamic gamesPlayed;

- (int16_t)gamesPlayedValue {
	NSNumber *result = [self gamesPlayed];
	return [result shortValue];
}

- (void)setGamesPlayedValue:(int16_t)value_ {
	[self setGamesPlayed:@(value_)];
}

- (int16_t)primitiveGamesPlayedValue {
	NSNumber *result = [self primitiveGamesPlayed];
	return [result shortValue];
}

- (void)setPrimitiveGamesPlayedValue:(int16_t)value_ {
	[self setPrimitiveGamesPlayed:@(value_)];
}

@dynamic gamesTied;

- (int16_t)gamesTiedValue {
	NSNumber *result = [self gamesTied];
	return [result shortValue];
}

- (void)setGamesTiedValue:(int16_t)value_ {
	[self setGamesTied:@(value_)];
}

- (int16_t)primitiveGamesTiedValue {
	NSNumber *result = [self primitiveGamesTied];
	return [result shortValue];
}

- (void)setPrimitiveGamesTiedValue:(int16_t)value_ {
	[self setPrimitiveGamesTied:@(value_)];
}

@dynamic gamesWon;

- (int16_t)gamesWonValue {
	NSNumber *result = [self gamesWon];
	return [result shortValue];
}

- (void)setGamesWonValue:(int16_t)value_ {
	[self setGamesWon:@(value_)];
}

- (int16_t)primitiveGamesWonValue {
	NSNumber *result = [self primitiveGamesWon];
	return [result shortValue];
}

- (void)setPrimitiveGamesWonValue:(int16_t)value_ {
	[self setPrimitiveGamesWon:@(value_)];
}

@dynamic pointsAgainst;

- (int16_t)pointsAgainstValue {
	NSNumber *result = [self pointsAgainst];
	return [result shortValue];
}

- (void)setPointsAgainstValue:(int16_t)value_ {
	[self setPointsAgainst:@(value_)];
}

- (int16_t)primitivePointsAgainstValue {
	NSNumber *result = [self primitivePointsAgainst];
	return [result shortValue];
}

- (void)setPrimitivePointsAgainstValue:(int16_t)value_ {
	[self setPrimitivePointsAgainst:@(value_)];
}

@dynamic pointsForUs;

- (int16_t)pointsForUsValue {
	NSNumber *result = [self pointsForUs];
	return [result shortValue];
}

- (void)setPointsForUsValue:(int16_t)value_ {
	[self setPointsForUs:@(value_)];
}

- (int16_t)primitivePointsForUsValue {
	NSNumber *result = [self primitivePointsForUs];
	return [result shortValue];
}

- (void)setPrimitivePointsForUsValue:(int16_t)value_ {
	[self setPrimitivePointsForUs:@(value_)];
}

@dynamic totalPoints;

- (int16_t)totalPointsValue {
	NSNumber *result = [self totalPoints];
	return [result shortValue];
}

- (void)setTotalPointsValue:(int16_t)value_ {
	[self setTotalPoints:@(value_)];
}

- (int16_t)primitiveTotalPointsValue {
	NSNumber *result = [self primitiveTotalPoints];
	return [result shortValue];
}

- (void)setPrimitiveTotalPointsValue:(int16_t)value_ {
	[self setPrimitiveTotalPoints:@(value_)];
}

@dynamic group;

@dynamic team;

@end

