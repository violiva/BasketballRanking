//
//  VOSCategoryTableViewCell.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 16/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSCategoryTableViewCell.h"
#import "VOSCategory.h"

@implementation VOSCategoryTableViewCell

#pragma mark - Properties


// creamos un setter personalizado
-(void) setCategory:(VOSCategory *)category{
    // guardamos la nota
    _category = category;
    
    // sincronizamos la vista con la categoría
    self.categoryName.text = category.name;
    
//    [self setEditing:YES];
    NSLog(@"pasa por setter personalizado");
}


 
#pragma mark - Class methods
+(CGFloat)height{
    return 60.0f;
}

+(NSString *)cellId{
    return [self description];
    
}

#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    // validamos el texto si tenemos que hacer alguna validación.
    if ( [textField.text isEqualToString:@""] ){
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle: @"Warning !!!"
                                                          message: @"Este campo no se puede dejar vacío"
                                                         delegate: nil
                                                cancelButtonTitle: @"I Know"
                                                otherButtonTitles: nil];
        [message show];
        
//        [textField becomeFirstResponder];
        
        return NO;
    }
    
    // Si está bien quitamos el foco para que desaparezca el teclado ( o podemos mandarlo al siguiente campo si nos interesase.
    // Si queremos controlar en que campo estamos en el caso de que haya más de un campo TextField, podríamos hacerlo preguntando
    
    
   [textField resignFirstResponder];
    
    return YES;
}


-(void)textFieldDidEndEditing:(UITextField *)textField{
    // Si está bien quitamos el foco para que desaparezca el teclado ( o podemos mandarlo al siguiente campo si nos interesase.
    // Si queremos controlar en que campo estamos en el caso de que haya más de un campo TextField, podríamos hacerlo preguntando
    // por
    
    if ( [textField.text isEqualToString:@""] ){
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle: @"Warning !!!"
                                                          message: @"Este campo no se puede dejar vacío"
                                                         delegate: nil
                                                cancelButtonTitle: @"I Know"
                                                otherButtonTitles: nil];
        [message show];
        [textField becomeFirstResponder];
        [textField setHighlighted:YES];
        
    }else{
        if ( ![textField.text isEqual: self.category.name] ) {
            self.category.name = textField.text;
        }
        [textField resignFirstResponder];
        
    }
    
    
    
    
}


#pragma mark - Misc
-(void) prepareForReuse{
    [super prepareForReuse];
//    self.category.name = self.categoryName.text;
    
}


- (void)awakeFromNib {
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
