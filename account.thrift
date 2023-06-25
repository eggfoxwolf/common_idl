namespace go chatflow.account

include "base.thrift"

enum VipType{
    NO_VIP                      = 0
    TRIAL_VIP                   = 1
    PAID_VIP                    = 2
    LIMITED_VIP                 = 3
}

struct Account {
    1: string                   uid;
    2: string                   token;
    3: VipType                  vip_type;
    4: i32                      vip_start_time;
    5: i32                      vip_end_time;
    6: base.ChatLevel          chat_level;
    7: list<GroupInfo>          group_list;
}

struct GroupInfo {
    1: i32                      group_id;
    2: string                   group_name;
    3: string                   group_url;
}

struct UserLoginReq {
    1: string                   wx_code
    2: string                   nick_name
    3: string                   avatar_url
}
struct UserLoginResp {
    1: i32                      code;
    2: string                   message;
    3: Account                  data;
}

struct UserDetailReq {
}
struct UserDetailResp {
    1: i32                      code;
    2: string                   message;
    3: Account                  data;
}

service AccountService {
    UserLoginResp   UserLogin(  1: UserLoginReq req)    (api.post   =   "/account/login/");
    UserDetailResp  UserDetail( 1: UserDetailReq req)   (api.get    =   "/account/detail/");
}