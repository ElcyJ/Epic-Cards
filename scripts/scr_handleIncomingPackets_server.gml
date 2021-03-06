var buffer = argument[0];
var socket = argument[1];
var msgId = buffer_read(buffer, buffer_u8);//find the tag

switch (msgId)
{
    case 1: //latency request
        var time = buffer_read(buffer, buffer_u32);//read in the time from the client
        buffer_seek(global.buffer, buffer_seek_start, 0);//seek to the beginning of the read buffer
        buffer_write(global.buffer, buffer_u8, 1);//write a tag to the global write buffer
        buffer_write(global.buffer, buffer_u32, time);//write the time receieved the global write buffer
        //send back to player who sent this message
        network_send_packet(socket, global.buffer, buffer_tell(global.buffer));
    break;
    
    case 2: //registration request
        var playerUsername = buffer_read(buffer, buffer_string);
        var passwordHash = buffer_read(buffer, buffer_string);
        var response = 0;
        
        //check if player already exists
        if (!file_exists(playerUsername + '.ini'))
        {
            //register a new player
            ini_open(playerUsername + '.ini');
            ini_write_string('alunos', 'username', playerUsername);
            ini_write_string('alunos', 'password', passwordHash);
            ini_write_real('alunos', 'victories', 0);
            ini_close();
            
            response = 1;
            //scr_showNotification('Um novo aluno entrou!');
        }

        ini_open('usuarios.ini');
        var playerExists = ini_read_string('usuarios',playerUsername, 'false');
        if (playerExists == 'false')
        {
            //resgister a new player
            //ini_write_string('users', playerUsername, passwordHash);
            ini_write_string('usuarios', playerUsername, playerUsername);
            response = 1;
            //scr_showNotification('Um novo jogador entrou!');
        }
        ini_close();
        
        //send repsonse to the client
        buffer_seek(global.buffer, buffer_seek_start, 0);//seek to the beginning of the read buffer
        buffer_write(global.buffer, buffer_u8, 2);//write a tag to the global write buffer
        buffer_write(global.buffer, buffer_u8, response);//write the time receieved the global write buffer
        network_send_packet(socket, global.buffer, buffer_tell(global.buffer));
        
        
    break;
    
    case 3://login request
        var pId =  buffer_read(buffer, buffer_u32);
        var playerUsername = buffer_read(buffer, buffer_string);
        var passwordHash = buffer_read(buffer, buffer_string);
        var response = 0;
        
        //check if player exists
        if (file_exists(playerUsername + '.ini'))
        {
            ini_open(playerUsername + '.ini');
            var playerStoredPassword = ini_read_string('alunos', 'password', '');
            studentVictories = ini_read_real('alunos', 'victories', 0);
            ini_close();
            
            if (passwordHash == playerStoredPassword)
            {
                response = 1;
                scr_showNotification('Um novo aluno entrou!');
                with (obj_student)
                {
                    if (studentIdentifier == pId)
                    {
                        studentName = playerUsername;
                    }
                }
            } 
        }
        
        //check if player exists
        /*ini_open('users.ini');
        var playerStoredPassword = ini_read_string('users', playerUsername, 'false');
        studentVictories = ini_read_real('users', playerUsername, 0);//
        if (playerStoredPassword != 'false')
        {
            
        }
        ini_close();*/
        
        //send a reponse
        buffer_seek(global.buffer, buffer_seek_start, 0);//seek to the beginning of the read buffer
        buffer_write(global.buffer, buffer_u8, 3);//write a tag to the global write buffer
        buffer_write(global.buffer, buffer_u8, response);//write the time receieved the global write buffer
        buffer_write(global.buffer, buffer_u32, studentVictories);
        network_send_packet(socket, global.buffer, buffer_tell(global.buffer));
        
    break;
    
    case 6:
        var pId = buffer_read(buffer, buffer_u32);
        var pName = '';
        //var pScore = 0;
        
        with (obj_student)
        {
            if (studentIdentifier == pId)
            {
                studentInGame = !studentInGame;
                pName = studentName;
                //pScore = studentScore;//
            }
        }
        
        //tell others players about this change 
        for (var i = 0; i < ds_list_size(global.students); i++)
        {
            var storedStudentSocket = ds_list_find_value(global.students, i);
            
            if (storedStudentSocket != socket)
            {
                buffer_seek(global.buffer, buffer_seek_start, 0);
                buffer_write(global.buffer, buffer_u8, 6);
                buffer_write(global.buffer, buffer_u32, pId);
                //buffer_write(global.buffer, buffer_u32, pScore);//
                buffer_write(global.buffer, buffer_string, pName);
                network_send_packet(storedStudentSocket, global.buffer, buffer_tell(global.buffer));
            }
         }
        
        //tell me about others players
        for (var i = 0; i < ds_list_size(global.students); i++)
        {
            var storedStudentSocket = ds_list_find_value(global.students, i);
            
            if (storedStudentSocket != socket)
            {
                var student = noone;
                
                with (obj_student)
                {
                    if (self.studentSocket == storedStudentSocket)
                    {
                        student = id;
                    }    
                }
                if (student != noone)
                {
                    if (student.studentInGame)
                    {
                        buffer_seek(global.buffer, buffer_seek_start, 0);
                        buffer_write(global.buffer, buffer_u8, 6);
                        buffer_write(global.buffer, buffer_u32, student.studentIdentifier);
                        //buffer_write(global.buffer, buffer_u32, student.studentScore);
                        buffer_write(global.buffer, buffer_string, student.studentName);
                        network_send_packet(socket, global.buffer, buffer_tell(global.buffer));   
                    }
                }
            }
        }
    break;
    
   case 7:
        var pId = buffer_read(buffer, buffer_u32);
        var pScore = buffer_read(buffer, buffer_s32);
        var pLife = buffer_read(buffer, buffer_s32);
        
        //tell others players about this change 
        for (var i = 0; i < ds_list_size(global.students); i++)
        {
            var storedStudentSocket = ds_list_find_value(global.students, i);
            
            if (storedStudentSocket != socket)
            {
                buffer_seek(global.buffer, buffer_seek_start, 0);
                buffer_write(global.buffer, buffer_u8, 7);
                buffer_write(global.buffer, buffer_u32, pId);
                buffer_write(global.buffer, buffer_s32, pScore);
                buffer_write(global.buffer, buffer_s32, pLife);
                network_send_packet(storedStudentSocket, global.buffer, buffer_tell(global.buffer));
            }
         }
        
        
    break;  
}

