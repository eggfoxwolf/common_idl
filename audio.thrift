namespace go chatflow.audio

struct GetASRAccessReq {
}
struct XunfeiASRAccess {
    1: string                   app_id;
    2: string                   host_url;
    3: string                   host;
    4: string                   date;
    5: string                   authorization;
}
struct GetASRAccessRsp {
    1: i32                      code;
    2: string                   message;
    3: XunfeiASRAccess          data;
}

struct GetOSSAccessReq {
}
struct AliyunOSSAccess {
    1: string                   access_key_id;
    2: string                   host;
    3: string                   policy;
    4: string                   key;
    5: string                   signature;
}
struct GetOSSAccessRsp {
    1: i32                      code;
    2: string                   message;
    3: AliyunOSSAccess          data;
}

struct GetTTSAccessReq {
}
struct AliyunTTSAccess {
    1: string                   app_key;
    2: string                   token;
    3: string                   host_url;
    4: string                   voice;
}
struct GetTTSAccessRsp {
    1: i32                      code;
    2: string                   message;
    3: AliyunTTSAccess          data;
}

service AudioService {
    GetASRAccessRsp GetASRAccess(1: GetASRAccessReq req)    (api.get    =   "/access/asr/");
    GetOSSAccessRsp GetOSSAccess(1: GetOSSAccessReq req)    (api.get    =   "/access/oss/");
    GetTTSAccessRsp GetTTSAccess(1: GetTTSAccessReq req)    (api.get    =   "/access/tts/");
}
