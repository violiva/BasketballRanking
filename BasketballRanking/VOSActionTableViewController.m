//
//  VOSActionTableViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 17/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSActionTableViewController.h"
#import "VOSAction.h"
#import "VOSActionTableViewCell.h"

@interface VOSActionTableViewController ()

@end

@implementation VOSActionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Actions";
    
    // Añadimos botón para añadir nueva Acción.
    UIBarButtonItem * addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector( addAction: )];
    
    self.navigationItem.rightBarButtonItem = addBtn;
    
    // Registramos el nib de la celda
    UINib * nib = [UINib nibWithNibName:@"VOSActionTableViewCell"
                                 bundle:[NSBundle mainBundle]];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:[VOSActionTableViewCell cellId]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Nuestro controlador implementa ya por sí solo los números de secciones y filas en cada sección,
// pero debemos especificarle que tipo de celda queremos para cada fila recuperada.
-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguamos de qué libreta me hablan
    VOSAction * act = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // creo una celda
    VOSActionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[VOSActionTableViewCell cellId]
                                                                      forIndexPath:indexPath];
    
    // La configuro ( sincronizo modelo y vista )
    cell.actionNameView.text = act.name;
    
    // la devuelvo
    return cell;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [VOSActionTableViewCell height];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar si el usuario quiere definitivamente eliminar el registro
    if ( editingStyle == UITableViewCellEditingStyleDelete ){
        
        // borramos la Acción, pero ¿ cuál es ?
        NSManagedObjectContext * ctx = self.fetchedResultsController.managedObjectContext;
        VOSAction * deceased = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:deceased];
    }
}

// Personalización del título del botón que aparece con el gesto de deslizar a la izquierda. Por defecto viene como Delete.
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}

#pragma mark - Actions
-(void) addAction:(id) sender{
    [VOSAction actionWithName:@"Nueva categoría"
                       points:@0
                      context:self.fetchedResultsController.managedObjectContext];
    
}

@end
