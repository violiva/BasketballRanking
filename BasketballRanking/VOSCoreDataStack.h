//
//  VOSCoreDataStack.h
//
//  Created by Vicente Oliva de la Serna on 2/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import Foundation;
@import CoreData;


@class NSManagedObjectContext;

@interface VOSCoreDataStack : NSObject

@property (strong, nonatomic, readonly) NSManagedObjectContext *context;

+(NSString *) persistentStoreCoordinatorErrorNotificationName;

+(VOSCoreDataStack *) coreDataStackWithModelName:(NSString *)aModelName
                               databaseFilename:(NSString*) aDBName;

+(VOSCoreDataStack *) coreDataStackWithModelName:(NSString *)aModelName;

+(VOSCoreDataStack *) coreDataStackWithModelName:(NSString *)aModelName
                                    databaseURL:(NSURL*) aDBURL;

-(id) initWithModelName:(NSString *)aModelName
            databaseURL:(NSURL*) aDBURL;

-(void) zapAllData;

-(void) saveWithErrorBlock: (void(^)(NSError *error))errorBlock;
-(NSArray *) executeFetchRequest:(NSFetchRequest *) req
                      errorBlock:(void (^)(NSError * error)) errorBlock;

@end
