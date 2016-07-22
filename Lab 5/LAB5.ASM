link l1 : ct                  \ BEGIN
link l2 : rdm                  \
link ewh : 16                   \
                                 \
accept rdm_delay : 0              \ one cycle for address forming
                                   \
dw 00A0h : 00Ch                     \ X
dw 009Eh : 00Ah                      \ Y
dw 009Ch : 0000h                      \ A(Z)
dw 0000h : 000h                        \ Z
                                        \
accept r10 : 00A0h                       \ first address
       {xor nil, r10, r10; oey; ewh;}     \ high digits to zero
       {add nil, r10, z; oey; ewl;}        \ low digits to address
                                            \
ss1    {r; cjp rdm, ss1; add r11, bus_d, z;} \ read content
                                              \
       {sub r10, r10, 02h, nz;}                \ move to next address
       {or nil, r10, z; oey; ewl;}              \ low digits to address
                                                 \
ss2    {r; cjp rdm, ss2; sub r11, bus_d, nz;}     \ read and sub content
                                                   \
       {sub r10, r10, 02h, nz;}                     \ move to next address
       {or nil, r10, z; oey; ewl;}                   \ low digits to address
                                                      \
ss3    {r; cjp rdm, ss3; add nil, bus_d, z; ewl;}      \ read the address
ss4    {w; cjp rdm, ss4; add nil, r11, z; oey;}         \ write the content
                                                         \
       {}                                                 \ END
