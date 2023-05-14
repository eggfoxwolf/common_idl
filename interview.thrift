namespace go chatflow.interview

include "chat.thrift"


struct GetJobListReq {
    1: i32   offset;   
    2: i32   limit;    
}

struct Job {
    1: i32      job_id;            
    2: string   name;              
    4: bool     selected_before;   
    5: string   round_id;          
}

struct JobList {
    1: list<Job>   jobs;    
    2: i32         total;   
}

struct GetJobListRsp {
    1: i32       code;      
    2: string    message;   
    3: JobList   data;      
}

struct StartChatReq {
    1: i32   job_id;   
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
    1: i32      job_id;      
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

service InterviewService {
    GetJobListRsp GetJobList(1: GetJobListReq req)(api.get = "/interview/job/list/");

    StartChatRsp StartChat(1: StartChatReq req)(api.post = "/interview/chat/start/");

    SendMessageRsp SendMessage(1: SendMessageReq req)(api.post = "/interview/message/send/");
}
