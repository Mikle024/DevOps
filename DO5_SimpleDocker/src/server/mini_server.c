#include <fcgiapp.h>
#include <stdio.h>

int main(void) {
  FCGX_Init();
  FCGX_Request request;
  if (FCGX_InitRequest(&request, 0, FCGI_FAIL_ACCEPT_ON_INTR) != 0) {
    return 1;
  }

  while (FCGX_Accept_r(&request) == 0) {
    FCGX_FPrintF(request.out, "Content-type: text/html\r\n");
    FCGX_FPrintF(request.out, "\r\n");
    FCGX_FPrintF(request.out, "<html>\n");
    FCGX_FPrintF(request.out, "<head>\n");
    FCGX_FPrintF(request.out, "<title>Hello World!</title>\n");
    FCGX_FPrintF(request.out, "</head>\n");
    FCGX_FPrintF(request.out, "<body>\n");
    FCGX_FPrintF(request.out, "<h1><center>Hello World!</center></h1>\n");
    FCGX_FPrintF(request.out, "</body>\n");
    FCGX_FPrintF(request.out, "</html>\n");
    FCGX_Finish_r(&request);
  }
  return 0;
}