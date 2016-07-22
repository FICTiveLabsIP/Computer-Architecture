              \
link l1: ct    \
                \
accept r1: 000Ch \X1 = 12
accept r2: 0002h  \X2 = 2
accept r3: 0000h   \X3 = 0
accept r4: 000Fh    \X4 = 15
                     \ F = 8*(X1 ^ X2) + (X3-1-X4)/16
{ or r1,r1,r2;}       \ X1 ^ X2
{ sub r3, r3, r4;}     \ X3-X4
{ push nz, 2;}          \ DO 3 times
{ or sla, r1, r1;}       \ 2*(X1 ^ X2)
{ cjp z, tag1; }          \ WHILE 0
{rfct;}                    \
                            \
tag1 { push nz, 3;}          \ DO 4 times
{ or sra, r3, r3;}            \ (X3-1-X4)/2
{ cjp z, tag2;}                \ WHILE 0
{ rfct;}                        \
                                 \
                                  \
tag2 { add rq, r1, r3, z;}         \ 8*(X1 ^ X2) + (X3-1-X4)/16
