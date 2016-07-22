link l1: ct               \
accept r0: 0h              \Z(8-15)
accept r1: 0h               \Z(0-7)
accept r3: 1000000000000111% \X
accept r2: 0000000000000101%  \Y
accept r5: 0FFFFh              \
accept r6: 0h                   \SIGN OF X
accept r7: 0h                    \SIGN OF Y
                                  \
          {or r6, r3;}             \
          {or r7, r2;}              \
          {or sll, r3,r3;}           \Without Sign
          {or sll, r2,r2;}            \
          {or srl, r3,r3;}             \
          {or srl, r2,r2;}              \
          {xor r6, r3;}                  \Sign of X
          {xor r7, r2;}                   \Sign of Y
          {add r6,r7;}                     \
          {load rm, flags;}                 \Mult Start
extag     {or srl, r2,r2,z;}                 \DO shiftr
          {cjp not rm_c,tag;}                 \
          {add r1, r3;cjp not co, tag;}        \R1=R1+R3
          {add r0, r0, 1;}                      \R0=R0+1 if overflow
tag       {or sll, r3, r3,z;}                    \Shiftl
          {or r2,r2, z; cjp not zo, extag;}       \WHILE
          {or r6, r6, z; cjp zo, exit;}            \Sign check
          {add r0, r6;}                             \To 32-bit
          {xor r1, r5;}                              \
          {or r0, r5;}                                \
          {add r1, 1h;}                                \
exit      {           }                                 \EXIT
