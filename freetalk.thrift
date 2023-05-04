namespace go chatflow.freetalk

include "chat.thrift"


struct StartChatReq {
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
    1: string   round_id;    
    2: string   content;     
    3: string   audio_url;
    4: i32      duration;
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

service FreetalkService {
    StartChatRsp StartChat(1: StartChatReq req) (api.post = "/freetalk/chat/start/");

    SendMessageRsp SendMessage(1: SendMessageReq req) (api.post = "/freetalk/message/send/");
}


