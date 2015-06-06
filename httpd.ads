with System;
with Ada.Unchecked_Conversion;
with Interfaces.C;
with Interfaces.C.Strings;

package HTTPD is
  package C renames Interfaces.C;
  use Interfaces;

  type Apr_Pool is null record with Convention => C;

  type Apr_Array_Header is null record with Convention => C;

  type Ap_Method_List is null record with Convention => C;

  type Apr_Bucket_Brigade is null record with Convention => C;

  type Apr_Table is null record with Convention => C;

  type Argv_Type is array(Integer range <>) of C.Strings.Chars_Ptr
    with Convention => C;

  type Process_Rec is
    record
      Pool : access Apr_Pool;
      Pconf : access Apr_Pool;
      Short_Name : C.Strings.Chars_Ptr;
      Argv : C.Strings.Chars_Ptr_Array(0..255);
    end record
      with Convention => C;

  type Server_Rec is
    record
      Process : access Process_Rec;
      Next : access Server_Rec;
      Error_Fname : C.Strings.Chars_Ptr;
    end record
      with Convention => C;

  type Conn_Rec is
    record
      Dummy : Integer;
    end record
      with Convention => C;

  type Request_Rec is
    record
      Pool : access Apr_Pool;
      Connection : access Conn_Rec;
      Server : access Server_Rec;
      Next : access Request_Rec;
      Prev : access Request_Rec;
      Main : access Request_Rec;
      The_Request : C.Strings.Chars_Ptr;
      AssBackwards : C.Int;
      ProxyReq : C.Int;
      Header_Only : C.Int;
      Proto_Num : C.Int;
      Protocol : C.Strings.Chars_Ptr;
      Hostname : C.Strings.Chars_Ptr;
      Request_Time : Integer_64;
      Status_Line : C.Strings.Chars_Ptr;
      Status : C.Int;
      Method_Number : C.Int;
      Method : C.Strings.Chars_Ptr;
      Allowed : Integer_64;
      Allowed_XMethods : access Apr_Array_Header;
      Allowed_Methods : access Ap_Method_List;
      Send_BodyCt : Integer_64;
      Bytes_Sent : Integer_64;
      MTime : Integer_64;
      Range_Str : C.Strings.Chars_Ptr;
      CLength : Integer_64;
      Chunked : C.Int;
      Read_Body : C.Int;
      Read_Chunked : C.Int;
      Expecting_100 : C.Unsigned;
      Kept_Body : access Apr_Bucket_Brigade;
      Body_Table : access Apr_Table;
      Remaining : Integer_64;
      Read_Length : Integer_64;
      Headers_In : access Apr_Table;
      Headers_Out : access Apr_Table;
      Err_Headers_Out : access Apr_Table;
      Subprocess_Env: access Apr_Table;
      Notes: access Apr_Table;
      Content_Type : C.Strings.Chars_Ptr;
      Handler : C.Strings.Chars_Ptr;
      Content_Encoding : C.Strings.Chars_Ptr;
    end record
      with Convention => C;

  procedure Ap_RPuts (Str : in String; Req : access Request_Rec);

  function to_chars_ptr is new Ada.Unchecked_Conversion (System.Address, C.Strings.Chars_Ptr);

  OK : constant := 0;
  DECLINED : constant := -1;
end HTTPD;

-- vim: sts=2 sw=2 ts=2 et
