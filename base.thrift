namespace go ai_partner.base

struct Response {
    1: i32 code (api.query="code", api.body="code");
    2: string message (api.query="message", api.body="message");
}