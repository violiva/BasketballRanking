//
//  AppDelegate.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 17/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "AppDelegate.h"
#import "VOSCoreDataStack.h"
#import "VOSCategory.h"
#import "VOSCategoriesViewController.h"
#import "UIViewController+Navigation.h"
#import "VOSAction.h"
#import "VOSActionTableViewController.h"
#import "VOSClub.h"
#import "VOSClubsViewController.h"

#define ACTION_TABLE_CREATED @"SAVED"

@interface AppDelegate ()

// @property(nonatomic,strong) VOSCoreDataStack * stack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    // creamos el stack
    self.stack = [VOSCoreDataStack coreDataStackWithModelName:@"Model"];
    
    // Llamada a la creación de datos de tabla de acciones para las estadística.
    // Es una tabla fija y se debe de crear sólo la primera vez que entra en la aplicación.
    [self createActionTable:self.stack.context];
    
// /*--------------------------------------------------------------
    // Creamos el conjunto de datos de Categorías
    NSFetchRequest * r = [NSFetchRequest fetchRequestWithEntityName:[VOSCategory entityName]];
    r.fetchBatchSize = 30;
    r.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:VOSCategoryAttributes.name
                                                         ascending:YES
                                                          selector:@selector(caseInsensitiveCompare:)] ];
    
    
    NSFetchedResultsController * frc = [[NSFetchedResultsController alloc] initWithFetchRequest:r
                                                                           managedObjectContext:self.stack.context
                                                                             sectionNameKeyPath:nil
                                                                                      cacheName:nil ];
    
    VOSCategoriesViewController * catVC = [[VOSCategoriesViewController alloc] initWithFetchedResultsController:frc
                                                                                                          style:UITableViewStylePlain];

    UINavigationController * catNav = [[UINavigationController alloc] initWithRootViewController:catVC];

// ---------------------------------------------------------------*/
    
    
//    /*--------------------------------------------------------------
    
    // Creamos el conjunto de datos de Clubes
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[VOSClub entityName]];
    req.fetchBatchSize = 30;
    req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:VOSClubAttributes.name
                                                         ascending:YES
                                                          selector:@selector(caseInsensitiveCompare:)] ];
    
    
    NSFetchedResultsController * frcClub = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                           managedObjectContext:self.stack.context
                                                                             sectionNameKeyPath:nil
                                                                                      cacheName:nil ];
    
    VOSClubsViewController * clubVC = [[VOSClubsViewController alloc] initWithFetchedResultsController:frcClub
                                                                                                 style:UITableViewStylePlain];
    
    UINavigationController * clubNav = [[UINavigationController alloc] initWithRootViewController:clubVC];
//    ---------------------------------------------------------------*/

    // despues creamos el combinador
    UITabBarController * tabVC =  [[UITabBarController alloc] init];
    
    // Cargamos el array con los controladores que se tienen que mostrar en el combinador
    tabVC.viewControllers = @[catNav, clubNav];
    
    // lo asignamos como controlador raiz
    self.window.rootViewController = tabVC;
  
    // Arrancamos el autoguardado
    [self autosave];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)save{
    
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar %s \n\n %@", __func__, error);
    }];
    
}

-(void)autosave{
    
    if ( AUTO_SAVE ){
        
        NSLog( @"Autosave ..." );
        [self save];
        [self performSelector:@selector(autosave)
                   withObject:nil
                   afterDelay:AUTO_SAVE_DELAY_IN_SECONDS];
        
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - NSUserDefaults
-(void)createActionTable:(NSManagedObjectContext *)context {
    NSDictionary * coords = nil;
    
    coords = [[NSUserDefaults standardUserDefaults] objectForKey:ACTION_TABLE_CREATED];
    if ( coords == nil ) {
        [self saveDefaultActionTable:context];
    }
}

-(void)saveDefaultActionTable:(NSManagedObjectContext *)context {
    [VOSAction actionWithName:@"Tiro personal convertido"
                       points:@1
                      context:context];
    
    [VOSAction actionWithName:@"Tiro personal fallado"
                       points:@0
                      context:context];
    
    [VOSAction actionWithName:@"Canasta convertida"
                       points:@2
                      context:context];
    
    [VOSAction actionWithName:@"Canasta fallada"
                       points:@0
                      context:context];
    
    [VOSAction actionWithName:@"Triple convertido"
                       points:@3
                      context:context];
    
    [VOSAction actionWithName:@"Triple fallado"
                       points:@0
                      context:context];
    
    [VOSAction actionWithName:@"Rebote ofensivo"
                       points:@0
                      context:context];
    
    [VOSAction actionWithName:@"Rebote en defensa"
                       points:@0
                      context:context];
    
    [VOSAction actionWithName:@"Robo de balón"
                       points:@0
                      context:context];
    
    [VOSAction actionWithName:@"Perdida de balón"
                       points:@0
                      context:context];
    
    [VOSAction actionWithName:@"Asistencia"
                       points:@0
                      context:context];
    
    [VOSAction actionWithName:@"Tapón"
                       points:@0
                      context:context];
    
    [VOSAction actionWithName:@"Falta recibida"
                       points:@0
                      context:context];
    
    [VOSAction actionWithName:@"Falta cometida"
                       points:@0
                      context:context];
    
    // Guardamos el contexto para tener los datos de esta tabla ya creados la próxima vez.
    [self save];
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    // Generamos el flag que nos indicará que estos datos ya han sido creados para no volver a crearlos.
    [defaults setObject:@"YES"
                 forKey:ACTION_TABLE_CREATED];
    
    [defaults synchronize];
    
}

@end
