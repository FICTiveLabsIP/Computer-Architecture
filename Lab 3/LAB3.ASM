link l1: ct
                        \F = 8*(x1^x2)+(x3-1-x4)/16
                        \Zapys F v registr r4
accept r1: 000Ch        \x1 = 12
accept r2: 0002h        \x2 = 2
accept r3: 0000h        \x3 = 0
accept r5: 000Fh        \x4 = 15

{or r1, r1, r2;}        \x1 = x1^x2
{sub r3, r3, r5;}       \x3 = x3-x4

{or sla, r1, r1, z;}    \
{or sla, r1, r1, z;}    \å1*8
{or sla, r1, r1, z;}    \

{or sra, r3, r3, z;}    \
{or sra, r3, r3, z;}    \x3/16
{or sra, r3, r3, z;}    \
{or sra, r3, r3, z;}    \

{add r4, r4,r3;}        \ r4+r3
{add r4, r4, r1;}       \ r4+r1

{}

