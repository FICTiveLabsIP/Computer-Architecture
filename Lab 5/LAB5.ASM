link L1 : ct
link L2 : rdm
link ewh: 16

accept rdm_delay: 0

dw 001Ah: 000h  \ A(x)
dw 0018h: 001h  \ A(y)
dw 0016h: 002h  \ A(z)
dw 0000h: 037h  \ x
dw 0001h: 00Ah  \ y
dw 0002h: 000h  \ z

accept r12: 001Ah

       { xor nil, r12, r12; oey; ewh; }
       { add nil, r12, z; oey; ewl;   }

tag1   { r; cjp rdm, tag1; add nil, bus_d, z; ewl; }
tag2   { r; cjp rdm, tag2; add r13, bus_d, z;      }

       { sub r12, r12, 02h, nz;     }
       { add nil, r12, z; oey; ewl; }

tag3   { r; cjp rdm, tag3; add nil, bus_d, z; ewl; }
tag4   { r; cjp rdm, tag4; sub r13, bus_d, nz;     }

       { sub r12, r12, 02h, nz; }
       { add nil, r12, z; oey; ewl; }

tag5   { r; cjp rdm, tag5; add nil, bus_d, z; ewl; }
tag6   { w; cjp rdm, tag6; add nil, r13, z; oey;   }

       {}
