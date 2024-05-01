;===============================================================================
; Object 0x0F 1 Player 2 Vs In Title Screen
; [ Begin ]
;===============================================================================	
loc_10A5A:
		moveq	#0,d0
		move.b	$24(a0),d0
		move.w	loc_10A6C(pc,d0),d1
		jsr	loc_10A6C(pc,d1)
		bra	displaySprite	
loc_10A6C:
		dc.w	loc_10A70-loc_10A6C
		dc.w	loc_10A9E-loc_10A6C
loc_10A70:
		addq.b	#2,$24(a0)
		move.w	#$128,8(a0)
		move.w	#$14C,$A(a0)
		move.l	#_1Player2Vs_Mappings,4(a0) 
		move.w	#0,2(a0);$2F0,2(a0)
		bsr	ModifySpriteAttr_2P	
		andi.b	#1,(Title_screen_option).w
		move.b	(Title_screen_option).w,mapping_frame(a0)
;		move.b	($FFFFFF86).w,$1A(a0)
;		and.b	#1,$1A(a0)
loc_10A9E:
		moveq	#0,d2
	move.b	(Title_screen_option).w,d2
	move.b	(Ctrl_1_Press).w,d0
	or.b	(Ctrl_2_Press).w,d0
	btst	#0,d0
	beq.s	.Plus1;+
	subq.b	#1,d2
	bcc.s	.Plus1;+
	move.b	#2,d2
.Plus1:;+
	btst	#1,d0
	beq.s	.Plus2;+
	addq.b	#1,d2
	cmpi.b	#3,d2
	bcs.s	.PLus2;+
	moveq	#0,d2
.Plus2:;+
	move.b	d2,mapping_frame(a0)
	move.b	d2,(Title_screen_option).w
	andi.b	#3,d0
	beq.s	return_13684
	move.b	#$4D+$80,d0;moveq	#$4D+$80,d0 ; selection blip sound
	bsr.w	JmpTo42_PlaySound

return_13684:
	rts
;		move.b	($FFFFF605).w,d0
;		and.b	#3,d0
;		beq.s	loc_10AB4
;		bchg	#0,$1A(a0)
;		move.b	$1A(a0),($FFFFFF86).w
;loc_10AB4:
;		moveq	#0,d0
;		move.b	($FFFFFF86).w,d0
;		move.w	d0,($FFFFFF8A).w
;		rts	
JmpTo42_PlaySound:
	jmp	Play_Sfx
;===============================================================================
; Object 0x0F 1 Player 2 Vs In Title Screen
; [ End ]
;===============================================================================