link l[3]: ct
                                      \ D = A*(B-1)+2C
                                      \ vidpovid' zapisyvaetsa v r10
accept r12: 0                         \ suma chastkovyh dobutkiv
accept r15: 1111111111111001%         \ mnozhnyk, A = -7
accept r10: 0000000000000101%         \ mnozhene, B = 5
accept r11: 17                        \ counter
accept r14: 1111111111110111%         \ C = -9

{cont; load rm,z;}                    \ obnulennya RM

{sub r10, r10, z;}                    \ B = B-1

label1                                \ mnozhennya A*B
{cjp not rm_c, label2;}               \ analiz cyfry mnozhnyka
{add r12, r12, r15, z;}               \ dodavannya mnozhenogo do R12

label2
{or srl, r12, r12, z;}                \ logichniy zsuv r12
{or sr.9, r10, r10, z;}               \ zsuv r10
{sub r11, r11, z, z;                  \ decrement
 load rm, flags; cem_c;}              \ perevirka lichilnika
{cjp not rm_z, label1;}               \ na 0


{or sla, r14, r14, z;}                \ C = C*2
{add r10, r10, r14;}                  \ B = B+C

{}
