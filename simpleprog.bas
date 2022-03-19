' import the support symbol table, prefix all constants with asm
#import support.sym,asm

' command constants
#const cmd.setup_screen sys{{asm.commands.setup_screen}}
#const cmd.printat      sys{{asm.commands.printat}},

#const delay 1000

' load the asm support routines into memory
    10  if xx>0 then 100
    20  xx=1
    30  load "support",8,1

' main program
    100 {{cmd.setup_screen}}
    '105 print "{clr}";
    110 {{cmd.printat}} 20,3,"good morning!"; : gosub 2000
    120 {{cmd.printat}} 13,4,"i'm the commodore 64"; : gosub 2000
    125 {{cmd.printat}} 9,15,"let's draw an ellipse";
    130 r=0
    140 x=sin(r)*15+20: y=cos(r)*8+15: {{cmd.printat}} x,y,chr$(rnd(0)*89+33);
    150 r=r+0.2: goto 140

    999 end

    2000 for d=0 to {{delay}}: next d
    2010 return
