namespace go chatflow.invitation

struct GetGroupDetailReq {
}

struct GroupDetail {
    1: string   group_url;
}

struct GetGroupDetailRsp {
    1: i32             code;      
    2: string          message;   
    3: GroupDetail   data;
}

service InvitationService {
    GetGroupDetailRsp GetGroupDetail(1: GetGroupDetailReq req) (api.get = "/invitation/group/detail/");
}


