;===============================================================================
; Object 0x0E Sonic And Miles In Title Screen
; [ Begin ]
;===============================================================================	
Obj0E:
	moveq	#0,d0
	move.b	routine(a0),d0
	move.w	Obj0E_States(pc,d0.w),d1
	jmp	Obj0E_States(pc,d1.w)
; ===========================================================================
; off_12E26:
Obj0E_States:
	dc.w loc_12E38-Obj0E_States;  0
	dc.w loc_12E58-Obj0E_States;  2
	dc.w lc_13066-Obj0E_States;  4
	dc.w loc_130D4-Obj0E_States;  6
	dc.w loc_1314A-Obj0E_States;  8
	dc.w loc_13200-Obj0E_States; $A
	dc.w loc_13294-Obj0E_States; $C
	dc.w loc_13112-Obj0E_States; $E
	dc.w lc_1324C-Obj0E_States;$10
; ===========================================================================

loc_12E38:
	addq.b	#2,routine(a0)
	move.l	#Obj0E_MapUnc_136A8,mappings(a0)
	move.w	#$150,art_tile(a0)
	move.b	#4,priority(a0)
	move.b	subtype(a0),routine(a0)
	bra.s	Obj0E
; ===========================================================================

loc_12E58:
	addq.w	#1,objoff_34(a0)
	cmpi.w	#$120,objoff_34(a0)
	bcc.s	loc_12E68
	bsr.w	sub_134BC

loc_12E68:
	moveq	#0,d0
	move.b	routine_secondary(a0),d0
	move.w	off_12E76(pc,d0.w),d1
	jmp	off_12E76(pc,d1.w)
; ===========================================================================
off_12E76:
	dc.w loc_12E8A-off_12E76
	dc.w loc_12EC2-off_12E76; 1
	dc.w loc_12EE8-off_12E76; 2
	dc.w loc_12F18-off_12E76; 3
	dc.w loc_12F52-off_12E76; 4
	dc.w loc_12F60-off_12E76; 5
	dc.w loc_12F7C-off_12E76; 6
	dc.w loc_12F9A-off_12E76; 7
	dc.w loc_12FD6-off_12E76; 8
	dc.w loc_13014-off_12E76; 9
; ===========================================================================
; spawn more stars
loc_12E8A:
	addq.b	#2,routine_secondary(a0)
	move.b	#5,mapping_frame(a0)
	move.w	#$110,x_pos(a0)
	move.w	#$E0,objoff_A(a0)
	lea	(Object_RAM+$C0).w,a1
	move.b	#$E,(a1) ; load obj0E (flashing intro stars) at $FFFFB0C0
	move.b	#8,subtype(a1)
	lea	(Object_RAM+$140).w,a1
	move.b	#$E,(a1) ; load obj0E (flashing intro stars) at $FFFFD140
	move.b	#6,subtype(a1)
	move.b	#$B5,d0;A7,d0
	bra.w	JmpTo4_PlaySound
; ===========================================================================

loc_12EC2:
	cmpi.w	#$38,objoff_34(a0)
	bcc.s	loc_12ECC
	rts
; ===========================================================================

loc_12ECC:
	addq.b	#2,routine_secondary(a0)
	lea	(Object_RAM+$100).w,a1
	move.b	#$C9,(a1) ; load objC9 (palette change)
	move.b	#0,subtype(a1)
	st	objoff_30(a0)
	move.b	#$99,d0 ; title music
	bra.w	JmpTo4_PlayMusic
; ===========================================================================

loc_12EE8:
	cmpi.w	#$80,objoff_34(a0)
	bcc.s	loc_12EF2
	rts
; ===========================================================================

loc_12EF2:
	addq.b	#2,routine_secondary(a0)
	lea	(Pal_133EC).l,a1
	lea	(Normal_palette).w,a2
	moveq	#$F,d6

lc_12F02:
	move.w	(a1)+,(a2)+
	dbf	d6,lc_12F02

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||


sub_12F08:
	lea	(Object_RAM+$180).w,a1
	move.b	#$E,(a1) ; load obj0E (flashing intro star) at $FFFFB180
	move.b	#$E,subtype(a1)
	rts
; End of function sub_12F08

; ===========================================================================

loc_12F18:
	moveq	#$24,d2
	lea	(word_13046).l,a1

loc_12F20:

	move.w	objoff_2A(a0),d0
	addq.w	#1,d0
	move.w	d0,objoff_2A(a0)
	andi.w	#3,d0
	bne.s	BranchTo6_j_2displaysprite
	move.w	objoff_2C(a0),d1
	addq.w	#4,d1
	cmp.w	d2,d1
	bcc.w	loc_1310A
	move.w	d1,objoff_2C(a0)
	move.l	-4(a1,d1.w),d0
	move.w	d0,objoff_A(a0)
	swap	d0
	move.w	d0,x_pos(a0)

BranchTo6_j_2displaysprite 
	bra.w	j_2displaysprite
; ===========================================================================

loc_12F52:

	lea	(off_13686).l,a1
	bsr.w	j_animatesprite
	bra.w	j_2displaysprite
; ===========================================================================

loc_12F60:
	addq.b	#2,routine_secondary(a0)
	move.b	#$12,mapping_frame(a0)
	lea	(Object_RAM+$1C0).w,a1
	move.b	#$E,(a1) ; load obj0E (flashing intro star) at $FFFFB1C0
	move.b	#$A,subtype(a1)
	bra.w	j_2displaysprite
; ===========================================================================

loc_12F7C:
	cmpi.w	#$C0,objoff_34(a0)
	bcs.s	BranchTo7_j_2displaysprite
	addq.b	#2,routine_secondary(a0)
	lea	(Object_RAM+$80).w,a1
	move.b	#$E,(a1) ; load obj0E (flashing intro star) at $FFFFB080
	move.b	#4,subtype(a1)

BranchTo7_j_2displaysprite 
	bra.w	j_2displaysprite
; ===========================================================================

loc_12F9A:
	cmpi.w	#$120,objoff_34(a0)
	bcs.s	BranchTo8_j_2displaysprite
	addq.b	#2,routine_secondary(a0)
	clr.w	objoff_2C(a0)
	st	objoff_2F(a0)
	lea	(Normal_palette_line3).w,a1
	move.w	#$EEE,d0
	moveq	#$F,d6

loc_12FB8:
	move.w	d0,(a1)+
	dbf	d6,loc_12FB8
	lea	(Object_RAM+$240).w,a1
	move.b	#$C9,(a1) ; load objC9 (palette change handler) at $FFFFB240
	move.b	#2,subtype(a1)
	move.b	#$F,(Object_RAM+$400).w ; load Obj0F (title screen menu) at $FFFFB400

BranchTo8_j_2displaysprite 
	bra.w	j_2displaysprite
; ===========================================================================

loc_12FD6:
	btst	#6,(Graphics_Flags).w
	beq.s	loc_12FEA
	cmpi.w	#$190,objoff_34(a0)
	beq.s	loc_12FF6
	bra.w	j_2displaysprite
; ===========================================================================

loc_12FEA:
	cmpi.w	#$1D0,objoff_34(a0)
	beq.s	loc_12FF6
	bra.w	j_2displaysprite
; ===========================================================================

loc_12FF6:
	lea	(Object_RAM+$440).w,a1
	move.b	#$E,(a1) ; load obj0E (flashing intro star) at $FFFFB440
	move.b	#$C,subtype(a1)
	addq.b	#2,routine_secondary(a0)
	lea	(Object_RAM+$180).w,a1
	bsr.w	j_2j_2deleteobject2 ; delete object at $FFFFB180
	bra.w	j_2displaysprite
; ===========================================================================

loc_13014:
	move.b	($FFFFFE0F).w,d0
	andi.b	#7,d0
	bne.s	BranchTo9_j_2displaysprite
	move.w	objoff_2C(a0),d0
	addq.w	#2,d0
	cmpi.w	#$C,d0
	bcs.s	loc_1302C
	moveq	#0,d0

loc_1302C:
	move.w	d0,objoff_2C(a0)
	move.w	word_1303A(pc,d0.w),(Normal_palette_line3+$A).w

BranchTo9_j_2displaysprite 
	bra.w	j_2displaysprite
; ===========================================================================
word_1303A:
	dc.w  $E64
	dc.w  $E86	; 1
	dc.w  $E64	; 2
	dc.w  $EA8	; 3
	dc.w  $E64	; 4
	dc.w  $ECA	; 5
word_13046:
	dc.w  $108
	dc.w   $D0	; 1
	dc.w  $100	; 2
	dc.w   $C0	; 3
	dc.w   $F8	; 4
	dc.w   $B0	; 5
	dc.w   $F6	; 6
	dc.w   $A6	; 7
	dc.w   $FA	; 8
	dc.w   $9E	; 9
	dc.w  $100	; 10
	dc.w   $9A	; 11
	dc.w  $104	; 12
	dc.w   $99	; 13
	dc.w  $108	; 14
	dc.w   $98	; 15
; ===========================================================================

lc_13066:
	moveq	#0,d0
	move.b	routine_secondary(a0),d0
	move.w	off_13074(pc,d0.w),d1
	jmp	off_13074(pc,d1.w)
; ===========================================================================
off_13074:
	dc.w loc_1307E-off_13074
	dc.w loc_13096-off_13074
	dc.w loc_12F52-off_13074
	dc.w loc_130A2-off_13074
	dc.w BranchTo10_j_2displaysprite-off_13074
; ===========================================================================

loc_1307E:
	addq.b	#2,routine_secondary(a0)
	move.w	#$D8,x_pos(a0)
	move.w	#$D8,objoff_A(a0)
	move.b	#1,anim(a0)
	rts
; ===========================================================================

loc_13096:
	moveq	#$20,d2
	lea	(word_130B8).l,a1
	bra.w	loc_12F20
; ===========================================================================

loc_130A2:
	addq.b	#2,routine_secondary(a0)
	lea	(Object_RAM+$200).w,a1
	move.b	#$E,(a1) ; load obj0E (flashing intro star) at $FFFFB200
	move.b	#$10,subtype(a1)

BranchTo10_j_2displaysprite 
	bra.w	j_2displaysprite
; ===========================================================================
word_130B8:
	dc.w   $D7
	dc.w   $C8	; 1
	dc.w   $D3	; 2
	dc.w   $B8	; 3
	dc.w   $CE	; 4
	dc.w   $AC	; 5
	dc.w   $CC	; 6
	dc.w   $A6	; 7
	dc.w   $CA	; 8
	dc.w   $A2	; 9
	dc.w   $C9	; 10
	dc.w   $A1	; 11
	dc.w   $C8	; 12
	dc.w   $A0	; 13
; ===========================================================================

loc_130D4:
	moveq	#0,d0
	move.b	routine_secondary(a0),d0
	move.w	off_130E2(pc,d0.w),d1
	jmp	off_130E2(pc,d1.w)
; ===========================================================================
off_130E2:
	dc.w loc_130E6-off_130E2
	dc.w BranchTo11_j_2displaysprite-off_130E2; 1
; ===========================================================================

loc_130E6:
	move.b	#$B,mapping_frame(a0)
	tst.b	(Graphics_Flags).w
	bmi.s	loc_130F8
	move.b	#$A,mapping_frame(a0)

loc_130F8:
	move.b	#2,priority(a0)
	move.w	#$120,x_pos(a0)
	move.w	#$E8,objoff_A(a0)

loc_1310A:
	addq.b	#2,routine_secondary(a0)

BranchTo11_j_2displaysprite 
	bra.w	j_2displaysprite
; ===========================================================================

loc_13112:
	moveq	#0,d0
	move.b	routine_secondary(a0),d0
	move.w	off_13120(pc,d0.w),d1
	jmp	off_13120(pc,d1.w)
; ===========================================================================
off_13120:
	dc.w loc_13124-off_13120
	dc.w BranchTo12_j_2displaysprite-off_13120; 1
; ===========================================================================

loc_13124:
	addq.b	#2,routine_secondary(a0)
	move.w	#0,art_tile(a0)
	move.b	#$11,mapping_frame(a0)
	move.b	#2,priority(a0)
	move.w	#$100,x_pos(a0)
	move.w	#$F0,objoff_A(a0)

BranchTo12_j_2displaysprite 
	bra.w	j_2displaysprite
; ===========================================================================

loc_1314A:
	moveq	#0,d0
	move.b	routine_secondary(a0),d0
	move.w	off_13158(pc,d0.w),d1
	jmp	off_13158(pc,d1.w)
; ===========================================================================
off_13158:
	dc.w loc_13160-off_13158
	dc.w loc_12F52-off_13158
	dc.w loc_13190-off_13158
	dc.w loc_1319E-off_13158
; ===========================================================================

loc_13160:
	addq.b	#2,routine_secondary(a0)
	move.b	#$C,mapping_frame(a0)
	ori.w	#$8000,art_tile(a0)
	move.b	#2,anim(a0)
	move.b	#1,priority(a0)
	move.w	#$100,x_pos(a0)
	move.w	#$A8,objoff_A(a0)
	move.w	#4,objoff_2A(a0)
	rts
; ===========================================================================

loc_13190:
	subq.w	#1,objoff_2A(a0)
	bmi.s	loc_13198
	rts
; ===========================================================================

loc_13198:
	addq.b	#2,routine_secondary(a0)
	rts
; ===========================================================================

loc_1319E:
	move.b	#2,routine_secondary(a0)
	move.b	#0,anim_frame(a0)
	move.b	#0,anim_frame_duration(a0)
	move.w	#6,objoff_2A(a0)
	move.w	objoff_2C(a0),d0
	addq.w	#4,d0
	cmpi.w	#$28,d0
	bcc.w	j_2deleteobject
	move.w	d0,objoff_2C(a0)
	move.l	word_131DC-4(pc,d0.w),d0
	move.w	d0,objoff_A(a0)
	swap	d0
	move.w	d0,x_pos(a0)
	move.b	#$35+$80,d0;27+$80,d0 ; play intro sparkle sound
	bra.w	JmpTo4_PlaySound;$35,$40,$4E can work
; ===========================================================================
; unknown
word_131DC:
	dc.w   $DA
	dc.w   $F2	; 1
	dc.w  $170	; 2
	dc.w   $F8	; 3
	dc.w  $132	; 4
	dc.w  $131	; 5
	dc.w  $19E	; 6
	dc.w   $A2	; 7
	dc.w   $C0	; 8
	dc.w   $E3	; 9
	dc.w  $180	; 10
	dc.w   $E0	; 11
	dc.w  $10D	; 12
	dc.w  $13B	; 13
	dc.w   $C0	; 14
	dc.w   $AB	; 15
	dc.w  $165	; 16
	dc.w  $107	; 17
; ===========================================================================

loc_13200:
	moveq	#0,d0
	move.b	routine_secondary(a0),d0
	move.w	off_1320E(pc,d0.w),d1
	jmp	off_1320E(pc,d1.w)
; ===========================================================================
off_1320E:
	dc.w loc_13214-off_1320E; 0
	dc.w lc_13234-off_1320E; 1
	dc.w BranchTo13_j_2displaysprite-off_1320E; 2
; ===========================================================================

loc_13214:
	addq.b	#2,routine_secondary(a0)
	move.b	#9,mapping_frame(a0)
	move.b	#3,priority(a0)
	move.w	#$145,x_pos(a0)
	move.w	#$BF,objoff_A(a0)

BranchTo13_j_2displaysprite 
	bra.w	j_2displaysprite
; ===========================================================================

lc_13234:
	moveq	#$10,d2
	lea	(word_13240).l,a1
	bra.w	loc_12F20
; ===========================================================================
word_13240:
	dc.w  $143
	dc.w   $C1	; 1
	dc.w  $140	; 2
	dc.w   $C2	; 3
	dc.w  $141	; 4
	dc.w   $C1	; 5
; ===========================================================================

lc_1324C:
	moveq	#0,d0
	move.b	routine_secondary(a0),d0
	move.w	off_1325A(pc,d0.w),d1
	jmp	off_1325A(pc,d1.w)
; ===========================================================================
off_1325A:
	dc.w loc_13260-off_1325A
	dc.w loc_13280-off_1325A; 1
	dc.w BranchTo14_j_2displaysprite-off_1325A; 2
; ===========================================================================

loc_13260:
	addq.b	#2,routine_secondary(a0)
	move.b	#$13,mapping_frame(a0)
	move.b	#3,priority(a0)
	move.w	#$10F,x_pos(a0)
	move.w	#$D5,objoff_A(a0)

BranchTo14_j_2displaysprite 
	bra.w	j_2displaysprite
; ===========================================================================

loc_13280:
	moveq	#$C,d2
	lea	(byte_1328C).l,a1
	bra.w	loc_12F20
; ===========================================================================
byte_1328C:
	dc.b   1
	dc.b  $C	; 1
	dc.b   0	; 2
	dc.b $D0	; 3
	dc.b   1	; 4
	dc.b  $D	; 5
	dc.b   0	; 6
	dc.b $D1	; 7
; ===========================================================================

loc_13294:
	moveq	#0,d0
	move.b	routine_secondary(a0),d0
	move.w	off_132A2(pc,d0.w),d1
	jmp	off_132A2(pc,d1.w)
; ===========================================================================
off_132A2:
	dc.w loc_132A6-off_132A2
	dc.w lc_132D2-off_132A2; 1
; ===========================================================================

loc_132A6:
	addq.b	#2,routine_secondary(a0)
	move.b	#$C,mapping_frame(a0)
	move.b	#5,priority(a0)
	move.w	#$170,x_pos(a0)
	move.w	#$80,objoff_A(a0)
	move.b	#3,anim(a0)
	move.w	#$8C,objoff_2A(a0)
	bra.w	j_2displaysprite
; ===========================================================================

lc_132D2:
	subq.w	#1,objoff_2A(a0)
	bmi.w	j_2deleteobject
	subq.w	#2,x_pos(a0)
	addq.w	#1,objoff_A(a0)
	lea	(off_13686).l,a1
	bsr.w	j_animatesprite
	bra.w	j_2displaysprite
; ===========================================================================
;loc_109D4:
;		moveq	#0,d0
;		move.b	$24(a0),d0
;		move.w	Sonic_Miles_Index(pc,d0),d1 
;		jmp	Sonic_Miles_Index(pc,d1)	
;Sonic_Miles_Index: 
;		dc.w	loc_109EA-Sonic_Miles_Index
;		dc.w	loc_10A2C-Sonic_Miles_Index
;		dc.w	loc_10A40-Sonic_Miles_Index
;		dc.w	loc_10A56-Sonic_Miles_Index
;loc_109EA:
;		addq.b	#2,$24(a0)
;		move.w	#$148,8(a0)
;		move.w	#$C4,$A(a0)
;		move.l	#Sonic_Miles_Mappings,4(a0) 
;		move.w	#$4200,2(a0)
;		move.b	#1,$18(a0)
;		move.b	#$1D,$1F(a0)
;		tst.b	$1A(a0)
;		beq.s	loc_10A2C
;		move.w	#$FC,8(a0)
;		move.w	#$CC,$A(a0)
;		move.w	#$2200,2(a0)
;loc_10A2C:
;		bra	j_2displaysprite	
;		subq.b	#1,$1F(a0)
;		bpl.s	loc_10A3E
;		addq.b	#2,$24(a0)
;		bra	j_2displaysprite	
;loc_10A3E:
;		rts
;loc_10A40:
;		sub.w	#8,$A(a0)
;		cmp.w	#$96,$A(a0)
;		bne.s	loc_10A52
;		addq.b	#2,$24(a0)
;loc_10A52:
;		bra	j_2displaysprite	
;loc_10A56:
;		bra	j_2displaysprite	
;===============================================================================
; Object 0x0E Sonic And Miles In Title Screen
; [ End ]
;===============================================================================
	include	"objc9.asm"
jmpto4_playsound:
	jmp	Play_Sfx;PlaySound
jmpto4_playmusic:
	jmp	Play_Music;PlayMusic
