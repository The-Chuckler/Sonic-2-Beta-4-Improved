; ----------------------------------------------------------------------------
; Object C9 - "Palette changing handler" from title screen
; ----------------------------------------------------------------------------
; Sprite_132F0:
ObjC9:
	moveq	#0,d0
	move.b	routine(a0),d0
	move.w	loc_132FE(pc,d0.w),d1
	jmp	loc_132FE(pc,d1.w)
; ===========================================================================

loc_132FE:
	ori.b	#$46,d4
	addq.b	#2,routine(a0)
	moveq	#0,d0
	move.b	subtype(a0),d0
	lea	(PaletteChangerDataIndex).l,a1
	adda.w	(a1,d0.w),a1
	move.l	(a1)+,objoff_3A(a0)
	movea.l	(a1)+,a2
	move.b	(a1)+,d0
	move.w	d0,objoff_34(a0)
	lea	(Second_palette).w,a3
	adda.w	d0,a3
	move.b	(a1)+,d0
	move.w	d0,objoff_36(a0)

loc_1332E:
	move.w	(a2)+,(a3)+
	dbf	d0,loc_1332E
	move.b	(a1)+,d0
	move.b	d0,objoff_30(a0)
	move.b	d0,objoff_31(a0)
	move.b	(a1)+,objoff_32(a0)
	rts
; ===========================================================================
	; unused/dead code ; a0=object

	subq.b	#1,objoff_30(a0)
	bpl.s	return_1337A
	move.b	objoff_31(a0),objoff_30(a0)
	subq.b	#1,objoff_32(a0)
	bmi.w	j_2deleteobject
	movea.l	objoff_3A(a0),a2
	movea.l	a0,a3
	move.w	objoff_36(a0),d0
	move.w	objoff_34(a0),d1
	lea	(Normal_palette).w,a0
	adda.w	d1,a0
	lea	(Second_palette).w,a1
	adda.w	d1,a1

.E:	jsr	(a2)	; dynamic call! to Pal_AddColor, loc_1344C, or loc_1348A, assuming the PaletteChangerData pointers haven't been changed
	dbf	d0,.E;-
	movea.l	a3,a0

return_1337A:
	rts
	
; ===========================================================================
; off_1337C:
PaletteChangerDataIndex:
	dc.w off_1338C-PaletteChangerDataIndex; 0
	dc.w off_13398-PaletteChangerDataIndex; 1
	dc.w off_133A4-PaletteChangerDataIndex; 2
	dc.w off_133B0-PaletteChangerDataIndex; 3
	dc.w off_133BC-PaletteChangerDataIndex; 4
	dc.w off_133C8-PaletteChangerDataIndex; 5
	dc.w off_133D4-PaletteChangerDataIndex; 6
	dc.w off_133E0-PaletteChangerDataIndex; 7

C9PalInfo macro codeptr,dataptr,loadtoOffset,length,fadeinTime,fadeinAmount
	dc.l codeptr, dataptr
	dc.b loadtoOffset, length, fadeinTime, fadeinAmount
    endm

off_1338C:	C9PalInfo Pal_AddColor, Pal_1342C, $60, $F,2,$15
off_13398:	C9PalInfo    loc_1344C, Pal_1340C, $40, $F,4,7
off_133A4:	C9PalInfo    loc_1344C,  Pal_AD1E,   0, $F,8,7
off_133B0:	C9PalInfo    loc_1348A,  Pal_AD1E,   0, $F,8,7
off_133BC:	C9PalInfo    loc_1344C,  Pal_AC7E,   0,$1F,4,7
off_133C8:	C9PalInfo    loc_1344C,  Pal_ACDE, $40,$1F,4,7
off_133D4:	C9PalInfo    loc_1344C,  Pal_AD3E,   0, $F,4,7
off_133E0:	C9PalInfo    loc_1344C,  Pal_AC9E,   0,$1F,4,7

Pal_133EC:	incbin "palettes/Title Sonic.bin"
Pal_1340C:	incbin "palettes/Title Background.bin"
Pal_1342C:	incbin "palettes/Title Emblem.bin"

; ===========================================================================

loc_1344C:

	move.b	(a1)+,d2
	andi.b	#$E,d2
	move.b	(a0),d3
	cmp.b	d2,d3
	bls.s	loc_1345C
	subq.b	#2,d3
	move.b	d3,(a0)

loc_1345C:
	addq.w	#1,a0
	move.b	(a1)+,d2
	move.b	d2,d3
	andi.b	#$E0,d2
	andi.b	#$E,d3
	move.b	(a0),d4
	move.b	d4,d5
	andi.b	#$E0,d4
	andi.b	#$E,d5
	cmp.b	d2,d4
	bls.s	loc_1347E
	subi.b	#$20,d4

loc_1347E:
	cmp.b	d3,d5
	bls.s	loc_13484
	subq.b	#2,d5

loc_13484:
	or.b	d4,d5
	move.b	d5,(a0)+
	rts
; ===========================================================================

loc_1348A:
	moveq	#$E,d2
	move.b	(a0),d3
	and.b	d2,d3
	cmp.b	d2,d3
	bcc.s	loc_13498
	addq.b	#2,d3
	move.b	d3,(a0)

loc_13498:
	addq.w	#1,a0
	move.b	(a0),d3
	move.b	d3,d4
	andi.b	#$E0,d3
	andi.b	#$E,d4
	cmpi.b	#-$20,d3
	bcc.s	loc_134B0
	addi.b	#$20,d3

loc_134B0:
	cmp.b	d2,d4
	bcc.s	loc_134B6
	addq.b	#2,d4

loc_134B6:
	or.b	d3,d4
	move.b	d4,(a0)+
	rts

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||


sub_134BC:
	tst.b	objoff_2F(a0)
	bne.w	return_135E8
	move.b	(Ctrl_1_Press).w,d0
	or.b	(Ctrl_2_Press).w,d0
	andi.b	#$7F,(Ctrl_1_Press).w
	andi.b	#$7F,(Ctrl_2_Press).w
	andi.b	#$80,d0
	beq.w	return_135E8
	st	objoff_2F(a0)
	move.b	#$10,routine_secondary(a0)
	move.b	#$12,mapping_frame(a0)
	move.w	#$108,x_pos(a0)
	move.w	#$98,objoff_A(a0)
	lea	(Object_RAM+$1C0).w,a1
	bsr.w	sub_135EA
	move.b	#$E,(a1) ; load obj0E (flashing intro star) at $FFFFB1C0
	move.b	#$A,routine(a1)
	move.b	#2,priority(a1)
	move.b	#9,mapping_frame(a1)
	move.b	#4,routine_secondary(a1)
	move.w	#$141,x_pos(a1)
	move.w	#$C1,objoff_A(a1)
	lea	(Object_RAM+$80).w,a1
	bsr.w	sub_135EA
	move.b	#$E,(a1) ; load obj0E
	move.b	#4,routine(a1)
	move.b	#4,mapping_frame(a1)
	move.b	#6,routine_secondary(a1)
	move.b	#3,priority(a1)
	move.w	#$C8,x_pos(a1)
	move.w	#$A0,objoff_A(a1)
	lea	(Object_RAM+$200).w,a1
	bsr.w	sub_135EA
	move.b	#$E,(a1) ; load obj0E
	move.b	#$10,routine(a1)
	move.b	#2,priority(a1)
	move.b	#$13,mapping_frame(a1)
	move.b	#4,routine_secondary(a1)
	move.w	#$10D,x_pos(a1)
	move.w	#$D1,objoff_A(a1)
	lea	(Object_RAM+$140).w,a1
	move.b	#$E,(a1) ; load obj0E
	move.b	#6,subtype(a1)
	bsr.w	sub_12F08
	move.b	#$F,(Object_RAM+$400).w ; load Obj0F (title screen menu) at $FFFFB400
	lea	(Object_RAM+$C0).w,a1
	bsr.w	j_2j_2deleteobject2
	lea	Pal_1342C(pc),a1
	lea	(Normal_palette_line4).w,a2
	moveq	#7,d6

loc_135B6:
	move.l	(a1)+,(a2)+
	dbf	d6,loc_135B6
	lea	Pal_1340C(pc),a1
	lea	(Normal_palette_line3).w,a2
	moveq	#7,d6

loc_135C6:
	move.l	(a1)+,(a2)+
	dbf	d6,loc_135C6
	lea	Pal_133EC(pc),a1
	lea	(Normal_palette).w,a2
	moveq	#7,d6

loc_135D6:
	move.l	(a1)+,(a2)+
	dbf	d6,loc_135D6
	tst.b	objoff_30(a0)
	bne.s	return_135E8
	move.b	#$19+$80,d0 ; title music
	bsr.w	JmpTo4_PlayMusic

return_135E8:

	rts
; End of function sub_134BC


; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||


sub_135EA:

	move.l	#Obj0E_MapUnc_136A8,mappings(a1)
	move.w	#$150,art_tile(a1)
	move.b	#4,priority(a1)
	rts
; End of function sub_135EA

; ===========================================================================
off_13686:
	dc.w byte_1368E-off_13686
	dc.w byte_13694-off_13686; 1
	dc.w byte_1369C-off_13686; 2
	dc.w byte_136A4-off_13686; 3
byte_1368E:
	dc.b   1
	dc.b   5	; 1
	dc.b   6	; 2
	dc.b   7	; 3
	dc.b   8	; 4
	dc.b $FA	; 5
byte_13694:
	dc.b   1
	dc.b   0	; 1
	dc.b   1	; 2
	dc.b   2	; 3
	dc.b   3	; 4
	dc.b   4	; 5
	dc.b $FA	; 6
	dc.b   0	; 7
byte_1369C:
	dc.b   1
	dc.b  $C	; 1
	dc.b  $D	; 2
	dc.b  $E	; 3
	dc.b  $D	; 4
	dc.b  $C	; 5
	dc.b $FA	; 6
	dc.b   0	; 7
byte_136A4:
	dc.b   3
	dc.b  $C	; 1
	dc.b  $F	; 2
	dc.b $FF	; 3
Pal_AC7E:	incbin	"palettes/Ending Sonic.bin"
Pal_AC9E:	incbin	"palettes/Ending Sonic Far.bin"
Pal_ACDE:	incbin	"palettes/Ending Background.bin"
Pal_AD1E:	incbin	"palettes/Ending Photos.bin"
Pal_AD3E:	incbin	"palettes/Ending Super Sonic.bin"
; -----------------------------------------------------------------------------
Obj0E_MapUnc_136A8:	incbin "misc/obj0E.bin"