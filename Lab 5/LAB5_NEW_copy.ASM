link l1: ct
link l2:rdm
link ewh:16

accept rdm_delay:2

dw 00F0h:0a24h
dw 00EEh:0005h
dw 00ECh:0c64h
dw 0a24h:0017h
dw 0c64h:0000h

accept r0:0
accept r14:00F0h

{add nil, r14, z; oey; ewl;}

ss1
{r; cjp rdm, ss1; add nil, bus_d, z; ewh;}
ss2
{r; cjp rdm, ss2; add r10, bus_d, z;}
{add nil, r10, z; oey; ewl;}
ss22
{r; cjp rdm, ss22; add  r10, r0, bus_d, z;}

{sub r14, r14, 0;}
{sub r14, r14, 0;}

{add nil, r14, z; oey; ewl;}

ss3
{r; cjp rdm, ss3; add r11, bus_d, z;}

{add r10, r10, r11;}

{sub r14, r14, 0;}
{sub r14, r14, 0;}

{add nil, r14, z; oey; ewl;}

ss4
{r; cjp rdm, ss4; add nil, bus_d, z; ewh;}
ss44
{r; cjp rdm, ss44; add r12, r0, bus_d, z;}
{add nil, r12, z; oey; ewl;}
ss5
{w; cjp rdm, ss5; add nil, r10, r0, z; oey;}

{}
