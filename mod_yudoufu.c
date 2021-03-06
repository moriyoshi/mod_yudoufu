/* 
**  mod_yudoufu.c -- Apache sample yudoufu module
**  [Autogenerated via ``apxs -n yudoufu -g'']
**
**  To play with this sample module first compile it into a
**  DSO file and install it into Apache's modules directory 
**  by running:
**
**    $ apxs -c -i mod_yudoufu.c
**
**  Then activate it in Apache's httpd.conf file for instance
**  for the URL /yudoufu in as follows:
**
**    #   httpd.conf
**    LoadModule yudoufu_module modules/mod_yudoufu.so
**    <Location /yudoufu>
**    SetHandler yudoufu
**    </Location>
**
**  Then after restarting Apache via
**
**    $ apachectl restart
**
**  you immediately can request the URL /yudoufu and watch for the
**  output of this module. This can be achieved for instance via:
**
**    $ lynx -mime_header http://localhost/yudoufu 
**
**  The output should be similar to the following one:
**
**    HTTP/1.1 200 OK
**    Date: Tue, 31 Mar 1998 14:42:22 GMT
**    Server: Apache/1.3.4 (Unix)
**    Connection: close
**    Content-Type: text/html
**  
**    The sample page from mod_yudoufu.c
*/ 

#include "httpd.h"
#include "http_config.h"
#include "http_protocol.h"
#include "ap_config.h"

int yudoufu_handler(request_rec *r);

extern void adainit(void);
extern void adafinal(void);

static void yudoufu_register_hooks(apr_pool_t *p)
{
    adainit();
    ap_hook_handler(yudoufu_handler, NULL, NULL, APR_HOOK_MIDDLE);
}

/* Dispatch list for API hooks */
module AP_MODULE_DECLARE_DATA yudoufu_module = {
    STANDARD20_MODULE_STUFF, 
    NULL,                  /* create per-dir    config structures */
    NULL,                  /* merge  per-dir    config structures */
    NULL,                  /* create per-server config structures */
    NULL,                  /* merge  per-server config structures */
    NULL,                  /* table of config file commands       */
    yudoufu_register_hooks  /* register hooks                      */
};

