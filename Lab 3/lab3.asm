\Sergei Nanovskyi, 4316
\Reg = R4
\X1 = -17
\X2 = 12
\X3 = 17
\X4 = 3
\F=16(X1+X2-1)&(X3-X4)/2

link l1:ct

accept r1: 00efh           \X1
accept r2: 000ch           \X2
accept r3: 0011h           \X3
accept r5: 0003h           \X4

{ add r1, r1, r2; }        \X1+X2
{ sub r4, r1, z; }         \X1+X2-1

{ or sla, r4, r4, z; }     \16(X1+X2-1)
{ or sla, r4, r4, z; }
{ or sla, r4, r4, z; }
{ or sla, r4, r4, z; }

{ sub r3, r3, r5; }        \X3-X4
{ add r3, r3, 0001h; }     \add 1 hack
{ or sra, r3, r3, z; }     \(X3-X4)/2

{ and r4, r3; }            \16(X1+X2-1)&(X3-X4)/2
