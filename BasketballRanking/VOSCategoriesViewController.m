//
//  VOSCategoriesViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 16/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSCategoriesViewController.h"
#import "VOSCategory.h"
#import "VOSCategoryTableViewCell.h"
#import "VOSGroup.h"
#import "VOSGroupsViewController.h"

@interface VOSCategoriesViewController ()

@end

@implementation VOSCategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Categories";
    
    // Añadimos botón para añadir nueva Categoría.
    UIBarButtonItem * addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector( addCategory: )];
    
    self.navigationItem.rightBarButtonItem = addBtn;
    
    // Registramos el nib de la celda
    UINib * nib = [UINib nibWithNibName:@"VOSCategoryTableViewCell"
                                 bundle:[NSBundle mainBundle]];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:[VOSCategoryTableViewCell cellId]];

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
    
    // creo una celda
    VOSCategoryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[VOSCategoryTableViewCell cellId]
                                                                      forIndexPath:indexPath];
    if (cell == nil ){
        cell = [[VOSCategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[VOSCategoryTableViewCell cellId]];
    }
    
    
    // La configuro ( sincronizo modelo y vista )
    cell.categoryName.text = cat.name;
//    cell.notesView.text = [NSString stringWithFormat:@"%lu", (unsigned long)nb.notes.count];

    // asignamos la propia celda como su propio delegado para controlar cuando comienza la edición, cuando finaliza, etc...
    cell.categoryName.delegate = cell;
    cell.category = cat;
    
    // la devuelvo
    return cell;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [VOSCategoryTableViewCell height];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar si el usuario quiere definitivamente eliminar el registro
    if ( editingStyle == UITableViewCellEditingStyleDelete ){
        
        // borramos la categoría, pero ¿ cuál es ?
        NSManagedObjectContext * ctx = self.fetchedResultsController.managedObjectContext;
        VOSCategory * deceased = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:deceased];
    }
}

// Personalización del título del botón que aparece con el gesto de deslizar a la izquierda. Por defecto viene como Delete.
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"Entra en la selección de una celda");
    
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
    
    // Le asignamos su libreta para que lo sepa
    grVC.categ = cat;
    
    // Lo pusheo
    [self.navigationController pushViewController:grVC
                                         animated:YES];

    NSLog(@"Categoría seleccionada : %@", cat.name);
}



#pragma mark - Actions
-(void) addCategory:(id) sender{
    [VOSCategory categoryWithName: @"Input New Category Name"
                          context:self.fetchedResultsController.managedObjectContext];
   
}

@end
