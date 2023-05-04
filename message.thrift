namespace go chatflow.message

include "chat.thrift"

enum TipType {
    ECTRANSLATE  = 1
    TEACHME    = 2
    IMPROVE    = 3
    CETRANSLATE = 4
    SPEAK = 5
}
enum OrderType {
    CREATED_ASC   = 1
    CREATED_DESC  = 2
}

struct GetASRAccessReq {
}

struct XunfeiASRAccess {
    1: string   app_id;
    2: string   host_url;
    3: string   host;
    4: string   date;
    5: string   authorization;
}

struct GetASRAccessRsp {
    1: i32               code;
    2: string            message;
    3: XunfeiASRAccess   data;
}

struct GetOSSAccessReq {
}

struct AliyunOSSAccess {
    1: string   access_key_id;
    2: string   host;
    3: string   policy;
    4: string   key;
    5: string   signature;
}

struct GetOSSAccessRsp {
    1: i32               code;
    2: string            message;
    3: AliyunOSSAccess   data;
}

struct GetMessageDetailReq {
    1: string   message_id;
}

struct GetMessageDetailRsp {
    1: i32       code;
    2: string    message;
    3: chat.Message   data;
}

struct GetMessageListReq {
    1: chat.ChatType            chat_type;
    2: optional string          round_id;
    3: optional string          end_message_id;
    4: OrderType                order_type;
    5: i32                      offset;
    6: i32                      limit;
}

struct MessageList {
    1: list<chat.Message>   messages;
    2: i32                  total;
    3: chat.RoundStat       round_stat;
}

struct GetMessageListRsp {
    1: i32           code;
    2: string        message;
    3: MessageList   data;
}

struct GetMessageTipReq {
    1: optional string  message_id;
    2: optional string  content;
    3: TipType          tip_type;
}

struct MessageTip {
    1: string         ec_translate;
    2: string         candidates;
    3: string         examples;
    4: string         grammar;
    5: string         optimization;
    6: string         ce_translate;
    7: string         audio_url;
}

struct GetMessageTipRsp {
    1: i32          code;
    2: string       message;
    3: MessageTip   data;
}

service MessageService {
    GetASRAccessRsp GetASRAccess(1: GetASRAccessReq req) (api.get="/access/asr/");

    GetOSSAccessRsp GetOSSAccess(1: GetOSSAccessReq req) (api.get = "/access/oss/");

    GetMessageDetailRsp GetMessageDetail(1: GetMessageDetailReq req) (api.get="/chat/message/detail/");

    GetMessageListRsp GetMessageList(1: GetMessageListReq req)(api.get="/chat/message/list/");

    GetMessageTipRsp GetMessageTip(1: GetMessageTipReq req)(api.post= "/chat/message/tip/");
}
