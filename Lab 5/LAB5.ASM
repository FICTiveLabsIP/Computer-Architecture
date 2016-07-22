link l1 : ct                  \ BEGIN
link l2 : rdm                  \
link ewh : 16                   \
                                 \
accept rdm_delay : 0              \ one cycle for address forming
                                   \
dw 004Ah : 00Ch                     \ X
dw 0048h : 0001h                     \ A(Y)
dw 0046h : 0000h                      \ A(Z)
dw 0000h : 000h                        \ Z
dw 0001h : 00Ah                         \ Y
                                         \
accept r8 : 004Ah                         \ first address
       {xor nil, r8, r8; oey; ewh;}        \ high digits to zero
       {add nil, r8, z; oey; ewl;}          \ low digits to address
                                             \
ss1    {r; cjp rdm, ss1; add r9, bus_d, z;}   \ read content
                                               \
       {sub r8, r8, 02h, nz;}                   \ move to next address
       {or nil, r8, z; oey; ewl;}                \ low digits to address
                                                  \
ss2    {r; cjp rdm, ss2; sub nil, bus_d, z; ewl;}  \ read and sub content
ss3    {r; cjp rdm, ss3; sub r9, bus_d, nz;}        \
       {sub r8, r8, 02h, nz;}                        \ move to next address
       {or nil, r8, z; oey; ewl;}                     \ low digits to address
                                                       \
ss4    {r; cjp rdm, ss4; add nil, bus_d, z; ewl;}       \ read the address
ss5    {w; cjp rdm, ss5; add nil, r9, z; oey;}           \ write the content
                                                          \
       {}                                                  \ END
