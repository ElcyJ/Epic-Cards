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
                room_goto(rm_gameWorld);
            break;
        }
    break;
}
