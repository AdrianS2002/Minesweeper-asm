.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern malloc: proc
extern memset: proc
extern printf: proc

includelib canvas.lib
extern BeginDrawing: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
window_title DB "Minesweeper",0
area_width EQU 640
area_height EQU 480
area DD 0
format DB "%d ",0
matrice db 0, 0, 0, 1, 0, 0, 1, 0
		db 0, 0, 0, 0, 0, 1, 0, 0
		db 0, 1, 0, 1, 1, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0
		db 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 1, 0, 0, 1, 0
		db 0, 1, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0
		
		
mat_afis db 0, 0, 0, 0, 0, 0, 0, 0
         db 0, 0, 0, 0, 0, 0, 0, 0
         db 0, 0, 0, 0, 0, 0, 0, 0
         db 0, 0, 0, 0, 0, 0, 0, 0
         db 0, 0, 0, 0, 0, 0, 0, 0
         db 0, 0, 0, 0, 0, 0, 0, 0
         db 0, 0, 0, 0, 0, 0, 0, 0
         db 0, 0, 0, 0, 0, 0, 0, 0


fin db 0
win db 0

counter DD 0 ; numara evenimentele de tip timer

arg1 EQU 8
arg2 EQU 12
arg3 EQU 16
arg4 EQU 20

symbol_width EQU 10
symbol_height EQU 20
include digits.inc
include letters.inc
;matricea
button_size EQU 50

button1_x EQU 120
button1_y EQU 60

button2_x EQU 170
button2_y EQU 60

button3_x EQU 220
button3_y EQU 60

button4_x EQU 270
button4_y EQU 60
 
button5_x EQU 320
button5_y EQU 60
 
button6_x EQU 370
button6_y EQU 60
 
button7_x EQU 420
button7_y EQU 60
 
button8_x EQU 470
button8_y EQU 60

button9_x EQU 120
button9_y EQU 110

button10_x EQU 170
button10_y EQU 110

button11_x EQU 220
button11_y EQU 110

button12_x EQU 270
button12_y EQU 110
 
button13_x EQU 320
button13_y EQU 110
 
button14_x EQU 370
button14_y EQU 110
 
button15_x EQU 420
button15_y EQU 110
 
button16_x EQU 470
button16_y EQU 110

button17_x EQU 120
button17_y EQU 160

button18_x EQU 170
button18_y EQU 160

button19_x EQU 220
button19_y EQU 160

button20_x EQU 270
button20_y EQU 160

button21_x EQU 320
button21_y EQU 160

button22_x EQU 370
button22_y EQU 160

button23_x EQU 420
button23_y EQU 160

button24_x EQU 470
button24_y EQU 160

button25_x EQU 120
button25_y EQU 210

button26_x EQU 170
button26_y EQU 210

button27_x EQU 220
button27_y EQU 210

button28_x EQU 270
button28_y EQU 210

button29_x EQU 320
button29_y EQU 210

button30_x EQU 370
button30_y EQU 210

button31_x EQU 420
button31_y EQU 210

button32_x EQU 470
button32_y EQU 210

button33_x EQU 120
button33_y EQU 260

button34_x EQU 170
button34_y EQU 260

button35_x EQU 220
button35_y EQU 260

button36_x EQU 270
button36_y EQU 260

button37_x EQU 320
button37_y EQU 260

button38_x EQU 370
button38_y EQU 260

button39_x EQU 420
button39_y EQU 260

button40_x EQU 470
button40_y EQU 260

button41_x EQU 120
button41_y EQU 310

button42_x EQU 170
button42_y EQU 310

button43_x EQU 220
button43_y EQU 310

button44_x EQU 270
button44_y EQU 310

button45_x EQU 320
button45_y EQU 310

button46_x EQU 370
button46_y EQU 310

button47_x EQU 420
button47_y EQU 310

button48_x EQU 470
button48_y EQU 310

button49_x EQU 120
button49_y EQU 360

button50_x EQU 170
button50_y EQU 360

button51_x EQU 220
button51_y EQU 360

button52_x EQU 270
button52_y EQU 360

button53_x EQU 320
button53_y EQU 360

button54_x EQU 370
button54_y EQU 360

button55_x EQU 420
button55_y EQU 360

button56_x EQU 470
button56_y EQU 360

button57_x EQU 120
button57_y EQU 410

button58_x EQU 170
button58_y EQU 410

button59_x EQU 220
button59_y EQU 410

button60_x EQU 270
button60_y EQU 410

button61_x EQU 320
button61_y EQU 410

button62_x EQU 370
button62_y EQU 410

button63_x EQU 420
button63_y EQU 410

button64_x EQU 470
button64_y EQU 410
minx db 0
miny db 0
minvy dw 0
minvx dw 0
vectory db 2,3,4,5,6,7,8,9;;coord y la toate butoanele
vectorx db 5,6,7,8,9,10,11,12;;coord x la toate butoanele
.code
; procedura make_text afiseaza o litera sau o cifra la coordonatele date
; arg1 - simbolul de afisat (litera sau cifra)
; arg2 - pointer la vectorul de pixeli
; arg3 - pos_x
; arg4 - pos_y

afis_patrat_macro macro
	mov ecx, 0
	mov miny,cl
	mov ecx, 500
	mov minvy,cx
	mov ecx,8
	mov ebx,[ebp+arg3]
	mov eax,0
	cmp ebx,60
	jl skip1
	cmp ebx,460
	jg skip1
	loop_apropbut:
	mov dl,vectory[ecx-1]
	mov eax,50
	mul dl
	sub eax,ebx
	mov edx,eax
	cmp dx, minvy
	ja skipy
	mov minvy, dx
	mov miny,cl
	skipy:
	loop loop_apropbut
	skip1:
	
	mov ecx, 0
	mov minx,cl
	mov ecx, 500
	mov minvx,cx
	mov ecx,8
	mov ebx,[ebp+arg2]
	mov eax,0
	cmp ebx,120
	jl skip2
	cmp ebx,520
	jg skip2
	loop_apropbut1:
    cmp ebx,120
        jl skipa
        inc minx
    skipa:
    cmp ebx,170
        jl skipb
        inc minx
    skipb:
    cmp ebx,220
        jl skipc
        inc minx
    skipc:
    cmp ebx,270
        jl skipd
        inc minx
    skipd:
    cmp ebx,320
        jl skipe
        inc minx
    skipe:
    cmp ebx,370
        jl skipf
        inc minx
    skipf:
    cmp ebx,420
        jl skipg
        inc minx
    skipg:
    cmp ebx,470
        jl skiph
        inc minx
    skiph:
	
	skip2:
	mov ecx,0
	add cl, minx
	mov eax,8
	mul cl
	add al,miny
	sub eax,9
	mov mat_afis[eax],1
	
	cmp eax, 4
	jne skipp1
	mov ecx,64 
	mat_afis1:
	mov mat_afis[ecx-1],1
	loop mat_afis1
	mov fin,1
	skipp1:
	
	cmp eax, 10
	jne skipp2
	mov ecx,64 
	mat_afis2:
	mov mat_afis[ecx-1],1
	loop mat_afis2
	mov fin,1
	skipp2:
	
	cmp eax, 14
	jne skipp3
	mov ecx,64 
	mat_afis3:
	mov mat_afis[ecx-1],1
	loop mat_afis3
	mov fin,1
	skipp3:
	
	cmp eax, 24
	jne skipp4
	mov ecx,64 
	mat_afis4:
	mov mat_afis[ecx-1],1
	loop mat_afis4
	mov fin,1
	skipp4:
	
	cmp eax, 26
	jne skipp5
	mov ecx,64 
	mat_afis5:
	mov mat_afis[ecx-1],1
	loop mat_afis5
	mov fin,1
	skipp5:
	
	cmp eax, 29
	jne skipp6
	mov ecx,64 
	mat_afis6:
	mov mat_afis[ecx-1],1
	loop mat_afis6
	mov fin,1
	skipp6:
	
	cmp eax, 34
	jne skipp7
	mov ecx,64 
	mat_afis7:
	mov mat_afis[ecx-1],1
	loop mat_afis7
	mov fin,1
	skipp7:
	
	cmp eax, 41
	jne skipp8
	mov ecx,64 
	mat_afis8:
	mov mat_afis[ecx-1],1
	loop mat_afis8
	mov fin,1
	skipp8:
	
	cmp eax, 48
	jne skipp9
	mov ecx,64 
	mat_afis9:
	mov mat_afis[ecx-1],1
	loop mat_afis9
	mov fin,1
	skipp9:
	
	cmp eax, 53
	jne skipp10
	mov ecx,64 
	mat_afis10:
	mov mat_afis[ecx-1],1
	loop mat_afis10
	mov fin,1
	skipp10:
	
	;;afis1:
	;;mov eax,0
	;;mov al, mat_afis[ecx-1]
	; push eax
	; push offset format
	; call printf
	; add esp,8
	;;loop afis1
	
	mov eax,0
	mov al,minx
	push eax
	push offset format	
	call printf
	add esp,8
	
	mov eax,0
	mov al,miny
	push eax
	push offset format	
	call printf
	add esp,8
	
	
endm

check_win_macro macro
mov ecx,64
check:
cmp matrice[ecx-1],1
je skip69
cmp mat_afis[ecx-1],0
je skip70
skip69:
loop check
mov win,1
skip70:
endm

make_text proc

	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp+arg1] ; citim simbolul de afisat
	cmp eax, 'A'
	jl make_digit
	cmp eax, 'Z'
	jg make_digit
	sub eax, 'A'
	lea esi, letters
	jmp draw_text
	
make_digit:

	cmp eax, '0'
	jl make_space
	cmp eax, '9'
	jg make_space
	sub eax, '0'
	lea esi, digits
	jmp draw_text
	
make_space:	

	mov eax, 26 ; de la 0 pana la 25 sunt litere, 26 e space
	lea esi, letters
	
draw_text:

	mov ebx, symbol_width
	mul ebx
	mov ebx, symbol_height
	mul ebx
	add esi, eax
	mov ecx, symbol_height
	
bucla_simbol_linii:

	mov edi, [ebp+arg2] ; pointer la matricea de pixeli
	mov eax, [ebp+arg4] ; pointer la coord y
	add eax, symbol_height
	sub eax, ecx
	mov ebx, area_width
	mul ebx
	add eax, [ebp+arg3] ; pointer la coord x
	shl eax, 2 ; inmultim cu 4, avem un DWORD per pixel
	add edi, eax
	push ecx
	mov ecx, symbol_width
	
bucla_simbol_coloane:

	cmp byte ptr [esi], 0
	je simbol_pixel_alb
	mov dword ptr [edi], 0
	jmp simbol_pixel_next
	
simbol_pixel_alb:

	mov dword ptr [edi], 0FFFFFFh
	
simbol_pixel_next:

	inc esi
	add edi, 4
	loop bucla_simbol_coloane
	pop ecx
	loop bucla_simbol_linii
	popa
	mov esp, ebp
	pop ebp
	ret
	
make_text endp

; un macro ca sa apelam mai usor desenarea simbolului
make_text_macro macro symbol, drawArea, x, y

	push y
	push x
	push drawArea
	push symbol
	call make_text
	add esp, 16
endm

linie_orizontala macro x,y,len, color

local bucla_linie

	mov eax,y;eax=y;
	mov ebx,area_width
	mul ebx ; eax=y*area_width+x
	add eax,x ; eax=y*area_width+x
	shl eax,2 ; eax=(y*area_width+x)*4
	add eax, area
	mov ecx,len
	bucla_linie:
		mov dword ptr[eax],color
		add eax,4
	loop bucla_linie
 
endm

linie_verticala macro x,y,len,color

local bucla_lin_oriz
	mov eax,y
	mov ebx,area_width
	mul ebx
	add eax,x
	shl eax,2
	add eax,area
	mov ecx,len
	bucla_lin_oriz:
		mov dword ptr[eax],color
		add eax, area_width*4
	loop bucla_lin_oriz
endm
	

; functia de desenare - se apeleaza la fiecare click
; sau la fiecare interval de 200ms in care nu s-a dat click
; arg1 - evt (0 - initializare, 1 - click, 2 - s-a scurs intervalul fara click)
; arg2 - x
; arg3 - y


draw proc

	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp+arg1]
	cmp eax, 1
	jz evt_click
	cmp eax, 2
	jz evt_timer ; nu s-a efectuat click pe nimic
	;mai jos e codul care intializeaza fereastra cu pixeli albi
	mov eax, area_width
	mov ebx, area_height
	mul ebx
	shl eax, 2
	push eax
	push 255
	push area
	call memset
	add esp, 12
	jmp afisare_litere


evt_click:
	; mov eax, [ebp+arg3];eax=y;
	; mov ebx,area_width
	; mul ebx ; eax=y*area_width+x
	; add eax,[ebp+arg2] ; eax=y*area_width+x
	; shl eax,2 ; eax=(y*area_width+x)*4
	; add eax, area
	; mov dword ptr[eax],0FF0000h
	; mov dword ptr[eax+4],0F9FF33h
	; mov dword ptr[eax-4],0f9ff33h
	; mov dword ptr[eax+4*area_width], 0F9FF33h  
	; mov dword ptr[eax-4*area_width], 0F9FF33h  
	;linie_orizontala [ebp+arg2], [ebp+arg3], 30 , 0C70039h
	;linie_verticala [ebp+arg2],[ebp+arg3],30, 0C70039h
	afis_patrat_macro
	
	cmp mat_afis[0],1
	jne skip3
	make_text_macro '0', area, 140, 75
	skip3:
	cmp mat_afis[1],1
	jne skip4
	make_text_macro '1', area, 140, 125
	skip4:
	cmp mat_afis[2],1
	jne skip5
	make_text_macro '1', area, 140, 175
	skip5:
	cmp mat_afis[3],1
	jne skip6
	make_text_macro '2', area, 140, 225
	skip6:
	cmp mat_afis[4],1
	jne skip7
	make_text_macro 'X', area, 140, 275
	skip7:
	cmp mat_afis[5],1
	jne skip8
	make_text_macro '2', area, 140, 325
	skip8:
	cmp mat_afis[6],1
	jne skip9
	make_text_macro '1', area, 140, 375
	skip9:
	cmp mat_afis[7],1
	jne skip10
	make_text_macro '1', area, 140, 425
	skip10:
	cmp mat_afis[8],1
	jne skip11
	make_text_macro '0', area, 190, 75
	skip11:
	cmp mat_afis[9],1
	jne skip12
	make_text_macro '1', area, 190, 125
	skip12:
	cmp mat_afis[10],1
	jne skip13
	make_text_macro 'X', area, 190, 175
	skip13:
	cmp mat_afis[11],1
	jne skip14
	make_text_macro '2', area, 190, 225
	skip14:
	cmp mat_afis[12],1
	jne skip15
	make_text_macro '1', area, 190, 275
	skip15:
	cmp mat_afis[13],1
	jne skip16
	make_text_macro '2', area, 190, 325
	skip16:
	cmp mat_afis[14],1
	jne skip17
	make_text_macro 'X', area, 190, 375
	skip17:
	cmp mat_afis[15],1
	jne skip18
	make_text_macro '1', area, 190, 425
	skip18:
	cmp mat_afis[16],1
	jne skip19
	make_text_macro '1', area, 240, 75
	skip19:
	cmp mat_afis[17],1
	jne skip20
	make_text_macro '3', area, 240, 125
	skip20:
	cmp mat_afis[18],1
	jne skip21
	make_text_macro '2', area, 240, 175
	skip21:
	cmp mat_afis[19],1
	jne skip22
	make_text_macro '2', area, 240, 225
	skip22:
	cmp mat_afis[20],1
	jne skip23
	make_text_macro '1', area, 240, 275
	skip23:
	cmp mat_afis[21],1
	jne skip24
	make_text_macro '2', area, 240, 325
	skip24:
	cmp mat_afis[22],1
	jne skip25
	make_text_macro '2', area, 240, 375
	skip25:
	cmp mat_afis[23],1
	jne skip26
	make_text_macro '1', area, 240, 425
	skip26:
	cmp mat_afis[24],1
	jne skip27
	make_text_macro 'X', area, 290, 75
	
	
		
	skip27:
	cmp mat_afis[25],1
	jne skip28
	make_text_macro '3', area, 290, 125
	skip28:
	cmp mat_afis[26],1
	jne skip29
	make_text_macro 'X', area, 290, 175
	skip29:
	cmp mat_afis[27],1
	jne skip30
	make_text_macro '2', area, 290, 225
	skip30:
	cmp mat_afis[28],1
	jne skip31
	make_text_macro '1', area, 290, 275
	skip31:
	cmp mat_afis[29],1
	jne skip32
	make_text_macro 'X', area, 290, 325
	skip32:
	cmp mat_afis[30],1
	jne skip33
	make_text_macro '1', area, 290, 375
	skip33:
	cmp mat_afis[31],1
	jne skip34
	make_text_macro '0', area, 290, 425
	skip34:
	cmp mat_afis[32],1
	jne skip35
	make_text_macro '2', area, 340, 75
	skip35:
	cmp mat_afis[33],1
	jne skip36
	make_text_macro '4', area, 340, 125
	skip36:
	cmp mat_afis[34],1
	jne skip37
	make_text_macro 'X', area, 340, 175
	skip37:
	cmp mat_afis[35],1
	jne skip38
	make_text_macro '2', area, 340, 225
	skip38:
	cmp mat_afis[36],1
	jne skip39
	make_text_macro '1', area, 340, 275
	skip39:
	cmp mat_afis[37],1
	jne skip40
	make_text_macro '1', area, 340, 325
	skip40:
	cmp mat_afis[38],1
	jne skip41
	make_text_macro '1', area, 340, 375
	skip41:
	cmp mat_afis[39],1
	jne skip42
	make_text_macro '0', area, 340, 425
	skip42:
	cmp mat_afis[40],1
	jne skip43
	make_text_macro '2', area, 390, 75
	skip43:
	cmp mat_afis[41],1
	jne skip44
	make_text_macro 'X', area, 390, 125
	skip44:
	cmp mat_afis[42],1
	jne skip45
	make_text_macro '2', area, 390, 175
	skip45:
	cmp mat_afis[43],1
	jne skip46
	make_text_macro '1', area, 390, 225
	skip46:
	cmp mat_afis[44],1
	jne skip47
	make_text_macro '1', area, 390, 275
	skip47:
	cmp mat_afis[45],1
	jne skip48
	make_text_macro '1', area, 390, 325
	skip48:
	cmp mat_afis[46],1
	jne skip49
	make_text_macro '1', area, 390, 375
	skip49:
	cmp mat_afis[47],1
	jne skip50
	make_text_macro '0', area, 390, 425
	skip50:
	cmp mat_afis[48],1
	jne skip51
	make_text_macro 'X', area, 440, 75
	skip51:
	cmp mat_afis[49],1
	jne skip52
	make_text_macro '2', area, 440, 125
	skip52:
	cmp mat_afis[50],1
	jne skip53
	make_text_macro '1', area, 440, 175
	skip53:
	cmp mat_afis[51],1
	jne skip54
	make_text_macro '0', area, 440, 225
	skip54:
	cmp mat_afis[52],1
	jne skip55
	make_text_macro '1', area, 440, 275
	skip55:
	cmp mat_afis[53],1
	jne skip56
	make_text_macro 'X', area, 440, 325
	skip56:
	cmp mat_afis[54],1
	jne skip57
	make_text_macro '1', area, 440, 375
	skip57:
	cmp mat_afis[55],1
	jne skip58
	make_text_macro '0', area, 440, 425
	skip58:
	cmp mat_afis[56],1
	jne skip59
	make_text_macro '1', area, 490, 75
	skip59:
	cmp mat_afis[57],1
	jne skip60 
	make_text_macro '1', area, 490, 125
	skip60:
	cmp mat_afis[58],1
	jne skip61
	make_text_macro '0', area, 490, 175
	skip61:
	cmp mat_afis[59],1
	jne skip62
	make_text_macro '0', area, 490, 225
	skip62:
	cmp mat_afis[60],1
	jne skip63
	make_text_macro '1', area, 490, 275
	skip63:
	cmp mat_afis[61],1
	jne skip64
	make_text_macro '1', area, 490, 325
	skip64:
	cmp mat_afis[62],1
	jne skip65
	make_text_macro '1', area, 490, 375
	skip65:
	cmp mat_afis[63],1
	jne skip66
	make_text_macro '0', area, 490, 425
	skip66: 
	
	
	
	jmp afisare_litere
	
evt_timer:
	inc counter
	
afisare_litere:
	;afisam valoarea counter-ului curent (sute, zeci si unitati)
	; mov ebx, 10
	; mov eax, counter
	;cifra unitatilor
	; mov edx, 0
	; div ebx
	; add edx, '0'
	; make_text_macro edx, area, 30, 10
	;cifra zecilor
	; mov edx, 0
	; div ebx
	; add edx, '0'
	; make_text_macro edx, area, 20, 10
	;cifra sutelor
	; mov edx, 0
	; div ebx
	; add edx, '0'
	; make_text_macro edx, area, 10, 10
	
	;scriem un mesaj
	make_text_macro 'M', area, 240, 4
	make_text_macro 'I', area, 250, 4
	make_text_macro 'N', area, 260, 4
	make_text_macro 'E', area, 270, 4
	make_text_macro 'S', area, 280, 4
	make_text_macro 'W', area, 290, 4
	make_text_macro 'E', area, 300, 4
	make_text_macro 'E', area, 310, 4
	make_text_macro 'P', area, 320, 4
	make_text_macro 'E', area, 330, 4
	make_text_macro 'R', area, 340, 4
	
	
	cmp fin,1
	jne skip
	make_text_macro 'G', area, 240, 4
	make_text_macro 'A', area, 250, 4
	make_text_macro 'M', area, 260, 4
	make_text_macro 'E', area, 270, 4
	make_text_macro ' ', area, 280, 4
	make_text_macro ' ', area, 290, 4
	make_text_macro ' ', area, 300, 4
	make_text_macro 'O', area, 310, 4
	make_text_macro 'V', area, 320, 4
	make_text_macro 'E', area, 330, 4
	make_text_macro 'R', area, 340, 4
	skip:
	cmp win,1
	jne skip71
	make_text_macro ' ', area, 240, 4
	make_text_macro ' ', area, 250, 4
	make_text_macro ' ', area, 260, 4
	make_text_macro ' ', area, 270, 4
	make_text_macro 'W', area, 280, 4
	make_text_macro 'I', area, 290, 4
	make_text_macro 'N', area, 300, 4
	make_text_macro ' ', area, 310, 4
	make_text_macro ' ', area, 320, 4
	make_text_macro ' ', area, 330, 4
	make_text_macro ' ', area, 340, 4
	skip71:
	
	linie_orizontala button1_x,button1_y,button_size,0
	linie_orizontala button1_x,button1_y+button_size,button_size,0
	linie_verticala button1_x, button1_y,button_size,0
	linie_verticala button1_x + button_size, button1_y,button_size,0

	linie_orizontala button2_x,button2_y,button_size,0
	linie_orizontala button2_x,button2_y+button_size,button_size,0
	linie_verticala button2_x, button2_y,button_size,0
	linie_verticala button2_x + button_size, button2_y,button_size,0
	
	linie_orizontala button3_x,button3_y,button_size,0
	linie_orizontala button3_x,button3_y+button_size,button_size,0
	linie_verticala button3_x, button3_y,button_size,0
	linie_verticala button3_x + button_size, button3_y,button_size,0
	
	linie_orizontala button4_x,button4_y,button_size,0
	linie_orizontala button4_x,button4_y+button_size,button_size,0
	linie_verticala button4_x, button4_y,button_size,0
	linie_verticala button4_x + button_size, button4_y,button_size,0
	
	linie_orizontala button5_x,button5_y,button_size,0
	linie_orizontala button5_x,button5_y+button_size,button_size,0
	linie_verticala button5_x, button5_y,button_size,0
	linie_verticala button5_x + button_size, button5_y,button_size,0
	
	linie_orizontala button6_x,button6_y,button_size,0
	linie_orizontala button6_x,button6_y+button_size,button_size,0
	linie_verticala button6_x, button6_y,button_size,0
	linie_verticala button6_x + button_size, button6_y,button_size,0
	
	linie_orizontala button7_x,button7_y,button_size,0
	linie_orizontala button7_x,button7_y+button_size,button_size,0
	linie_verticala button7_x, button7_y,button_size,0
	linie_verticala button7_x + button_size, button7_y,button_size,0
	
	linie_orizontala button8_x,button8_y,button_size,0
	linie_orizontala button8_x,button8_y+button_size,button_size,0
	linie_verticala button8_x, button8_y,button_size,0
	linie_verticala button8_x + button_size, button8_y,button_size,0
	
	linie_orizontala button9_x,button9_y,button_size,0
	linie_orizontala button9_x,button9_y+button_size,button_size,0
	linie_verticala button9_x, button9_y,button_size,0
	linie_verticala button9_x + button_size, button9_y,button_size,0
	
	linie_orizontala button10_x,button10_y,button_size,0
	linie_orizontala button10_x,button10_y+button_size,button_size,0
	linie_verticala button10_x, button10_y,button_size,0
	linie_verticala button10_x + button_size, button10_y,button_size,0
	
	linie_orizontala button11_x,button11_y,button_size,0
	linie_orizontala button11_x,button11_y+button_size,button_size,0
	linie_verticala button11_x, button11_y,button_size,0
	linie_verticala button11_x + button_size, button11_y,button_size,0
	
	linie_orizontala button12_x,button12_y,button_size,0
	linie_orizontala button12_x,button12_y+button_size,button_size,0
	linie_verticala button12_x, button12_y,button_size,0
	linie_verticala button12_x + button_size, button12_y,button_size,0
	
	linie_orizontala button13_x,button13_y,button_size,0
	linie_orizontala button13_x,button13_y+button_size,button_size,0
	linie_verticala button13_x, button13_y,button_size,0
	linie_verticala button13_x + button_size, button13_y,button_size,0
	
	linie_orizontala button13_x,button13_y,button_size,0
	linie_orizontala button13_x,button13_y+button_size,button_size,0
	linie_verticala button13_x, button13_y,button_size,0
	linie_verticala button13_x + button_size, button13_y,button_size,0
	
	linie_orizontala button14_x,button14_y,button_size,0
	linie_orizontala button14_x,button14_y+button_size,button_size,0
	linie_verticala button14_x,button14_y,button_size,0
	linie_verticala button14_x+ button_size,button14_y,button_size,0

	linie_orizontala button15_x,button15_y,button_size,0
	linie_orizontala button15_x,button15_y+button_size,button_size,0
	linie_verticala button15_x,button15_y,button_size,0
	linie_verticala button15_x+ button_size,button15_y,button_size,0

	linie_orizontala button16_x,button16_y,button_size,0
	linie_orizontala button16_x,button16_y+button_size,button_size,0
	linie_verticala button16_x,button16_y,button_size,0
	linie_verticala button16_x+ button_size,button16_y,button_size,0

	linie_orizontala button17_x,button17_y,button_size,0
	linie_orizontala button17_x,button17_y+button_size,button_size,0
	linie_verticala button17_x,button17_y,button_size,0
	linie_verticala button17_x+ button_size,button17_y,button_size,0

	linie_orizontala button18_x,button18_y,button_size,0
	linie_orizontala button18_x,button18_y+button_size,button_size,0
	linie_verticala button18_x,button18_y,button_size,0
	linie_verticala button18_x+ button_size,button18_y,button_size,0

	linie_orizontala button19_x,button19_y,button_size,0
	linie_orizontala button19_x,button19_y+button_size,button_size,0
	linie_verticala button19_x,button19_y,button_size,0
	linie_verticala button19_x+ button_size,button19_y,button_size,0

	linie_orizontala button20_x,button20_y,button_size,0
	linie_orizontala button20_x,button20_y+button_size,button_size,0
	linie_verticala button20_x,button20_y,button_size,0
	linie_verticala button20_x+ button_size,button20_y,button_size,0

	linie_orizontala button21_x,button21_y,button_size,0
	linie_orizontala button21_x,button21_y+button_size,button_size,0
	linie_verticala button21_x,button21_y,button_size,0
	linie_verticala button21_x+ button_size,button21_y,button_size,0

	linie_orizontala button22_x,button22_y,button_size,0
	linie_orizontala button22_x,button22_y+button_size,button_size,0
	linie_verticala button22_x,button22_y,button_size,0
	linie_verticala button22_x+ button_size,button22_y,button_size,0

	linie_orizontala button23_x,button23_y,button_size,0
	linie_orizontala button23_x,button23_y+button_size,button_size,0
	linie_verticala button23_x,button23_y,button_size,0
	linie_verticala button23_x+ button_size,button23_y,button_size,0

	linie_orizontala button24_x,button24_y,button_size,0
	linie_orizontala button24_x,button24_y+button_size,button_size,0
	linie_verticala button24_x,button24_y,button_size,0
	linie_verticala button24_x+ button_size,button24_y,button_size,0

	linie_orizontala button25_x,button25_y,button_size,0
	linie_orizontala button25_x,button25_y+button_size,button_size,0
	linie_verticala button25_x,button25_y,button_size,0
	linie_verticala button25_x+ button_size,button25_y,button_size,0

	linie_orizontala button26_x,button26_y,button_size,0
	linie_orizontala button26_x,button26_y+button_size,button_size,0
	linie_verticala button26_x,button26_y,button_size,0
	linie_verticala button26_x+ button_size,button26_y,button_size,0

	linie_orizontala button27_x,button27_y,button_size,0
	linie_orizontala button27_x,button27_y+button_size,button_size,0
	linie_verticala button27_x,button27_y,button_size,0
	linie_verticala button27_x+ button_size,button27_y,button_size,0

	linie_orizontala button28_x,button28_y,button_size,0
	linie_orizontala button28_x,button28_y+button_size,button_size,0
	linie_verticala button28_x,button28_y,button_size,0
	linie_verticala button28_x+ button_size,button28_y,button_size,0

	linie_orizontala button29_x,button29_y,button_size,0
	linie_orizontala button29_x,button29_y+button_size,button_size,0
	linie_verticala button29_x,button29_y,button_size,0
	linie_verticala button29_x+ button_size,button29_y,button_size,0

	linie_orizontala button30_x,button30_y,button_size,0
	linie_orizontala button30_x,button30_y+button_size,button_size,0
	linie_verticala button30_x,button30_y,button_size,0
	linie_verticala button30_x+ button_size,button30_y,button_size,0

	linie_orizontala button31_x,button31_y,button_size,0
	linie_orizontala button31_x,button31_y+button_size,button_size,0
	linie_verticala button31_x,button31_y,button_size,0
	linie_verticala button31_x+ button_size,button31_y,button_size,0

	linie_orizontala button32_x,button32_y,button_size,0
	linie_orizontala button32_x,button32_y+button_size,button_size,0
	linie_verticala button32_x,button32_y,button_size,0
	linie_verticala button32_x+ button_size,button32_y,button_size,0

	linie_orizontala button33_x,button33_y,button_size,0
	linie_orizontala button33_x,button33_y+button_size,button_size,0
	linie_verticala button33_x,button33_y,button_size,0
	linie_verticala button33_x+ button_size,button33_y,button_size,0

	linie_orizontala button34_x,button34_y,button_size,0
	linie_orizontala button34_x,button34_y+button_size,button_size,0
	linie_verticala button34_x,button34_y,button_size,0
	linie_verticala button34_x+ button_size,button34_y,button_size,0

	linie_orizontala button35_x,button35_y,button_size,0
	linie_orizontala button35_x,button35_y+button_size,button_size,0
	linie_verticala button35_x,button35_y,button_size,0
	linie_verticala button35_x+ button_size,button35_y,button_size,0

	linie_orizontala button36_x,button36_y,button_size,0
	linie_orizontala button36_x,button36_y+button_size,button_size,0
	linie_verticala button36_x,button36_y,button_size,0
	linie_verticala button36_x+ button_size,button36_y,button_size,0

	linie_orizontala button37_x,button37_y,button_size,0
	linie_orizontala button37_x,button37_y+button_size,button_size,0
	linie_verticala button37_x,button37_y,button_size,0
	linie_verticala button37_x+ button_size,button37_y,button_size,0

	linie_orizontala button38_x,button38_y,button_size,0
	linie_orizontala button38_x,button38_y+button_size,button_size,0
	linie_verticala button38_x,button38_y,button_size,0
	linie_verticala button38_x+ button_size,button38_y,button_size,0

	linie_orizontala button39_x,button39_y,button_size,0
	linie_orizontala button39_x,button39_y+button_size,button_size,0
	linie_verticala button39_x,button39_y,button_size,0
	linie_verticala button39_x+ button_size,button39_y,button_size,0

	linie_orizontala button40_x,button40_y,button_size,0
	linie_orizontala button40_x,button40_y+button_size,button_size,0
	linie_verticala button40_x,button40_y,button_size,0
	linie_verticala button40_x+ button_size,button40_y,button_size,0

	linie_orizontala button41_x,button41_y,button_size,0
	linie_orizontala button41_x,button41_y+button_size,button_size,0
	linie_verticala button41_x,button41_y,button_size,0
	linie_verticala button41_x+ button_size,button41_y,button_size,0

	linie_orizontala button42_x,button42_y,button_size,0
	linie_orizontala button42_x,button42_y+button_size,button_size,0
	linie_verticala button42_x,button42_y,button_size,0
	linie_verticala button42_x+ button_size,button42_y,button_size,0

	linie_orizontala button43_x,button43_y,button_size,0
	linie_orizontala button43_x,button43_y+button_size,button_size,0
	linie_verticala button43_x,button43_y,button_size,0
	linie_verticala button43_x+ button_size,button43_y,button_size,0

	linie_orizontala button44_x,button44_y,button_size,0
	linie_orizontala button44_x,button44_y+button_size,button_size,0
	linie_verticala button44_x,button44_y,button_size,0
	linie_verticala button44_x+ button_size,button44_y,button_size,0

	linie_orizontala button45_x,button45_y,button_size,0
	linie_orizontala button45_x,button45_y+button_size,button_size,0
	linie_verticala button45_x,button45_y,button_size,0
	linie_verticala button45_x+ button_size,button45_y,button_size,0

	linie_orizontala button46_x,button46_y,button_size,0
	linie_orizontala button46_x,button46_y+button_size,button_size,0
	linie_verticala button46_x,button46_y,button_size,0
	linie_verticala button46_x+ button_size,button46_y,button_size,0

	linie_orizontala button47_x,button47_y,button_size,0
	linie_orizontala button47_x,button47_y+button_size,button_size,0
	linie_verticala button47_x,button47_y,button_size,0
	linie_verticala button47_x+ button_size,button47_y,button_size,0

	linie_orizontala button48_x,button48_y,button_size,0
	linie_orizontala button48_x,button48_y+button_size,button_size,0
	linie_verticala button48_x,button48_y,button_size,0
	linie_verticala button48_x+ button_size,button48_y,button_size,0

	linie_orizontala button49_x,button49_y,button_size,0
	linie_orizontala button49_x,button49_y+button_size,button_size,0
	linie_verticala button49_x,button49_y,button_size,0
	linie_verticala button49_x+ button_size,button49_y,button_size,0

	linie_orizontala button50_x,button50_y,button_size,0
	linie_orizontala button50_x,button50_y+button_size,button_size,0
	linie_verticala button50_x,button50_y,button_size,0
	linie_verticala button50_x+ button_size,button50_y,button_size,0

	linie_orizontala button51_x,button51_y,button_size,0
	linie_orizontala button51_x,button51_y+button_size,button_size,0
	linie_verticala button51_x,button51_y,button_size,0
	linie_verticala button51_x+ button_size,button51_y,button_size,0

	linie_orizontala button52_x,button52_y,button_size,0
	linie_orizontala button52_x,button52_y+button_size,button_size,0
	linie_verticala button52_x,button52_y,button_size,0
	linie_verticala button52_x+ button_size,button52_y,button_size,0

	linie_orizontala button53_x,button53_y,button_size,0
	linie_orizontala button53_x,button53_y+button_size,button_size,0
	linie_verticala button53_x,button53_y,button_size,0
	linie_verticala button53_x+ button_size,button53_y,button_size,0

	linie_orizontala button54_x,button54_y,button_size,0
	linie_orizontala button54_x,button54_y+button_size,button_size,0
	linie_verticala button54_x,button54_y,button_size,0
	linie_verticala button54_x+ button_size,button54_y,button_size,0

	linie_orizontala button55_x,button55_y,button_size,0
	linie_orizontala button55_x,button55_y+button_size,button_size,0
	linie_verticala button55_x,button55_y,button_size,0
	linie_verticala button55_x+ button_size,button55_y,button_size,0

	linie_orizontala button56_x,button56_y,button_size,0
	linie_orizontala button56_x,button56_y+button_size,button_size,0
	linie_verticala button56_x,button56_y,button_size,0
	linie_verticala button56_x+ button_size,button56_y,button_size,0

	linie_orizontala button57_x,button57_y,button_size,0
	linie_orizontala button57_x,button57_y+button_size,button_size,0
	linie_verticala button57_x,button57_y,button_size,0
	linie_verticala button57_x+ button_size,button57_y,button_size,0

	linie_orizontala button58_x,button58_y,button_size,0
	linie_orizontala button58_x,button58_y+button_size,button_size,0
	linie_verticala button58_x,button58_y,button_size,0
	linie_verticala button58_x+ button_size,button58_y,button_size,0

	linie_orizontala button59_x,button59_y,button_size,0
	linie_orizontala button59_x,button59_y+button_size,button_size,0
	linie_verticala button59_x,button59_y,button_size,0
	linie_verticala button59_x+ button_size,button59_y,button_size,0

	linie_orizontala button60_x,button60_y,button_size,0
	linie_orizontala button60_x,button60_y+button_size,button_size,0
	linie_verticala button60_x,button60_y,button_size,0
	linie_verticala button60_x+ button_size,button60_y,button_size,0

	linie_orizontala button61_x,button61_y,button_size,0
	linie_orizontala button61_x,button61_y+button_size,button_size,0
	linie_verticala button61_x,button61_y,button_size,0
	linie_verticala button61_x+ button_size,button61_y,button_size,0

	linie_orizontala button62_x,button62_y,button_size,0
	linie_orizontala button62_x,button62_y+button_size,button_size,0
	linie_verticala button62_x,button62_y,button_size,0
	linie_verticala button62_x+ button_size,button62_y,button_size,0

	linie_orizontala button63_x,button63_y,button_size,0
	linie_orizontala button63_x,button63_y+button_size,button_size,0
	linie_verticala button63_x,button63_y,button_size,0
	linie_verticala button63_x+ button_size,button63_y,button_size,0

	linie_orizontala button64_x,button64_y,button_size,0
	linie_orizontala button64_x,button64_y+button_size,button_size,0
	linie_verticala button64_x,button64_y,button_size,0
	linie_verticala button64_x+ button_size,button64_y,button_size,0
	
	
final_draw:
	popa
	mov esp, ebp
	pop ebp
	ret
draw endp

start:
	;alocam memorie pentru zona de desenat
	mov eax, area_width
	mov ebx, area_height
	mul ebx
	shl eax, 2
	push eax
	call malloc
	add esp, 4
	mov area, eax
	;apelam functia de desenare a ferestrei
	; typedef void (*DrawFunc)(int evt, int x, int y);
	; void __cdecl BeginDrawing(const char *title, int width, int height, unsigned int *area, DrawFunc draw);
	push offset draw
	push area
	push area_height
	push area_width
	push offset window_title
	call BeginDrawing
	add esp, 20
	
	;terminarea programului
	push 0
	call exit
end start
