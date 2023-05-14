namespace go chatflow.account

enum VipType{
    NO_VIP = 0
    TRIAL_VIP = 1
    PAID_VIP = 2
}

struct Account {
    1: string uid
    2: string token
    3: VipType vip_type
    4: i32 vip_start_time
    5: i32 vip_end_time
}

struct UserLoginReq {
    1: string wx_code
}

struct UserLoginResp {
    1: i32        code;
    2: string     message;
    3: Account    data;
}

struct UserDetailReq {
}

struct UserDetailResp {
    1: i32        code;
    2: string     message;
    3: Account    data;
}

service AccountService {
    UserLoginResp userLogin(1: UserLoginReq req)  (api.post="/account/login/");
    UserDetailResp userDetail(1: UserDetailReq req) (api.get="/account/detail/");
}