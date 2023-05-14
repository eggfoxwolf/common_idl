namespace go chatflow.chat


enum UserType {
    AI    = 1  
    USER  = 2  
}
enum ChatType {
    FREETALK   = 1  
    IELTS      = 2  
    INTERVIEW  = 3  
    TOPIC      = 4  
}

struct Message {
    1: string                 message_id;     
    2: string                 round_id;       
    3: UserType               user_type;      
    4: ChatType               chat_type;      
    5: i32                    status;         
    6: string                 content;        
    7: string                 audio_url;      
    8: i32                    duration;
    9:string                  round_name;
    10:i32                    created_time;
}

struct RoundStat {
    1: i32      user_word_count;
    2: i32      ai_word_count;
    3: i32      user_message_count;
    4: i32      ai_message_count;
    5: i32      required_word_count;
    6: i32      required_message_count;
}


