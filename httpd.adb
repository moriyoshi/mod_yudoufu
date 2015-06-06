with System;
with Ada.Unchecked_Conversion;
with Interfaces.C;
with Interfaces.C.Strings;

package body HTTPD is 
  procedure C_ap_rwrite (Str : C.Strings.Chars_Ptr; Len : C.Size_t; Req : access Request_Rec)
    with Import => True, Convention => C, External_Name => "ap_rwrite";
  function C_strlen (Str : C.Strings.Chars_Ptr) return C.Size_t
    with Import => True, Convention => C, External_Name => "strlen";

  procedure Ap_RPuts (Str : in String; Req : access Request_Rec) is
    CStr : C.Char_Array := C.To_C (Str);
    StrPtr : C.Strings.Chars_Ptr := to_chars_ptr (CStr(CStr'First)'Address);
  begin
    C_ap_rwrite (StrPtr, C_strlen(StrPtr), Req);
  end;
end HTTPD;

-- vim: sts=2 sw=2 ts=2 et
