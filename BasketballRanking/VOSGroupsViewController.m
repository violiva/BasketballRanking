//
//  VOSGroupsViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 17/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSGroupsViewController.h"
#import "VOSGroup.h"

@interface VOSGroupsViewController ()

@end

@implementation VOSGroupsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // agregamos el botón de añadir notas.
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
    cell.textLabel.text = gr.name;
    
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
    [VOSGroup groupWithName:@"Nuevo Grupo"
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
    
    
    
    
    NSLog(@"Ahora pasaríamos a ver los equipos dentro del grupo: %@", gr.name);

/*
    // crear formulario de nota
    VOSNoteViewController * nVC = [[VOSNoteViewController alloc] initWithModel:note];
    
    // Hacerle push
    [self.navigationController pushViewController:nVC animated:YES];
*/
    
}

@end
