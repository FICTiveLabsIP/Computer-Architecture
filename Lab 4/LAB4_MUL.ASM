link l1: ct                \ MUL VAR 3

accept r0: 08001h          \Z(8-15) and Y
accept r1: 00000h          \Z(0-7)
accept r2: 00001h          \X

       { xor r1, r0; }
       { xor r1, r2; }
       { and r1, 08000h; }
       { and r0, 07FFFh; }
       { and r2, 07FFFh; }

       { push nz, 15;         }
       { or sl.16, r1, r1, z; }
       { or sl.25, r0, r0, z; }
       { cjp not rm_c, tag1;  }

       { add r1, r2; load rm, flags; }
       { add r0, r0, z, rm_c;        }
tag1   { rfct;                       }
