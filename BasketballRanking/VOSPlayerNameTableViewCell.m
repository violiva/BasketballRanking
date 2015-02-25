//
//  VOSPlayerNameTableViewCell.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 24/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSPlayerNameTableViewCell.h"
#import "VOSPlayer.h"

@implementation VOSPlayerNameTableViewCell

#pragma mark - Properties
// creamos un setter personalizado
-(void) setPlayer:(VOSPlayer *)player{
    // guardamos el nombre del Club
    _player = player;
    
    // sincronizamos la vista con el nombre del Club
    self.namePlayerView.text = player.name;
}

#pragma mark - Class methods
+(CGFloat) height{
    return 45.0f;
}

+(NSString *) cellId{
    return [self description];
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
        
    }else{
        if ( ![textField.text isEqual: self.player.name  ] ) {
            self.player.name = textField.text;
        }
        [textField resignFirstResponder];
        
    }
}

#pragma mark - Misc
-(void) prepareForReuse{
    [super prepareForReuse];
    
    // Sincroniza la vista con la nota por si hubo cambios
    self.player.name = self.namePlayerView.text;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
