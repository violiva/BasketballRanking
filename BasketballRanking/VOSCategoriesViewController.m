//
//  VOSCategoriesViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 16/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSCategoriesViewController.h"
#import "VOSCategory.h"
#import "VOSGroup.h"
#import "VOSGroupsViewController.h"
#import "VOSEditCategoryViewController.h"

@interface VOSCategoriesViewController ()

@end

@implementation VOSCategoriesViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Añadimos botón para añadir nueva Categoría.
    UIBarButtonItem * addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector( addCategory: )];
    self.navigationItem.rightBarButtonItem = addBtn;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.title = @"Categories";
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Nuestro controlador implementa ya por sí solo los números de secciones y filas en cada sección,
// pero debemos especificarle que tipo de celda queremos para cada fila recuperada.
-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguamos de qué categoría me hablan
    VOSCategory * cat = [self.fetchedResultsController objectAtIndexPath:indexPath];

    // Creamos la celda
    static NSString * cellId = @"categoryCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    // la configuramos
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    cell.textLabel.font = [UIFont fontWithName:@"Dosis Book" size:20];
    cell.textLabel.text = cat.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ tiempos de %@ minutos", cat.period, cat.timePeriod];
    
    // la devolvemos
    return cell;
    
}

// Personalización del título del botón que aparece con el gesto de deslizar a la izquierda. Por defecto viene como Delete.
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}

#pragma mark - Actions
-(void) addCategory:(id) sender{
    [VOSCategory categoryWithName: @"New Category Name"
                          context:self.fetchedResultsController.managedObjectContext];
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar si el usuario quiere definitivamente eliminar el registro
    if ( editingStyle == UITableViewCellEditingStyleDelete ){
        
        // borramos la categoría, pero ¿ cuál es ?
        NSManagedObjectContext * ctx = self.fetchedResultsController.managedObjectContext;
        VOSCategory * deceased = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:deceased];
        [self.tableView reloadData];
    }
}

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguamos cual es la categoría a modificar
    VOSCategory * cat = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // creamos el controlador para poder modificar los datos de la categoría
    VOSEditCategoryViewController * editCatVC = [[VOSEditCategoryViewController alloc] initWithModel:cat];
    
    // Hacemos push del controlador
    [self.navigationController pushViewController:editCatVC animated:YES];

}

-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{

    // Averiguar cual fue la categoría seleccionada
    VOSCategory * cat = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Creo la selección de datos
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[VOSGroup entityName]];
    
    req.fetchBatchSize = 30;
    req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:VOSGroupAttributes.name
                                                           ascending:YES
                                                            selector:@selector(caseInsensitiveCompare:)] ];
    
    req.predicate = [NSPredicate predicateWithFormat:@"category == %@", cat];
    
    NSFetchedResultsController * frc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                           managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                                             sectionNameKeyPath:nil
                                                                                      cacheName:nil];
    
    // Creamos una instancia de controlador de Notas
    VOSGroupsViewController * grVC = [[VOSGroupsViewController alloc] initWithFetchedResultsController:frc
                                                                                                 style:UITableViewStylePlain];
    
    // Le asignamos su categoría para que lo conozcan sus tablas hijas y puedan asociarlo
    grVC.categ = cat;
    
    // Lo pusheo
    [self.navigationController pushViewController:grVC
                                         animated:YES];

}

@end
