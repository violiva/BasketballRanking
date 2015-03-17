//
//  VOSGroupsViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 17/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSGroupsViewController.h"
#import "VOSGroup.h"
#import "VOSEditGroupViewController.h"
#import "VOSClasification.h"
#import "VOSClasificationViewController.h"

@interface VOSGroupsViewController ()

@end

@implementation VOSGroupsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // agregamos el botón de añadir Grupo nuevo.
    UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                        target:self
                                                                        action:@selector( addGroup: )];
    
    self.navigationItem.rightBarButtonItem = btn;
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.title = self.categ.name;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar el grupo
    VOSGroup * gr = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Creamos la celda
    static NSString * cellId = @"groupCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    // la configuramos
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    cell.textLabel.text = gr.name;
    cell.textLabel.font = [UIFont fontWithName:@"Dosis Book" size:20];
    
    // la devolvemos
    return cell;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar si el usuario quiere definitivamente eliminar el registro
    if ( editingStyle == UITableViewCellEditingStyleDelete ){
        
        // Averiguo la celda
        VOSGroup * deceased = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        // la elimino
        NSManagedObjectContext * ctxt = self.categ.managedObjectContext;
        
        [ctxt deleteObject:deceased];
    }
}


// Personalización del título del botón que aparece con el gesto de deslizar a la izquierda. Por defecto viene como Delete.
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}


#pragma mark - Actions
-(void) addGroup:(id) sender{
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger year = [components year];
    
    [VOSGroup groupWithName:@"Nuevo Grupo"
                       year:@(year)
                 category:self.categ
                  context:self.categ.managedObjectContext];
}


- (void)presentViewController:(UIViewController *)viewControllerToPresent
                     animated:(BOOL)flag
                   completion:(void (^)(void))completion{
    
}


#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Averiguar el grupo
    VOSGroup * gr = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // crear formulario para editar el grupo
    VOSEditGroupViewController * editGroupVC = [[VOSEditGroupViewController alloc] initWithModel:gr];
 
    // Hacerle push
    [self.navigationController pushViewController:editGroupVC animated:YES];
}


-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar cual fue el grupo seleccionado
    VOSGroup * gr = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSLog(@"Grupo Seleccionado: %@ ", gr.name);
    
    // Creo la selección de datos
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[VOSClasification entityName]];
    
    req.fetchBatchSize = 30;
//    req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"team.name"
//                                                           ascending:YES
//                                                            selector:@selector(caseInsensitiveCompare:)] ];
    req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:VOSClasificationAttributes.totalPoints
                                                           ascending:NO
                                                            selector:nil] ];
    
    req.predicate = [NSPredicate predicateWithFormat:@"group == %@", gr];
    
    NSFetchedResultsController * frc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                           managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                                             sectionNameKeyPath:nil
                                                                                      cacheName:nil];
    
/*---------------------------------------
    NSArray *fetchedObjects;
    NSError * error = nil;
    fetchedObjects = [self.fetchedResultsController.managedObjectContext executeFetchRequest:req error:&error];
    
    NSLog(@"Registros : %lu", (unsigned long)[fetchedObjects count] );
//---------------------------------------*/

    
    // Creamos una instancia de controlador de Clasificaciones para este grupo
    VOSClasificationViewController * clasifVC = [[VOSClasificationViewController alloc] initWithFetchedResultsController:frc
                                                                                                 style:UITableViewStylePlain];
    
    // Le asignamos su categoría para que lo conozcan sus tablas hijas y puedan asociarlo
    clasifVC.group = gr;
    
    // Lo pusheo
    [self.navigationController pushViewController:clasifVC
                                         animated:YES];
    

}

@end
