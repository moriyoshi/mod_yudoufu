with HTTPD;
with Interfaces.C.Strings;
with Ada.Text_IO;

function Yudoufu_Handler(Req : access HTTPD.Request_Rec) return Interfaces.C.Int is
  package C renames Interfaces.C;
  use Interfaces.C;
  Handler_Name : String := C.Strings.Value (Req.Handler);
  Content_Type : C.Char_Array := C.To_C ("text/html; charset=UTF-8");
  Image_Data : String := "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";

begin
  if Handler_Name /= "yudoufu-handler" then
    return HTTPD.DECLINED;
  end if;
    
  Req.Content_Type := HTTPD.To_Chars_Ptr (Content_Type(Content_Type'First)'Address);

  if Req.Header_Only = C.Int(0) then
    HTTPD.Ap_RPuts (
      "<!DOCTYPE html>" &
      "<html>"&
      "<head>" &
      "<meta charset=""UTF-8"">" &
      "<title>mod_yudoufu</title>" &
      "</head>" &
      "<body style=""background:url(data:image/jpeg;base64," & Image_Data & ") repeat"">" &
      "</body>" &
      "</html>", Req);
  end if;
  return HTTPD.OK;
end Yudoufu_Handler;
  
-- vim: sts=2 sw=2 ts=2 et
