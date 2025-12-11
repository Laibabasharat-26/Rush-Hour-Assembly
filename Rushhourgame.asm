INCLUDE Irvine32.inc
Beep PROTO, dwFreq:DWORD, dwDuration:DWORD
.data
   temp1 BYTE    "###############################",0
   menumsg0 BYTE "RUSH HOUR",0
   menumsg1 BYTE "[1] START A NEW GAME",0
   menumsg2 BYTE "[2] CONTINUE THE GAME",0
   menumsg3 BYTE "[3] CHANGE THE DIFFICULTY LEVEL",0
   menumsg4 BYTE "[4] VIEW LEADER BOARD",0
   menumsg5 BYTE "[5] READ INSTRUCTIONS",0
   menumsg6 BYTE "Enter your choice: ",0
   ;------MENU2-------
   menu2msg1 BYTE "TAXI SELECTION",0
   temp2 BYTE  "#########################",0
   temp8 BYTE "|^*^|",0  
   menu2msg2 BYTE "[1] Choose Taxi Color",0
   menu2msg3 BYTE "[2] Random Taxi Color",0
   menu2msg4 BYTE "SELECT YOUR TAXI",0
   menu2msg5 BYTE "[Y] Yellow Taxi",0
   menu2msg6 BYTE "[R] Red Taxi",0
   menu2msg7 BYTE "TAXI selected ",0
   menu2msg8 BYTE "Enter Your Name: ",0
   menu2msg9 BYTE "Yellow Taxi ",0
   menu2msg10 BYTE "Red Taxi ",0
   pname BYTE 10 DUP(?)
   menu2msg11 BYTE "SELECT MODE",0
   menu2msg12 BYTE "[1] Career Mode",0
   menu2msg13 BYTE "[2] Time mode",0
   menu2msg14 BYTE "[3] Endless Mode",0
   height EQU 40
   widthh EQU 70
   bordermsg1 BYTE "#",0
   wallrcla BYTE  40,8,70,0, 40,40,70,0,  40,8,33,1, 110,8,33,1, 40,15,17,0
            BYTE  40,25,17,0, 56,25,6,1, 75,15,14,1, 90,8,8,1, 65,11,6,1
            BYTE 40,34,13,0, 66,8,10,0,  70,8,5,0,  75,36,5,1, 72,35,7,0
            BYTE 100,20,10,0, 100,35,10,0, 100,35,3,1, 82,19,6,0, 82,20,6,0
            BYTE 98,28,4,0, 98,29,4,0, 98,30,4,0,  64,21,6,0, 64,22,6,0
   totalwalls EQU 25
   treerc BYTE 45,27, 65,36, 45,10, 102,15
   totaltrees EQU 4
   treemsg1 BYTE "2222",0
   treemsg2 BYTE "222222",0
   treemsg3 BYTE "||",0
   passengermsg1 BYTE "22",0
   passengermsg2 BYTE "222",0
   passengermsg3 BYTE"PAS",0
   totalpass EQU 3
   passrc BYTE 6 DUP (?)

   minx = 40
   maxx = 105
   miny = 8
   maxy = 38

   taxix BYTE 50 
   taxiy BYTE 20
   taximsg1 BYTE "T",0
   taxicolor BYTE cyan
   taxispeed BYTE 1             
   taximovedelay DWORD 0
   backgroundcolor BYTE yellow
   redtaxicounter BYTE 0

   ; CAR 
   totalcars EQU 5
   carmsg1 BYTE "CAR",0
   carrc  BYTE 58,15,9,14,0   
            BYTE 62,25,25,35,1    
            BYTE 78,20,15,28,0    
            BYTE 94,30,22,36,1    
            BYTE 95,15,9,14,0  
   carColors BYTE white, lightmagenta, lightGreen, brown, lightGray
   carspeeddelay DWORD 25    
   minCarSpeed DWORD 8   
   passengersForSpeedUp BYTE 2 

   pickupMsg BYTE "Press SPACEBAR to pick up/drop passenger",0
   scoreMsg BYTE "Score: ",0
   timeMsg BYTE "Time: ",0
   playerMsg BYTE "Player: ",0
   destMsg BYTE "DEST",0
   
   destrc BYTE 6 DUP (?)       
   passstate BYTE 3 DUP(0) 
   currentpass BYTE 255     
   
   ; Game state
   score DWORD 0
   wallCollisionPenalty DWORD 5 
   starttime DWORD ?
   currentTime DWORD ?
   remainingpass BYTE 3
   gameOverMsg BYTE "ALL PASSENGERS DELIVERED! Press ESC to exit",0
   movecount DWORD 0  

 
  gameOverTitle BYTE "GAME OVER ",0
  congratsMsg BYTE "CONGRATULATIONS!",0
  finalScoreMsg BYTE "Final Score: ",0
  timeTakenMsg BYTE "Time Taken: ",0
  secondsMsg BYTE " seconds",0
  warningstatus BYTE 0        
  flashState BYTE 0         

  totalbonus EQU 3                   
  bonusrc BYTE 48,30, 85,12, 105,33     
  bonusstate BYTE 3 DUP(1)             
              
  bonusMsg2 BYTE "KEY",0              
  bonuscolors BYTE lightGreen, gray, lightMagenta
   
  gameMode BYTE 0             
  timeLimit DWORD 30000        
  timeModeMsg BYTE "TIME LEFT: ",0
  timeUpMsg BYTE "TIME'S UP! GAME OVER",0
  endlessModeMsg BYTE "Press 'G' to end game",0
  passdelivered DWORD 0     
  timeModeVictoryMsg BYTE "ALL PASSENGERS DELIVERED IN TIME!",0
  timeRemainingMsg BYTE "Time Remaining: ",0

  playerlives BYTE 3           
  maxLives BYTE 3              
  livesMsg BYTE "Lives: ",0
  heartMsg BYTE "<3 ",0        
  gameOverLivesMsg BYTE "NO LIVES LEFT! GAME OVER",0


  playerfuel DWORD 100         
  maxFuel DWORD 150           
  fuelMsg BYTE "Fuel: ",0
  fuelLowMsg BYTE "LOW FUEL!",0
  fuelEmptyMsg BYTE "OUT OF FUEL! GAME OVER",0

  totalfuelcans EQU 3
  fuelCanrc BYTE 52,12, 88,32, 83,18   
  fuelstatus BYTE 3 DUP(1)           
  fuelcanmsg BYTE "GAS",0          
  fuelCanColor BYTE lightCyan


  gamePaused BYTE 0                   
  pauseMsg1 BYTE "GAME PAUSED",0
  pauseMsg2 BYTE "Press any key to resume",0


  ;INSTRUCTIONS
  instmsg1 BYTE "GAME INSTRUCTIONS",0
  instmsg2 BYTE "================================",0
  instmsg3 BYTE "CONTROLS:",0
  instmsg4 BYTE "  W/A/S/D to Move Taxi Up/Left/Down/Right",0
  instmsg5 BYTE "  SPACEBAR to Pick Up / Drop Off Passenger",0
  instmsg6 BYTE "  ESC to Exit Game",0
  instmsg7 BYTE "  G - End Endless Mode",0
  instmsg8 BYTE "  P - Pause Game",0

  
  instmsg9 BYTE "GAME MODES:",0
  instmsg10 BYTE "  [1] CAREER MODE:",0
  instmsg11 BYTE "      - Complete missions with 3 lives",0
  instmsg12 BYTE "      - Manage fuel carefully",0
  instmsg13 BYTE "      - Avoid moving cars",0
  instmsg14 BYTE "      - Cars speed up after 2 deliveries",0
  instmsg15 BYTE "  [2] TIME MODE:",0
  instmsg16 BYTE "      - Race against 30-second timer",0
  instmsg17 BYTE "      - Warning flash at 10 seconds left",0
  instmsg18 BYTE "      - Deliver passengers before time runs out",0
  instmsg19 BYTE "  [3] ENDLESS MODE:",0
  instmsg20 BYTE "      - Unlimited passengers spawn",0
  instmsg21 BYTE "      - No lives or fuel limits",0
  instmsg22 BYTE "      - Press 'G' to end and view score",0

  instScore1 BYTE "SCORING SYSTEM:",0
  instScore2 BYTE "  ADD 10 Points -  Deliver Passenger",0
  instScore3 BYTE "  ADD 10 Points - Collect KEY Bonus",0
  instScore4 BYTE "  ADD 20 Points - Complete one batch of passenger in Endless mode ",0

  instTaxi1 BYTE "TAXI TYPES:",0
  instTaxi2 BYTE "  Yellow/Brown Taxi - FAST (1x speed)",0
  instTaxi3 BYTE "  Red Taxi - SLOW (0.5x speed)",0

  instCareer1 BYTE "CAREER MODE RULES:",0
  instCareer2 BYTE "  - Start with 3 Lives",0
  instCareer3 BYTE "  - Start with 100% Fuel",0
  instCareer4 BYTE "  - Hitting cars loses 1 life",0
  instCareer5 BYTE "  - Movement consumes fuel",0
  instCareer6 BYTE "  - Collect GAS to refuel to 100%",0
  instCareer7 BYTE "  - Game Over if lives = 0 or fuel = 0",0

  instObj1 BYTE "GAME OBJECTS:",0
  instObj2 BYTE "  PAS - Passenger (Yellow)",0
  instObj3 BYTE "  DEST - Destination (Green)",0
  instObj4 BYTE "  KEY - Bonus Item (+10 points)",0
  instObj5 BYTE "  GAS - Fuel Canister (Refill to 100%)",0
  instObj6 BYTE "  CAR - Moving Obstacle (Avoid in Career)",0
  instObj7 BYTE "  Walls (Cannot pass through)",0
  instObj8 BYTE "  Tree - Obstacles (Cannot pass through)",0

  instTip1 BYTE "TIPS:",0
  instTip2 BYTE "  - Stand next to PAS and press SPACE to pick up",0
  instTip3 BYTE "  - Drive to green DEST marker to drop off",0
  instTip4 BYTE "  - Watch your fuel in Career Mode",0
  instTip5 BYTE "  - Cars move faster after 2 deliveries",0
  instTip6 BYTE "  - Collect all KEYs for bonus points",0
  instmsg23 BYTE "Press any key to return to main menu",0

.code

sound PROC
    INVOKE Beep, 800, 50
    ret
sound ENDP

main PROC
  mov eax,black+(lightgreen*16)
  call SetTextColor
  call Clrscr
  call menu
  call menu2
  call ReadChar
  call endgame
  exit
main endp

menu PROC 
   mov eax,RED+(RED*16)
   call SetTextColor
   mov dl,62
   mov dh,8
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(RED*16)
   call SetTextColor
   mov dl,72
   mov dh,8
   call Gotoxy
   mov edx,OFFSET menumsg0
   call writeString

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,62
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,68
   mov dh,13
   call Gotoxy
   mov edx,OFFSET menumsg1
   call writeString
   
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,62
   mov dh,15
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,68
   mov dh,15
   call Gotoxy
   mov edx,OFFSET menumsg2
   call writeString
   
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,62
   mov dh,17
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,62
   mov dh,17
   call Gotoxy
   mov edx,OFFSET menumsg3
   call writeString

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,62
   mov dh,19
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,68
   mov dh,19
   call Gotoxy
   mov edx,OFFSET menumsg4
   call writeString

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,62
   mov dh,21
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,68
   mov dh,21
   call Gotoxy
   mov edx,OFFSET menumsg5
   call writeString

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,62
   mov dh,28
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,67
   mov dh,28
   call Gotoxy
   mov edx,OFFSET menumsg6
   call writestring
  
   call ReadChar
   CMP al,'1'
   JE menu2  
   CMP al,'5'           
   JE instructions 
   JMP endl
   ret

instructions:      
   call gameinstruc 
   call Clrscr          
   jmp menu 
endl:
   JMP menu
menu endp

menu2 PROC
   call Clrscr
   mov eax,black+(lightgreen*16)
   call SetTextColor
   call Clrscr
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,63
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp2
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp8
   call writestring
   mov dl,67
   mov dh,13
   call Gotoxy
   mov edx,OFFSET menu2msg1
   call writestring
   mov dl,82
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp8
   call writestring
   

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,62
   mov dh,15
   call Gotoxy
   mov edx,OFFSET temp2
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,63
   mov dh,15
   call Gotoxy
   mov edx,OFFSET menu2msg2
   call writestring
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,62
   mov dh,17
   call Gotoxy
   mov edx,OFFSET temp2
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,63
   mov dh,17
   call Gotoxy
   mov edx,OFFSET menu2msg3
   call writestring

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,62
   mov dh,21
   call Gotoxy
   mov edx,OFFSET temp2
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,64
   mov dh,21
   call Gotoxy
   mov edx,OFFSET menumsg6
   call writestring

   call ReadChar
   CMP al,'1'
   JE taxicolorl
   CMP al,'2'
   JE randomtaxicolor
   JMP enddp
enddp:
   JMP menu2
randomtaxicolor:
   call Randomize
   mov eax,6
   call Randomrange

   CMP eax,0
   JE cyancolor
   CMP eax,1
   JE greencolor
   CMP eax,2
   JE graycolor
   CMP eax,3
   JE whitecolor
   CMP eax,4
   JE bluecolor
   CMP eax,5
   JE magentacolor
    
cyancolor:
   mov taxicolor,cyan
   mov taxispeed, 1  
   JMP endl
greencolor:
   mov taxicolor,green
   mov taxispeed, 1  
   JMP endl
graycolor:
   mov taxicolor,gray
   mov taxispeed, 1  
   JMP endl
whitecolor:
   mov taxicolor,white
   mov taxispeed, 1  
   JMP endl
bluecolor:
   mov taxicolor,blue
   mov taxispeed, 1  
   JMP endl
magentacolor:
   mov taxicolor,magenta
   mov taxispeed, 1  
   JMP endl
endl:
   JMP namel
   
taxicolorl:
   call Clrscr
   mov eax,black+(lightgreen*16)
   call SetTextColor

   call Clrscr
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,62
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp8
   call writestring
   mov dl,68
   mov dh,13
   call Gotoxy
   mov edx,OFFSET menu2msg4
   call writestring
   mov dl,85
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp8
   call writestring
   

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,15
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,68
   mov dh,15
   call Gotoxy
   mov edx,OFFSET menu2msg5
   call writestring

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,17
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,68
   mov dh,17
   call Gotoxy
   mov edx,OFFSET menu2msg6
   call writestring

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,20
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,65
   mov dh,20
   call Gotoxy
   mov edx,OFFSET menumsg6
   call writestring

   call ReadChar
   CMP al,'Y'
   JE ytaxi
   CMP al,'y'
   JE ytaxi
   CMP al,'R'
   JE redtaxi
   CMP al,'r'
   JE redtaxi
   JMP endpp
endpp:
   JMP taxicolorl

redtaxi:
   call Clrscr
   mov taxicolor,red
    mov taxispeed,2
   mov eax,black+(lightgreen*16)
   call SetTextColor

   call Clrscr
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,64
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp8
   call writestring
   mov dl,70
   mov dh,13
   call Gotoxy
   mov edx,OFFSET menu2msg7
   call writestring
   mov dl,84
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp8
   call writestring
   call Crlf

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,15
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,72
   mov dh,15
   call Gotoxy
   mov edx,OFFSET menu2msg10
   call writestring

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,20
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,67
   mov dh,20
   call Gotoxy
   mov edx,OFFSET menu2msg8
   call writestring
   mov edx,OFFSET pname
   mov ecx,SIZEOF pname
   call ReadString
   JMP mode

ytaxi:
   call Clrscr
   mov taxicolor,brown
    mov taxispeed,1
   mov eax,black+(lightgreen*16)
   call SetTextColor

   call Clrscr
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,64
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp8
   call writestring
   mov dl,70
   mov dh,13
   call Gotoxy
   mov edx,OFFSET menu2msg7
   call writestring
   mov dl,84
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp8
   call writestring
   call Crlf
   
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,15
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,70
   mov dh,15
   call Gotoxy
   mov edx,OFFSET menu2msg9
   call writestring

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,20
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,67
   mov dh,20
   call Gotoxy
   mov edx,OFFSET menu2msg8
   call writestring
   mov edx,OFFSET pname
   mov ecx,SIZEOF pname
   call ReadString
   JMP mode
namel:
   call Clrscr
   mov eax,black+(lightgreen*16)
   call SetTextColor
   call Clrscr
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,20
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,67
   mov dh,20
   call Gotoxy
   mov edx,OFFSET menu2msg8
   call writestring
   mov edx,OFFSET pname
   mov ecx,SIZEOF pname
   call ReadString
   JMP mode
mode:
   call Clrscr
   mov eax,black+(lightgreen*16)
   call SetTextColor

   call Clrscr
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,64
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp8
   call writestring
   mov dl,70
   mov dh,13
   call Gotoxy
   mov edx,OFFSET menu2msg11
   call writestring
   mov dl,82
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp8
   call writestring 
   mov dl,82
   mov dh,13
   call Gotoxy
   mov edx,OFFSET temp8
   call writestring

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,15
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,66
   mov dh,15
   call Gotoxy
   mov edx,OFFSET menu2msg12
   call writestring

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,17
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,66
   mov dh,17
   call Gotoxy
   mov edx,OFFSET menu2msg13
   call writestring

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,19
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,66
   mov dh,19
   call Gotoxy
   mov edx,OFFSET menu2msg14
   call writestring

   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,61
   mov dh,23
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,64
   mov dh,23
   call Gotoxy
   mov edx,OFFSET menumsg6
   call writestring
   call ReadChar

   CMP al,'1'
   JE careermode
   CMP al,'2'
   JE timemode
   CMP al,'3'
   JE endlessmode
   JMP mode
careermode:
  mov gameMode, 0
  mov backgroundcolor,yellow
   mov eax,magenta+(yellow*16)
   call SetTextColor
   call board
   JMP endpart
timemode:
   mov gameMode, 1
   mov eax,magenta+(yellow*16)
   call SetTextColor
   call board
   JMP endpart
endlessmode:
   mov gameMode, 2
   mov eax,magenta+(yellow*16)
   call SetTextColor
    call board
   JMP endpart
endpart:
   ret
menu2 endp

gameinstruc PROC
    call Clrscr
    mov eax,black+(lightgreen*16)
    call SetTextColor
    call Clrscr
    
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,60
    mov dh,2
    call Gotoxy
    mov edx,OFFSET instmsg2
    call WriteString
    
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,66
    mov dh,2
    call Gotoxy
    mov edx,OFFSET instmsg1
    call WriteString
    
    mov eax,yellow+(lightgreen*16)
    call SetTextColor
  
    mov dl,5
    mov dh,4
    call Gotoxy
    mov edx,OFFSET instmsg3
    call WriteString
    
    mov eax,black+(lightgreen*16)
    call SetTextColor
    mov dl,5
    mov dh,5
    call Gotoxy
    mov edx,OFFSET instmsg4
    call WriteString
    
    mov dl,5
    mov dh,6
    call Gotoxy
    mov edx,OFFSET instmsg5
    call WriteString
    
    mov dl,5
    mov dh,7
    call Gotoxy
    mov edx,OFFSET instmsg6
    call WriteString
    
    mov dl,5
    mov dh,8
    call Gotoxy
    mov edx,OFFSET instmsg7
    call WriteString
    
    mov dl,5
    mov dh,9
    call Gotoxy
    mov edx,OFFSET instmsg8
    call WriteString


    mov eax,cyan+(lightgreen*16)
    call SetTextColor
    mov dl,5
    mov dh,10
    call Gotoxy
    mov edx,OFFSET instmsg9
    call WriteString
    
    mov eax,black+(lightgreen*16)
    call SetTextColor
    mov dl,5
    mov dh,11
    call Gotoxy
    mov edx,OFFSET instmsg10
    call WriteString
    
    mov dl,5
    mov dh,12
    call Gotoxy
    mov edx,OFFSET instmsg11
    call WriteString
    
    mov dl,5
    mov dh,13
    call Gotoxy
    mov edx,OFFSET instmsg12
    call WriteString
    
    mov dl,5
    mov dh,14
    call Gotoxy
    mov edx,OFFSET instmsg13
    call WriteString
    
    mov dl,5
    mov dh,15
    call Gotoxy
    mov edx,OFFSET instmsg14
    call WriteString
    
    mov dl,5
    mov dh,16
    call Gotoxy
    mov edx,OFFSET instmsg15
    call WriteString
    
    mov dl,5
    mov dh,17
    call Gotoxy
    mov edx,OFFSET instmsg16
    call WriteString
    
    mov dl,5
    mov dh,18
    call Gotoxy
    mov edx,OFFSET instmsg17
    call WriteString
    
    mov dl,5
    mov dh,19
    call Gotoxy
    mov edx,OFFSET instmsg18
    call WriteString
    
    mov dl,5
    mov dh,20
    call Gotoxy
    mov edx,OFFSET instmsg19
    call WriteString
    
    mov dl,5
    mov dh,21
    call Gotoxy
    mov edx, OFFSET instmsg20
    call WriteString
    
    mov dl,5
    mov dh,22
    call Gotoxy
    mov edx,OFFSET instmsg21
    call WriteString
    
    mov dl,5
    mov dh,23
    call Gotoxy
    mov edx,OFFSET instmsg22
    call WriteString
    
    mov eax,cyan+(lightgreen*16)
    call SetTextColor
    mov dl,70
    mov dh,4
    call Gotoxy
    mov edx,OFFSET instScore1
    call WriteString
    
    mov eax,black+(lightgreen*16)
    call SetTextColor
    mov dl,70
    mov dh,5
    call Gotoxy
    mov edx,OFFSET instScore2
    call WriteString
    
    mov dl,70
    mov dh,6
    call Gotoxy
    mov edx,OFFSET instScore3
    call WriteString
    
    mov dl,70
    mov dh,7
    call Gotoxy
    mov edx,OFFSET instScore4
    call WriteString
    
    mov eax,brown+(lightgreen*16)
    call SetTextColor
    mov dl,70
    mov dh,9
    call Gotoxy
    mov edx,OFFSET instTaxi1
    call WriteString
    
    mov eax,black+(lightgreen*16)
    call SetTextColor
    mov dl,70
    mov dh,10
    call Gotoxy
    mov edx,OFFSET instTaxi2
    call WriteString
    
    mov dl,70
    mov dh,11
    call Gotoxy
    mov edx,OFFSET instTaxi3
    call WriteString
    
    mov eax,red+(lightgreen*16)
    call SetTextColor
    mov dl,70
    mov dh,13
    call Gotoxy
    mov edx,OFFSET instCareer1
    call WriteString
    
    mov eax,black+(lightgreen*16)
    call SetTextColor
    mov dl,70
    mov dh,14
    call Gotoxy
    mov edx,OFFSET instCareer2
    call WriteString
    
    mov dl,70
    mov dh,15
    call Gotoxy
    mov edx,OFFSET instCareer3
    call WriteString
    
    mov dl,70
    mov dh,16
    call Gotoxy
    mov edx,OFFSET instCareer4
    call WriteString
    
    mov dl,70
    mov dh,17
    call Gotoxy
    mov edx,OFFSET instCareer5
    call WriteString
    
    mov dl,70
    mov dh,18
    call Gotoxy
    mov edx,OFFSET instCareer6
    call WriteString
    
    mov dl,70
    mov dh,19
    call Gotoxy
    mov edx,OFFSET instCareer7
    call WriteString

    mov eax,magenta+(lightgreen*16)
    call SetTextColor
    mov dl,5
    mov dh,25
    call Gotoxy
    mov edx,OFFSET instObj1
    call WriteString
    
    mov eax,black+(lightgreen*16)
    call SetTextColor
    mov dl,5
    mov dh,26
    call Gotoxy
    mov edx,OFFSET instObj2
    call WriteString
    
    mov dl,5
    mov dh,27
    call Gotoxy
    mov edx,OFFSET instObj3
    call WriteString
    
    mov dl,5
    mov dh,28
    call Gotoxy
    mov edx,OFFSET instObj4
    call WriteString
    
    mov dl,5
    mov dh,29
    call Gotoxy
    mov edx,OFFSET instObj5
    call WriteString
    
    mov dl,30
    mov dh,26
    call Gotoxy
    mov edx,OFFSET instObj6
    call WriteString
    
    mov dl,30
    mov dh,27
    call Gotoxy
    mov edx,OFFSET instObj7
    call WriteString
    
    mov dl,30
    mov dh,28
    call Gotoxy
    mov edx,OFFSET instObj8
    call WriteString
    
    mov eax,lightCyan+(lightgreen*16)
    call SetTextColor
    mov dl,70
    mov dh,22
    call Gotoxy
    mov edx,OFFSET instTip1
    call WriteString
    
    mov eax,black+(lightgreen*16)
    call SetTextColor
    mov dl,71
    mov dh,23
    call Gotoxy
    mov edx,OFFSET instTip2
    call WriteString
    
    mov dl,71
    mov dh,24
    call Gotoxy
    mov edx,OFFSET instTip3
    call WriteString
    
    mov dl,71
    mov dh,25
    call Gotoxy
    mov edx,OFFSET instTip4
    call WriteString
    
    mov dl,71
    mov dh,26
    call Gotoxy
    mov edx,OFFSET instTip5
    call WriteString
    
    mov dl,71
    mov dh,27
    call Gotoxy
    mov edx,OFFSET instTip6
    call WriteString
    
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,62
    mov dh,35
    call Gotoxy
    mov edx,OFFSET instmsg23
    call WriteString
    
    call ReadChar
    ret
gameinstruc ENDP


;====================BOARD
board PROC
    call Clrscr   
    movzx eax,backgroundcolor
    shl eax,4
    add al,backgroundcolor
    call SetTextColor
    call Clrscr
 
    mov edi,OFFSET passstate
    mov ecx,totalpass
    mov al,0
startloop:
    mov [edi],al
    inc edi
    loop startloop
    
    mov edi,OFFSET destrc
    mov ecx,totalpass*2
    mov al,0
startdestloop:
    mov [edi],al
    inc edi
    loop startdestloop

    mov edi,OFFSET bonusstate
    mov ecx,totalbonus
    mov al, 1
startbonusloop:
    mov [edi], al
    inc edi
    loop startbonusloop

    mov currentpass,255
    mov score,0

    mov remainingpass,3
    mov movecount,0
    mov passdelivered,0
    mov playerlives,3          
    mov playerfuel,100   
    mov carspeeddelay,25
    mov taximovedelay,0

    mov edi,OFFSET fuelstatus
    mov ecx,totalfuelcans
    mov al,1
startfuelloop:
    mov [edi], al
    inc edi
    loop startfuelloop    
    call wall
    call trees
    call passengerrandomgene
   
    call passengers
    call cars
    call taxi
    
    mov eax,500
    call Delay
    
    call gameplay
    ret
board endp

wall PROC
    mov esi,0
    mov ecx,totalwalls
l1:
    push ecx
    mov dl,wallrcla[esi]
    mov dh,wallrcla[esi+1]
    mov cl,wallrcla[esi+2]
    mov bl,wallrcla[esi+3]
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov al,'#'

    CMP bl,0
    JE l5

l2:
   movzx ecx,cl
l3:
   call Gotoxy
   call WriteChar
   inc dh
   loop l3
   JMP l4
l5:
   movzx ecx,cl
l6:
   call Gotoxy
   call WriteChar
   inc dl
   loop l6
l4:
   add esi,4
   pop ecx
   loop l1

   mov eax,magenta+(yellow*16)
   call SetTextColor
   ret
wall endp

trees PROC
    mov esi,0
    mov ecx,totaltrees
   
l1:
    mov eax,green+(green*16)
    call SetTextColor
    push ecx
    mov dl,treerc[esi]
    mov dh,treerc[esi+1]
    inc dl
    call Gotoxy
    mov edx,OFFSET treemsg1
    call Writestring
    call crlf
   
    mov dl,treerc[esi]
    mov dh,treerc[esi+1]
    inc dh
    call Gotoxy
    mov edx,OFFSET treemsg2
    call WriteString
    call crlf
   
    mov eax,brown+(brown*16)
    call SetTextColor
    mov dl,treerc[esi]
    mov dh,treerc[esi+1]
    add dh,2
    add dl,2
    call Gotoxy
    mov edx,OFFSET treemsg3
    call WriteString

    add esi,2
    pop ecx
    dec ecx
    JNz l1
    ret
trees endp


cars PROC
    pushad
    
    mov esi,OFFSET carrc
    mov edi,OFFSET carColors
    mov ecx,totalcars
    
drawingcar:
    push ecx
    
    mov dl,[esi]      
    mov dh,[esi+1]   
      
    CMP dl,minx
    jl skipthiscar
    CMP dl,maxx
    jg skipthiscar
    CMP dh,miny
    jl skipthiscar
    CMP dh,maxy
    jg skipthiscar
    
   
    movzx eax,BYTE PTR [edi]
    shl eax,4
    add al,black
    call SetTextColor
    
   
    call Gotoxy
    push edx
    mov edx,OFFSET carmsg1
    call WriteString
    pop edx
    
skipthiscar:
    add esi,5       
    inc edi           
    pop ecx
    dec ecx
    CMP ecx,0
    jne drawingcar  
    popad
    ret
cars ENDP

removecars PROC
    push eax
    push edx
    
    CMP dl,minx
    jl skipremovingthiscar
    CMP dl,maxx
    jg skipremovingthiscar
    CMP dh,miny
    jl skipremovingthiscar
    CMP dh,maxy
    jg skipremovingthiscar
    
    movzx eax,backgroundcolor
    shl eax,4
    add al,backgroundcolor
    call SetTextColor
    call Gotoxy
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    
skipremovingthiscar:
    pop edx
    pop eax
    ret
removecars ENDP

bonus PROC
    push esi
    push edi
    push ecx
    push edx    
    mov esi,OFFSET bonusrc
    mov edi,OFFSET bonusstate
    mov ebx,OFFSET bonuscolors
    mov ecx,totalbonus

drawbonus:
    push ecx 
    mov al,[edi]
    CMP al,0
    je skipbonus   
    mov dl,[esi]
    mov dh,[esi+1]
 
    CMP dl,0
    je skipbonus
    CMP dh,0
    je skipbonus
    
    push esi
    mov esi,ebx
    movzx eax,BYTE PTR [esi]
    pop esi
    mov eax,black
    push ecx
    shl ecx,4          
    add eax,ecx        
    pop ecx
    call SetTextColor
    inc dh
    call Gotoxy
    push edx
    mov edx,OFFSET bonusMsg2
    call WriteString
    pop edx
skipbonus:
    add esi,2
    inc edi
    inc ebx
    pop ecx
    loop drawbonus
    
    pop edx
    pop ecx
    pop edi
    pop esi
    ret
bonus ENDP

gas PROC
    push esi
    push edi
    push ecx
    push edx

    mov al,gameMode
    CMP al,2
    je skipallfueldraw
    
  
    CMP al,1
    je skipallfueldraw
    mov esi,OFFSET fuelCanrc
    mov edi,OFFSET fuelstatus
    mov ecx,totalfuelcans

drawfuel:
    push ecx
    mov al,[edi]
    CMP al,0
    je skipfueldraw
    mov dl,[esi]
    mov dh,[esi+1] 
    CMP dl,0
    je skipfueldraw
    CMP dh,0
    je skipfueldraw
    movzx eax,backgroundcolor
    shl eax,4
    movzx ebx,fuelCanColor
    add eax,ebx
    call SetTextColor
    call Gotoxy
    push edx
    mov edx,OFFSET fuelcanmsg
    call WriteString
    pop edx

skipfueldraw:
    add esi,2
    inc edi
    pop ecx
    loop drawfuel
    
skipallfueldraw:
    pop edx
    pop ecx
    pop edi
    pop esi
    ret
gas ENDP




;========passenger 
passengerrandomgene PROC
  call Randomize
  mov esi,OFFSET passrc
  mov ecx,totalpass

passengerl:
  push ecx              
  mov ebx,0

temp:
  inc ebx
  CMP ebx,100          
  JG ttemp1

 
  mov eax,maxx-minx-5   
  call RandomRange
  add al,minx
  add al,1
  mov dl,al

  mov eax,maxy-miny-2
  call RandomRange
  add al,miny
  mov dh,al

  push edx
  mov al,taxix
  mov ah,taxiy
  
  CMP dl,al
  jne notontaxix
  CMP dh, ah
  je againtry     
  
notontaxix:
  pop edx
  push edx
  mov al,taxix
  mov ah,taxiy
  mov cl,al
  sub cl,dl
  jnc x_positive
  mov cl,dl         
  sub cl,al

x_positive::  
  mov ch,ah
  sub ch,dh
  jnc y_positive  
  mov ch,dh          
  sub ch,ah          
  
y_positive:

  CMP cl,5
  jl againtry
  CMP ch,5
  jl againtry
  
  pop edx
  push edx
  call wallcollsion
  CMP eax,0
  JE againtry
 
  call treecollision
  CMP eax,0
  JE againtry
  
  inc dl
  call wallcollsion
  CMP eax,0
  JE againtry
  
  call treecollision
  CMP eax,0
  JE againtry
  
  inc dl
  call wallcollsion
  CMP eax,0
  JE againtry
  
  call treecollision
  CMP eax,0
  JE againtry
    
  pop edx
  push edx
   
  call caroverlap
  CMP eax, 1
  je againtry
  
  inc dl
  call caroverlap
  CMP eax, 1
  je againtry
  
  inc dl
  call caroverlap
  CMP eax, 1
  je againtry
  
  pop edx
  push esi
  mov edi,OFFSET passrc
  
checkotherpass:
  CMP edi,esi         
  je skipselfcheck  
  mov al,[edi]
  CMP al,0
  je skipselfcheck
  mov al,[edi]
  mov ah,[edi+1] 
  mov bl,dh
  sub bl,2
  CMP ah,bl
  jl skipselfcheck
  mov bl,dh
  add bl,2
  CMP ah,bl
  jg skipselfcheck 
  mov bl,dl
  sub bl,5            
  CMP al,bl
  jl skipselfcheck
  mov bl,dl
  add bl,5
  CMP al,bl
  jg skipselfcheck
  pop esi
  jmp temp
  
skipselfcheck:
  add edi,2
  CMP edi,esi
  jl checkotherpass
  pop esi
  mov [esi],dl
  mov [esi+1],dh
  JMP ttemp2

againtry:
  pop edx
  jmp temp

ttemp1:
  mov al,taxix
  add al,25           
  CMP al,maxx
  jle fallbackvalidx
  sub al, 50           
fallbackvalidx:
  mov [esi],al
  
  mov al,taxiy
  add al,10           
  CMP al,maxy
  jle fallbackvalidy
  sub al,20            
fallbackvalidy:
  mov [esi+1],al

ttemp2:
  add esi,2
  pop ecx               
  dec ecx               
  CMP ecx,0             
  jne passengerl        
 
  ret
passengerrandomgene endp 


passengers PROC
   mov esi,OFFSET passrc
   mov edi,OFFSET passstate
   mov ecx,totalpass
   
l1:
   push ecx
   mov al,[edi]
   CMP al, 2
   je skipthispass    
   CMP al, 1
   je skipthispass     
   mov al,[esi]
   CMP al,0
   je skipthispass
   mov eax,black+(black*16)
   call SetTextColor
   mov dl,[esi]
   mov dh,[esi+1]
   call Gotoxy
   mov edx,OFFSET passengermsg2
   call writestring
   
   mov eax,yellow+(black*16)
   call SetTextColor
   mov dl,[esi]
   mov dh,[esi+1]
   call Gotoxy
   mov edx,OFFSET passengermsg3
   call writestring
   call crlf
   
skipthispass:
   add esi,2
   inc edi
   pop ecx
   loop l1
   ret
passengers endp


genedestination PROC
    pushad
    mov eax,esi
    sub eax,OFFSET passrc
    shr eax,1
    shl eax,1
    mov edi,OFFSET destrc
    add edi,eax
    mov bl,[esi]     
    mov bh,[esi+1]   
    call Randomize
    
    mov ecx,0 
genenewdest:
    inc ecx
    CMP ecx,200     
    jg usingfallback

    mov eax,maxx - minx - 10
    call RandomRange
    add al,minx + 4
    mov dl,al
   
    mov eax,maxy - miny - 5
    call RandomRange
    add al,miny+3
    mov dh,al  
    CMP dl,minx+3
    jl genenewdest
    CMP dl,maxx - 7
    jg genenewdest
    CMP dh,miny + 2
    jl genenewdest
    CMP dh,maxy - 2
    jg genenewdest
    mov al, dl
    mov ah, dh 
    push eax
    mov dl, al
    mov dh, ah
    call wallcollsion
    CMP eax,0
    je posinotvalid
    call treecollision
    CMP eax, 0
    je posinotvalid
    
    inc dl
    call wallcollsion
    CMP eax, 0
    je posinotvalid
    call treecollision
    CMP eax, 0
    je posinotvalid
       
    inc dl
    call wallcollsion
    CMP eax, 0
    je posinotvalid
    call treecollision
    CMP eax, 0
    je posinotvalid
    
    inc dl
    call wallcollsion
    CMP eax, 0
    je posinotvalid
    call treecollision
    CMP eax, 0
    je posinotvalid
    
    mov dl,al
    mov dh,ah
    call caroverlap
    CMP eax,1
    je posinotvalid
    
    pop eax
   
    mov [edi],al
    mov [edi+1],ah
    jmp destdone

posinotvalid:
    pop eax
    jmp genenewdest
    
usingfallback:
    movzx eax, currentpass
    and eax,3
    
    CMP eax,0
    je fallback1
    CMP eax,1
    je fallback2
    CMP eax,2
    je fallback3

    mov al,95
    mov ah,28
    jmp storingfallback
    
fallback1:
    mov al,45
    mov ah,15
    jmp storingfallback
    
fallback2:
    mov al,85
    mov ah,32
    jmp storingfallback
    
fallback3:
    mov al,65
    mov ah,22
    
storingfallback:
    mov [edi],al
    mov [edi+1],ah

destdone:
    popad
    ret
genedestination ENDP


displaydest PROC
    mov esi,OFFSET destrc
    mov edi,OFFSET passstate
    mov ecx,totalpass   
dest:
    push ecx  
    mov al,[edi]
    CMP al,1                    
    jne nextdest               
    mov dl,[esi]
    CMP dl,0                    
    je nextdest 
    mov dh, [esi+1]
    movzx eax,backgroundcolor
    shl eax,4
    add eax,green              
    call SetTextColor  
    call Gotoxy
    mov edx,OFFSET destMsg
    call WriteString   
nextdest:
    add esi,2
    inc edi
    pop ecx
    loop dest
    ret
displaydest ENDP

checkingneighbourpass PROC
    push ecx
    push edi
    push ebx
    push esi
    push edx   
    mov esi,OFFSET passrc
    mov ecx,totalpass
    mov ebx,0                   
    
checkneighbors:
    push ecx                    
    push esi
    push ebx
    mov edi, OFFSET passstate
    add edi, ebx
    mov al, [edi]               
    pop ebx
    pop esi
    CMP al,0
    jne NextPassenger           
    mov al,[esi]              
    mov ah,[esi+1]             
    CMP al,0
    je NextPassenger
    CMP ah,0
    je NextPassenger
    mov dl,taxix            
    mov dh,taxiy               
    CMP dh,ah                 
    mov cl,al                
    dec cl                     
    mov ch,al                 
    add ch,3                   
    CMP dl,cl
    jl NextPassenger            
    CMP dl,ch
    jg NextPassenger           
    pop ecx                     
    mov eax,ebx               
    jmp CheckDone
    
NextPassenger:
    pop ecx                   
    add esi, 2                 
    inc ebx                   
    loop checkneighbors
    mov eax, -1
    
CheckDone:
    pop edx
    pop esi
    pop ebx
    pop edi
    pop ecx
    ret
checkingneighbourpass ENDP

passpickup PROC
    pushad
    mov al,currentpass
    CMP al,totalpass
    jge pickupdone
    mov esi,OFFSET passrc
    movzx eax,currentpass
    mov edx,2
    mul edx
    add esi,eax
    mov bl,[esi]      
    mov bh,[esi+1]    
    CMP bl,0
    je pickupdone
    CMP bh,0
    je pickupdone
    push ebx
    mov [esi],bl
    mov [esi+1],bh
    call genedestination
    pop ebx
    mov edi,OFFSET destrc
    movzx eax,currentpass
    mov edx,2
    mul edx
    add edi,eax
    mov al,[edi]
    CMP al,0
    je pickupfailed    
    mov ah,[edi+1]
    CMP ah,0
    je pickupfailed
    mov dl,bl
    mov dh,bh
    movzx eax,backgroundcolor
    shl eax,4
    add al,backgroundcolor
    call SetTextColor
    call Gotoxy
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    movzx ebx,currentpass
    mov edi,OFFSET passstate
    add edi,ebx
    mov byte ptr [edi],1
    mov esi,OFFSET passrc
    movzx eax,currentpass
    mov edx,2
    mul edx
    add esi,eax
    mov byte ptr [esi],0
    mov byte ptr [esi+1],0
    call sound
    jmp pickupdone

pickupfailed: 
    mov currentpass, 255
    
pickupdone:
    popad
    ret
passpickup ENDP

    
checkatdestination PROC
    push ebx
    push ecx
    push esi
    mov al,currentpass
    CMP al,255
    je notatdest
    CMP al, totalpass
    jge notatdest
    movzx ebx, al
    mov eax, ebx
    mov edx, 2
    mul edx
    mov edi, OFFSET destrc
    add edi, eax
    mov dl, [edi]      
    mov dh, [edi+1]   
    CMP dl, 0
    je notatdest
    CMP dh, 0
    je notatdest
    mov al, taxix
    mov ah, taxiy
    CMP ah, dh
    jne notatdest
    mov cl, dl
    dec cl
    CMP al, cl
    je at_dest
    CMP al, dl
    je at_dest
    mov cl, dl
    inc cl
    CMP al, cl
    je at_dest
    mov cl, dl
    add cl, 2
    CMP al, cl
    je at_dest
    mov cl, dl
    add cl, 3
    CMP al, cl
    je at_dest
    mov cl, dl
    add cl, 4
    CMP al, cl
    je at_dest
    jmp notatdest
    
at_dest:
    mov eax, 1
    jmp dest_check_done
    
notatdest:
    mov eax, 0
    
dest_check_done:
    pop esi
    pop ecx
    pop ebx
    ret
checkatdestination ENDP



passdrop PROC
    pushad
    mov al, currentpass
    CMP al, totalpass
    jge dropdone
    add score, 10
    call sound
    mov al, 3
    sub al, remainingpass
    inc al  
    CMP al, 1
    jne checkseconddelivery
    mov carspeeddelay, 20
    jmp skipspeedincrease
    
checkseconddelivery:
    CMP al, 2
    jne check_third_delivery  
    mov carspeeddelay, 12
    jmp skipspeedincrease
    
check_third_delivery:
    CMP al, 3
    jne skipspeedincrease  
    mov carspeeddelay, 8
    
skipspeedincrease:
    dec remainingpass
    movzx eax, currentpass
    mov edx, 2
    mul edx
    mov edi, OFFSET destrc
    add edi, eax 
    mov dl, [edi]
    mov dh, [edi+1]
    CMP dl, 0
    je skipremovingthiscardest
    CMP dh, 0
    je skipremovingthiscardest
    push edx
    movzx eax, backgroundcolor
    shl eax, 4
    add al, backgroundcolor
    call SetTextColor
    call Gotoxy
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    pop edx
    
skipremovingthiscardest: 
    mov byte ptr [edi], 0
    mov byte ptr [edi+1], 0
    mov edi, OFFSET passstate
    movzx ebx, currentpass
    add edi, ebx
    mov byte ptr [edi], 2
    mov esi, OFFSET passrc
    movzx eax, currentpass
    mov edx, 2
    mul edx
    add esi, eax
    mov byte ptr [esi], 0
    mov byte ptr [esi+1], 0
    mov currentpass, 255
    CMP remainingpass, 0
    jne notgameover
    mov al, gameMode
    CMP al, 0              
    je careergameover
    CMP al, 1              
    je timegameover
    CMP al, 2            
    je endlessregeneofpass
    jmp notgameover

careergameover:
    popad                   
    call gameover
    ret                      

timegameover:
    popad                     
    call timemodevictory
    ret                       

endlessregeneofpass:
    inc passdelivered        
    mov remainingpass, 3
    mov edi, OFFSET passstate
    mov ecx, totalpass
    mov al, 0
removepass:
    mov [edi], al
    inc edi
    loop removepass
    mov edi, OFFSET destrc
    mov ecx, totalpass * 2
    mov al, 0
cleardest:
    mov [edi], al
    inc edi
    loop cleardest
    call passengerrandomgene
    add score, 20

notgameover:
dropdone:
    popad
    ret
passdrop ENDP


;============ taxi movement
taxi PROC
  push edx
  push eax
  movzx eax, taxicolor
  shl eax, 4         
  add al, black       
  call SetTextColor

  mov dl, taxiX
  mov dh, taxiY
  call Gotoxy
  mov edx, OFFSET taximsg1
  call WriteString
  pop eax
  pop edx
   ret
taxi endp

removetaxi PROC
    push edx
    push eax
    movzx eax, backgroundcolor
    shl eax, 4
    add al, backgroundcolor            
    call SetTextColor
    
    mov dl, taxix
    mov dh, taxiy
    call Gotoxy
    mov al, ' '
    call WriteChar              
    pop eax
    pop edx
    ret
removetaxi ENDP


left PROC
    push edx
    mov al,taxispeed
    CMP al, 2
    JNE moveleft
    inc redtaxicounter
    mov al,redtaxicounter
    AND al,1
    CMP al,0
    jne cannotmoveleft
    
moveleft:
    mov dl,taxix
    mov dh,taxiy
    dec dl 
    CMP dl,minx
    jl cannotmoveleft
    push edx
    call validposition
    CMP eax,0
    je cannotmoveleftp
    pop edx
    jmp validmoveleft

cannotmoveleftp:
    pop edx
    jmp cannotmoveleft

validmoveleft:
    call removetaxi
    dec taxix
    mov al,gameMode
    CMP al,0
    jne skipfuelleft
    
    mov dl,taxix
    mov dh,taxiy
    call carcollision
    CMP eax,1
    jne skipcollisionleft
    
    call processcarcollision
    CMP playerlives, 0
    jle gameoverleft
    
skipcollisionleft:
    inc taximovedelay
    mov eax,taximovedelay
    AND eax,3
    CMP eax,0
    jne skipfuelleft
    dec playerfuel   
skipfuelleft:
    
cannotmoveleft:
    pop edx
    ret

gameoverleft:
    pop edx
    ret
left ENDP


right PROC
    push edx
    mov al,taxispeed
    CMP al,2
    jne moveright
    inc redtaxicounter
    mov al,redtaxicounter
    AND al,1
    CMP al,0
    jne cannotmoveright
    
moveright:
    mov dl,taxix
    mov dh,taxiy
    inc dl
    CMP dl,maxx
    jg cannotmoveright
    push edx
    call validposition
    CMP eax,0
    je cannotmoverightp
    pop edx
    jmp validmoveright

cannotmoverightp:
    pop edx
    jmp cannotmoveright

validmoveright:
    call removetaxi
    inc taxix
    mov al,gameMode
    CMP al,0
    jne skipfuelright
    
    mov dl,taxix
    mov dh,taxiy
    call carcollision
    CMP eax,1
    jne skipcollisionright
    
    call processcarcollision
    CMP playerlives, 0
    jle gameoverright
    
skipcollisionright:
    inc taximovedelay
    mov eax,taximovedelay
    AND eax,3
    CMP eax,0
    jne skipfuelright 
    dec playerfuel

skipfuelright:  
cannotmoveright:
    pop edx
    ret

gameoverright:
    pop edx
    ret
right ENDP


up PROC
    push edx
    mov dl,taxix
    mov dh,taxiy
    dec dh
    CMP dh,miny
    jl cannotmoveup
    push edx
    call validposition
    CMP eax, 0
    je cannotmoveupp
    pop edx
    jmp validmoveup

cannotmoveupp:
    pop edx
    jmp cannotmoveup

validmoveup:
    call removetaxi
    dec taxiy
    mov al,gameMode
    CMP al,0
    jne skipfuelup
    mov dl,taxix
    mov dh,taxiy
    call carcollision
    CMP eax,1
    jne skipcollisionup
    call processcarcollision
    CMP playerlives,0
    jle gameoverup
    
skipcollisionup:
    inc taximovedelay
    mov eax,taximovedelay
    AND eax,3
    CMP eax,0
    jne skipfuelup
    dec playerfuel
  
skipfuelup:   
cannotmoveup:
    pop edx
    ret

gameoverup:
    pop edx
    ret
up ENDP


down PROC
    push edx
    mov dl,taxix
    mov dh,taxiy
    inc dh
    CMP dh,maxy
    jg cannotmovedown
    push edx
    call validposition
    CMP eax, 0
    je cannotmovedownp
    pop edx
    jmp validmovedown

cannotmovedownp:
    pop edx
    jmp cannotmovedown

validmovedown:
    call removetaxi
    inc taxiy
    mov al,gameMode
    CMP al,0
    jne skipfueldown
    
    mov dl,taxix
    mov dh,taxiy
    call carcollision
    CMP eax,1
    jne skipcollisiondown
    
    call processcarcollision
    CMP playerlives, 0
    jle gameoverdown
    
skipcollisiondown:
    inc taximovedelay
    mov eax,taximovedelay
    AND eax,3
    CMP eax,0
    jne skipfueldown
    dec playerfuel
    
skipfueldown:
    
cannotmovedown:
    pop edx
    ret

gameoverdown:
    pop edx
    ret
down ENDP


;========= car movement
carmovement PROC
    pushad
    mov esi,OFFSET carrc
    mov ecx,totalcars
    
MoveCarLoop:
    push ecx
    mov dl,[esi]     
    mov dh,[esi+1]     
    CMP dl,minx
    jl skipcarmovement
    CMP dl,maxx
    jg skipcarmovement
    CMP dh,miny
    jl skipcarmovement
    CMP dh,maxy
    jg skipcarmovement
    mov bl,[esi+2]   
    mov bh,[esi+3]    
    mov al,[esi+4]     
    push esi
    push eax
    push edx
    call carpasscollision
    CMP eax, 1
    je currentpositiononobstacle
    
    call cardestinationcollision
    CMP eax, 1
    je currentpositiononobstacle
    pop edx
    pop eax
    pop esi
    jmp checknextmove
    
currentpositiononobstacle: 
    pop edx
    pop eax
    pop esi
    xor al, 1           
    mov [esi+4],al
    jmp skipcarmovement
    
checknextmove: 
    push eax            
    mov dh,[esi+1]  
    CMP al,0
    je findnextupwardmove   
CalculateNextDown:
    inc dh             
    jmp checknextposition
    
findnextupwardmove:
    dec dh             
    
CheckNextPosition:   
    push esi
    push edx   
    call carpasscollision
    CMP eax, 1
    je carwillcollidewithobject
    call cardestinationcollision
    CMP eax, 1
    je carwillcollidewithobject
    pop edx
    pop esi
    pop eax            
    jmp checknormalmovement
    
carwillcollidewithobject: 
    pop edx
    pop esi
    pop eax              
    xor al, 1            
    mov [esi+4], al    
    jmp skipcarmovement
    
checknormalmovement: 
    CMP al,0
    je carup
    
cardown:
    inc dh
    CMP dh, bh
    jle validatecarposition
    mov BYTE PTR [esi+4],0
    jmp skipcarmovement
    
carup:
    dec dh 
    CMP dh, bl
    jge validatecarposition
    mov BYTE PTR [esi+4], 1
    jmp skipcarmovement
    
validatecarposition:  
    push esi
    push eax
    push edx
    call wallcollsion
    CMP eax, 0
    je carhitobstacle
    call treecollision
    CMP eax, 0
    je carhitobstacle   
    pop edx
    pop eax
    pop esi
    jmp updatecarposition
    
carhitobstacle:
    pop edx
    pop eax
    pop esi
    mov al,[esi+4]
    xor al,1
    mov [esi+4],al
    jmp skipcarmovement
    
updatecarposition: 
    mov [esi+1], dh
    
skipcarmovement:
    add esi,5
    pop ecx
    dec ecx
    CMP ecx,0
    jne MoveCarLoop     
    popad
    ret
carmovement ENDP

;======== collision 
wallcollsion PROC
    push esi
    push ecx
    push ebx

    mov esi,OFFSET wallrcla
    mov ecx,totalwalls
wallcheckl:
    push ecx
    mov al,[esi]
    mov ah,[esi+1]
    mov bl,[esi+2]
    mov bh,[esi+3]
    CMP bh,0
    JE horiwall
    CMP dl,al
    JNE nextwall
    mov cl,ah
    add cl,bl
    dec cl
    CMP dh,ah
    JL nextwall
    CMP dh,cl
    JG nextwall
    pop ecx
    mov eax,0
    JMP endl
horiwall:
    CMP dh,ah
    JNE nextwall
    mov cl,al
    add cl,bl
    dec cl
    CMP dl,al
    JL nextwall
    CMP dl,cl
    JG nextwall
    pop ecx
    mov eax,0
    JMP endl

vertwall:
    CMP dl,al
    JNE nextwall
    mov cl,ah
    add cl,bl
    dec cl
    CMP dh,ah
    JL nextwall
    CMP dh,cl
    JG nextwall
    pop ecx
    mov eax,0
    JMP endl
nextwall:
    add esi,4
    pop ecx
    loop wallcheckl
    mov eax,1
endl:
    pop ebx
    pop ecx
    pop esi
    ret 
wallcollsion endp


treecollision PROC
   push esi
   push ecx
   push ebx
   mov esi,OFFSET treerc
   mov ecx,totaltrees

treel:
   push ecx 
   mov al,[esi]       
   mov ah,[esi+1]      
   CMP dh, ah
   jne checkrow2   
   mov bl, al
   inc bl             
   mov cl, al
   add cl, 4              
   CMP dl, bl
   jl checkrow2
   CMP dl, cl
   jge checkrow2     
   pop ecx
   mov eax, 0
   jmp endtree
checkrow2:
   mov bl,ah
   inc bl
   CMP dh,bl
   jne checkrow3  
   mov bl, al         
   mov cl, al
   add cl, 5             
   CMP dl, bl
   jl checkrow3
   CMP dl, cl
   jge checkrow3
   pop ecx
   mov eax, 0
   jmp endtree
checkrow3:  
   mov bl, ah
   add bl, 2
   CMP dh, bl
   jne nexttree   
   mov bl, al
   add bl, 2           
   mov cl, al
   add cl, 3      
   CMP dl, bl
   jl nexttree
   CMP dl, cl
   jge nexttree
   pop ecx
   mov eax, 0
   jmp endtree
nexttree:
   add esi,2
   pop ecx
   loop treel
   mov eax, 1
endtree:
   pop ebx
   pop ecx
   pop esi 
   ret
treecollision endp


passcollision PROC
   push esi
   push ecx
   push ebx
   mov edi,OFFSET passrc
   mov ecx,totalpass

ttemp:
   push ecx                   
   mov al,[edi]
   CMP al,0
   JE nextpass
   mov al,[edi]
   mov ah,[edi+1]
   CMP dh,ah                  
   JNE nextpass
   mov bl,al
   add bl,2                    
   CMP dl,al
   JL nextpass
   CMP dl,bl
   JG nextpass                   
   pop ecx                   
   mov eax,0
   JMP endl

nextpass:
   pop ecx                   
   add edi,2
   loop ttemp
   mov eax,1
   JMP endl
endl:
  pop ebx
  pop ecx
  pop esi
  ret
passcollision endp

carcollision PROC   
    push esi
    push ecx
    push ebx 
    mov esi, OFFSET carrc
    mov ecx, totalcars
    
CheckCar:
    push ecx    
    mov al, [esi]      
    mov ah, [esi+1]       
    CMP dh, ah
    jne CheckWheelLine  
    mov bl, al
    add bl, 2          
    CMP dl, al        
    jl CheckWheelLine
    CMP dl, bl        
    jg CheckWheelLine    
    pop ecx
    mov eax, 1
    jmp carcollided
    
CheckWheelLine: 
    mov bl, ah
    inc bl             
    CMP dh, bl
    jne NextCar  
    mov bl, al
    add bl, 2         
    CMP dl, al
    jl NextCar
    CMP dl, bl
    jg NextCar
    pop ecx
    mov eax, 1
    jmp carcollided
    
NextCar:
    add esi, 5
    pop ecx
    loop CheckCar
    mov eax, 0
    
carcollided:
    pop ebx
    pop ecx
    pop esi
    ret
carcollision ENDP
  
caroverlap PROC  
    push esi
    push ecx
    push ebx   
    mov esi,OFFSET carrc
    mov ecx,totalcars
    
CheckOverlapLoop:
    push ecx 
    mov al, [esi]      
    mov ah, [esi+1]    
    CMP dh, ah
    jne checknextcar
    mov bl, al
    add bl, 2        
    CMP dl, al
    jl checknextcar
    CMP dl, bl
    jg checknextcar
    pop ecx
    mov eax, 1
    jmp OverlapDone
    
checknextcar:
    add esi,5
    pop ecx
    loop CheckOverlapLoop
    mov eax, 0
    
OverlapDone:
    pop ebx
    pop ecx
    pop esi
    ret
caroverlap ENDP
 
carpasscollision PROC
    push esi
    push ecx
    push ebx
    push edi
    mov esi,OFFSET passrc
    mov edi,OFFSET passstate
    mov ecx,totalpass
    
CheckPassLoop:
    push ecx
    mov al, [edi]
    CMP al,2                   
    je nextpasscheck
    CMP al,1                  
    je nextpasscheck
    mov al, [esi]
    CMP al, 0                   
    je nextpasscheck
    mov ah, [esi+1]
    CMP dh, ah
    jne nextpasscheck
    mov bl, al                  
    mov bh, al
    add bh, 2                  
    mov cl, dl                  
    mov ch, dl
    add ch, 2                 
    CMP ch, bl
    jl nextpasscheck           
    CMP cl, bh
    jg nextpasscheck            
    pop ecx
    mov eax, 1
    jmp passCollided
    
nextpasscheck:
    add esi, 2
    inc edi
    pop ecx
    loop CheckPassLoop
    mov eax, 0
    
passCollided:
    pop edi
    pop ebx
    pop ecx
    pop esi
    ret
carpasscollision ENDP

 

cardestinationcollision PROC
    push esi
    push ecx
    push ebx
    push edi
    mov esi, OFFSET destrc
    mov edi, OFFSET passstate
    mov ecx, totalpass
    
checkdest:
    push ecx
    mov al, [edi]
    CMP al, 1                   
    jne NextDestCheck
    mov al, [esi]
    CMP al, 0                   
    je NextDestCheck
    mov ah, [esi+1]
    CMP dh, ah
    jne NextDestCheck
    mov bl, al              
    mov bh, al
    add bh, 3                  
    mov cl, dl              
    mov ch, dl
    add ch, 2                
    CMP ch, bl
    jl nextdestcheck          
    CMP cl, bh
    jg nextdestcheck           
    pop ecx
    mov eax, 1
    jmp destcollided
    
nextdestcheck:
    add esi, 2
    inc edi
    pop ecx
    loop checkdest
    mov eax, 0
    
destcollided:
    pop edi
    pop ebx
    pop ecx
    pop esi
    ret
cardestinationcollision ENDP
 

validposition PROC
    call wallcollsion
    CMP eax, 0
    je invalidposition
    
    call treecollision
    CMP eax, 0
    je invalidposition
    
    call passcollision
    CMP eax, 0
    je invalidposition
    
    mov al, gameMode
    CMP al, 0                    
    je skipcarblock           
    
    call caroverlap
    CMP eax,1
    je invalidposition           
    
skipcarblock:
    CMP dl, minx
    jl invalidposition
    CMP dl, maxx
    jg invalidposition
    CMP dh, miny
    jl invalidposition
    CMP dh, maxy
    jg invalidposition
    mov eax, 1
    ret
    
invalidposition:
    mov eax,0
    ret
validposition ENDP



carvalidposition PROC
    push edx
    call wallcollsion
    CMP eax, 0
    je carinvalidpos
    
    call treecollision
    CMP eax, 0
    je carinvalidpos
    
    pop edx
    mov eax, 1
    ret
    
carinvalidpos:
    pop edx
    mov eax, 0
    ret
carvalidposition ENDP



;============ collision hANDlers
processtreecollision PROC
    mov al, taxicolor
    CMP al, brown         
    je yellowtreescorededuction 
    CMP al, red
    je redtreescorededuction
    jmp notreescorededuction
    
yellowtreescorededuction:
    CMP score, 4
    jl zeroscoretree
    sub score, 4
    jmp treecollisionend
    
redtreescorededuction:
    CMP score, 2
    jl zeroscoretree
    sub score, 2
    jmp treecollisionend
    
zeroscoretree:
    mov score, 0
    
treecollisionend:  
    push eax
    mov eax, 100
    call Delay
    pop eax
    
notreescorededuction:
    ret
processtreecollision ENDP

processwallcollision PROC
    push eax
    push ebx
    mov eax, score
    mov ebx, 5
    CMP eax, ebx
    jl settozero
    sub eax, ebx
    mov score, eax
    jmp donecollision
    
settozero:
    mov eax, 0
    mov score, eax
    
donecollision:   
    push eax
    mov eax, 100
    call Delay
    pop eax   
    pop ebx
    pop eax
    ret
processwallcollision ENDP


processcarcollision PROC
    call sound
    call scorededuction
    mov al,gameMode
    CMP al,0                   
    jne skiplifereduction
    dec playerlives
    mov eax, red
    shl eax, 4
    add al, red
    call SetTextColor
    call Clrscr
    mov eax, 300
    call Delay
    movzx eax, backgroundcolor
    shl eax, 4
    add al, backgroundcolor
    call SetTextColor
    call Clrscr
    
    CMP playerlives, 0
    jle livesgameover
    call removetaxi
    call noobstacleposition
    mov currentpass, 255
    push edi
    push ecx
    mov edi, OFFSET destrc
    mov ecx, totalpass * 2
    mov al, 0
clearalldest:
    mov [edi], al
    inc edi
    loop clearalldest
    pop ecx
    pop edi

    push edi
    push ecx
    push esi
    mov edi, OFFSET passstate
    mov esi, OFFSET passrc
    mov ecx, totalpass
resetpassengerstate:
    push ecx
    mov al, [edi]
    CMP al, 1
    jne skipresetpassenger
    mov byte ptr [edi], 0

skipresetpassenger:
    inc edi
    add esi, 2
    pop ecx
    loop resetpassengerstate
    pop esi
    pop ecx
    pop edi

    call wall
    call trees
    call passengers
    call bonus
    call gas
    call cars
    call taxi
    mov eax, 500
    call Delay
    
    jmp skiplifereduction
    
livesgameover:  
    call nolivesgameover 
    call gameover
    
skiplifereduction:
    ret
processcarcollision ENDP

scorededuction PROC  
    mov al, taxicolor 
    CMP al, red
    je redcarscorededuction
    CMP al, brown         
    je yellowcarscorededuction
    jmp nocarscorededuction
    
redcarscorededuction: 
    CMP score, 2
    jl zeroscorecar
    sub score, 2
    jmp carcollisionend
    
yellowcarscorededuction:
    CMP score, 5
    jl zeroscorecar
    sub score, 5
    jmp carcollisionend
    
zeroscorecar:
    mov score, 0
    
carcollisionend:
    
nocarscorededuction:
    ret
scorededuction ENDP



;===== bonus AND fuel
bonuscollection PROC
    push esi
    push edi
    push ecx
    push edx
    mov esi, OFFSET bonusrc
    mov edi, OFFSET bonusstate
    mov ecx, totalbonus
    mov ebx, 0

checkbonus:
    push ecx
    mov al, [edi]
    CMP al, 0
    je nextbonuscheck
    mov al, [esi]
    mov ah, [esi+1]
    CMP al, 0
    je nextbonuscheck
    mov dl, taxix
    mov dh, taxiy
    mov cl, ah
    CMP dh, cl
    je checkxcollision
    inc cl
    CMP dh, cl
    je checkxcollision
    inc cl
    CMP dh, cl
    je checkxcollision
    jmp nextbonuscheck

checkxcollision:
    mov cl, al
    add cl, 4          
    CMP dl, al         
    jl nextbonuscheck
    CMP dl, cl         
    jg nextbonuscheck
    mov byte ptr [edi], 0        
    add score, 10               
    call sound
    push edx
    push eax
    movzx eax, backgroundcolor
    shl eax, 4
    add al, backgroundcolor
    call SetTextColor
    mov dl, [esi]
    mov dh, [esi+1]
    call Gotoxy
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    
    inc dh
    mov dl, [esi]
    call Gotoxy
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    
    inc dh
    mov dl, [esi]
    call Gotoxy
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    pop eax
    pop edx
    jmp bonuscollected

nextbonuscheck:
    add esi, 2
    inc edi
    inc ebx
    pop ecx
    dec ecx
    CMP ecx, 0
    jne checkbonuscontinue
    jmp nobonuscollected

checkbonuscontinue:
    jmp checkbonus

bonuscollected:
    pop ecx
    
nobonuscollected:
    pop edx
    pop ecx
    pop edi
    pop esi
    ret
bonuscollection ENDP

gascollection PROC
    push esi
    push edi
    push ecx
    push edx
    mov al,gameMode
    CMP al,0
    jne nofuelcollected
    mov esi, OFFSET fuelCanrc
    mov edi, OFFSET fuelstatus
    mov ecx, totalfuelcans
    mov ebx, 0

checkfuel:
    push ecx
    mov al, [edi]
    CMP al, 0
    je nextfuelcheck
    mov al, [esi]
    mov ah, [esi+1]
    mov dl, taxix
    mov dh, taxiy
    CMP dh, ah
    jne nextfuelcheck
    mov cl, al
    add cl, 2         
    CMP dl, al
    jl nextfuelcheck
    CMP dl, cl
    jg nextfuelcheck
    mov byte ptr [edi], 0       
    mov playerfuel, 100
    call sound
    push edx
    push eax
    
    movzx eax, backgroundcolor
    shl eax, 4
    add al, backgroundcolor
    call SetTextColor
    mov dl, [esi]
    mov dh, [esi+1]
    call Gotoxy
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    pop eax
    pop edx
    jmp fuelcollected

nextfuelcheck:
    add esi, 2
    inc edi
    inc ebx
    pop ecx
    dec ecx
    CMP ecx, 0
    jne check_fuel_continue
    jmp nofuelcollected

check_fuel_continue:
    jmp checkfuel

fuelcollected:
    pop ecx
    
nofuelcollected:
    pop edx
    pop ecx
    pop edi
    pop esi
    ret
gascollection ENDP


;====== game logic
gameplay PROC
    call GetMSeconds
    mov starttime,eax
    movzx eax,backgroundcolor
    shl eax, 4
    add al, backgroundcolor
    call SetTextColor
    call Clrscr
    call wall              
    call trees            
    
gameplayloop:
    mov al, gameMode
    CMP al, 1
    jne skiptimecheck
    call timelimitt
    CMP eax, 1
    jne skiptimecheck
    call timeupgameover
    ret
    
skiptimecheck:
    mov al, gameMode
    CMP al, 1
    jne skipflashcheck
    call GetMSeconds
    sub eax, starttime
    mov ebx, timeLimit
    sub ebx, eax
    CMP ebx, 10000
    jg skipflashcheck
    mov eax, ebx
    mov edx, 0
    mov ecx, 2000
    div ecx
    CMP edx, 0
    jne skipflashcheck
    INVOKE Beep,1000,100
    
skipflashcheck:
    inc movecount
    mov eax,movecount
    CMP eax,carspeeddelay
    jl skipcarmovement
    mov movecount, 0
    push esi
    mov esi, OFFSET carrc
    mov ecx, totalcars

clearoldcars:
    push ecx
    mov dl, [esi]
    mov dh, [esi+1]
    call removecars      
    add esi, 5
    pop ecx
    loop clearoldcars
    pop esi
    call carmovement
    
skipcarmovement:
     mov al, gameMode
    CMP al, 0
    jne skipfuelcheck
    
    CMP playerfuel, 0
    jle fuelempty
    jmp skipfuelcheck
    
fuelempty:
    call nofuelgameover
    jmp exitgame
    
skipfuelcheck:
    call passengers         
    call bonus     
    call gas       
    call cars           
    call displaydest
    call taxi               
    mov dl, 0
    mov dh, 0
    call Gotoxy
    mov eax,white+(black*16)
    call SetTextColor 
    call gameinformation
    mov eax, 25
    call Delay
    call ReadKey
    jz gameplayloop
    mov bl, al  
    mov al, taxicolor
    CMP al, red
    jne processinputnormal 
    inc redtaxicounter
    mov al, redtaxicounter
    
    and al, 1              
    CMP al, 0               
    jne skipredtaximove
    mov al, bl
    jmp processinputnormal

skipredtaximove:
    jmp gameplayloop       

processinputnormal:
    mov al, bl 
    CMP al, 'p'
    je pausegame
    CMP al, 'P'
    je pausegame    
    CMP al, 'a'
    je leftmove
    CMP al, 'd'  
    je rightmove
    CMP al, 'w'
    je upmove
    CMP al, 's'
    je downmove
    CMP al, 27
    je exitgame
    CMP al, 32
    je spacebarpressed
    CMP al, 'g'
    je Gpressed
    CMP al, 'G'
    je Gpressed
    jmp gameplayloop

pausegame:
    mov gamePaused, 1
    call gamepause
    movzx eax, backgroundcolor
    shl eax, 4
    add al, backgroundcolor
    call SetTextColor
    call Clrscr
    call wall
    call trees
    call passengers
    call bonus
    call gas
    call cars
    call displaydest
    call taxi
    jmp gameplayloop

Gpressed:
    mov al, gameMode
    CMP al, 2
    jne gameplayloop
    call gameoverendlessmode
    ret
    
leftmove:
    call left
    call bonuscollection
    call gascollection
    jmp gameplayloop
    
rightmove:
    call right  
    call bonuscollection
    call gascollection
    jmp gameplayloop
    
upmove:
    call up
    call bonuscollection
    call gascollection
    jmp gameplayloop
    
downmove:
    call down
    call bonuscollection
    call gascollection
    jmp gameplayloop
 
spacebarpressed:
    movzx eax, currentpass
    CMP al, 255
    je pickup
    CMP al,totalpass
    jge invalidpassenger
    call checkatdestination
    CMP eax, 1
    jne notatdestination  
    call passdrop
    jmp gameplayloop
    
invalidpassenger:
    mov currentpass, 255
    jmp gameplayloop   
    
notatdestination:
    jmp gameplayloop
    
pickup:
    call checkingneighbourpass
    CMP eax, -1
    je nopassengernearby
    mov currentpass, al
    call passpickup
    jmp gameplayloop   
nopassengernearby:
    jmp gameplayloop

exitgame:
    call Clrscr
    mov eax,white+(black*16)
    call SetTextColor
    call endgame
    ret     

gameplay ENDP

timelimitt PROC  
    push ebx
    push edx
    call GetMSeconds
    sub eax,starttime
    CMP eax,timeLimit
    jge timeexpired
    mov eax, 0
    jmp timecheckdone
    
timeexpired:
    mov eax, 1
    
timecheckdone:
    pop edx
    pop ebx
    ret
timelimitt ENDP

redlight PROC
    mov al, gameMode
    CMP al, 1
    jne noflash
    call GetMSeconds
    sub eax, starttime
    mov ebx, timeLimit
    sub ebx, eax
    CMP ebx, 10000
    jg noflash
    mov warningstatus, 1
    call sound
    mov al, flashState
    xor al, 1
    mov flashState, al
    CMP flashState, 1
    je showredflash 
    movzx eax, backgroundcolor
    shl eax, 4
    add al, backgroundcolor
    call SetTextColor
    jmp flashdone
    
showredflash:
    mov eax, red
    shl eax, 4
    add al, red
    call SetTextColor
    mov eax, 800        
flashdone: 
    call Clrscr
    ret
  
noflash:
    mov warningstatus, 0
    ret
redlight ENDP


;======display
gameinformation PROC
    push eax
    push edx
    mov dl, 40
    mov dh, 6
    call Gotoxy
    mov eax,magenta+(yellow*16)
    call SetTextColor
    mov edx, OFFSET playerMsg
    call WriteString
    mov edx, OFFSET pname
    call WriteString
 
    mov dl, 70
    mov dh, 6
    call Gotoxy
    mov eax, magenta + (yellow * 16)
    call SetTextColor
    mov edx, OFFSET scoreMsg
    call WriteString
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    
    mov dl, 77
    mov dh, 6
    call Gotoxy
    mov eax, score
    call WriteDec
    
    mov al, gameMode
    CMP al, 0
    jne skiplivesdisplay
    
    mov dl, 40
    mov dh, 4
    call Gotoxy
    mov eax, red + (yellow * 16)
    call SetTextColor
    mov edx, OFFSET livesMsg
    call WriteString
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar

    mov dl, 47
    mov dh, 4
    call Gotoxy
    movzx ecx, playerlives
    CMP ecx, 0
    je skiplivesdisplay
liveheart:
    mov edx, OFFSET heartMsg
    call WriteString
    loop liveheart
    
skiplivesdisplay:
    mov al, gameMode
    CMP al, 0
    jne skipfueldisplay
    mov dl, 40
    mov dh, 2
    call Gotoxy
    mov eax, playerfuel
    CMP eax, 20
    jl lowfuel
    mov eax, cyan + (yellow * 16)
    call SetTextColor
    mov edx, OFFSET fuelMsg
    call WriteString
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    mov dl, 46
    mov dh, 2
    call Gotoxy
    mov eax, playerfuel
    call WriteDec
    mov al,'%'
    call WriteChar
    jmp skipfueldisplay
    
lowfuel:
    mov eax, red + (yellow * 16)
    call SetTextColor
    mov edx, OFFSET fuelLowMsg
    call WriteString
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar

    mov dl, 51
    mov dh, 2
    call Gotoxy
    mov eax, playerfuel
    call WriteDec
    mov al, '%'
    call WriteChar
    
skipfueldisplay:
    mov dl, 100
    mov dh, 6
    call Gotoxy
    mov eax, magenta + (yellow * 16)
    call SetTextColor
    
    mov al, gameMode
    CMP al, 1
    je displaycountdown
    mov edx, OFFSET timeMsg
    call WriteString
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    
    mov dl, 106
    mov dh, 6
    call Gotoxy
    call GetMSeconds
    sub eax, starttime
    mov currentTime, eax
    mov edx, 0
    mov ebx, 1000
    div ebx
    call WriteDec
    mov al, 's'
    call WriteChar
    jmp endl

displaycountdown:
    mov edx, OFFSET timeModeMsg
    call WriteString
    
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    
    mov dl, 111
    mov dh, 6
    call Gotoxy
    call GetMSeconds
    sub eax, starttime
    mov ebx, timeLimit
    sub ebx, eax
    jc show_zero_time
    mov eax, ebx
    mov edx, 0
    mov ebx, 1000
    div ebx
    call WriteDec
    mov al, 's'
    call WriteChar
    jmp endl

show_zero_time:
    mov eax, 0
    call WriteDec
    mov al, 's'
    call WriteChar

endl:
    mov al, gameMode
    CMP al, 2
    jne skipendless
    
    mov dl, 66
    mov dh, 4
    call Gotoxy
    mov eax,magenta+(yellow*16)
    call SetTextColor
    mov edx, OFFSET endlessModeMsg
    call WriteString

skipendless:
    
    pop edx
    pop eax
    ret
gameinformation ENDP

scoretwodigits PROC 
    push eax
    push ebx
    push edx   
    CMP eax, 10
    jge normaldisplay  
    mov ebx, eax
    mov al, '0'
    call WriteChar
    mov eax, ebx
    call WriteDec
    jmp displaydone
    
normaldisplay:
    call WriteDec
    
displaydone:
    pop edx
    pop ebx
    pop eax
    ret
scoretwodigits ENDP


;==== game over
gameover PROC
    pushad  
    call GetMSeconds
    sub eax, starttime
    mov currentTime, eax
    xor edx, edx
    mov ebx, 1000
    div ebx
    mov ebx, eax        
    call Clrscr
    mov eax,magenta+(lightgreen*16)
    call SetTextColor
    call Clrscr
  
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,65
   mov dh,15
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,74
   mov dh,15
   call Gotoxy
   mov edx, OFFSET gameOverTitle
   call WriteString
    
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,65
   mov dh,17
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,73
   mov dh,17
   call Gotoxy
   mov edx, OFFSET congratsMsg
   call WriteString
    
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,65
   mov dh,19
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,73
   mov dh,19
   call Gotoxy
   mov edx, OFFSET playerMsg
   call WriteString
   mov edx, OFFSET pname
   call WriteString
    
 
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,65
   mov dh,21
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,72
   mov dh,21
   call Gotoxy
   mov edx, OFFSET finalScoreMsg
   call WriteString
   mov eax, score
   call WriteDec
    
   mov eax,magenta+(magenta*16)
   call SetTextColor
   mov dl,65
   mov dh,23
   call Gotoxy
   mov edx,OFFSET temp1
   call writestring
   mov eax,yellow+(magenta*16)
   call SetTextColor
   mov dl,72
   mov dh,23
   call Gotoxy
   mov edx, OFFSET timeTakenMsg
   call WriteString
   mov eax, ebx       
   call WriteDec
   mov edx, OFFSET secondsMsg
   call WriteString

   call ReadChar
   call endgame 
   popad
   ret
gameover ENDP

nolivesgameover PROC
    pushad
    call sound
    call Clrscr
    mov eax,lightgreen+(lightgreen*16)
    call SetTextColor
    call Clrscr
    
    mov eax,lightgreen+(lightgreen*16)
    call SetTextColor
    mov dl,58
    mov dh,18
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(lightgreen*16)
    call SetTextColor
    mov dl,60
    mov dh,18
    call Gotoxy
    mov edx, OFFSET gameOverLivesMsg
    call WriteString
    
    mov eax, 2000
    call Delay
    call ReadChar
    
    call gameover
    call endgame
    popad
    ret
nolivesgameover ENDP


  
timemodevictory PROC
    pushad
    call sound
    call Clrscr
    mov eax, magenta + (lightgreen * 16)
    call SetTextColor
    call Clrscr
    
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,65
    mov dh,15
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,74
    mov dh,15
    call Gotoxy
    mov edx, OFFSET gameOverTitle
    call WriteString
    
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,65
    mov dh,17
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,63
    mov dh,17
    call Gotoxy
    mov edx, OFFSET timeModeVictoryMsg
    call WriteString
        
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,65
    mov dh,19
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,72
    mov dh,19
    call Gotoxy
    mov edx, OFFSET finalScoreMsg
    call WriteString
    mov eax, score
    call WriteDec
    
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,65
    mov dh,21
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,68
    mov dh,21
    call Gotoxy
    mov edx, OFFSET timeRemainingMsg
    call WriteString
    
    call GetMSeconds
    sub eax, starttime
    mov ebx, timeLimit
    sub ebx, eax
    mov eax, ebx
    mov edx, 0
    mov ebx, 1000
    div ebx
    call WriteDec
    mov al, 's'
    call WriteChar
    
    call ReadChar
    call endgame
    
    popad
    ret
timemodevictory ENDP

nofuelgameover PROC
    pushad  
    call Clrscr
    mov eax, magenta + (lightgreen * 16)
    call SetTextColor
    call Clrscr
       
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,60
    mov dh,15
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,63
    mov dh,15
    call Gotoxy
    mov edx, OFFSET fuelEmptyMsg
    call WriteString
    
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,60
    mov dh,17
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,70
    mov dh,17
    call Gotoxy
    mov edx, OFFSET playerMsg
    call WriteString
    mov edx, OFFSET pname
    call WriteString
        
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,60
    mov dh,19
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,68
    mov dh,19
    call Gotoxy
    mov edx, OFFSET finalScoreMsg
    call WriteString
    mov eax, score
    call WriteDec
    
    call ReadChar
    call endgame
    popad
    ret
nofuelgameover ENDP


timeupgameover PROC
    pushad
     call sound
    call Clrscr
    mov eax, magenta + (lightgreen * 16)
    call SetTextColor
    call Clrscr
    
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,65
    mov dh,15
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,70
    mov dh,15
    call Gotoxy
    mov edx, OFFSET timeUpMsg
    call WriteString
    
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,65
    mov dh,17
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,73
    mov dh,17
    call Gotoxy
    mov edx, OFFSET playerMsg
    call WriteString
    mov edx, OFFSET pname
    call WriteString
        
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,65
    mov dh,19
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,72
    mov dh,19
    call Gotoxy
    mov edx, OFFSET finalScoreMsg
    call WriteString
    mov eax, score
    call WriteDec
    
    call ReadChar
    call endgame
    
    popad
    ret
timeupgameover ENDP


gameoverendlessmode PROC
    pushad    
    call GetMSeconds
    sub eax, starttime
    mov currentTime, eax
    xor edx, edx
    mov ebx, 1000
    div ebx
    push ebx           
    
    call Clrscr
    mov eax, magenta + (lightgreen * 16)
    call SetTextColor
    call Clrscr
    
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,62
    mov dh,13
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,72
    mov dh,13
    call Gotoxy
    mov edx, OFFSET gameOverTitle
    call WriteString
        
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,62
    mov dh,15
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,71
    mov dh,15
    call Gotoxy
    mov edx, OFFSET playerMsg
    call WriteString
    mov edx, OFFSET pname
    call WriteString
       
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,62
    mov dh,17
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,70
    mov dh,17
    call Gotoxy
    mov edx, OFFSET congratsMsg
  
    mov byte ptr [edx], 'P'
    mov byte ptr [edx+1], 'a'
    mov byte ptr [edx+2], 's'
    mov byte ptr [edx+3], 's'
    mov byte ptr [edx+4], 'e'
    mov byte ptr [edx+5], 'n'
    mov byte ptr [edx+6], 'g'
    mov byte ptr [edx+7], 'e'
    mov byte ptr [edx+8], 'r'
    mov byte ptr [edx+9], 's'
    mov byte ptr [edx+10], ':'
    mov byte ptr [edx+11], 0
    call WriteString
    mov al, ' '
    call WriteChar
    mov eax, passdelivered
    call WriteDec
      
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,62
    mov dh,19
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,70
    mov dh,19
    call Gotoxy
    mov edx, OFFSET finalScoreMsg
    call WriteString
    mov eax, score
    call WriteDec
       
    mov eax,magenta+(magenta*16)
    call SetTextColor
    mov dl,62
    mov dh,21
    call Gotoxy
    mov edx,OFFSET temp1
    call writestring
    mov eax,yellow+(magenta*16)
    call SetTextColor
    mov dl,68
    mov dh,21
    call Gotoxy
    mov edx, OFFSET timeTakenMsg
    call WriteString
    pop ebx            
    mov eax, ebx
    call WriteDec
    mov edx, OFFSET secondsMsg
    call WriteString
    
    call ReadChar
    call endgame
    
    popad
    ret
gameoverendlessmode ENDP

gamepause PROC
    pushad 
    mov dl, 65
    mov dh, 20
    call Gotoxy
    mov eax,red + (yellow * 16)
    call SetTextColor
    mov eax,red + (yellow * 16)
    call SetTextColor
    mov dl, 70
    mov dh, 20
    call Gotoxy
    mov edx, OFFSET pauseMsg1
    call WriteString  

    mov eax,red + (yellow * 16)
    call SetTextColor
    mov dl, 64
    mov dh, 22
    call Gotoxy
    mov edx, OFFSET pauseMsg2
    call WriteString
    call ReadChar
    mov gamePaused, 0 
    popad
    ret
gamepause ENDP



;====== kkkk
noobstacleposition PROC   
    push edx
    push ecx
    mov dl, 50
    mov dh, 20
    call caroverlap
    CMP eax, 0
    je safepos

    mov dl, 70
    mov dh, 12
    call caroverlap
    CMP eax, 0
    je safepos
 
    mov dl, 45
    mov dh, 30
    call caroverlap
    CMP eax, 0
 
    mov dl, 95
    mov dh, 25
    call caroverlap
    CMP eax, 0
    je safepos
 
    mov dl, 50
    mov dh, 20
    
safepos:
    mov taxix, dl
    mov taxiy, dh
    pop ecx
    pop edx
    ret
noobstacleposition ENDP

validpassposition PROC
    mov ebx, 0
    
findposi:
    inc ebx
    CMP ebx, 50
    jg usingfallbackpos
    
    mov eax,maxx - minx - 3
    call RandomRange
    add al, minx
    mov dl, al
    
    mov eax, maxy - miny - 1
    call RandomRange
    add al, miny
    mov dh, al
   
    call wallcollsion
    CMP eax, 0
    je findposi
    
    call treecollision
    CMP eax, 0
    je findposi
    push esi
    mov esi, OFFSET passrc
    mov ecx, totalpass
    
checkotherpass:
    mov al, [esi]
    CMP al, 0
    je skippasscheck
    mov al, [esi]
    mov ah, [esi+1]
    mov bl, al
    sub bl, dl
    jnc xpassdiff
    neg bl
xpassdiff:  
    mov bh, ah
    sub bh, dh
    jnc ypassdiff
    neg bh
ypassdiff: 
    CMP bl, 5
    jl findposip
    CMP bh, 5
    jl findposip 
skippasscheck:
    add esi, 2
    loop checkotherpass  
    pop esi
    ret
    
findposip:
    pop esi
    jmp findposi
    
usingfallbackpos:
    mov dl, 50
    mov dh, 20
    ret
validpassposition ENDP


destposition PROC 
    push edx
    push ecx
    mov al, dl
    mov ah, dh 
    mov ecx, 4
checkpos:
    call wallcollsion
    CMP eax, 0
    je posinvalid
    call treecollision
    CMP eax, 0
    je posinvalid
    inc dl
    loop checkpos
    mov eax, 1
    jmp checkdone
    
posinvalid:
    mov eax, 0    
checkdone:
    pop ecx
    pop edx
    ret
destposition ENDP



againcheckdest PROC
    push edx
    push ecx
    
    mov al, dl
    mov ah, dh
    mov ecx, 4
quickcheck:
    mov dl, al
    mov dh, ah
    push eax
    push ecx
    call wallcollsion
    CMP eax, 0
    pop ecx
    je quickfail
    
    call treecollision
    CMP eax, 0
    pop eax
    je quickfail
    
    inc al
    dec ecx
    CMP ecx, 0
    jne quickcheck
    
    mov eax, 1
    jmp quickdone
    
quickfail:
    pop eax
    mov eax, 0
    
quickdone:
    pop ecx
    pop edx
    ret
againcheckdest ENDP


removedest PROC
    push edx
    push ecx
    mov al, dl
    mov ah, dh
    mov ecx, 4
checkdest:
    mov dl, al
    mov dh, ah
    call wallcollsion
    CMP eax, 0
    je destnotclear
    
    call treecollision
    CMP eax, 0
    je destnotclear
    
    call caroverlap
    CMP eax, 1
    je destnotclear
    
    inc al
    dec ecx
    CMP ecx, 0
    jne checkdest
    mov eax, 1
    jmp destcheckdone
    
destnotclear:
    mov eax, 0
    
destcheckdone:
    pop ecx
    pop edx
    ret
removedest ENDP

endgame PROC 
    call Clrscr
    mov eax, white + (black * 16)
    call SetTextColor

    exit
endgame ENDP
END main
  