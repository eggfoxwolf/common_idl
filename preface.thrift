namespace go chatflow.preface

include "base.thrift"

struct OralLevel {
    1: string                   description;
    2: base.ChatLevel          chat_level;
    3: list<string>             replies;
}

struct GetLevelListReq {
}
struct LevelList {
    1: string                   introduction;
    2: list<OralLevel>          oral_levels;
}
struct GetLevelListRsp {
    1: i32                      code;
    2: string                   message;
    3: LevelList                data;
}

struct UpdateLevelReq {
    1: base.ChatLevel          chat_level;
}

struct UpdateLevelRsp {
    1: i32                      code;
    2: string                   message;
}

service PrefaceService {
    GetLevelListRsp GetLevelList(1: GetLevelListReq req)    (api.get    =   "/preface/level/list/");
    UpdateLevelRsp  UpdateLevel(1:  UpdateLevelReq req)     (api.post   =   "/preface/level/update/");
}
