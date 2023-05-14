namespace go chatflow.ielts

include "chat.thrift"

enum ExerciseMode {
    PART123  = 1  
    PART1    = 2  
    PART2    = 3  
    PART23   = 4  
}
enum ExerciseStatus {
    ONGOING   = 1  
    FINISHED  = 2  
}
enum OrderType {
    CREATED_ASC   = 1
    CREATED_DESC  = 2
    UPDATED_ASC   = 3
    UPDATED_DESC  = 4
}

struct Exercise {
    1: string           exercise_id;      
    2: ExerciseMode     mode;             
    3: ExerciseStatus   status;           
    4: i32              exercise_part;    
    5: string           part1_round_id;   
    6: string           part2_round_id;   
    7: string           part3_round_id;   
    8: i32              created_time;     
    9: i32              updated_time;     
}

struct GetStatusReq {
}

struct IeltsStatus {
    1: ExerciseStatus   status;     
    2: Exercise         exercise;   
}

struct GetStatusRsp {
    1: i32           code;      
    2: string        message;   
    3: IeltsStatus   data;      
}

struct GetExerciseListReq {
    1: i32          offset;
    2: i32          limit;
    3: OrderType    order_type;
}

struct ExerciseList {
    1: list<Exercise>   exercises;   
    2: i32              total;       
}

struct GetExerciseListRsp {
    1: i32            code;      
    2: string         message;   
    3: ExerciseList   data;      
}

struct GetExerciseDetailReq {
    1: string   exercise_id;   
}

struct GetExerciseDetailRsp {
    1: i32        code;      
    2: string     message;   
    3: Exercise   data;      
}

struct Exam {
    1: i32      exam_id;     
    4: string   exam_name;   
}

struct GetExamListReq {
    1: i32   offset;   
    2: i32   limit;    
}

struct ExamList {
    1: list<Exam>   exams;   
    2: i32          total;   
}

struct GetExamListRsp {
    1: i32        code;      
    2: string     message;   
    3: ExamList   data;      
}

struct StartExerciseReq {
    1: ExerciseMode   mode;   
}

struct StartExerciseData {
    1: string   exercise_id;   
}

struct StartExerciseRsp {
    1: i32                 code;      
    2: string              message;   
    3: StartExerciseData   data;      
}

struct StartPartReq {
    1: string   exercise_id;     
    2: i32      exercise_part;   
    3: i32      exam_id;         
}

struct StartPartData {
    1: string   round_id;     
    2: string   message_id;   
}

struct StartPartRsp {
    1: i32             code;      
    2: string          message;   
    3: StartPartData   data;      
}

struct FinishExerciseReq {
    1: string   exercise_id;   
}

struct FinishExerciseData {
}

struct FinishExerciseRsp {
    1: i32                  code;      
    2: string               message;   
    3: FinishExerciseData   data;      
}

struct SendMessageReq {
    1: string   exercise_id;     
    2: i32      exercise_part;   
    3: string   round_id;        
    4: string   content;         
    5: string   audio_url;
    6: i32      duration;
}

struct SendMessageData {
    1: chat.Message     message;            
    2: string           reply_message_id;   
    3: chat.RoundStat   round_stat;         
}

struct SendMessageRsp {
    1: i32               code;      
    2: string            message;   
    3: SendMessageData   data;      
}

service IeltsService {
    GetStatusRsp GetStatus(1: GetStatusReq req) (api.get = "/ielts/status/");

    GetExerciseListRsp GetExerciseList(1: GetExerciseListReq req) (api.get = "/ielts/exercise/list/");

    GetExerciseDetailRsp GetExerciseDetail(1: GetExerciseDetailReq req) (api.get = "/ielts/exercise/detail/");

    GetExamListRsp GetExamList(1: GetExamListReq req) (api.get = "/ielts/exam/list/");

    StartExerciseRsp StartExercise(1: StartExerciseReq req) (api.post = "/ielts/exercise/start/");

    StartPartReq StartPart(1: StartPartReq req) (api.post = "/ielts/part/start/");

    FinishExerciseRsp FinishExercise(1: FinishExerciseReq req) (api.post = "/ielts/exercise/finish/");

    SendMessageRsp SendMessage(1: SendMessageReq req) (api.post = "/ielts/message/send/");
}

