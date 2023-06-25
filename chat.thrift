namespace go chatflow.chat

include "base.thrift"

struct GetRandomSceneReq {
    1: base.ChatType           chat_type;
    2: base.ChatLevel          chat_level;
}
struct SceneData {
    1: base.Scene              scene;
}
struct GetRandomSceneRsp {
    1: i32                      code;
    2: string                   message;
    3: SceneData                data;
}

struct GetSceneListReq {
    1: base.ChatType           chat_type;
    2: base.ChatLevel          chat_level;
    3: i32                      offset;
    4: i32                      limit;
}
struct SceneList {
    1: list<base.Scene>        scenes;
    2: i32                      total;
}
struct GetSceneListRsp {
    1: i32                      code;
    2: string                   message;
    3: SceneList              data;
}

struct GetSceneDetailReq {
    1: base.ChatType           chat_type;
    2: i32                      scene_id;
}
struct GetSceneDetailRsp {
    1: i32                      code;
    2: string                   message;
    3: SceneData                data;
}

struct StartRoundReq {
    1: base.ChatType           chat_type;
    2: i32                      scene_id;
    3: base.ChatMode           chat_mode;
    4: base.ChatLevel          chat_level;
    5: string                   group_id;
}
struct StartRoundData {
    1: base.Message            ai_message;
    2: base.Round              round;
}
struct StartRoundRsp {
    1: i32                      code;
    2: string                   message;
    3: StartRoundData           data;
}

struct FinishRoundReq {
    1: string                   round_id;
}
struct RoundData {
    1: base.Round              round;
}
struct FinishRoundRsp {
    1: i32                      code;
    2: string                   message;
    3: RoundData                data;
}

struct GetRoundReq {
    1: string                   round_id;
}
struct GetRoundRsp {
    1: i32                      code;
    2: string                   message;
    3: RoundData                data;
}

struct GetRoundListReq {
    1: base.ChatType           chat_type;
    2: base.ChatMode           chat_mode;
    3: base.ChatLevel          chat_level;
    4: string                   group_id;
    5: i32                      scene_id;
    6: base.OrderType          order_type;
    7: i32                      offset;
    8: i32                      limit;
}
struct RoundList {
    1: list<base.Round>        rounds;
    2: i32                      total;
}
struct GetRoundListRsp {
    1: i32                      code;
    2: string                   message;
    3: RoundList                data;
}

struct SendMessageReq {
    1: string                   round_id;
    2: string                   content;
    3: string                   audio_url;
    4: i32                      duration;
    5: double                   score;
}
struct SendMessageData {
    1: base.Message             ai_message;
    2: base.Round              round;
}
struct SendMessageRsp {
    1: i32                      code;
    2: string                   message;
    3: SendMessageData          data;
}

struct GetMessageReq {
    1: string                   message_id;
}
struct MessageData {
    1: base.Message            message;
}
struct GetMessageRsp {
    1: i32                      code;
    2: string                   message;
    3: MessageData              data;
}

struct UpdateMessageReq {
    1: string                   message_id;
    2: string                   audio_url;
}
struct UpdateMessageRsp {
    1: i32                      code;
    2: string                   message;
}

struct GetMessageListReq {
    1: base.ChatType           chat_type;
    2: base.ChatMode           chat_mode;
    3: base.ChatLevel          chat_level;
    4: string                   round_id;
    5: string                   end_message_id;
    6: base.OrderType          order_type;
    7: i32                      offset;
    8: i32                      limit;
}
struct MessageList {
    1: list<base.Message>      messages;
    2: i32                      total;
    3: base.Round              round;
}
struct GetMessageListRsp {
    1: i32                      code;
    2: string                   message;
    3: MessageList              data;
}

enum TipType {
    ECTRANSLATE                 = 1
    TEACHME                     = 2
    IMPROVE                     = 3
    CETRANSLATE                 = 4
    SPEAK                       = 5
}
struct GetMessageTipReq {
    1: string                   message_id;
    2: string                   content;
    3: TipType                  tip_type;
}
struct MessageTip {
    1: string                   ec_translate;
    2: string                   candidates;
    3: string                   examples;
    4: string                   grammar;
    5: string                   optimization;
    6: string                   ce_translate;
    7: string                   audio_url;
}
struct GetMessageTipRsp {
    1: i32                      code;
    2: string                   message;
    3: MessageTip               data;
}

service ChatService {
    GetRandomSceneRsp   GetRandomScene( 1: GetRandomSceneReq req)   (api.get    =   "/chat/scene/random/");
    GetSceneListRsp     GetSceneList(   1: GetSceneListReq req)     (api.get    =   "/chat/scene/list/");
    GetSceneDetailRsp   GetSceneDetail( 1: GetSceneDetailReq req)   (api.get    =   "/chat/scene/detail/");

    StartRoundRsp       StartRound(     1: StartRoundReq req)       (api.post   =   "/chat/round/start/");
    FinishRoundRsp      FinishRound(    1: FinishRoundReq req)      (api.post   =   "/chat/round/finish/");
    GetRoundRsp         GetRound(       1: GetRoundReq req)         (api.get    =   "/chat/round/detail/");
    GetRoundListRsp     GetRoundList(   1: GetRoundListReq req)     (api.get    =   "/chat/round/list/");

    SendMessageRsp      SendMessage(    1: SendMessageReq req)      (api.post   =   "/chat/message/send/");
    GetMessageRsp       GetMessage(     1: GetMessageReq req)       (api.get    =   "/chat/message/detail/");
    UpdateMessageRsp    UpdateMessage(  1: UpdateMessageReq req)    (api.post   =   "/chat/message/update/");
    GetMessageListRsp   GetMessageList( 1: GetMessageListReq req)   (api.get    =   "/chat/message/list/");
    GetMessageTipRsp    GetMessageTip(  1: GetMessageTipReq req)    (api.post   =   "/chat/message/tip/");
}
