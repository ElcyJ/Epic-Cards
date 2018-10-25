cards = ds_list_create();
ds_list_add(cards, spr_e1, spr_e2, spr_e3, spr_e4, spr_e5, spr_e6, spr_e7, spr_e8, spr_e9, spr_e10, spr_e11, spr_e12, spr_e13, spr_e14, spr_e15);
ds_list_add(cards, spr_e16, spr_e17, spr_e18, spr_e19, spr_e20, spr_e21, spr_e22, spr_e23, spr_e24, spr_e25, spr_e26, spr_e27, spr_e28, spr_e30);
ds_list_add(cards, spr_e31, spr_e32, spr_e33, spr_e34, spr_e36, spr_e37, spr_e38)
width = 6;
height = 2;

xx = 288//192
yy = 320//394

found = false;

sort = ds_list_create();
ds_list_add(sort, '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11');
randomize();
ds_list_shuffle(sort);
randomInt = ds_list_find_value(sort, ds_list_size(sort) - 1);//size(cards)

val = noone;
val2 = noone;
val3 = noone;
val4 = noone;
val5 = noone;
val6 = noone;

for (var i = 0; i < width; i++)
{
    for (var j = 0; j < height; j++)
    {
        var card = instance_create(xx, yy, obj_card);
        
        while (found == false)
        { 
            switch(randomInt)
            {
                case '0':
                   if (val == noone)
                       {
                            randomize();
                            ds_list_shuffle(cards);
                            val = ds_list_find_value(cards, ds_list_size(cards) - 1); 
                       }
                       card.sprite = val;
                       card.index = 0;
                       found = true;
                       instance_create(xx, yy, obj_cardFire);
                       
                       pos = ds_list_find_index(sort, '0');
                       ds_list_delete(sort, pos);
                   
                break;
                
                case '1':
                   if (val == noone)
                       {
                            randomize();
                            ds_list_shuffle(cards);
                            val = ds_list_find_value(cards, ds_list_size(cards) - 1); 
                       }
                       card.sprite = val;
                       card.index = 1;
                       found = true;
                       instance_create(xx, yy, obj_cardFire);
                       
                       pos = ds_list_find_index(sort, '1');
                       ds_list_delete(sort, pos);
                   
                break;
                
                case '2':
                   if (val2 == noone)
                       {
                            randomize();
                            ds_list_shuffle(cards);
                            val2 = ds_list_find_value(cards, ds_list_size(cards) - 1); 
                       }
                       card.sprite = val2;
                       card.index = 0;
                       found = true;
                       instance_create(xx, yy, obj_cardFire);
                       
                       pos = ds_list_find_index(sort, '2');
                       ds_list_delete(sort, pos);
                   
                break;
                
                case '3':
                   if (val2 == noone)
                       {
                            randomize();
                            ds_list_shuffle(cards);
                            val2 = ds_list_find_value(cards, ds_list_size(cards) - 1); 
                       }
                       card.sprite = val2;
                       card.index = 1;
                       found = true;
                       instance_create(xx, yy, obj_cardFire);
                       
                       pos = ds_list_find_index(sort, '3');
                       ds_list_delete(sort, pos);
                   
                break;
                
                case '4':
                   if (val3 == noone)
                       {
                            randomize();
                            ds_list_shuffle(cards);
                            val3 = ds_list_find_value(cards, ds_list_size(cards) - 1); 
                       }
                       card.sprite = val3;
                       card.index = 0;
                       found = true;
                       instance_create(xx, yy, obj_cardFire);
                       
                       pos = ds_list_find_index(sort, '4');
                       ds_list_delete(sort, pos);
                   
                break;
                
                case '5':
                   if (val3 == noone)
                       {
                            randomize();
                            ds_list_shuffle(cards);
                            val3 = ds_list_find_value(cards, ds_list_size(cards) - 1); 
                       }
                       card.sprite = val3;
                       card.index = 1;
                       found = true;
                       instance_create(xx, yy, obj_cardFire);
                       
                       pos = ds_list_find_index(sort, '5');
                       ds_list_delete(sort, pos);
                   
                break;
                
                case '6':
                   if (val4 == noone)
                       {
                            randomize();
                            ds_list_shuffle(cards);
                            val4 = ds_list_find_value(cards, ds_list_size(cards) - 1); 
                       }
                       card.sprite = val4;
                       card.index = 0;
                       found = true;
                       instance_create(xx, yy, obj_cardFire);
                       
                       pos = ds_list_find_index(sort, '6');
                       ds_list_delete(sort, pos);
                   
                break;
                
                case '7':
                   if (val4 == noone)
                       {
                            randomize();
                            ds_list_shuffle(cards);
                            val4 = ds_list_find_value(cards, ds_list_size(cards) - 1); 
                       }
                       card.sprite = val4;
                       card.index = 1;
                       found = true;
                       instance_create(xx, yy, obj_cardFire);
                       
                       pos = ds_list_find_index(sort, '7');
                       ds_list_delete(sort, pos);
                   
                break;
                
                case '8':
                   if (val5 == noone)
                       {
                            randomize();
                            ds_list_shuffle(cards);
                            val5 = ds_list_find_value(cards, ds_list_size(cards) - 1); 
                       }
                       card.sprite = val5;
                       card.index = 0;
                       found = true;
                       instance_create(xx, yy, obj_cardFire);
                       
                       pos = ds_list_find_index(sort, '8');
                       ds_list_delete(sort, pos);
                   
                break;
                
                case '9':
                   if (val5 == noone)
                       {
                            randomize();
                            ds_list_shuffle(cards);
                            val5 = ds_list_find_value(cards, ds_list_size(cards) - 1); 
                       }
                       card.sprite = val5;
                       card.index = 1;
                       found = true;
                       instance_create(xx, yy, obj_cardFire);
                       
                       pos = ds_list_find_index(sort, '9');
                       ds_list_delete(sort, pos);
                   
                break;
                
                case '10':
                   if (val6 == noone)
                       {
                            randomize();
                            ds_list_shuffle(cards);
                            val6 = ds_list_find_value(cards, ds_list_size(cards) - 1); 
                       }
                       card.sprite = val6;
                       card.index = 0;
                       found = true;
                       instance_create(xx, yy, obj_cardFire);
                       
                       pos = ds_list_find_index(sort, '10');
                       ds_list_delete(sort, pos); 
                   
                break;
                
                case '11':
                   if (val6 == noone)
                       {
                            randomize();
                            ds_list_shuffle(cards);
                            val6 = ds_list_find_value(cards, ds_list_size(cards) - 1); 
                       }
                       card.sprite = val6;
                       card.index = 1;
                       found = true;
                       instance_create(xx, yy, obj_cardFire);
                       
                       pos = ds_list_find_index(sort, '11');
                       ds_list_delete(sort, pos);
                   
                break;
                }
            }
            randomize();
            ds_list_shuffle(sort);
            if (ds_list_size(sort) >= 0)
            {
                randomInt = ds_list_find_value(sort, 0);
            }
            else
            {
                room_goto(rm_error)
            }

            found = false;
            yy += 416//392//384//400//224;
            
        }
        
        xx += 265;//270;
        yy = 320;
}
with (obj_card)
{
    flipped = true;
}
