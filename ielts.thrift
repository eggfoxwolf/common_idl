namespace go chatflow.ielts

include "base.thrift"

enum ExerciseMode {
    PART123                     = 1
    PART1                       = 2
    PART2                       = 3
    PART23                      = 4
}

enum ExerciseStatus {
    ONGOING                     = 1
    FINISHED                    = 2
}

struct Evaluation {
    1: double                   overall_score;
    2: double                   fluency;
    3: double                   tone;
    4: double                   grammar;
    5: double                   vocabulary;
    6: double                   pronunciation;
}

struct Exercise {
    1: string                   exercise_id;
    2: ExerciseMode             mode;
    3: ExerciseStatus           status;
    4: i32                      exercise_part;
    5: string                   part1_round_id;
    6: string                   part2_round_id;
    7: string                   part3_round_id;
    8: Evaluation               evaluation;
    9: i32                      created_time;
    10:i32                      updated_time;
}

struct GetStatusReq {
}
struct IeltsStatus {
    1: ExerciseStatus           status;
    2: Exercise                 exercise;
}
struct GetStatusRsp {
    1: i32                      code;
    2: string                   message;
    3: IeltsStatus              data;
}

struct GetExerciseListReq {
    1: i32                      offset;
    2: i32                      limit;
    3: base.OrderType          order_type;
}
struct ExerciseList {
    1: list<Exercise>           exercises;
    2: i32                      total;
}
struct GetExerciseListRsp {
    1: i32                      code;
    2: string                   message;
    3: ExerciseList             data;
}

struct GetExerciseDetailReq {
    1: string                   exercise_id;
}
struct ExerciseData {
    1: Exercise                 exercise;
}
struct GetExerciseDetailRsp {
    1: i32                      code;
    2: string                   message;
    3: ExerciseData             data;
}

struct Exam {
    1: i32                      exam_id;
    4: string                   exam_name;
}
struct GetExamListReq {
    1: i32                      offset;
    2: i32                      limit;
}
struct ExamList {
    1: list<Exam>               exams;
    2: i32                      total;
}
struct GetExamListRsp {
    1: i32                      code;
    2: string                   message;
    3: ExamList                 data;
}

struct StartExerciseReq {
    1: ExerciseMode             mode;
    2: i32                      exam_id;
}
struct StartExerciseData {
    1: string                   exercise_id;
}
struct StartExerciseRsp {
    1: i32                      code;
    2: string                   message;
    3: StartExerciseData        data;
}

struct FinishExerciseReq {
    1: string                   exercise_id;
}

struct FinishExerciseRsp {
    1: i32                      code;
    2: string                   message;
    3: ExerciseData             data;
}

service IeltsService {
    GetStatusRsp            GetStatus(          1: GetStatusReq req)            (api.get    =   "/ielts/status/");

    GetExamListRsp          GetExamList(        1: GetExamListReq req)          (api.get    =   "/ielts/exam/list/");

    GetExerciseListRsp      GetExerciseList(    1: GetExerciseListReq req)      (api.get    =   "/ielts/exercise/list/");
    GetExerciseDetailRsp    GetExerciseDetail(  1: GetExerciseDetailReq req)    (api.get    =   "/ielts/exercise/detail/");
    StartExerciseRsp        StartExercise(      1: StartExerciseReq req)        (api.post   =   "/ielts/exercise/start/");
    FinishExerciseRsp       FinishExercise(     1: FinishExerciseReq req)       (api.post   =   "/ielts/exercise/finish/");
}

