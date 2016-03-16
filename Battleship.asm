
INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE C:\masm32\include\user32.inc ;download masm32 here http://www.masm32.com/masmdl.htm
INCLUDE C:\masm32\include\kernel32.inc

.data
POINT STRUCT
x DWORD ?
y DWORD ?
POINT ENDS

first BYTE "                                     |__",0
second BYTE "                                     |\/",0
third BYTE "                                     ---",0
fourth BYTE "                                     / | [",0
fifth BYTE "                              !      | |||",0
sixth BYTE "                            _/|     _/|-++'",0
seventh BYTE "                        +  +--|    |--|--|_ |-",0
eigth BYTE "                     { /|__|  |/\__|  |--- |||__/",0
ninth BYTE "                    +---------------___[}-_===_.'____                 /\",0
tenth BYTE "                ____`-' ||___-{]_| _[}-  |     |_[___\==--            \/   _",0
eleventh BYTE " __..._____--==/___]_|__|_____________________________[___\==--____,------' .7",0
twelth BYTE "|                                                                     BB-61/",0
thirteenth BYTE " \_________________________________________________________________________|",0
begin BYTE "BATTLESHIP!",0 


bomb1 BYTE "                               ________________",0
bomb2 BYTE "                          ____/ (  (    )   )  \",0
bomb3 BYTE "                         /( (  (  )   _    ))  )   )\",0
bomb4 BYTE "                       ((     (   )(    )  )   (   )  )",0
bomb5 BYTE "                     ((/  ( _(   )   (   _) ) (  () )  )",0
bomb6 BYTE "                    ( (  ( (_)   ((    (   )  .((_ ) .  )_",0
bomb7 BYTE "                   ( (  )    (      (  )    )   ) . ) (   )",0
bomb8 BYTE "                  (  (   (  (   ) (  _  ( _) ).  ) . ) ) ( )",0
bomb9 BYTE "                  ( (  (   ) (  )   (  ))     ) _)(   )  )  )",0
bomb10 BYTE "                 ( (  ( \ ) (    (_  ( ) ( )  )   ) )  )) ( )",0
bomb11 Byte "                  (  (   (  (   (_ ( ) ( _    )  ) (  )  )   )",0
bomb12 Byte "                 ( (  ( (  (  )     (_  )  ) )  _)   ) _( ( )",0
bomb13 Byte "                  ((  (   )(    (     _    )   _) _(_ (  (_ )",0
bomb14 Byte "                   (_((__(_(__(( ( ( |  ) ) ) )_))__))_)___)",0
bomb15 Byte "                   ((__)        \\||lll|l||///          \_))",0
bomb16 Byte "                            (   /(/ (  )  ) )\   )",0
bomb17 Byte "                          (    ( ( ( | | ) ) )\   )",0
bomb18 Byte "                           (   /(| / ( )) ) ) )) )",0
bomb19 Byte "                         (     ( ((((_(|)_)))))     )",0
bomb20 Byte "                          (      ||\(|(|)|/||     )",0
bomb21 Byte "                        (        |(||(||)||||        )",0
bomb22 Byte "                          (     //|/l|||)|\\ \     )",0

ComputerShown BYTE "#: A|B|C|D|E|F|G|H|I|J0: _|_|_|_|_|_|_|_|_|_1: _|_|_|_|_|_|_|_|_|_2: _|_|_|_|_|_|_|_|_|_3: _|_|_|_|_|_|_|_|_|_4: _|_|_|_|_|_|_|_|_|_5: _|_|_|_|_|_|_|_|_|_6: _|_|_|_|_|_|_|_|_|_7: _|_|_|_|_|_|_|_|_|_8: _|_|_|_|_|_|_|_|_|_9: _|_|_|_|_|_|_|_|_|_",0
ComputerHidden BYTE "#: A|B|C|D|E|F|G|H|I|J0: _|_|_|_|_|_|_|_|_|_1: _|_|_|_|_|_|_|_|_|_2: _|_|_|_|_|_|_|_|_|_3: _|_|_|_|_|_|_|_|_|_4: _|_|_|_|_|_|_|_|_|_5: _|_|_|_|_|_|_|_|_|_6: _|_|_|_|_|_|_|_|_|_7: _|_|_|_|_|_|_|_|_|_8: _|_|_|_|_|_|_|_|_|_9: _|_|_|_|_|_|_|_|_|_",0
PlayerBoard BYTE "#: A|B|C|D|E|F|G|H|I|J0: _|_|_|_|_|_|_|_|_|_1: _|_|_|_|_|_|_|_|_|_2: _|_|_|_|_|_|_|_|_|_3: _|_|_|_|_|_|_|_|_|_4: _|_|_|_|_|_|_|_|_|_5: _|_|_|_|_|_|_|_|_|_6: _|_|_|_|_|_|_|_|_|_7: _|_|_|_|_|_|_|_|_|_8: _|_|_|_|_|_|_|_|_|_9: _|_|_|_|_|_|_|_|_|_",0
PlayerHidden BYTE "#: A|B|C|D|E|F|G|H|I|J0: _|_|_|_|_|_|_|_|_|_1: _|_|_|_|_|_|_|_|_|_2: _|_|_|_|_|_|_|_|_|_3: _|_|_|_|_|_|_|_|_|_4: _|_|_|_|_|_|_|_|_|_5: _|_|_|_|_|_|_|_|_|_6: _|_|_|_|_|_|_|_|_|_7: _|_|_|_|_|_|_|_|_|_8: _|_|_|_|_|_|_|_|_|_9: _|_|_|_|_|_|_|_|_|_",0

entry BYTE "Awaiting coordinates, Captain...",0
Hit BYTE "Hit!",0
Miss BYTE "Miss!",0
ComputerResults BYTE "Computer's turn resulted in a: ",0
PlayerResults DWORD ?


;variables used when inputting where to attack
location DWord ?
locationX Byte ?
locationY Byte ?

;variables used to make sure that the pieces don't overlap when placed on the board
spot1 BYTE ?
spot2 BYTE ?
spot3 BYTE ?
spot4 BYTE ?
spot5 BYTE ?

MOUSE	POINT	<>

;health for each of the computers ships
CCarrier BYTE 5
CBattleship BYTE 4
CSub  BYTE 3
CDestroyer Byte 3
CSweeper BYTE 2

;health for each of the players ships
PCarrier BYTE 5
PBattleship BYTE 4
PSub  BYTE 3
PDestroyer BYTE 3
PSweeper BYTE 2


; total healths, when zero game over
ComputerScore BYTE 17
PlayerScore BYTE 17

.code
main PROC
	Call Randomize ;randomize
	mov edx, 0
	Call TitleScreen ;brings up the title screen
	Call PlacePlayerPieces ;procedure to place the players ships
	mov ebx, 0
	Call fillboard ;fills the computers board randomly
	Call createB ;displays the boards
	
	mov ecx, 100 ;loops the max amount of places on the board
L1:
	push ecx ;keep track of the counter
	Call AttackLocation ;procedure to attack the oponents board
	Call ComputerTurn ;procedure for the computer to take a turn
	pop ecx
	.if(PlayerScore==0)
		Call PlayerWinScreen
		INVOKE ExitProcess,0
	.elseif(ComputerScore==0)
		Call ComputerWinScreen
		INVOKE ExitProcess,0
	.endif
Loop L1

	INVOKE ExitProcess,0
main ENDP

.data
hwnd DWORD ? ;variable that holds the handle of the client

.code

GetMouseCoords PROC ;procedure to get the coordinates of a mouse click
mov ebx,0
mov dh, 16
mov dl, 30
Call gotoxy
mov edx, offset entry
Call WriteString
.REPEAT ;waits until the user clicks
	invoke GetKeyState, VK_LBUTTON   
    .if sbyte ptr ah<0
	   mov ebx, 1
	.ENDIF
.UNTIL(ebx==1) ;once the user makes a click then it takes the coordinates
	INVOKE	GetCursorPos, ADDR MOUSE
	Call GetConsoleWindow
	mov hwnd, eax
	INVOKE ScreenToClient, hwnd, ADDR MOUSE ;takes the coordinates and sets them relative to the client
ret
GetMouseCoords ENDP

TitleScreen PROC ;print out the pretty title screen
	Call crlf
	Call crlf
	Call crlf
	mov edx, offset first
	Call WriteString
	Call crlf
	mov edx, offset second
	Call WriteString
	Call crlf
	mov edx, offset third
	Call WriteString
	Call crlf
	mov edx, offset fourth
	Call WriteString
	Call crlf
	mov edx, offset fifth
	Call WriteString
	Call crlf
	mov edx, offset sixth
	Call WriteString
	Call crlf
	mov edx, offset seventh
	Call WriteString
	Call crlf
	mov edx, offset eigth
	Call WriteString
	Call crlf
	mov edx, offset ninth
	Call WriteString
	Call crlf
	mov edx, offset tenth
	Call WriteString
	Call crlf
	mov edx, offset eleventh
	Call WriteString
	Call crlf
	mov edx, offset twelth
	Call WriteString
	Call crlf
	mov edx, offset thirteenth
	Call WriteString
	Call crlf
	Call crlf
	Call crlf
	mov dh, 20
	mov dl, 35
	Call gotoxy
	mov edx, offset begin
	Call WriteString
	Call crlf
	mov dh, 21
	mov dl, 25
	Call gotoxy
	Call WaitMsg
	Call clrscr
	ret
TitleScreen ENDP

createB PROC uses esi edi ecx ;displays the boards
	mov esi, 0
	mov edi, offset ComputerShown ;the computers board the player can see
	mov esi, offset PlayerBoard ;the players board the player can see
	mov ecx, 11
L1: ;print out the computer board
	mov ebx, ecx
	mov ecx, 22
	L2:
		mov al, [edi]
		.If (al=="~") ;if the location is a miss then it's a squiggle and yellow
			mov eax, yellow
			Call setTextColor
			mov eax, "~"
			call writechar
		.ELSEIF (al=="X") ;if the location is a hit then it's an X and red
			mov eax, red
			Call setTextColor
			mov eax, "X"
			Call writeChar
		.Else
			mov eax, green ;otherwise it's green
			Call setTextColor
			mov eax, [edi]
			Call WriteChar
		.ENDIF
		inc edi
	Loop L2
	mov ecx, ebx
	call crlf
Loop L1
	call crlf
	mov ecx, 11
L3: ;print out the player board
	mov ebx, ecx
	mov ecx, 22
	L4:
		mov al, [esi]
		.If (al=="~")
			mov eax, yellow
			Call setTextColor
			mov eax, "~"
			call writechar
		.ELSEIF (al=="X")
			mov eax, red
			Call setTextColor
			mov eax, "X"
			Call writeChar
		.Else
			mov eax, green
			Call setTextColor
			mov eax, [esi]
			Call WriteChar
		.ENDIF
		inc esi
	Loop L4
	mov ecx, ebx
	call crlf
Loop L3
push edx
Call theButton
mov eax, green ;make sure the text color is reset to green
Call setTextColor
pop edx
ret
createB ENDP

AttackLocation PROC uses ecx;procedure for user to select a location to attack
	Call GetMouseCoords ;gets the mouse coordinates

	;based on those coordinates it checks which spot on the grid the user clicked
	.if(Mouse.X<35) 
		mov locationX, "A"
	.elseif(Mouse.X>=35)&&(Mouse.X<51)
		mov locationX, "B"
	.elseif(Mouse.X>=51)&&(Mouse.X<67)
		mov locationX, "C"
	.elseif(Mouse.X>=67)&&(Mouse.X<83)
		mov locationX, "D"
	.elseif(Mouse.X>=83)&&(Mouse.X<99)
		mov locationX, "E"
	.elseif(Mouse.X>=99)&&(Mouse.X<115)
		mov locationX, "F"
	.elseif(Mouse.X>=115)&&(Mouse.X<131)
		mov locationX, "G"
	.elseif(Mouse.X>=131)&&(Mouse.X<147)
		mov locationX, "H"
	.elseif(Mouse.X>=147)&&(Mouse.X<163)
		mov locationX, "I"
	.elseif(Mouse.X>=163)&&(Mouse.X<179)
		mov locationX, "J"
	.endif

	.if(Mouse.Y<22)
		mov locationY, "0"
	.elseif(Mouse.Y>=22)&&(Mouse.Y<34)
		mov locationY, "1"
	.elseif(Mouse.Y>=34)&&(Mouse.Y<46)
		mov locationY, "2"
	.elseif(Mouse.Y>=46)&&(Mouse.Y<58)
		mov locationY, "3"
	.elseif(Mouse.Y>=58)&&(Mouse.Y<70)
		mov locationY, "4"
	.elseif(Mouse.Y>=70)&&(Mouse.Y<82)
		mov locationY, "5"
	.elseif(Mouse.Y>=82)&&(Mouse.Y<94)
		mov locationY, "6"
	.elseif(Mouse.Y>=94)&&(Mouse.Y<106)
		mov locationY, "7"
	.elseif(Mouse.Y>=106)&&(Mouse.Y<118)
		mov locationY, "8"
	.elseif(Mouse.Y>=118)&&(Mouse.Y<130)
		mov locationY, "9"
	.endif

.IF (Mouse.Y>213)&&(Mouse.X>523)&&(Mouse.Y<285)&&(Mouse.X<619) ;if the user clicks on the lower right screen then it calls durga
	Call durga
.ENDIF
	Call MakeChange ;attacks the location the user selected
	ret
AttackLocation ENDP

.data 
durgaMode BYTE "                        You nuked everything! You win!",0

.code
durga PROC ;autowin when you click on the lower right corner
	Call clrscr
	call crlf
	call crlf
	call crlf
	mov edx, offset bomb1
	call writestring
	call crlf
	mov edx, offset bomb2
	call writestring
	call crlf
	mov edx, offset bomb3
	call writestring
	call crlf
	mov edx, offset bomb4
	call writestring
	call crlf
	mov edx, offset bomb5
	call writestring
	call crlf
	mov edx, offset bomb6
	call writestring
	call crlf
	mov edx, offset bomb7
	call writestring
	call crlf
	mov edx, offset bomb8
	call writestring
	call crlf
	mov edx, offset bomb9
	call writestring
	call crlf
	mov edx, offset bomb10
	call writestring
	call crlf
	mov edx, offset bomb11
	call writestring
	call crlf
	mov edx, offset bomb12
	call writestring
	call crlf
	mov edx, offset bomb13
	call writestring
	call crlf
	mov edx, offset bomb14
	call writestring
	call crlf
	mov edx, offset bomb15
	call writestring
	call crlf
	mov edx, offset bomb16
	call writestring
	call crlf
	mov edx, offset bomb17
	call writestring
	call crlf
	mov edx, offset bomb18
	call writestring
	call crlf
	mov edx, offset bomb19
	call writestring
	call crlf
	mov edx, offset bomb20
	call writestring
	call crlf
	mov edx, offset bomb21
	call writestring
	call crlf
	mov edx, offset bomb22
	call writestring
	call crlf
	call crlf
	mov edx, offset durgaMode
	Call writeString

	mov eax, 5000
	call delay
	Invoke ExitProcess, 0
durga ENDP

ComputerTurn PROC uses ecx ;computers turn
	mov eax, 6
	Call RandomRange ;randomized a number between 0 and 10
	cmp al, 1 ;if the randomized number is 1 then it will auto hit
	.if(ComputerScore!=0) ;checks to make sure that there are ships to auto hit before it auto hits
		je autoHit
	.endif
.REPEAT	;repeats until it finds a location it hasn't already hit
	mov esi, offset PlayerBoard
	add esi, 25
	mov eax, 10
	call RandomRange ;randomly generates a location on the board to attack
	IMUL eax, 22 ;multiply eax by 22
	add esi, eax
	mov eax, 19
	call RandomRange
	AND eax, 0FFFFFFEh ;makes sure it generates an even number that way the attack will land on a _ and not a | on the board
	add esi, eax
	
	mov ebx, [esi]
.UNTIL (bl!="X") && (bl!="~") ;loops until it finds a place it hasn't already hit
	mov al, "~"
.IF (bl!="_")
	mov al, "X"
	dec ComputerScore ;if it hit a ship then it keeps track of that
.ENDIF
	mov [esi], al

mov edx, offset Miss ;defaults it to be a miss
.IF (bl=="C")
	dec PCarrier
	.if(PCarrier==0) ;if it sunk a ship then display the ship sinking
		mov edx, offset PlayerCSunk
		Call CarrierSunk
	.endif
	mov edx, offset Hit ;if it hit a ship then it says that the attack was a hit
.ELSEIF (bl =="M")
	dec PSweeper
	.if(PSweeper==0)
		Call Glub
		mov edx, offset PlayerMSunk
		Call WriteString
		mov eax, 1000
		call Delay
	.endif
	mov edx, offset Hit
.ELSEIF (bl =="S")
	dec PSub
	.if(PSub==0)
		mov edx, offset PlayerSSunk ;if it sunk the ship then it displays the ship sinking
		Call SubSunk
	.endif
	mov edx, offset Hit
.ELSEIF (bl =="D")
	dec PDestroyer
	.if(PDestroyer==0)
		Call Glub
		mov edx, offset PlayerDSunk
		Call WriteString
		mov eax, 1000
		call Delay
	.endif
	mov edx, offset Hit
.ELSEIF (bl =="B")
	dec PBattleShip
	.if(PBattleShip==0)
		Call Glub
		mov edx, offset PlayerBSunk
		Call WriteString
		mov eax, 1000
		call Delay
	.endif
	mov edx, offset Hit
.ENDIF

call clrscr
Call createb
mov ebx, edx
mov dh, 10
mov dl, 45
Call gotoxy
mov edx, PlayerResults ;display the results of the players attack
Call WriteString
mov dh, 14
mov dl, 30
Call gotoxy
mov edx, offset ComputerResults ;display the results of the computers turn
Call WriteString
mov edx, ebx
Call WriteString
mov eax, 500
Call Delay
Call crlf
mov dh, 16
mov dl, 30
Call gotoxy
mov edx, offset entry ;prompts the user for where to attack next
call writeString
Call gotoxy
ret

autoHit:

.REPEAT ;keeps randomizing locations until it finds a ship that hasn't been hit
mov esi, offset PlayerBoard
	add esi, 25
	mov eax, 10
	call RandomRange
	IMUL eax, 22
	add esi, eax
	mov eax, 19
	call RandomRange
	AND eax, 0FFFFFFEh ;makes sure it generates an even number
	add esi, eax
	
	mov ebx, [esi]
.UNTIL (bl!="_") && (bl!="~") && (bl!="X") ;20% of the time it will hit a ship
	mov al, "X"
	mov [esi], al
	dec ComputerScore

mov edx, offset Hit
.IF (bl=="C")
	dec PCarrier
	.if(PCarrier==0)
		mov edx, offset PlayerCSunk
		Call CarrierSunk
	.endif
	mov edx, offset Hit
.ELSEIF (bl =="M")
	dec PSweeper
	.if(PSweeper==0)
		Call Glub
		mov edx, offset PlayerMSunk
		Call WriteString
		mov eax, 1000
		call Delay
	.endif
	mov edx, offset Hit
.ELSEIF (bl =="S")
	dec PSub
	.if(PSub==0)
		mov edx, offset PlayerSSunk
		Call SubSunk
	.endif
	mov edx, offset Hit
.ELSEIF (bl =="D")
	dec PDestroyer
	.if(PDestroyer==0)
		Call Glub
		mov edx, offset PlayerDSunk
		Call WriteString
		mov eax, 1000
		call Delay
	.endif
	mov edx, offset Hit
.ELSEIF (bl =="B")
	dec PBattleShip
	.if(PBattleShip==0)
		Call Glub
		mov edx, offset PlayerBSunk
		Call WriteString
		mov eax, 1000
		call Delay
	.endif
	mov edx, offset Hit
.ENDIF

call clrscr
Call createb
mov ebx, edx
mov dh, 10
mov dl, 45
Call gotoxy
mov edx, PlayerResults
Call WriteString
mov dh, 14
mov dl, 30
Call gotoxy
mov edx, offset ComputerResults
Call WriteString
mov edx, ebx
Call WriteString
mov eax, 500
Call Delay
Call crlf
mov dh, 16
mov dl, 30
Call gotoxy
mov edx, offset entry
call writeString
ret
ComputerTurn ENDP

MakeChange PROC ;procedure to change the board based on the given values of location
	and locationX, 11011111b ;converts letters to uppercase

	mov edi, offset ComputerShown
	mov esi, offset ComputerHidden
	mov ebx, "A"
	add edi, 25
	add esi, 25
	sub bl, locationX
	neg bl
	imul edx, ebx, 2
	add edi, edx
	add esi, edx
	mov ebx, "0"
	sub bl, locationY
	neg bl
	imul edx, ebx, 22
	add edi, edx
	add esi, edx

	mov ebx, [esi]
.IF(bl=="~")||(bl=="X") ;if the spot has already been selected then the user has to select a spot that hasn't already been selected
	Call AttackLocation
	ret
.endif
	
	mov edx, offset Miss ;defaults it to a miss
	mov al, "~"
.IF (bl!="_") && (bl!="~") ;if the user hit a ship then it will mark the board with an X
	mov al, "X"
	.if(bl=="C")
		dec CCarrier
		.if(CCarrier==0)
			mov edx, offset CompCSunk
			Call CarrierSunk
			mov al, "X"
		.endif
	.elseif(bl=="M")
		dec CSweeper
		.if(CSweeper==0)
			Call Glub
			mov edx, offset CompMSunk
			Call WriteString
			mov eax, 1000
			call Delay
		.endif
		mov al, "X"
	.elseif(bl=="S")
		dec CSub
		.if(CSub==0)
			mov edx, offset CompSSunk
			Call SubSunk
			mov eax, 1000
			call Delay
		.endif
		mov al, "X"
	.elseif(bl=="D")
		dec CDestroyer
		.if(CDestroyer==0)
			Call Glub
			mov edx, offset CompDSunk
			Call WriteString
			mov eax, 1000
			call Delay
		.endif
		mov al, "X"
	.elseif(bl=="B")
		dec CBattleship
		.if(CBattleship==0)
			Call Glub
			mov edx, offset CompBSunk
			Call WriteString
			mov eax, 1000
			call Delay
		.endif
		mov al, "X"
	.endif
	dec PlayerScore
	mov edx, offset Hit
.ENDIF
	mov [edi], al
	mov [esi], al
	mov PlayerResults, edx
	ret
MakeChange ENDP

fillBoard PROC ;procedure to randomly fill the computers board with ships
	call makeCarrier
	call makeBattleship
	call makeSub
	call makeDestroyer
	call makeSweeper
	ret
fillBoard ENDP

.data
place1 BYTE "Place Carrier using the wsad keys, r to rotate, space to finalize location",0
place2 BYTE "Place Battleship using the wsad keys, r to rotate, space to finalize location",0
place3 BYTE "Place Sub using the wsad keys, r to rotate, space to finalize location",0
place4 BYTE "Place Destroyer using the wsad keys, r to rotate, space to finalize location",0
place5 BYTE "Place Sweeper using the wsad keys, r to rotate, space to finalize location",0
direction Byte 1
done BYTE 1
movements DWORD 25
invalidMove BYTE "Invalid move, place ship elsewhere",0

.code

placePlayerPieces PROC ;procedure for the player to manually place their ships
Call PlacePCarrier ;procedures to place each individual ship
Call PlacePBattleShip
Call PlacePSub
Call PlacePDestroyer
Call PlacePSweeper
Call Clrscr
ret
placePlayerPieces ENDP

PlacePCarrier PROC
Call clrscr
mov esi, offset PlayerBoard
add esi, 25

	mov bl, "C"
	mov ecx, 5
L1:
	mov [esi], bl
	add esi, 2
	loop L1
sub esi, 10

.REPEAT ;repeats until the user finalizes the location
Call clrscr
Call CreateB
mov edx, offset place1
Call WriteString
Call ReadChar
	.if(al=="s") ;if the user wants to move the ship down
		.if(direction==1) ;keeps track of the direction the ship is facing
			mov al, [esi+22]
			.if(al=="_") ;makes sure the ship is placed on a "_" on the map so the ship doesn't go off the board
				mov ecx,5
				h4:
				mov bl, "_"
				mov [esi], bl
				add esi, 2
				loop h4
				sub esi, 10
				add esi, 22
				add movements, 22
			.endif
		.else
			mov al, [esi+110]
			.if(al=="_")
				mov ecx,5
				v4:
				mov bl, "_"
				mov [esi], bl
				add esi, 22
				loop v4
			sub esi, 110
			add esi, 22
			add movements, 22
			.endif
		.endif

	.elseif(al=="a") ;if the user wants to move the ship to the left
		.if(direction==1)
			mov al,[esi-2]
			.if(al=="_")
				mov ecx,5
				h3:
				mov bl, "_"
				mov [esi], bl
				add esi, 2
				loop h3
				sub esi, 10
				sub esi, 2
				sub movements, 2
			.endif
		.else
			mov al,[esi-2]
			.if(al=="_")
				mov ecx,5
				v3:
				mov bl, "_"
				mov [esi], bl
				add esi, 22
				loop v3
			sub esi, 110
			sub esi,2
			sub movements,2
			.endif
		.endif
	

	.elseif(al=="d") ;if the user wants to move the ship to the right
		.if(direction==1)
		mov al,[esi+10]
		.if(al=="_")
			mov ecx,5
			h2:
			mov bl, "_"
			mov [esi], bl
			add esi, 2
			loop h2
			sub esi, 10
			add esi,2
			add movements,2
		.endif
		.else
			mov al,[esi+2]
			.if(al=="_")
				mov ecx,5
				v2:
				mov bl, "_"
				mov [esi], bl
				add esi, 22
				loop v2
			sub esi, 110
			add esi,2
			add movements,2
			.endif
		.endif

	.elseif(al=="w") ;if the user wants to move the ship up
		.if(direction==1)
		mov al, [esi-22]
		.if(al=="_")
			mov ecx,5
			h1:
			mov bl, "_"
			mov [esi], bl
			add esi, 2
			loop h1
			sub esi, 10
			sub esi,22
			sub movements,22
		.endif
		.else
			mov al, [esi-22]
			.if(al=="_")
				mov ecx,5
				v1:
				mov bl, "_"
				mov [esi], bl
				add esi, 22
				loop v1
			sub esi, 110
			sub esi,22
			sub movements,22
		.endif
		.endif

	.elseif(al=="r") ;if the user wants to rotate the ship
		.if(direction==1)
			mov ecx,5
			horizontal:
			mov bl, "_"
			mov [esi], bl
			add esi, 2
			loop horizontal
			sub esi, 10
		.else
				mov ecx,5
				vertical:
				mov bl, "_"
				mov [esi], bl
				add esi, 22
				loop vertical
			sub esi, 110
		.endif
	neg direction
	
	.elseif(al==32) ;if the user hit pace then the loop ends
	mov done, 0

.endif
	mov bl, "C" 
	mov ecx, 5

.if(direction==1) ;places the tenative ship location on the board
L2:
	mov [esi], bl
	add esi, 2
	loop L2
sub esi, 10
	
.else ;places it on the tenative ship location on the board in the other direction
	L3:
	mov [esi], bl
	add esi, 22
	loop L3
sub esi, 110
.endif
.UNTIL(done==0)

mov esi, offset PlayerHidden ;places it on the hidden board to keep track if the move is valid for the next bunch of ships
add esi, movements
mov bl, "C"
mov ecx, 5
.if(direction==1)
L4:
	mov [esi], bl
	add esi, 2
	loop L4	
.else
	L5:
	mov [esi], bl
	add esi, 22
	loop L5
.endif

ret
PlacePCarrier ENDP

PlacePBattleShip PROC ;place the players battleship
Call clrscr
mov esi, offset PlayerBoard
add esi, 25
mov edi, offset PlayerHidden
add edi, 25
mov done, 1
mov direction, 1

	mov bl, "B"
	mov ecx, 4
L1:
	mov [esi], bl
	add esi, 2
	loop L1
sub esi, 8

.REPEAT
Call clrscr
Call CreateB
mov edx, offset place2
Call WriteString
Call ReadChar
	.if(al=="s")
		.if(direction==1)
			mov al, [esi+22]
			.if(al=="_")||(al=="C") ;this time makes sure the ship isn't placed over another ship
				mov ecx,4
				h4:
				mov bl, [edi]
				mov [esi], bl
				add esi, 2
				add edi, 2
				loop h4
				sub esi, 8
				sub edi, 8
				add esi, 22
				add edi, 22
			.endif
		.else
			mov al, [esi+88]
			.if(al=="_")||(al=="C")
				mov ecx,4
				v4:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v4
			sub esi, 88
			sub edi, 88
			add esi, 22
			add edi, 22
			.endif
		.endif

	.elseif(al=="a")
		.if(direction==1)
			mov al,[esi-2]
			.if(al=="_")||(al=="C")
				mov ecx,4
				h3:
				mov bl, [edi]
				mov [esi], bl
				add esi, 2
				add edi, 2
				loop h3
				sub esi, 8
				sub edi, 8
				sub esi, 2
				sub edi, 2
			.endif
		.else
			mov al,[esi-2]
			.if(al=="_")||(al=="C")
				mov ecx,4
				v3:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v3
			sub esi, 88
			sub edi, 88
			sub esi,2
			sub edi, 2
			.endif
		.endif
	

	.elseif(al=="d")
		.if(direction==1)
		mov al,[esi+8]
		.if(al=="_")||(al=="C")
			mov ecx,4
			h2:
			mov bl, [edi]
			mov [esi], bl
			add esi, 2
			add edi, 2
			loop h2
			sub esi, 8
			sub edi, 8
			add esi, 2
			add edi, 2
		.endif
		.else
			mov al,[esi+2]
			.if(al=="_")||(al=="C")
				mov ecx,4
				v2:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v2
			sub esi, 88
			sub edi, 88
			add esi, 2
			add edi, 2
			.endif
		.endif

	.elseif(al=="w")
		.if(direction==1)
		mov al, [esi-22]
		.if(al=="_")||(al=="C")
			mov ecx,4
			h1:
			mov bl, [edi]
			mov [esi], bl
			add esi, 2
			add edi, 2
			loop h1
			sub esi, 8
			sub edi, 8
			sub esi, 22
			sub edi, 22
		.endif
		.else
			mov al, [esi-22]
			.if(al=="_")||(al=="C")
				mov ecx,4
				v1:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v1
			sub esi, 88
			sub edi, 88
			sub esi, 22
			sub edi, 22
			.endif
		.endif

	.elseif(al=="r")
		.if(direction==1)
			mov ecx,4
			horizontal:
			mov bl, [edi]
			mov [esi], bl
			add esi, 2
			add edi, 2
			loop horizontal
			sub esi, 8
			sub edi, 8
		.else
				mov ecx,4
				vertical:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop vertical
			sub esi, 88
			sub edi, 88
		.endif
	neg direction
	
	.elseif(al==32)
		.if(direction==1)
			mov al, [edi]
			mov spot1, al
			mov al, [edi+2]
			mov spot2, al
			mov al, [edi+4]
			mov spot3, al
			mov al, [edi+6]
			mov spot4, al
			.if(spot1=="_")&&(spot2=="_")&&(spot3=="_")&&(spot4=="_")
				mov done, 0
			.else
			mov dh, 10
			mov dl, 30
			Call gotoxy
			mov edx, offset InvalidMove
			Call WriteString
			mov eax, 1000
			call delay
			.endif
		.else
			mov al, [edi]
			mov spot1, al
			mov al, [edi+22]
			mov spot2, al
			mov al, [edi+44]
			mov spot3, al
			mov al, [edi+66]
			mov spot4, al
			.if(spot1=="_")&&(spot2=="_")&&(spot3=="_")&&(spot4=="_")
				mov done, 0
			.else
			mov dh, 10
			mov dl, 30
			Call gotoxy
			mov edx, offset InvalidMove
			Call WriteString
			mov eax, 1000
			call delay
			.endif
		.endif

.endif
	mov bl, "B"
	mov ecx, 4

.if(direction==1)
L2:
	mov [esi], bl
	add esi, 2
	loop L2
sub esi, 8
	
.else
	L3:
	mov [esi], bl
	add esi, 22
	loop L3
sub esi, 88
.endif
.UNTIL(done==0)

mov bl, "B"
mov ecx, 4
.If(direction==1)
L4:
	mov [edi], bl
	add edi, 2
	loop L4	
.else
	L5:
	mov [edi], bl
	add edi, 22
	loop L5
.endif

ret
PlacePBattleShip ENDP

PlacePSub PROC
Call clrscr
mov esi, offset PlayerBoard
add esi, 25
mov edi, offset PlayerHidden
add edi, 25
mov done, 1
mov direction, 1

	mov bl, "S"
	mov ecx, 3
L1:
	mov [esi], bl
	add esi, 2
	loop L1
sub esi, 6

.REPEAT
Call clrscr
Call CreateB
mov edx, offset place3
Call WriteString
Call ReadChar
	.if(al=="s")
		.if(direction==1)
			mov al, [esi+22]
			.if(al=="_")||(al=="C")||(al=="B")
				mov ecx,3
				h4:
				mov bl, [edi]
				mov [esi], bl
				add esi, 2
				add edi, 2
				loop h4
				sub esi, 6
				sub edi, 6
				add esi, 22
				add edi, 22
			.endif
		.else
			mov al, [esi+66]
			.if(al=="_")||(al=="C")||(al=="B")
				mov ecx,3
				v4:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v4
			sub esi, 66
			sub edi, 66
			add esi, 22
			add edi, 22
			.endif
		.endif

	.elseif(al=="a")
		.if(direction==1)
			mov al,[esi-2]
			.if(al=="_")||(al=="C")||(al=="B")
				mov ecx,3
				h3:
				mov bl, [edi]
				mov [esi], bl
				add esi, 2
				add edi, 2
				loop h3
				sub esi, 6
				sub edi, 6
				sub esi, 2
				sub edi, 2
			.endif
		.else
			mov al,[esi-2]
			.if(al=="_")||(al=="C")||(al=="B")
				mov ecx,3
				v3:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v3
			sub esi, 66
			sub edi, 66
			sub esi,2
			sub edi, 2
			.endif
		.endif
	

	.elseif(al=="d")
		.if(direction==1)
		mov al,[esi+6]
		.if(al=="_")||(al=="C")||(al=="B")
			mov ecx,3
			h2:
			mov bl, [edi]
			mov [esi], bl
			add esi, 2
			add edi, 2
			loop h2
			sub esi, 6
			sub edi, 6
			add esi, 2
			add edi, 2
		.endif
		.else
			mov al,[esi+2]
			.if(al=="_")||(al=="C")||(al=="B")
				mov ecx,3
				v2:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v2
			sub esi, 66
			sub edi, 66
			add esi, 2
			add edi, 2
			.endif
		.endif

	.elseif(al=="w")
		.if(direction==1)
		mov al, [esi-22]
		.if(al=="_")||(al=="C")||(al=="B")
			mov ecx,3
			h1:
			mov bl, [edi]
			mov [esi], bl
			add esi, 2
			add edi, 2
			loop h1
			sub esi, 6
			sub edi, 6
			sub esi, 22
			sub edi, 22
		.endif
		.else
			mov al, [esi-22]
			.if(al=="_")||(al=="C")||(al=="B")
				mov ecx,3
				v1:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v1
			sub esi, 66
			sub edi, 66
			sub esi, 22
			sub edi, 22
			.endif
		.endif

	.elseif(al=="r")
		.if(direction==1)
			mov ecx,3
			horizontal:
			mov bl, [edi]
			mov [esi], bl
			add esi, 2
			add edi, 2
			loop horizontal
			sub esi, 6
			sub edi, 6
		.else
				mov ecx,3
				vertical:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop vertical
			sub esi, 66
			sub edi, 66
		.endif
	neg direction
	
	.elseif(al==32)
		.if(direction==1)
			mov al, [edi]
			mov spot1, al
			mov al, [edi+2]
			mov spot2, al
			mov al, [edi+4]
			mov spot3, al
			.if(spot1=="_")&&(spot2=="_")&&(spot3=="_")
				mov done, 0
			.else
			mov dh, 10
			mov dl, 30
			Call gotoxy
			mov edx, offset InvalidMove
			Call WriteString
			mov eax, 1000
			call delay
			.endif
		.else
			mov al, [edi]
			mov spot1, al
			mov al, [edi+22]
			mov spot2, al
			mov al, [edi+44]
			mov spot3, al
			.if(spot1=="_")&&(spot2=="_")&&(spot3=="_")
				mov done, 0
			.else
			mov dh, 10
			mov dl, 30
			Call gotoxy
			mov edx, offset InvalidMove
			Call WriteString
			mov eax, 1000
			call delay
			.endif
		.endif

.endif
	mov bl, "S"
	mov ecx, 3

.if(direction==1)
L2:
	mov [esi], bl
	add esi, 2
	loop L2
sub esi, 6
	
.else
	L3:
	mov [esi], bl
	add esi, 22
	loop L3
sub esi, 66
.endif
.UNTIL(done==0)

mov bl, "S"
mov ecx, 3
.If(direction==1)
L4:
	mov [edi], bl
	add edi, 2
	loop L4	
.else
	L5:
	mov [edi], bl
	add edi, 22
	loop L5
.endif

ret
PlacePSub ENDP

PlacePDestroyer PROC
Call clrscr
mov esi, offset PlayerBoard
add esi, 25
mov edi, offset PlayerHidden
add edi, 25
mov done, 1
mov direction, 1

	mov bl, "D"
	mov ecx, 3
L1:
	mov [esi], bl
	add esi, 2
	loop L1
sub esi, 6

.REPEAT
Call clrscr
Call CreateB
mov edx, offset place4
Call WriteString
Call ReadChar
	.if(al=="s")
		.if(direction==1)
			mov al, [esi+22]
			.if(al=="_")||(al=="C")||(al=="B")||(al=="S")
				mov ecx,3
				h4:
				mov bl, [edi]
				mov [esi], bl
				add esi, 2
				add edi, 2
				loop h4
				sub esi, 6
				sub edi, 6
				add esi, 22
				add edi, 22
			.endif
		.else
			mov al, [esi+66]
			.if(al=="_")||(al=="C")||(al=="B")||(al=="S")
				mov ecx,3
				v4:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v4
			sub esi, 66
			sub edi, 66
			add esi, 22
			add edi, 22
			.endif
		.endif

	.elseif(al=="a")
		.if(direction==1)
			mov al,[esi-2]
			.if(al=="_")||(al=="C")||(al=="B")||(al=="S")
				mov ecx,3
				h3:
				mov bl, [edi]
				mov [esi], bl
				add esi, 2
				add edi, 2
				loop h3
				sub esi, 6
				sub edi, 6
				sub esi, 2
				sub edi, 2
			.endif
		.else
			mov al,[esi-2]
			.if(al=="_")||(al=="C")||(al=="B")||(al=="S")
				mov ecx,3
				v3:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v3
			sub esi, 66
			sub edi, 66
			sub esi,2
			sub edi, 2
			.endif
		.endif
	

	.elseif(al=="d")
		.if(direction==1)
		mov al,[esi+6]
		.if(al=="_")||(al=="C")||(al=="B")||(al=="S")
			mov ecx,3
			h2:
			mov bl, [edi]
			mov [esi], bl
			add esi, 2
			add edi, 2
			loop h2
			sub esi, 6
			sub edi, 6
			add esi, 2
			add edi, 2
		.endif
		.else
			mov al,[esi+2]
			.if(al=="_")||(al=="C")||(al=="B")||(al=="S")
				mov ecx,3
				v2:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v2
			sub esi, 66
			sub edi, 66
			add esi, 2
			add edi, 2
			.endif
		.endif

	.elseif(al=="w")
		.if(direction==1)
		mov al, [esi-22]
		.if(al=="_")||(al=="C")||(al=="B")||(al=="S")
			mov ecx,3
			h1:
			mov bl, [edi]
			mov [esi], bl
			add esi, 2
			add edi, 2
			loop h1
			sub esi, 6
			sub edi, 6
			sub esi, 22
			sub edi, 22
		.endif
		.else
			mov al, [esi-22]
			.if(al=="_")||(al=="C")||(al=="B")||(al=="S")
				mov ecx,3
				v1:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v1
			sub esi, 66
			sub edi, 66
			sub esi, 22
			sub edi, 22
			.endif
		.endif

	.elseif(al=="r")
		.if(direction==1)
			mov ecx,3
			horizontal:
			mov bl, [edi]
			mov [esi], bl
			add esi, 2
			add edi, 2
			loop horizontal
			sub esi, 6
			sub edi, 6
		.else
				mov ecx,3
				vertical:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop vertical
			sub esi, 66
			sub edi, 66
		.endif
	neg direction
	
	.elseif(al==32)
		.if(direction==1)
			mov al, [edi]
			mov spot1, al
			mov al, [edi+2]
			mov spot2, al
			mov al, [edi+4]
			mov spot3, al
			.if(spot1=="_")&&(spot2=="_")&&(spot3=="_")
				mov done, 0
			.else
			mov dh, 10
			mov dl, 30
			Call gotoxy
			mov edx, offset InvalidMove
			Call WriteString
			mov eax, 1000
			call delay
			.endif
		.else
			mov al, [edi]
			mov spot1, al
			mov al, [edi+22]
			mov spot2, al
			mov al, [edi+44]
			mov spot3, al
			.if(spot1=="_")&&(spot2=="_")&&(spot3=="_")
				mov done, 0
			.else
			mov dh, 10
			mov dl, 30
			Call gotoxy
			mov edx, offset InvalidMove
			Call WriteString
			mov eax, 1000
			call delay
			.endif
		.endif

.endif
	mov bl, "D"
	mov ecx, 3

.if(direction==1)
L2:
	mov [esi], bl
	add esi, 2
	loop L2
sub esi, 6
	
.else
	L3:
	mov [esi], bl
	add esi, 22
	loop L3
sub esi, 66
.endif
.UNTIL(done==0)

mov bl, "D"
mov ecx, 3
.If(direction==1)
L4:
	mov [edi], bl
	add edi, 2
	loop L4	
.else
	L5:
	mov [edi], bl
	add edi, 22
	loop L5
.endif

ret
PlacePDestroyer ENDP

PlacePSweeper PROC
Call clrscr
mov esi, offset PlayerBoard
add esi, 25
mov edi, offset PlayerHidden
add edi, 25
mov done, 1
mov direction, 1

	mov bl, "M"
	mov ecx, 2
L1:
	mov [esi], bl
	add esi, 2
	loop L1
sub esi, 4

.REPEAT
Call clrscr
Call CreateB
mov edx, offset place5
Call WriteString
Call ReadChar
	.if(al=="s")
		.if(direction==1)
			mov al, [esi+22]
			.if(al=="_")||(al=="C")||(al=="B")||(al=="D")||(al=="S")
				mov ecx,2
				h4:
				mov bl, [edi]
				mov [esi], bl
				add esi, 2
				add edi, 2
				loop h4
				sub esi, 4
				sub edi, 4
				add esi, 22
				add edi, 22
			.endif
		.else
			mov al, [esi+44]
			.if(al=="_")||(al=="C")||(al=="B")||(al=="D")||(al=="S")
				mov ecx,2
				v4:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v4
			sub esi, 44
			sub edi, 44
			add esi, 22
			add edi, 22
			.endif
		.endif

	.elseif(al=="a")
		.if(direction==1)
			mov al,[esi-2]
			.if(al=="_")||(al=="C")||(al=="B")||(al=="D")||(al=="S")
				mov ecx,2
				h3:
				mov bl, [edi]
				mov [esi], bl
				add esi, 2
				add edi, 2
				loop h3
				sub esi, 4
				sub edi, 4
				sub esi, 2
				sub edi, 2
			.endif
		.else
			mov al,[esi-2]
			.if(al=="_")||(al=="C")||(al=="B")||(al=="D")||(al=="S")
				mov ecx,2
				v3:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v3
			sub esi, 44
			sub edi, 44
			sub esi,2
			sub edi, 2
			.endif
		.endif
	

	.elseif(al=="d")
		.if(direction==1)
		mov al,[esi+4]
		.if(al=="_")||(al=="C")||(al=="B")||(al=="D")||(al=="S")
			mov ecx,2
			h2:
			mov bl, [edi]
			mov [esi], bl
			add esi, 2
			add edi, 2
			loop h2
			sub esi, 4
			sub edi, 4
			add esi, 2
			add edi, 2
		.endif
		.else
			mov al,[esi+2]
			.if(al=="_")||(al=="C")||(al=="B")||(al=="D")||(al=="S")
				mov ecx,2
				v2:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v2
			sub esi, 44
			sub edi, 44
			add esi, 2
			add edi, 2
			.endif
		.endif

	.elseif(al=="w")
		.if(direction==1)
		mov al, [esi-22]
		.if(al=="_")||(al=="C")||(al=="B")||(al=="D")||(al=="S")
			mov ecx,2
			h1:
			mov bl, [edi]
			mov [esi], bl
			add esi, 2
			add edi, 2
			loop h1
			sub esi, 4
			sub edi, 4
			sub esi, 22
			sub edi, 22
		.endif
		.else
			mov al, [esi-22]
			.if(al=="_")||(al=="C")||(al=="B")||(al=="D")||(al=="S")
				mov ecx,2
				v1:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop v1
			sub esi, 44
			sub edi, 44
			sub esi, 22
			sub edi, 22
			.endif
		.endif

	.elseif(al=="r")
		.if(direction==1)
			mov ecx,2
			horizontal:
			mov bl, [edi]
			mov [esi], bl
			add esi, 2
			add edi, 2
			loop horizontal
			sub esi, 4
			sub edi, 4
		.else
				mov ecx,2
				vertical:
				mov bl, [edi]
				mov [esi], bl
				add esi, 22
				add edi, 22
				loop vertical
			sub esi, 44
			sub edi, 44
		.endif
	neg direction
	
	.elseif(al==32)
		.if(direction==1)
			mov al, [edi]
			mov spot1, al
			mov al, [edi+2]
			mov spot2, al
			.if(spot1=="_")&&(spot2=="_")
				mov done, 0
			.else
			mov dh, 10
			mov dl, 30
			Call gotoxy
			mov edx, offset InvalidMove
			Call WriteString
			mov eax, 1000
			call delay
			.endif
		.else
			mov al, [edi]
			mov spot1, al
			mov al, [edi+22]
			mov spot2, al
			.if(spot1=="_")&&(spot2=="_")
				mov done, 0
			.else
			mov dh, 10
			mov dl, 30
			Call gotoxy
			mov edx, offset InvalidMove
			Call WriteString
			mov eax, 1000
			call delay
			.endif
		.endif

.endif
	mov bl, "M"
	mov ecx, 2

.if(direction==1)
L2:
	mov [esi], bl
	add esi, 2
	loop L2
sub esi, 4
	
.else
	L3:
	mov [esi], bl
	add esi, 22
	loop L3
sub esi, 44
.endif
.UNTIL(done==0)

mov bl, "M"
mov ecx, 2
.If(direction==1)
L4:
	mov [edi], bl
	add edi, 2
	loop L4	
.else
	L5:
	mov [edi], bl
	add edi, 22
	loop L5
.endif

ret
PlacePSweeper ENDP


makeCarrier PROC uses ebx ;makes the random carrier for the computers board
	mov eax, 2
	call RandomRange
	cmp eax, 0
	je Vert
	jmp Hor
Vert:
	.REPEAT
	cmp ebx, 0
	je Computer
	mov esi, offset PlayerBoard
	add esi, 25
	jmp make
Computer:
	mov esi, offset ComputerHidden
	add esi, 25
make:
	mov eax, 5
	call RandomRange
	IMUL eax, 22
	add esi, eax
	mov eax, 11
	call RandomRange
	AND eax, 0FFFFFFFEh
	add esi, eax
	mov al, [esi]
	mov spot1, al
	mov al, [esi+22]
	mov spot2, al
	mov al, [esi+44]
	mov spot3, al
	mov al, [esi+66]
	mov spot4, al
	mov al, [esi+88]
	mov spot5, al
.UNTIL (spot1=="_") && (spot2=="_") && (spot3=="_") && (spot4=="_") && (spot5=="_")
	mov bl, "C"
	mov ecx, 5
L1:
	mov [esi], bl
	add esi, 22
 loop L1
	ret
Hor:
	.REPEAT
	cmp ebx, 0
	je Comp
	mov esi, offset PlayerBoard
	add esi, 25
	jmp Cont
Comp:
	mov esi, offset ComputerHidden
	add esi, 25
Cont:
	mov eax, 5
	call RandomRange
	IMUL eax, 22
	add esi, eax
	mov eax, 11
	call RandomRange
	AND eax, 0FFFFFFFEh
	add esi, eax
	mov al, [esi]
	mov spot1, al
	mov al, [esi+2]
	mov spot2, al
	mov al, [esi+4]
	mov spot3, al
	mov al, [esi+6]
	mov spot4, al
	mov al, [esi+8]
	mov spot5, al
.UNTIL (spot1=="_") && (spot2=="_") && (spot3=="_") && (spot4=="_") && (spot5=="_") ;makes sure the ship isn't placed ontop of another ship

	mov bl, "C"
	mov ecx, 5
L2:
	mov [esi], bl
	add esi, 2
	loop L2
	ret
makeCarrier ENDP

makeBattleship PROC uses ebx ;makes the random battleship for the computers board

	 mov eax, 2
	 call RandomRange
	 cmp eax, 0
	 je Vert
	 jmp Hor

Vert:
	.REPEAT
	 cmp ebx, 0
	 je Computer
	 mov esi, offset PlayerBoard
	 add esi, 25
	 jmp make
Computer:
	 mov esi, offset ComputerHidden
	 add esi, 25
make:
	mov eax, 6
	call RandomRange
	IMUL eax, 22
	add esi, eax

	mov eax, 12
	call RandomRange
	AND eax, 0FFFFFFEh
	add esi, eax
	mov ecx, 4
	mov al, [esi]
	mov spot1, al
	mov al, [esi+22]
	mov spot2, al
	mov al, [esi+44]
	mov spot3, al
	mov al, [esi+66]
	mov spot4, al
.UNTIL (spot1=="_") && (spot2=="_") && (spot3=="_") && (spot4=="_")
	mov bl, "B"
L1:
	mov [esi], bl
	add esi, 22
	loop L1
	ret

Hor:
.REPEAT
	cmp ebx, 0
	je Comp
	mov esi, offset PlayerBoard
	add esi, 25
	jmp Cont
Comp:
	mov esi, offset ComputerHidden
	add esi, 25
Cont:
	mov eax, 6
	call RandomRange
	IMUL eax, 22
	add esi, eax

	mov eax, 12
	call RandomRange
	AND eax, 0FFFFFFEh
	add esi, eax
	mov ecx, 4
	mov al, [esi]
	mov spot1, al
	mov al, [esi+2]
	mov spot2, al
	mov al, [esi+4]
	mov spot3, al
	mov al, [esi+6]
	mov spot4, al
.UNTIL (spot1=="_") && (spot2=="_") && (spot3=="_") && (spot4=="_")

	mov bl, "B"

L2:
	mov [esi], bl
	add esi, 2
 loop L2
	ret
makeBattleShip ENDP

makeSub PROC uses ebx
	mov eax, 2
	call RandomRange
	cmp eax, 0
	je Vert
	jmp Hor
Hor:
.REPEAT
	cmp ebx, 0
	je Computer
	mov esi, offset PlayerBoard
	add esi, 25
	jmp make
Computer:
	mov esi, offset ComputerHidden
	add esi, 25
make:
	mov eax, 7
	call RandomRange
	IMUL eax, 22 ;multiply 22 and eax and store it in eax
	add esi, eax

	mov eax, 14
	call RandomRange
	AND eax, 0FFFFFFEh ;makes sure it randomizes an even number so that it will write on the _ instead of the |
	add esi, eax
	mov ecx, 3
	mov al, [esi]
	mov spot1, al
	mov al, [esi+22]
	mov spot2, al
	mov al, [esi+44]
	mov spot3, al
.UNTIL (spot1=="_") && (spot2=="_") && (spot3=="_")
 
	mov bl, "S"
L1:
	mov [esi], bl
	add esi, 22
 loop L1
	ret
Vert:
.REPEAT
	cmp ebx, 0
	je Comp
	mov esi, offset PlayerBoard
	add esi, 25
	jmp Cont
Comp:
	mov esi, offset ComputerHidden
	add esi, 25
Cont:
	mov eax, 7
	call RandomRange
	IMUL eax, 22
	add esi, eax

	mov eax, 14
	call RandomRange
	AND eax, 0FFFFFFEh
	add esi, eax
	mov ecx, 3
	mov al, [esi]
	mov spot1, al
	mov al, [esi+2]
	mov spot2, al
	mov al, [esi+4]
	mov spot3, al
.UNTIL (spot1=="_") && (spot2=="_") && (spot3=="_")
	mov bl, "S"
L2:
	mov [esi], bl
	add esi, 2
loop L2
	ret
makeSub ENDP

makeDestroyer PROC uses ebx
	mov eax, 2
	call RandomRange
	cmp eax, 0
	je Vert
	jmp Hor
Vert:
.REPEAT
	cmp ebx, 0
	je Computer
	mov esi, offset PlayerBoard
	add esi, 25
	jmp make
Computer:
	mov esi, offset ComputerHidden
	add esi, 25
make:
	mov eax, 7
	call RandomRange
	IMUL eax, 22
	add esi, eax

	mov eax, 14
	call RandomRange
	AND eax, 0FFFFFFEh
	add esi, eax
	mov ecx, 3
	mov al, [esi]
	mov spot1, al
	mov al, [esi+22]
	mov spot2, al
	mov al, [esi+44]
	mov spot3, al
.UNTIL (spot1=="_") && (spot2=="_") && (spot3=="_")
	mov bl, "D"
L1:
	mov [esi], bl
	add esi, 22
loop L1
	ret
Hor:
.REPEAT
	cmp ebx, 0
	je Comp
	mov esi, offset PlayerBoard
	add esi, 25
	jmp Cont
Comp:
	mov esi, offset ComputerHidden
	add esi, 25
Cont:
	mov eax, 7
	call RandomRange
	IMUL eax, 22
	add esi, eax

	mov eax, 14
	call RandomRange
	AND eax, 0FFFFFFEh
	add esi, eax
	mov ecx, 3
	mov al, [esi]
	mov spot1, al
	mov al, [esi+2]
	mov spot2, al
	mov al, [esi+4]
	mov spot3, al
.UNTIL (spot1=="_") && (spot2=="_") && (spot3=="_")
	mov bl, "D"
L2:
	mov [esi], bl
	add esi, 2
loop L2
	ret
makeDestroyer ENDP

makeSweeper PROC uses ebx
	mov eax, 2
	call RandomRange
	cmp eax, 0
	je Vert
	jmp Hor
Vert:
.REPEAT
	cmp ebx, 0
	je Computer
	mov esi, offset PlayerBoard
	add esi, 25
	jmp make
Computer:
	mov esi, offset ComputerHidden
	add esi, 25
make:
	mov eax, 8
	call RandomRange
	IMUL eax, 22
	add esi, eax

	mov eax, 16
	call RandomRange
	AND eax, 0FFFFFFFEh
	add esi, eax
	mov ecx, 2
	mov al, [esi]
	mov spot1, al
	mov al, [esi+22]
	mov spot2, al
.UNTIL (spot1=="_") && (spot2=="_")
	mov bl, "M"
L1:
	mov [esi], bl
	add esi, 22
loop L1
	ret
Hor:

.REPEAT
	cmp ebx, 0
	je Comp
	mov esi, offset PlayerBoard
	add esi, 25
	jmp Cont
Comp:
	mov esi, offset ComputerHidden
	add esi, 25
Cont:
	mov eax, 8
	call RandomRange
	IMUL eax, 22
	add esi, eax
	mov eax, 16
	call RandomRange
	AND eax, 0FFFFFFFEh
	add esi, eax
	mov ecx, 2
	mov al, [esi]
	mov spot1, al
	mov al, [esi+2]
	mov spot2, al
.UNTIL (spot1=="_") && (spot2=="_")
	mov bl, "M"
L2:
	mov [esi], bl
	add esi, 2
	loop L2
	ret
makeSweeper ENDP

.data
Csunk1 BYTE "                         /\",0
Csunk2 BYTE "                        /  \",0
Csunk3 BYTE "                        \   \__",0
Csunk4 BYTE "            _            \   \o\",0
Csunk5 BYTE "           |_0            \   \o\=",0
Csunk6 BYTE "~~~~~~~~~~~||~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0
Csunk7 BYTE "         __  |__",0
Csunk8 BYTE "       __L L_|L L__",0
Csunk9 BYTE " ...[+(____________)",0
Csunk10 BYTE "        C_________/",0
CompCSunk BYTE "YOU SUNK MY CARRIER!",0
PlayerCSunk BYTE "Your carrier got sunk",0

.code
CarrierSunk PROC
Call Clrscr
mov ebx, edx
mov dl, 15
mov dh, 5
Call gotoxy
mov edx, offset Csunk1
Call WriteString
mov dl, 15
mov dh, 6
Call gotoxy
mov edx, offset Csunk2
Call WriteString
mov dl, 15
mov dh, 7
Call gotoxy
mov edx, offset Csunk3
Call WriteString
mov dl, 15
mov dh, 8
Call gotoxy
mov edx, offset Csunk4
Call WriteString
mov dl, 15
mov dh, 9
Call gotoxy
mov edx, offset Csunk5
Call WriteString
mov dl, 15
mov dh, 10
Call gotoxy
mov edx, offset Csunk6
Call WriteString
mov dl, 15
mov dh, 11
Call gotoxy
mov edx, offset Csunk7
Call WriteString
mov dl, 15
mov dh, 12
Call gotoxy
mov edx, offset Csunk8
Call WriteString
mov dl, 15
mov dh, 13
Call gotoxy
mov edx, offset Csunk9
Call WriteString
mov dl, 15
mov dh, 14
Call gotoxy
mov edx, offset Csunk10
Call WriteString
Call crlf
mov dl, 30
mov dh, 17
Call gotoxy
mov edx, ebx
Call WriteString

mov eax, 4000
Call Delay
Call clrscr

ret
CarrierSunk ENDP

.data

EXP BYTE "			    _.-^^---....,,--__",0
EXP1 BYTE "		        _--                   --_",0
EXP2 BYTE "		       <                         >",0
EXP3 BYTE "		       |                         |",0
EXP4 BYTE "			\._                   _./",0
EXP5 BYTE "			   ```--. . , ; .--'''",0
EXP6 BYTE "				 | |   |",0
EXP7 BYTE "			      .-=||  | |=-.",0
EXP8 BYTE "			      `-=#$%&%$#=-'",0
EXP9 BYTE "				 | ;  :|",0
EXPA BYTE "			_____.,-#%&$@%#&#~,._____  ",0

SSunk1 BYTE "         |_",0
SSunk2 BYTE "   _____|~ |____",0
SSunk3 BYTE "  (  --         ~~~~--_,",0
SSunk4 BYTE "   ~~~~~~~~~~~~~~~~~~~'` ",0
PlayerSSunk BYTE "Your Submarine got sunk",0
CompSSunk BYTE "YOU SUNK MY SUBMARINE!",0

.code
SubSunk PROC

Call clrscr
mov ebx, edx
mov dl,30
mov dh,7
call gotoxy
mov edx, offset SSunk1
Call WriteString
mov dl, 30
mov dh, 8
call gotoxy
mov edx, offset SSunk2
Call WriteString
mov dl, 30
mov dh, 9
Call gotoxy
mov edx, offset SSunk3
Call WriteString
mov dl, 30
mov dh, 10
Call gotoxy
mov edx, offset SSunk4
Call WriteString

Call Explosion

mov dl, 27
mov dh, 15
Call gotoxy
mov edx, ebx
Call WriteString

mov eax, 1000
Call Delay

ret
SubSunk ENDP

Explosion PROC
mov eax, 1000
Call Delay
Call Clrscr
mov edx, offset Exp
Call WriteString
Call crlf
mov edx, offset Exp1
Call WriteString
Call crlf
mov edx, offset Exp2
Call WriteString
Call crlf
mov edx, offset Exp3
Call WriteString
Call crlf
mov edx, offset Exp4
Call WriteString
Call crlf
mov edx, offset Exp5
Call WriteString
Call crlf
mov edx, offset Exp6
Call WriteString
Call crlf
mov edx, offset Exp7
Call WriteString
Call crlf
mov edx, offset Exp8
Call WriteString
Call crlf
mov edx, offset Exp9
Call WriteString
Call crlf
mov edx, offset ExpA
Call WriteString
Call crlf
Call crlf

mov eax, 500
Call Delay
ret
Explosion ENDP

.data
win1 BYTE "                                     .---.",0
win2 BYTE "                                    /_____\",0
win3 BYTE "                                    ( '.' )",0
win4 BYTE "                                     \_-_/_",0
win5 BYTE "                                  .-'''V'//-.",0
win6 BYTE "                                 / ,   |// , \",0
win7 BYTE "                                / /|Ll //Ll|\ \",0
win8 BYTE "                               / / |__//   | \_\",0
win9 BYTE "                               \ \/---|[]==| / /",0
win10 BYTE "                               \/\__/ |   \/\/  ",0
win11 BYTE "                                |/_   | Ll_\|",0
win12 BYTE "                                  |'^'''^'| ",0
win13 BYTE "                                  |   |   |",0
win14 BYTE "                                  |   |   |",0
win15 BYTE "                                  |   |   |",0
win16 BYTE "                                  |   |   |",0
win17 BYTE "                                  L___l___J",0
win18 BYTE "                                   |_ | _|",0
win19 BYTE "                                  (___|___)",0

win20 BYTE "                                    .---.",0
win21 BYTE "                               ___ /_____\",0
win22 BYTE "                              /\.-`( '.' )",0
win23 BYTE "                             / /    \_-_/_",0
win24 BYTE "                             \ \-.-'''V'//-.",0
win25 BYTE "                              `.__,   |// , \",0
win26 BYTE "                                  |Ll //Ll|\ \",0
win27 BYTE "                                  |__//   | \_\",0
win28 BYTE "                                 /---|[]==| / /",0
win29 BYTE "                                 \__/ |   \/\/  ",0
win30 BYTE "                                 |_   | Ll_\|",0
win31 BYTE "                                  |'^'''^`| ",0
win32 BYTE "                                  |   |   |",0
win33 BYTE "                                  |   |   |",0
win34 BYTE "                                  |   |   |",0
win35 BYTE "                                  |   |   |",0
win36 BYTE "                                  L___l___J",0
win37 BYTE "                                   |_ | _|",0
win38 BYTE "                                  (___|___)",0
win39 BYTE "           THANK YOU CAPTAIN! YOU SAVED THE FLEET AND WON THE WAR!",0

.code
PlayerWinScreen PROC

Call clrscr
mov edx, offset win1
Call WriteString
Call crlf
mov edx, offset win2
Call WriteString
Call crlf
mov edx, offset win3
Call WriteString
Call crlf
mov edx, offset win4
Call WriteString
Call crlf
mov edx, offset win5
Call WriteString
Call crlf
mov edx, offset win6
Call WriteString
Call crlf
mov edx, offset win7
Call WriteString
Call crlf
mov edx, offset win8
Call WriteString
Call crlf
mov edx, offset win9
Call WriteString
Call crlf
mov edx, offset win10
Call WriteString
Call crlf
mov edx, offset win11
Call WriteString
Call crlf
mov edx, offset win12
Call WriteString
Call crlf
mov edx, offset win13
Call WriteString
Call Crlf
mov edx, offset win14
Call WriteString
Call crlf
mov edx, offset win15
Call WriteString
Call crlf
mov edx, offset win16
Call WriteString
Call crlf
mov edx, offset win17
Call WriteString
Call crlf
mov edx, offset win18
Call WriteString
Call crlf
mov edx, offset win19
Call WriteString
Call crlf

mov eax, 2000
Call Delay

Call Clrscr

mov edx, offset win20
Call WriteString
Call crlf
mov edx, offset win21
Call WriteString
Call crlf
mov edx, offset win22
Call WriteString
Call crlf
mov edx, offset win23
Call WriteString
Call crlf
mov edx, offset win24
Call WriteString
Call crlf
mov edx, offset win25
Call WriteString
Call crlf
mov edx, offset win26
Call WriteString
Call crlf
mov edx, offset win27
Call WriteString
Call crlf
mov edx, offset win28
Call WriteString
Call crlf
mov edx, offset win29
Call WriteString
Call crlf
mov edx, offset win30
Call WriteString
Call crlf
mov edx, offset win31
Call WriteString
Call crlf
mov edx, offset win32
Call WriteString
Call crlf
mov edx, offset win33
Call WriteString
Call crlf
mov edx, offset win34
Call WriteString
Call crlf
mov edx, offset win35
Call WriteString
Call crlf
mov edx, offset win36
Call WriteString
Call crlf
mov edx, offset win37
Call WriteString
Call crlf
mov edx, offset win38
Call WriteString
Call crlf
Call crlf
mov eax, 1000
Call Delay
mov edx, offset win39
Call WriteString
Call crlf

mov eax, 5000
Call Delay

ret
PlayerWinScreen ENDP

.data
lose1 BYTE "::::::::::::::::::::::::::::::::::::::::::::::::::::::",0
lose2 BYTE "::::::::::::::::::::::::::::::::::::::::::::::::::::::",0
lose3 BYTE "::::::::::::::::::::::::::::::::::::::::::::::::::::::",0
lose4 BYTE "::::::::::::::::::::::::::_:::::::::::::::::::::::::::",0
lose5 BYTE ":::::::::::::::::::::::::/ |::::::::::::::::::::::::::",0
lose6 BYTE ":::::::::::::::::::::/ \ | | /\:::::::::::::::::::::::",0
lose7 BYTE "::::::::::::::::::::::\ \| |/ /:::::::::::::::::::::::",0
lose8 BYTE ":::::::::::::::::::::::\ Y | /___:::::::::::::::::::::",0
lose9 BYTE ":::::::::::::::::::::.-.) '. `__/:::::::::::::::::::::",0
lose10 BYTE "::::::::::::::::::::(.-.   / /::::::::::::::::::::::::",0
lose11 BYTE "~^~_-~^^-^~^_~^_^-~^~^-~| ' |~^~_-~^_^-^~^_~^_^-~^~^-~",0
lose12 BYTE "~^-_~^-~^_~^-~^_~^-_ _^,|___| ,~_ _~^-_~^-~^_~^-~^_~^-",0
lose13 BYTE "~^-~^~-_~^__.===~'`__..[_____]-..__`'~===.__~^-~^~-_~^",0
lose14 BYTE "~_~^_.=~~'   ~_.==~-.-~|     |~=.-~==._~^-^'~~=._~_~^",0
lose15 BYTE "~-:`-~^-~^_~^:-~^~-_~-.`-===-'_.=~-_~^-_:~^-~^-_~`;-~",0
lose16 BYTE "~-'._~^-~^-_^~=._~-~_~-'~~'~`_^-~_^_.=~-~^-_~^-_.'^-",0
lose17 BYTE "_~^-~^~=._~^-~^_-^~~==..,~_^_,..==~~-_~^-~^-_.=~_~^-~^",0
lose18 BYTE "_-~^-~^_~^`~==.__-~^_~^-_~^-_~^-_~^-~__.==~`_-~^-~^_~^",0
lose19 BYTE "-~_~^~-~^-~^~_~^~`~~~==,,....,,==~~~`-~_~^~-~^-~^~_~^~",0
lose20 BYTE "~~_~^-~^-_~^~^_-^~^-~^~-_~^-~^-~^_~^~-~^~-~^-~^-~^-~^",0
lose21 BYTE "~^~^-~^-~^_~^~-^~_~^-^~^~^-~^-~^~^~-^~-~^-~^~~-^~-^~^",0
lose22 BYTE "                     YOU LOST  ",0

  .code

ComputerWinScreen PROC ;print out the losing screen

Call clrscr
mov edx, offset lose1
Call WriteString
Call crlf
mov edx, offset lose2
Call WriteString
Call crlf
mov edx, offset lose3
Call WriteString
Call crlf
mov edx, offset lose4
Call WriteString
Call crlf
mov edx, offset lose5
Call WriteString
Call crlf
mov edx, offset lose6
Call WriteString
Call crlf
mov edx, offset lose7
Call WriteString
Call crlf
mov edx, offset lose8
Call WriteString
Call crlf
mov edx, offset lose9
Call WriteString
Call crlf
mov edx, offset lose10
Call WriteString
Call crlf
mov edx, offset lose11
Call WriteString
Call crlf
mov edx, offset lose12
Call WriteString
Call crlf
mov edx, offset lose13
Call WriteString
Call crlf
mov edx, offset lose14
Call WriteString
Call crlf
mov edx, offset lose15
Call WriteString
Call crlf
mov edx, offset lose16
Call WriteString
Call crlf
mov edx, offset lose17
Call WriteString
Call crlf
mov edx, offset lose18
Call WriteString
Call crlf
mov edx, offset lose19
Call WriteString
Call crlf
mov edx, offset lose20
Call WriteString
Call crlf
mov edx, offset lose21
Call WriteString
Call crlf
mov edx, offset lose22
Call WriteString
Call crlf

mov eax, 5000
Call Delay

ret
ComputerWinScreen ENDP

.data
Bsunk1 BYTE "               /\",0
Bsunk2 BYTE "              /  \",0
Bsunk3 BYTE "              \   \__",0
Bsunk4 BYTE "               \   \o\",0
Bsunk5 BYTE "                \   \o\=",0
Bsunk6 BYTE "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",0
CompBSunk BYTE "YOU SUNK MY BATTLESHIP!",0
PlayerBSunk BYTE "Your battleship was sunk",0
CompDSunk BYTE "YOU SUNK MY DESTROYER!",0
PlayerDSunk BYTE "Your destroyer was sunk",0
CompMSunk BYTE "YOU SUNK MY MINESWEEPER!",0
PlayerMSunk BYTE "Your minesweeper was sunk",0

.code
Glub PROC
 call Clrscr
 mov dl, 18
mov dh, 8
Call gotoxy
 mov edx, offset Bsunk1
 call WriteString
 call Crlf
 mov dl, 18
mov dh, 9
Call gotoxy
 mov edx, offset Bsunk2
 call WriteString
 call Crlf
 mov dl, 18
mov dh, 10
Call gotoxy
 mov edx, offset Bsunk3
 call WriteString
 call Crlf
 mov dl, 18
mov dh, 11
Call gotoxy
 mov edx, offset Bsunk4
 call WriteString
 call Crlf
 mov dl, 18
mov dh, 12
Call gotoxy
 mov edx, offset Bsunk5
 call WriteString
 call Crlf
 mov dl, 18
mov dh, 13
Call gotoxy
 mov edx, offset Bsunk6
 call WriteString
 call Crlf
 mov eax, 500
 call Delay
 Call Clrscr

 call Crlf
 mov dl, 18
mov dh, 9
Call gotoxy
 mov edx, offset Bsunk1
 call WriteString
 call Crlf
 mov dl, 18
mov dh, 10
Call gotoxy
 mov edx, offset Bsunk2
 call WriteString
 call Crlf
 mov dl, 18
mov dh, 11
Call gotoxy
 mov edx, offset Bsunk3
 call WriteString
 call Crlf
 mov dl, 18
mov dh, 12
Call gotoxy
 mov edx, offset Bsunk4
 call WriteString
 call Crlf
 mov dl, 18
mov dh, 13
Call gotoxy
 mov edx, offset Bsunk6
 call WriteString
 call Crlf
 mov eax, 500
 call Delay
 Call Clrscr

 call Crlf
 call Crlf
 mov dl, 18
mov dh, 10
Call gotoxy
 mov edx, offset Bsunk1
 call WriteString
 call Crlf
 mov dl, 18
mov dh, 11
Call gotoxy
 mov edx, offset Bsunk2
 call WriteString
 call Crlf
 mov dl, 18
mov dh, 12
Call gotoxy
 mov edx, offset Bsunk3
 call WriteString
 call Crlf
 mov dl, 18
mov dh, 13
Call gotoxy
 mov edx, offset Bsunk6
 call WriteString
 call Crlf
 mov eax, 500
 call Delay
 Call Clrscr

 mov dl, 18
mov dh, 11
Call gotoxy
 mov edx, offset Bsunk1
 call WriteString
 call Crlf
 mov dl, 18
 mov dh, 12
Call gotoxy
 mov edx, offset Bsunk2
 call WriteString
 call Crlf
 mov dl, 18
mov dh, 13
Call gotoxy
 mov edx, offset Bsunk6
 call WriteString
 call Crlf
 mov eax, 500
 call Delay

mov dl, 30
mov dh, 15
Call gotoxy

 ret
Glub ENDP

.data
Button  BYTE " ___________ ",0
Button1 BYTE "|           |",0
Button2 BYTE "|  .-'''-.  |",0
Button3 BYTE "| / DURGA \ |",0
Button4 BYTE "| \ MODE  / |",0
Button5 BYTE "|  '-...-'  |",0
Button6 BYTE "|___________|",0

.code
theButton PROC
 mov eax, red
 call SetTextColor
 mov dh, 17
 mov dl, 65
 call GoToXY
 mov edx, offset Button
 call WriteString
 mov dh, 18
 mov dl, 65
 call GoToXY
 mov edx, offset Button1
 call WriteString
  mov dh, 19
 mov dl, 65
 call GoToXY
 mov edx, offset Button2
 call WriteString
  mov dh, 20
 mov dl, 65
 call GoToXY
 mov edx, offset Button3
 call WriteString
  mov dh, 21
 mov dl, 65
 call GoToXY
 mov edx, offset Button4
 call WriteString
  mov dh, 22
 mov dl, 65
 call GoToXY
 mov edx, offset Button5
 call WriteString
  mov dh, 23
 mov dl, 65
 call GoToXY
 mov edx, offset Button6
 call WriteString
 Call Crlf
 ret
theButton ENDP

END main