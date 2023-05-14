namespace go chatflow.recharge

enum ServiceType {
    CONTRACT = 1
    INDIVIDUAL = 2
}

enum PayResultType{
    NOT_PAID = 0
    PAID = 1
    CANCELLED = 2
}

struct PaidService {
  1: i32 service_id
  2: string service_name
  3: ServiceType service_type
  4: string price
  5: string daily_price
  6: string undiscount_price
  7: i32 is_discount
  8: string description
}

struct VipRechargeListReq {
}

struct VipRechargeListResp {
  1: i32         code;
  2: string      message;
  3: VipRechargeList   data;
}

struct VipRechargeList {
  1: list<PaidService> paid_services
  2: i32 total
}

struct PrepayReq {
  1: i32 service_id
}

struct PrepayResp {
  1: i32         code;
  2: string      message;
  3: Prepay   data;
}

struct Prepay{
  1: string prepay_id
  2: string out_trade_no
  3: string pay_sign
  4: string nonce_str
  5: string time_stamp
}

struct PayResultReq {
  1: string out_trade_no
}

struct PayResultResp {
  1: i32         code;
  2: string      message;
  3: PayResult   data;
}

struct PayResult {
  1: PayResultType pay_result
}

struct NotifyCallBackReq {
}

struct NotifyCallBackResp {
}

service RechargeService {
  VipRechargeListResp getVipRechargeList(1: VipRechargeListReq req) (api.get="/recharge/paid_service/list/");
  PrepayResp getPrepay(1: PrepayReq req) (api.post="/recharge/paid_service/prepay/");
  PayResultResp getPayResult(1: PayResultReq req) (api.get="/recharge/paid_service/pay_result/");
  NotifyCallBackResp notifyCallBack(1: NotifyCallBackReq req) (api.post="/recharge/paid_service/notify_callback/");
}