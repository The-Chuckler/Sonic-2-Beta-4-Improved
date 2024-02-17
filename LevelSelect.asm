MenuScreen_LevelSelect:
	lea	(RAM_Start).l,a1;(Metablock_Table).l,a1
	lea	(MapEng_LevSel).l,a0
	move.w	#0,d0
	bsr.w	EniDecJmp
	lea	(RAM_Start).l,a1;(Metablock_Table).l,a1
	move.l	#$40000003,d0
	moveq	#$27,d1
	moveq	#$1B,d2
	bsr.w	lc_9EB4;JmpTo_ShowVDPGraphics
	moveq	#0,d3
	bsr.w	loc_965A
	lea	($FFFF08C0).l,a1
;	lea	(MapEng_LevSelIcon).l,a0
;	move.w	#$90,d0
;	bsr.w	EniDecJmp
;	bsr.w	loc_9688
	clr.w	(Player_mode).w
	clr.w	(Results_Screen_2P).w
	clr.b	(Level_started_flag).w
	clr.w	($FFFFF7F0).w
	lea	(Menu_Animate).l,a2;(word_87C6).l,a2
	bsr.w	lc_9EBA;JmpTo2_Dynamic_Normal
	moveq	#$26,d0
	bsr.w	J_PalLoad1
	lea	(Normal_palette_line3).w,a1
	lea	(Second_palette_line3).w,a2
	moveq	#7,d1

loc_9366:
	move.l	(a1),(a2)+
	clr.l	(a1)+
	dbf	d1,loc_9366
	move.b	#-$6F,d0
	bsr.w	J_Play2_Music;JmpTo_PlayMusic
	move.w	#$707,(Demo_Time_left).w
	clr.w	(Two_player_mode).w
	clr.l	(Camera_X_pos).w
	clr.l	(Camera_Y_pos).w
	clr.w	(Correct_cheat_entries).w
	clr.w	(Correct_cheat_entries_2).w
	move.b	#$16,(Delay_Time).w
	bsr.w	J_DelayProgram
	move.w	($FFFFF60C).w,d0
	ori.b	#$40,d0
	move.w	d0,(VDP_control_port).l
	bsr.w	J_Pal_FadeTo

loc_93AC:
	move.b	#$16,(Delay_Time).w
	bsr.w	J_DelayProgram
	move	#$2700,sr
	moveq	#0,d3
	bsr.w	loc_95B8
	bsr.w	LevSelControls
	move.w	#$6000,d3
	bsr.w	loc_95B8
;	bsr.w	loc_9688
	move	#$2300,sr
	lea	(Menu_Animate).l,a2;(word_87C6).l,a2
	bsr.w	lc_9EBA;JmpTo2_Dynamic_Normal
	move.b	(Ctrl_1_Press).w,d0
	or.b	($FFFFF607).w,d0
	andi.b	#$80,d0
	bne.s	loc_93F0
	bra.w	loc_93AC
; ===========================================================================

loc_93F0:
	move.w	(Level_select_zone).w,d0
	add.w	d0,d0
	move.w	Misc_9454(pc,d0.w),d0
	bmi.w	loc_944C
	cmpi.w	#$4000,d0
	bne.s	loc_9480
	move.b	#$10,(Game_Mode).w ; => SpecialStage
	clr.w	(Current_ZoneAndAct).w
	move.b	#3,(Life_count).w
	move.b	#3,(Life_count_2P).w
	moveq	#0,d0
	move.w	d0,(Ring_count).w
	move.l	d0,(Timer).w
	move.l	d0,(Score).w
	move.w	d0,(Ring_count_2P).w
	move.l	d0,(Timer_2P).w
	move.l	d0,(Score_2P).w
	move.l	#5000,(Next_Extra_life_score).w
	move.l	#5000,(Next_Extra_life_score_2P).w
;	move.w	(Player_option).w,(Player_mode).w
	rts
; ===========================================================================

loc_944C:
	move.b	#0,(Game_Mode).w ; => SegaScreen
	rts
; ===========================================================================
; -----------------------------------------------------------------------------
; Level Select Level Order

; One entry per item in the level select menu. Just set the value for the item
; you want to link to the level/act number of the level you want to load when
; the player selects that item.
; -----------------------------------------------------------------------------
Misc_9454:
	dc.w	 0
	dc.w	 1	; 1
	dc.w  $D00	; 2
	dc.w  $D01	; 3
	dc.w  $F00	; 4
	dc.w  $F01	; 5
	dc.w  $C00	; 6
	dc.w  $C01	; 7
	dc.w  $700	; 8
	dc.w  $701	; 9
	dc.w  $B00	; 10
	dc.w  $B01	; 11
	dc.w  $A00	; 12
	dc.w  $A01	; 13
	dc.w  $400	; 14
	dc.w  $401	; 15
	dc.w  $500	; 16
	dc.w $1000	; 17
	dc.w  $600	; 18
	dc.w  $E00	; 19
	dc.w $4000	; 20
	dc.w $FFFF	; 21
; ===========================================================================

loc_9480:
	andi.w	#$3FFF,d0
	move.w	d0,(Current_ZoneAndAct).w
	move.b	#$C,(Game_Mode).w ; => Level (Zone play mode)
	move.b	#3,(Life_count).w
	move.b	#3,(Life_count_2P).w
	moveq	#0,d0
	move.w	d0,(Ring_count).w
	move.l	d0,(Timer).w
	move.l	d0,(Score).w
	move.w	d0,(Ring_count_2P).w
	move.l	d0,(Timer_2P).w
	move.l	d0,(Score_2P).w
	move.b	d0,(Continue_count).w
	move.l	#5000,(Next_Extra_life_score).w
	move.l	#5000,(Next_Extra_life_score_2P).w
	move.b	#-7,d0
	bsr.w	J_Play2_Sfx
	moveq	#0,d0
	move.w	d0,(Two_player_mode_copy).w
	move.w	d0,(Two_player_mode).w
	rts
; ---------------------------------------------------------------------------
; Change what you're selecting in the level select
; ---------------------------------------------------------------------------
; loc_94DC:
LevSelControls:
	move.b	(Ctrl_1_Press).w,d1
	andi.b	#3,d1
	bne.s	loc_94EC
	subq.w	#1,($FFFFFF80).w
	bpl.s	loc_9522

loc_94EC:
	move.w	#$B,($FFFFFF80).w
	move.b	(Ctrl_1_Held).w,d1
	andi.b	#3,d1
	beq.s	loc_9522
	move.w	(Level_select_zone).w,d0
	btst	#0,d1
	beq.s	loc_950C
	subq.w	#1,d0
	bcc.s	loc_950C
	moveq	#$15,d0

loc_950C:
	btst	#1,d1
	beq.s	loc_951C
	addq.w	#1,d0
	cmpi.w	#$16,d0
	bcs.s	loc_951C
	moveq	#0,d0

loc_951C:
	move.w	d0,(Level_select_zone).w
	rts
; ===========================================================================

loc_9522:
	cmpi.w	#$15,(Level_select_zone).w
	bne.s	loc_958A
	move.w	(Sound_test_sound).w,d0
	move.b	(Ctrl_1_Press).w,d1
	btst	#2,d1
	beq.s	loc_953E
	subq.b	#1,d0
	bcc.s	loc_953E
	moveq	#$7F,d0

loc_953E:
	btst	#3,d1
	beq.s	loc_954E
	addq.b	#1,d0
	cmpi.w	#$80,d0
	bcs.s	loc_954E
	moveq	#0,d0

loc_954E:
	btst	#6,d1
	beq.s	loc_955C
	addi.b	#$10,d0
	andi.b	#$7F,d0

loc_955C:
	move.w	d0,(Sound_test_sound).w
	andi.w	#$30,d1
	beq.s	return_9588
	move.w	(Sound_test_sound).w,d0
	addi.w	#$80,d0
	bsr.w	J_Play2_Music;JmpTo_PlayMusic
	lea	(debug_cheat).l,a0
	lea	(byte_97C5).l,a2
	lea	($FFFFFFD2).w,a1
	moveq	#1,d2
	bsr.w	loc_9746

return_9588:
	rts
; ===========================================================================

loc_958A:
	move.b	(Ctrl_1_Press).w,d1
	andi.b	#$C,d1
	beq.s	return_95A0
	move.w	(Level_select_zone).w,d0
	move.b	byte_95A2(pc,d0.w),d0
	move.w	d0,(Level_select_zone).w

return_95A0:
	rts
; ===========================================================================
byte_95A2:
	dc.b $E
	dc.b $F		; 1
	dc.b $11	; 2
	dc.b $11	; 3
	dc.b $12	; 4
	dc.b $12	; 5
	dc.b $13	; 6
	dc.b $13	; 7
	dc.b $14	; 8
	dc.b $14	; 9
	dc.b $15	; 10
	dc.b $15	; 11
	dc.b $C		; 12
	dc.b $D		; 13
	dc.b 0		; 14
	dc.b 1		; 15
	dc.b 1		; 16
	dc.b 2		; 17
	dc.b 4		; 18
	dc.b 6		; 19
	dc.b 8		; 20
	dc.b $A		; 21
loc_95B8:
	lea	(RAM_Start).l,a4;(Metablock_Table).l,a4
	lea	(byte_96EE).l,a5
	lea	(VDP_data_port).l,a6
	moveq	#0,d0
	move.w	(Level_select_zone).w,d0
	lsl.w	#2,d0
	lea	(a5,d0.w),a3
	moveq	#0,d0
	move.b	(a3),d0
	mulu.w	#$50,d0
	moveq	#0,d1
	move.b	1(a3),d1
	add.w	d1,d0
	lea	(a4,d0.w),a1
	moveq	#0,d1
	move.b	(a3),d1
	lsl.w	#7,d1
	add.b	1(a3),d1
	addi.w	#-$4000,d1
	lsl.l	#2,d1
	lsr.w	#2,d1
	ori.w	#$4000,d1
	swap	d1
	move.l	d1,4(a6)
	moveq	#$D,d2

loc_9608:
	move.w	(a1)+,d0
	add.w	d3,d0
	move.w	d0,(a6)
	dbf	d2,loc_9608
	addq.w	#2,a3
	moveq	#0,d0
	move.b	(a3),d0
	beq.s	loc_964C
	mulu.w	#$50,d0
	moveq	#0,d1
	move.b	1(a3),d1
	add.w	d1,d0
	lea	(a4,d0.w),a1
	moveq	#0,d1
	move.b	(a3),d1
	lsl.w	#7,d1
	add.b	1(a3),d1
	addi.w	#-$4000,d1
	lsl.l	#2,d1
	lsr.w	#2,d1
	ori.w	#$4000,d1
	swap	d1
	move.l	d1,4(a6)
	move.w	(a1)+,d0
	add.w	d3,d0
	move.w	d0,(a6)

loc_964C:
	cmpi.w	#$15,(Level_select_zone).w
	bne.s	return_9658
	bsr.w	loc_965A

return_9658:
	rts
; ===========================================================================

loc_965A:
	move.l	#$49440003,(VDP_control_port).l
	move.w	(Sound_test_sound).w,d0
	move.b	d0,d2
	lsr.b	#4,d0
	bsr.s	loc_9670
	move.b	d2,d0

loc_9670:
	andi.w	#$F,d0
	cmpi.b	#$A,d0
	bcs.s	loc_967E
	addi.b	#4,d0

loc_967E:
	addi.b	#$10,d0
	add.w	d3,d0
	move.w	d0,(a6)
	rts
byte_96EE:
	dc.b   3,  6,  3,$24,  3,  6,  4,$24,  6,  6,  6,$24,  6,  6,  7,$24
	dc.b   9,  6,  9,$24,  9,  6, $A,$24, $C,  6, $C,$24, $C,  6, $D,$24; 16
	dc.b  $F,  6, $F,$24, $F,  6,$10,$24,$12,  6,$12,$24,$12,  6,$13,$24; 32
	dc.b $15,  6,$15,$24,$15,  6,$16,$24,  3,$2C,  3,$48,  3,$2C,  4,$48; 48
	dc.b   3,$2C,  5,$48,  6,$2C,  0,  0,  9,$2C,  0,  0, $C,$2C,  0,  0; 64
	dc.b  $F,$2C,  0,  0,$12,$2C,$12,$48; 80
; ===========================================================================
J_Play2_Music:
	jmp	Play_Music
loc_9746:
;loc_965A:
;loc_95B8:
	rts
lc_9EB4:
		jmp	ShowVDPGraphics 
lc_9EBA:
		jmp	Dynamic_Normal 
J_DelayProgram:
	jmp	DelayProgram
J_PalLoad1:
	jmp	PalLoad1
J_Pal_FadeTo:
	jmp	Pal_FadeTo
J_Play2_Sfx:
	jmp	Play_Sfx
EniDecJmp:
	jmp	EnigmaDec
level_select_cheat:	dc.b $19, $65,   9, $17,   0
byte_97B7:	dc.b   1,   1,   2,   4,   0
debug_cheat:	dc.b   1,   9,   9,   2,   1,   1,   2,   4,   0
byte_97C5:	dc.b   4,   1,   2,   6,   0