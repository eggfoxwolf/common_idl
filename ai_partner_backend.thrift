namespace go ai_partner.backend
include "base.thrift"

struct WeChatTtsReq {
    1: string open_id;
    2: string prompt_key;
    3: string session_key;
    4: string user_content;
}

struct WeChatTtsRsp {

    255: base.Response base;
}

service BackendService {
    WeChatTtsRsp WeChatTts(1: WeChatTtsReq req)
}