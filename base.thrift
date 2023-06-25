namespace go chatflow.base

enum ChatType {
    FREETALK        = 1
    IELTS           = 2
    INTERVIEW       = 3
    TOPIC           = 4
}

enum UserType {
    USER            = 1
    AI              = 2
}

enum MessageStatus {
    NULL            = -1
    INIT            = 0
    TEXT            = 1
    AUDIO           = 2
}

enum ChatLevel {
    ELEMENTARY      = 1
    INTERMEDIATE    = 2
    ADVANCED        = 3
}

enum ChatMode {
    FREE            = 1
    TRAIN           = 2
}

enum OrderType {
    CREATED_ASC     = 1
    CREATED_DESC    = 2
    UPDATED_ASC     = 3
    UPDATED_DESC    = 4
}

struct Message {
    1: string                 message_id;
    2: string                 round_id;       
    3: UserType               user_type;
    4: ChatType               chat_type;
    5: MessageStatus          status;
    6: string                 content;        
    7: string                 audio_url;      
    8: i32                    duration;
    9: i32                    created_time;
    10:MessageExtra           extra;
}

struct MessageExtra {
    1: string                 round_name;
    2: StandardReply          standard_reply;
}

struct StandardReply {
    1: string                 content;
    2: string                 audio_url;
    3: i32                    duration;
    4: string                 translate;
    5: string                 guide;
    6: list<string>           keywords;
}

struct Round {
    1: string                 round_id;
    2: string                 round_name;
    3: i32                    user_word_count;
    4: i32                    ai_word_count;
    5: i32                    user_message_count;
    6: i32                    ai_message_count;
    7: i32                    required_word_count;
    8: i32                    required_message_count;
    9: i32                    created_time;
    10:i32                    updated_time;
    11:double                 score;
    12:double                 surpass_pct;
    13:i32                    continuous_day;
}

struct Scene {
    1: i32                    scene_id;
    2: string                 title;
    3: string                 icon;
    4: list<string>           items;
}