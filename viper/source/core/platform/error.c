#include<stdlib.h>
#include<errno.h>
#include<string.h>

#include<viper/core/platform/error.h>

/**
 * Internal helper functon to help with the copying of error message into the buffer.
 *
 * @param msg :: The message.
 * @param length :: The message length.
 * @param buffer :: The buffer where the msg will be copied to.
 * @param bufferSize :: The size of the buffer.
 *
 * @returns length on success and 0 on failure.
 */
static inline i64 __ViperErrnoCopy(const char* restrict msg, i64 length, char* restrict buffer, i64 bufferSize) {
         if (length > bufferSize) {
            return 0;
         };

         memcpy(buffer, msg, length);
         return length;
}

/**
 * The ViperErrnoToBuffer function is a replacment for the strerror_r
 * function, that comforms with Viper more then the orginal fuunction.
 *
 * @param eno :: The errno value.
 * @param buffer :: Tbe buffer where the data will be copied.
 * @param size :: Size is the size of the buffer.
 *
 * @return This functions return the length of the data copied
 * or it will return 0.
 *
 * @code
 * #include<stdio.h>
 * #include<string.h>
 *
 * int main() {
 *    char* buffer[256] = { "hello, " };
 *
 *    ViperErrnoToBuffer(1, buffer + strlen(buffer), 256 - strlen(buffer));
 *
 *    // will print "hello, EPERM(Operation not permitted)"
 *    puts(buffer);
 * }
 * @endcode
 */
inline i64 ViperErrnoToBuffer(int eno, char* buffer, i64 size) {
   switch(eno) {
      case EPERM:             return __ViperErrnoCopy("EPERM(Operation not permitted)",                              30, buffer, size); // 001
      case ENOENT:            return __ViperErrnoCopy("ENOENT(No such file or directory)",                           33, buffer, size); // 002
      case ESRCH:             return __ViperErrnoCopy("ESRCH(No such process)",                                      22, buffer, size); // 003
      case EINTR:             return __ViperErrnoCopy("EINTR(Interrupted system call)",                              30, buffer, size); // 004
      case EIO:               return __ViperErrnoCopy("EIO(IO error)",                                               33, buffer, size); // 005
      case ENXIO:             return __ViperErrnoCopy("ENXIO(No such device or address)",                            32, buffer, size); // 006
      case E2BIG:             return __ViperErrnoCopy("E2BIG(Argument list too long)",                               29, buffer, size); // 007
      case ENOEXEC:           return __ViperErrnoCopy("ENOEXEC(Exec format error)",                                  26, buffer, size); // 008
      case EBADF:             return __ViperErrnoCopy("EBADF(Bad file number)",                                      22, buffer, size); // 009
      case ECHILD:            return __ViperErrnoCopy("ECHILD(No child processes)",                                  26, buffer, size); // 010
      case EAGAIN:            return __ViperErrnoCopy("EAGAIN(Try again)",                                           17, buffer, size); // 011
      case ENOMEM:            return __ViperErrnoCopy("ENOMEM(Out of memory)",                                       21, buffer, size); // 012
      case EACCES:            return __ViperErrnoCopy("EACCES(Premission denined)",                                  26, buffer, size); // 013
      case EFAULT:            return __ViperErrnoCopy("EFAULT(Bad address)",                                         19, buffer, size); // 014
      case ENOTBLK:           return __ViperErrnoCopy("ENOTBLK(Block device required)",                              30, buffer, size); // 015
      case EBUSY:             return __ViperErrnoCopy("EBUSY(Device or resource is busy)",                           33, buffer, size); // 016
      case EEXIST:            return __ViperErrnoCopy("EEXIST(File exists)",                                         19, buffer, size); // 017
      case EXDEV:             return __ViperErrnoCopy("EXDEV(Cross-device link)",                                    24, buffer, size); // 018
      case ENODEV:            return __ViperErrnoCopy("ENODEV(No such device)",                                      22, buffer, size); // 019
      case ENOTDIR:           return __ViperErrnoCopy("ENOTDIR(Not a directory)",                                    24, buffer, size); // 020
      case EISDIR:            return __ViperErrnoCopy("EISDIR(Is a directory)",                                      22, buffer, size); // 021
      case EINVAL:            return __ViperErrnoCopy("EINVAL(Invalid argument)",                                    24, buffer, size); // 022
      case ENFILE:            return __ViperErrnoCopy("ENFILE(File table overflow)",                                 26, buffer, size); // 023
      case EMFILE:            return __ViperErrnoCopy("EMFILE(Too many open files)",                                 27, buffer, size); // 024
      case ENOTTY:            return __ViperErrnoCopy("ENOTTY(Not a typewriter)",                                    24, buffer, size); // 025
      case ETXTBSY:           return __ViperErrnoCopy("ETXTBSY(Text file busy)",                                     23, buffer, size); // 026
      case EFBIG:             return __ViperErrnoCopy("EFBIG(File too large)",                                       21, buffer, size); // 027
      case ENOSPC:            return __ViperErrnoCopy("ENOSPC(No space left on device)",                             31, buffer, size); // 028
      case ESPIPE:            return __ViperErrnoCopy("ESPIPE(Illgal seek)",                                         19, buffer, size); // 029
      case EROFS:             return __ViperErrnoCopy("EROFS(Read-only file system)",                                28, buffer, size); // 030
      case EMLINK:            return __ViperErrnoCopy("EMLINK(Too many open files)",                                 27, buffer, size); // 031
      case EPIPE:             return __ViperErrnoCopy("EPIPE(Broken pipe)",                                          18, buffer, size); // 032
      case EDOM:              return __ViperErrnoCopy("EDOM(Math argument out of domain of func)",                   41, buffer, size); // 033
      case ERANGE:            return __ViperErrnoCopy("ERANGE(Math result not representable)",                       37, buffer, size); // 034
      case EDEADLK:           return __ViperErrnoCopy("EDEADLK(Resource deadlock would occur)",                      38, buffer, size); // 035
      case ENAMETOOLONG:      return __ViperErrnoCopy("ENAMETOOLLONG(File name too long)",                           33, buffer, size); // 036
      case ENOLCK:            return __ViperErrnoCopy("ENOLCK(No record locks available)",                           33, buffer, size); // 037
      case ENOSYS:            return __ViperErrnoCopy("ENOSYS(Function not implemented)",                            32, buffer, size); // 038
      case ENOTEMPTY:         return __ViperErrnoCopy("ENOTEMPTY(Directory not empty)",                              30, buffer, size); // 039
      case ELOOP:             return __ViperErrnoCopy("ELOOP(Too many symbolic linkes encountered)",                 43, buffer, size); // 040
      case 41:                return __ViperErrnoCopy("UNKNOWN(Unkown error)",                                       21, buffer, size); // 041
      case ENOMSG:            return __ViperErrnoCopy("ENOMDG(No message of desired type)",                          32, buffer, size); // 042
      case EIDRM:             return __ViperErrnoCopy("EIDRM(Identifier removed)",                                   25, buffer, size); // 043
      case ECHRNG:            return __ViperErrnoCopy("ECHRNG(Channel number out of range)",                         35, buffer, size); // 044
      case EL2NSYNC:          return __ViperErrnoCopy("EL2NSYNC(Level 2 not synchronized)",                          34, buffer, size); // 045
      case EL3HLT:            return __ViperErrnoCopy("EL3HLT(Level 3 halted)",                                      22, buffer, size); // 046
      case EL3RST:            return __ViperErrnoCopy("EL3RST(Level 3 reset)",                                       21, buffer, size); // 047
      case ELNRNG:            return __ViperErrnoCopy("ELNRNG(Linked number out off of range)",                      38, buffer, size); // 048
      case EUNATCH:           return __ViperErrnoCopy("EUNATCH(Protocol drive not attached)",                        36, buffer, size); // 049
      case ENOCSI:            return __ViperErrnoCopy("ENOCSI(No CSI structure available)",                          34, buffer, size); // 050
      case EL2HLT:            return __ViperErrnoCopy("EL2HLT(Level 2 halted)",                                      22, buffer, size); // 051
      case EBADE:             return __ViperErrnoCopy("EBADE(Invalid exchange)",                                     23, buffer, size); // 052
      case EBADR:             return __ViperErrnoCopy("EBADR(Invalid request description)",                          34, buffer, size); // 053
      case EXFULL:            return __ViperErrnoCopy("EXFULL(Exchange full)",                                       21, buffer, size); // 054
      case ENOANO:            return __ViperErrnoCopy("ENOANO(No anode)",                                            16, buffer, size); // 055
      case EBADRQC:           return __ViperErrnoCopy("EBADRQC(Invalid request code)",                               29, buffer, size); // 056
      case EBADSLT:           return __ViperErrnoCopy("EBADSLT(Invalid slot)",                                       21, buffer, size); // 057
      case 58:                return __ViperErrnoCopy("UNKNOWN(Unkown error)",                                       21, buffer, size); // 058
      case EBFONT:            return __ViperErrnoCopy("EBFONT(Bad file file format)",                                28, buffer, size); // 059
      case ENOSTR:            return __ViperErrnoCopy("ENOSTR(Device not a stream)",                                 27, buffer, size); // 060
      case ENODATA:           return __ViperErrnoCopy("ENODATA(No data available)",                                  26, buffer, size); // 061
      case ETIME:             return __ViperErrnoCopy("ETIME(Timer expired)",                                        20, buffer, size); // 062
      case ENOSR:             return __ViperErrnoCopy("ENOSR(Out of stream resources)",                              30, buffer, size); // 063
      case ENONET:            return __ViperErrnoCopy("ENONET(Machine is not on the network)",                       37, buffer, size); // 064
      case ENOPKG:            return __ViperErrnoCopy("ENOPKG(Package not installed)",                               29, buffer, size); // 065
      case EREMOTE:           return __ViperErrnoCopy("EREMOTE(Object is remote)",                                   25, buffer, size); // 066
      case ENOLINK:           return __ViperErrnoCopy("ENOLINK(Link has been severed)",                              30, buffer, size); // 067
      case EADV:              return __ViperErrnoCopy("EADV(Advertise error)",                                       21, buffer, size); // 068
      case ESRMNT:            return __ViperErrnoCopy("ESRMNT(Srmount error)",                                       21, buffer, size); // 069
      case ECOMM:             return __ViperErrnoCopy("ECOMM(Communication error on send)",                          34, buffer, size); // 070
      case EPROTO:            return __ViperErrnoCopy("EPROTO(Protocol error)",                                      22, buffer, size); // 071
      case EMULTIHOP:         return __ViperErrnoCopy("EMULTIHOP(Multihop attempted)",                               29, buffer, size); // 072
      case EDOTDOT:           return __ViperErrnoCopy("EDOTDOT(RFS specific error)",                                 27, buffer, size); // 073
      case EBADMSG:           return __ViperErrnoCopy("EBADMSG(Not a data message)",                                 27, buffer, size); // 074
      case EOVERFLOW:         return __ViperErrnoCopy("EOVERFLOW(Value to large for defined data type)",             47, buffer, size); // 075
      case ENOTUNIQ:          return __ViperErrnoCopy("ENOTUNIQ(Name not unique on network)",                        36, buffer, size); // 076
      case EBADFD:            return __ViperErrnoCopy("EBADFD(File descriptor in bad state)",                        36, buffer, size); // 077
      case EREMCHG:           return __ViperErrnoCopy("EREMCHG(Remote address changed)",                             31, buffer, size); // 078
      case ELIBACC:           return __ViperErrnoCopy("ELIBACC(Can not access a needed shared library)",             47, buffer, size); // 079
      case ELIBBAD:           return __ViperErrnoCopy("ELIBBAD(Accessing a corrupted shaed library)",                44, buffer, size); // 080
      case ELIBSCN:           return __ViperErrnoCopy("ELIBSCN(.lib section in a.out corrupted)",                    40, buffer, size); // 081
      case ELIBMAX:           return __ViperErrnoCopy("ELIBMAX(Attempting tp link too many shared libraries)",       53, buffer, size); // 082
      case ELIBEXEC:          return __ViperErrnoCopy("ELIBEXEC(Cannot exec a shared library directly)",             46, buffer, size); // 083
      case EILSEQ:            return __ViperErrnoCopy("EILSEQ(Illegal bytes sequence)",                              30, buffer, size); // 084
      case ERESTART:          return __ViperErrnoCopy("ERESTART(Interuppted system call should be restarted)",       53, buffer, size); // 085
      case ESTRPIPE:          return __ViperErrnoCopy("ESTRPIPE(Streams pipe error)",                                28, buffer, size); // 086
      case EUSERS:            return __ViperErrnoCopy("EUSERS(Too many users)",                                      22, buffer, size); // 087
      case ENOTSOCK:          return __ViperErrnoCopy("ENOTSOCK(Socket operation on non-socket)",                    40, buffer, size); // 088
      case EDESTADDRREQ:      return __ViperErrnoCopy("EDESTADDRREQ(Destination address required)",                  42, buffer, size); // 089
      case EMSGSIZE:          return __ViperErrnoCopy("EMSGSIZE(Message too long)",                                  26, buffer, size); // 090
      case EPROTOTYPE:        return __ViperErrnoCopy("EPROTOTYPE(Protocol wrong type for socket)",                  42, buffer, size); // 091
      case ENOPROTOOPT:       return __ViperErrnoCopy("ENOPROTOOPT(Address family not supported by socket)",         51, buffer, size); // 092
      case EPROTONOSUPPORT:   return __ViperErrnoCopy("EPROTONOSUPPORT(Protocol not supported)",                     39, buffer, size); // 093
      case ESOCKTNOSUPPORT:   return __ViperErrnoCopy("ESOCKNOSUPPORT(Socket type not supported)",                   41, buffer, size); // 094
      case EOPNOTSUPP:        return __ViperErrnoCopy("EOPNOTSUPP(Operation not supporeted on transport endpoint)",  58, buffer, size); // 095
      case EPFNOSUPPORT:      return __ViperErrnoCopy("EPFNOSOPPORT(Protocol family not supported)",                 43, buffer, size); // 096
      case EAFNOSUPPORT:      return __ViperErrnoCopy("EAFNOSUPPORT(Address family not supported by protocol)",      54, buffer, size); // 097
      case EADDRINUSE:        return __ViperErrnoCopy("EADDRINUSE(Address already in use)",                          34, buffer, size); // 098
      case EADDRNOTAVAIL:     return __ViperErrnoCopy("EADDRNOTAVAIL(Cannot assign requested address)",              46, buffer, size); // 099
      case ENETDOWN:          return __ViperErrnoCopy("ENETDOWN(Network is down)",                                   25, buffer, size); // 100
      case ENETUNREACH:       return __ViperErrnoCopy("ENETUNREACH(Network is unreachable)",                         35, buffer, size); // 101
      case ENETRESET:         return __ViperErrnoCopy("ENETRESET(Network dropped connection because of reset)",      54, buffer, size); // 102
      case ECONNABORTED:      return __ViperErrnoCopy("ECONNABORTED(Software caused connection abort)",              46, buffer, size); // 103
      case ECONNRESET:        return __ViperErrnoCopy("ECONNRESET(Connection reseted by peer)",                      38, buffer, size); // 104
      case ENOBUFS:           return __ViperErrnoCopy("ENOBUFS(No buffer space available)",                          34, buffer, size); // 105
      case EISCONN:           return __ViperErrnoCopy("EISCONN(Transport endpoint is already connected)",            48, buffer, size); // 106
      case ENOTCONN:          return __ViperErrnoCopy("ENOTCONN(Transport endpoint is not connected)",               48, buffer, size); // 107
      case ESHUTDOWN:         return __ViperErrnoCopy("ESHUTDOWN(Cannot send after transport endpoint shutdown)",    56, buffer, size); // 108
      case ETOOMANYREFS:      return __ViperErrnoCopy("ETOOMANYREFS(Too many references: cannot splice)",            48, buffer, size); // 109
      case ETIMEDOUT:         return __ViperErrnoCopy("ETIMEOUT(Connectin timed out)",                               29, buffer, size); // 110
      case ECONNREFUSED:      return __ViperErrnoCopy("ECONNREFUSED(Connection refused)",                            32, buffer, size); // 111
      case EHOSTDOWN:         return __ViperErrnoCopy("EHOSTDOWN(Host is down)",                                     23, buffer, size); // 112
      case EHOSTUNREACH:      return __ViperErrnoCopy("EHOSTUNREACH(No route to host)",                              30, buffer, size); // 113
      case EALREADY:          return __ViperErrnoCopy("EALREADY(Operation already in progress)",                     39, buffer, size); // 114
      case EINPROGRESS:       return __ViperErrnoCopy("EINPROGRESS(Operation now in progress)",                      38, buffer, size); // 115
      case ESTALE:            return __ViperErrnoCopy("ESTALE(Stale NFS file handle)",                               29, buffer, size); // 116
      case EUCLEAN:           return __ViperErrnoCopy("EUCLEAN(Structure needs cleaning)",                           33, buffer, size); // 117
      case ENOTNAM:           return __ViperErrnoCopy("ENOTNAM(Not a XENIX named type file)",                        36, buffer, size); // 118
      case ENAVAIL:           return __ViperErrnoCopy("ENAVAIL(No XENIX semaphores available)",                      38, buffer, size); // 119
      case EISNAM:            return __ViperErrnoCopy("EISNAME(Is a named type file)",                               29, buffer, size); // 120
      case EREMOTEIO:         return __ViperErrnoCopy("EREMOTEIO(Remote IO error)",                                  26, buffer, size); // 121
      case EDQUOT:            return __ViperErrnoCopy("EDQUOT(Quata exceeded)",                                      22, buffer, size); // 122
      case ENOMEDIUM:         return __ViperErrnoCopy("ENOMEDIUM(No medium found)",                                  26, buffer, size); // 123
      case EMEDIUMTYPE:       return __ViperErrnoCopy("EMEDIUMTYPE(Wrong media type)",                               29, buffer, size); // 124
      case ECANCELED:         return __ViperErrnoCopy("ECANCELED(Operation canceled)",                               29, buffer, size); // 125
      case ENOKEY:            return __ViperErrnoCopy("ENOKEY(Required key not available)",                          34, buffer, size); // 126
      case EKEYEXPIRED:       return __ViperErrnoCopy("EKEYEXPIRED(Key expired)",                                    24, buffer, size); // 127
      case EKEYREVOKED:       return __ViperErrnoCopy("EKEYREVOKED(Key has been revoked)",                           33, buffer, size); // 128
      case EKEYREJECTED:      return __ViperErrnoCopy("EKEYREJECTED(Key was rejected by server)",                    40, buffer, size); // 129
      case EOWNERDEAD:        return __ViperErrnoCopy("EOWNERDEAD(Owner died)",                                      22, buffer, size); // 130
      case ENOTRECOVERABLE:   return __ViperErrnoCopy("ENOTRECOVERABLE(State not recoverable)",                      38, buffer, size); // 131
      case 132:               return __ViperErrnoCopy("UNKNOWN(Unkown error)",                                       21, buffer, size); // 131
   }

   return 0;
}
