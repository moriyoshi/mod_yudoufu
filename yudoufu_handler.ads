with HTTPD;
with Interfaces.C;

function Yudoufu_Handler(Req : access HTTPD.Request_Rec) return Interfaces.C.Int;

pragma Export(C, Yudoufu_Handler, "yudoufu_handler");

