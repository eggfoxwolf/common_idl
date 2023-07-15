namespace go chatflow.topic

include "chat.thrift"


struct GetTopicListReq {
    1: i32   offset;   
    2: i32   limit;    
}

struct Topic {
    1: i32      topic_id;          
    2: string   name;              
    4: bool     selected_before;   
    5: string   round_id;
    6: i32      is_membership_type
}

struct TopicList {
    1: list<Topic>   topics;   
    2: i32           total;    
}

struct GetTopicListRsp {
    1: i32         code;      
    2: string      message;   
    3: TopicList   data;      
}

struct StartChatReq {
    1: i32   topic_id;   
}

struct StartChatData {
    1: string   round_id;     
    2: string   message_id;   
}

struct StartChatRsp {
    1: i32             code;      
    2: string          message;   
    3: StartChatData   data;      
}

struct SendMessageReq {
    1: i32      topic_id;    
    2: string   round_id;    
    3: string   content;     
    4: string   audio_url;
    5: i32      duration;
}

struct SendMessageData {
    1: chat.Message   message;            
    2: string         reply_message_id;   
}

struct SendMessageRsp {
    1: i32               code;      
    2: string            message;   
    3: SendMessageData   data;      
}

service TopicService {
    GetTopicListRsp GetTopicList(1: GetTopicListReq req)(api.get = "/topic/topic/list/");

    StartChatRsp StartChat(1: StartChatReq req)(api.post = "/topic/chat/start/");

    SendMessageRsp SendMessage(1: SendMessageReq req)(api.post="/topic/message/send/");
}


