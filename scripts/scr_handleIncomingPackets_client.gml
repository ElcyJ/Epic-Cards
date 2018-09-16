var buffer = argument[0];
var msgId = buffer_read(buffer, buffer_u8);

switch(msgId)
{
    case 1: //latency request
        var time = buffer_read(buffer, buffer_u32);
        latency = current_time - time;
    break;
    
    case 2://registration request
        var response = buffer_read(buffer, buffer_u8);
        switch(response)
        {
            case 0://failure
                scr_showNotification('cadastro falhou! Nome de usuário já existe');
            break;
            
            case 1://success
                room_goto(rm_login);
            break;
        }
    break;
    
    case 3://login request
        var response = buffer_read(buffer, buffer_u8);
        switch(response)
        {
            case 0://failure
                scr_showNotification('login falhou! Nome de usuário não existe ou senha incorreta');
            break;
            
            case 1://success
            
                global.studentVictories = buffer_read(buffer, buffer_u32);   
            
                room_goto(rm_mainMenu);
            break;
        }
    break;
    
    case 4:
        global.studentId = buffer_read(buffer, buffer_u32);
        scr_showNotification('Id do aluno recebido');
    break;
    
    case 5:
        var pId = buffer_read(buffer, buffer_u32);
        /*with (obj_remoteStudent)
        {
            if (global.remoteStudentId = pId)
            {
                instance_destroy();
            }
        }*/
    break;
    
    case 6:
        var pId = buffer_read(buffer, buffer_u32);
        //var pScore = buffer_read(buffer, buffer_u32);
        var pName = buffer_read(buffer, buffer_string);
        
        var instance = noone;
        
        with (obj_remoteStudent)
        {
            if (global.remoteStudentId == pId)
            {
                instance = id;
            }
        }    
        if (instance == noone)
        {
            //only if we're in the gameWorld
            if (instance_exists(obj_localStudent))
            {
            
                instance_create(room_width/2, room_height/2, obj_remoteStudent);
                with (obj_remoteStudent)
                {
                    global.remoteStudentId = pId;
                    global.remoteStudentName = pName;
                }
                //create a remote player
                //var remoteStudent = instance_create(room_width/2, room_height/2, obj_remoteStudent);
                //remoteStudent.remoteStudentId = pId;
                //remoteStudent.remoteStudentName = pName;
                //remoteStudentScore = pScore
            }
        }
        else
        {
            with (instance)
            {
                //instance_destroy();
            }
        }
    break;
    
    case 7:
        var pId = buffer_read(buffer, buffer_u32);
        var pScore = buffer_read(buffer, buffer_s32);
        var pLife = buffer_read(buffer, buffer_s32);
        
        with (obj_remoteStudent)
        {
            if (global.remoteStudentId == pId)
            {
                global.remoteStudentScore = pScore;
                global.remoteStudentLife = pLife;
            }
        }
    
    break;
      
}
