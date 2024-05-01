sub_B262:
	lea	off_B2CA(pc),a1
	move.w	($FFFFFF4C).w,d0
	lsl.w	#2,d0
	move.l	(a1,d0.w),d0
	movea.l	d0,a1

loc_B272:
	move	#$2700,sr
	lea	(VDP_data_port).l,a6

loc_B27C:
	move.l	(a1)+,d0
	bmi.s	loc_B298
	movea.l	d0,a2
	move.w	(a1)+,d0
	bsr.s	sub_B29E
	move.l	d0,4(a6)
	move.b	(a2)+,d0
	lsl.w	#8,d0

loc_B28E:
	move.b	(a2)+,d0
	bmi.s	BranchTo_loc_B27C
	move.w	d0,(a6)
	bra.s	loc_B28E
; ===========================================================================

BranchTo_loc_B27C 
	bra.s	loc_B27C
; ===========================================================================

loc_B298:
	move	#$2300,sr
	rts
; End of function sub_B262


; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||


sub_B29E:
	andi.l	#$FFFF,d0
	lsl.l	#2,d0
	lsr.w	#2,d0
	ori.w	#$4000,d0
	swap	d0
	rts
; End of function sub_B29E
; macro for declaring pointer/position structures for intro/credit text
off_B2B0:	dc.l byte_BD1A		; DATA XREF: ROM:00003A2Eo
		dc.w $C49E
		dc.l byte_BCEE
		dc.w $C622
		dc.l byte_BCF6
		dc.w $C786
		dc.l byte_BCE9
		dc.w $C924
		dc.w $FFFF
off_B2CA:	dc.l off_B322		; 0 ; DATA XREF: sub_9EF4+120o
					; sub_B262t
		dc.l off_B336		; 1
		dc.l off_B34A		; 2
		dc.l off_B358		; 3
		dc.l off_B366		; 4
		dc.l off_B374		; 5
		dc.l off_B388		; 6
		dc.l off_B3A8		; 7
		dc.l off_B3C2		; 8
		dc.l off_B3DC		; 9
		dc.l off_B3F0		; 10
		dc.l off_B41C		; 11
		dc.l off_B436		; 12
		dc.l off_B450		; 13
		dc.l off_B45E		; 14
		dc.l off_B490		; 15
		dc.l off_B4B0		; 16
		dc.l off_B4C4		; 17
		dc.l off_B4F0		; 18
		dc.l off_B51C		; 19
		dc.l off_B548		; 20
		dc.l $FFFFFFFF		; 21
off_B322:	dc.l byte_BC46		; DATA XREF: ROM:0000B2CAo
		dc.w $C59C
		dc.l byte_BC51
		dc.w $C5B0
		dc.l byte_BC55
		dc.w $C784
		dc.w $FFFF
off_B336:	dc.l byte_B55C		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C586
		dc.l byte_B56F
		dc.w $C5AC
		dc.l byte_B581
		dc.w $C78C
		dc.w $FFFF
off_B34A:	dc.l byte_B56F		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C598
		dc.l byte_B59F
		dc.w $C78E
		dc.w $FFFF
off_B358:	dc.l byte_B5BC		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C598
		dc.l byte_B5CD
		dc.w $C78C
		dc.w $FFFF
off_B366:	dc.l byte_B5EB		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C58A
		dc.l byte_B60C
		dc.w $C78E
		dc.w $FFFF
off_B374:	dc.l byte_B628		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C510
		dc.l byte_B642
		dc.w $C708
		dc.l byte_B665
		dc.w $C814
		dc.w $FFFF
off_B388:	dc.l byte_B67B		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C408
		dc.l byte_B69C
		dc.w $C522
		dc.l byte_B6A4
		dc.w $C612
		dc.l byte_B6BC
		dc.w $C808
		dc.l byte_B6DE
		dc.w $C910
		dc.w $FFFF
off_B3A8:	dc.l byte_B6F8		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C496
		dc.l byte_B70B
		dc.w $C592
		dc.l byte_B723
		dc.w $C794
		dc.l byte_B738
		dc.w $C886
		dc.w $FFFF
off_B3C2:	dc.l byte_B75C		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C488
		dc.l byte_B642
		dc.w $C688
		dc.l byte_B77E
		dc.w $C78E
		dc.l byte_B799
		dc.w $C88E
		dc.w $FFFF
off_B3DC:	dc.l byte_B7B5		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C510
		dc.l byte_B75C
		dc.w $C608
		dc.l byte_B799
		dc.w $C80E
		dc.w $FFFF
off_B3F0:	dc.l byte_B7F2		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C312
		dc.l byte_B6BC
		dc.w $C508
		dc.l byte_B80B
		dc.w $C614
		dc.l byte_B821
		dc.w $C712
		dc.l byte_B839
		dc.w $C80E
		dc.l byte_B855
		dc.w $C916
		dc.l byte_B869
		dc.w $CA16
		dc.w $FFFF
off_B41C:	dc.l byte_B7B5		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C492
		dc.l byte_B87D
		dc.w $C594
		dc.l byte_B893
		dc.w $C796
		dc.l byte_B8A8
		dc.w $C88E
		dc.w $FFFF
off_B436:	dc.l byte_B8C5		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C48C
		dc.l byte_B8E2
		dc.w $C68A
		dc.l byte_B902
		dc.w $C786
		dc.l byte_B90F
		dc.w $C888
		dc.w $FFFF
off_B450:	dc.l byte_B932		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C588
		dc.l byte_B954
		dc.w $C78A
		dc.w $FFFF
off_B45E:	dc.l byte_B974		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C288
		dc.l byte_B995
		dc.w $C49E
		dc.l byte_B9A1
		dc.w $C59E
		dc.l byte_B9AD
		dc.w $C69E
		dc.l byte_B9B8
		dc.w $C7A0
		dc.l byte_B9C1
		dc.w $C8A2
		dc.l byte_B9C8
		dc.w $C9A2
		dc.l byte_B9D0
		dc.w $CA9E
		dc.w $FFFF
off_B490:	dc.l byte_B9DB		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C406
		dc.l byte_BA00
		dc.w $C610
		dc.l byte_BA1B
		dc.w $C70C
		dc.l byte_BA3A
		dc.w $C812
		dc.l byte_BA52
		dc.w $C914
		dc.w $FFFF
off_B4B0:	dc.l byte_BA69		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C512
		dc.l byte_BA81
		dc.w $C70A
		dc.l byte_B7CE
		dc.w $C806
		dc.w $FFFF
off_B4C4:	dc.l byte_B55C		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C316
		dc.l byte_BAA2
		dc.w $C414
		dc.l byte_BAB8
		dc.w $C606
		dc.l byte_BADC
		dc.w $C70E
		dc.l byte_BAF7
		dc.w $C80A
		dc.l byte_BB16
		dc.w $C90E
		dc.l byte_BB32
		dc.w $CA04
		dc.w $FFFF
off_B4F0:	dc.l byte_BB58		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C30C
		dc.l byte_BB75
		dc.w $C424
		dc.l byte_BB7B
		dc.w $C60C
		dc.l byte_BC9F
		dc.w $C70A
		dc.l byte_BBD8
		dc.w $C810
		dc.l byte_BBF2
		dc.w $C910
		dc.l byte_BC0C
		dc.w $CA12
		dc.w $FFFF
off_B51C:	dc.l byte_BB58		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C30C
		dc.l byte_BB75
		dc.w $C424
		dc.l byte_BB98
		dc.w $C606
		dc.l byte_BBBC
		dc.w $C70E
		dc.l byte_BCBE
		dc.w $C80E
		dc.l byte_BCD9
		dc.w $C91A
		dc.l byte_BC25
		dc.w $CA08
		dc.w $FFFF
off_B548:	dc.l byte_BC7B		; 0 ; DATA XREF: ROM:0000B2CAo
		dc.w $C496
		dc.l byte_BC8F
		dc.w $C6A4
		dc.l byte_BC95
		dc.w $C8A0
		dc.w $FFFF
byte_B55C:	dc.b $20, $A, $B,$2F,$30, $A, $B,  6,  7,$29,$2A,$27,$28,$12,$2B,$2C; 0
					; DATA XREF: ROM:0000B336o
					; ROM:0000B4C4o
		dc.b  $A, $B,$FF	; 16
byte_B56F:	dc.b $20,$1F,$20,$23,$24,$1D,$1E,  8,  9,$29,$2A,  6,  7, $A, $B,$23; 0
					; DATA XREF: ROM:0000B33Co
					; ROM:0000B34Ao
		dc.b $24,$FF		; 16
byte_B581:	dc.b   0,$10,$11,  2,  3,$31,$32,  2,  3,$1D,$1E,  0,  0,$1B,$1C,  2; 0
					; DATA XREF: ROM:0000B342o
		dc.b   3,$15,$16,  2,  3,$31,$32,  2,  3,$19,$1A,  2,  3,$FF; 16
byte_B59F:	dc.b   0,$25,$26,$10,$11,$12,$1B,$1C,$1D,$1E,  4,  5,$29,$2A,  0,  0; 0
					; DATA XREF: ROM:0000B350o
		dc.b $27,$28,$1D,$1E,$31,$32,$1D,$1E,  8,  9,  2,  3,$FF; 16
byte_B5BC:	dc.b $20,  8,  9,$12,$23,$24, $A, $B,  6,  7,$27,$28,$1D,$1E,$23,$24; 0
					; DATA XREF: ROM:0000B358o
		dc.b $FF		; 16
byte_B5CD:	dc.b   0,$19,$1A,  2,  3,$25,$26,  2,  3,$10,$11,  2,  3,$23,$24,$29; 0
					; DATA XREF: ROM:0000B35Eo
		dc.b $2A,  0,  0,$31,$32,$1D,$1E,$25,$26,$10,$11,$12,$12,$FF; 16
byte_B5EB:	dc.b $20,  6,  7,$10,$11,$12, $A, $B, $C, $D,  0,  0,$1F,$20,$23,$24; 0
					; DATA XREF: ROM:0000B366o
		dc.b $1D,$1E, $E, $F,$23,$24,  2,  3,$19,$1A,$19,$1A, $A, $B,$23,$24; 16
		dc.b $FF		; 32
byte_B60C:	dc.b   0,$31,$32,$29,$2A,$13,$14,$12,  0,  0,$1B,$1C,  2,  3,$15,$16; 0
					; DATA XREF: ROM:0000B36Co
		dc.b   2,  3,  0,$37,$31,$32,$29,$2A,$35,$36,$38,$FF; 16
byte_B628:	dc.b $20, $E, $F,  2,  3,$19,$1A, $A, $B,  0,  0,$1F,$20,$17,$18,  2; 0
					; DATA XREF: ROM:0000B374o
		dc.b   3,$1B,$1C,$1B,$1C, $A, $B,$23,$24,$FF; 16
byte_B642:	dc.b   0,$10,$11,$12,$23,$24,$1D,$1E,$15,$16,  2,  3,$33,$34,$29,$2A; 0
					; DATA XREF: ROM:0000B37Ao
					; ROM:0000B3C8o
		dc.b   0,  0,$31,$32,  2,  3,$25,$26,$29,$2A,$10,$11,  2,  3,$23,$24; 16
		dc.b   2,  3,$FF	; 32
byte_B665:	dc.b   0,$37,  6,  7,  2,  3,$23,$24,$1D,$1E,$17,$18,  0,  0,$31,$32; 0
					; DATA XREF: ROM:0000B380o
		dc.b   2,  3,$25,$26,$38,$FF; 16
byte_B67B:	dc.b $20,  6,  7,$10,$11,  2,  3,$23,$24,  2,  3,  6,  7,$27,$28, $A; 0
					; DATA XREF: ROM:0000B388o
		dc.b  $B,$23,$24,  0,  0,  8,  9, $A, $B,$25,$26,$12, $E, $F,$1B,$1C; 16
		dc.b $FF		; 32
byte_B69C:	dc.b $20,  2,  3,$1B,$1C,  8,  9,$FF; 0	; DATA XREF: ROM:0000B38Eo
byte_B6A4:	dc.b $20,  6,  7,$10,$11,$12, $A, $B, $C, $D,  0,  0,  2,  3,$23,$24; 0
					; DATA XREF: ROM:0000B394o
		dc.b $27,$28,$12,$25,$26,$27,$28,$FF; 16
byte_B6BC:	dc.b   0,$31,$32,  2,  3,$25,$26,$29,$2A,$25,$26,$10,$11,$12,  0,  0; 0
					; DATA XREF: ROM:0000B39Ao
					; ROM:0000B3F6o
		dc.b $31,$32,  2,  3,$19,$1A,  2,  3, $E, $F,$29,$2A,  6,  7,$10,$11; 16
		dc.b $12,$FF		; 32
byte_B6DE:	dc.b   0,$37,$13,$14,$29,$2A,  8,  9,$31,$32,  0,  0,$27,$28,$1D,$1E; 0
					; DATA XREF: ROM:0000B3A0o
		dc.b $27,$28,$1D,$1E,$31,$32,  2,  3,$38,$FF; 16
byte_B6F8:	dc.b $20,  2,  3,$25,$26,$25,$26,$12,$25,$26,$27,$28,  2,  3,$1B,$1C; 0
					; DATA XREF: ROM:0000B3A8o
		dc.b $27,$28,$FF	; 16
byte_B70B:	dc.b $20,$1F,$20,$23,$24,$1D,$1E, $E, $F,$23,$24,  2,  3,$19,$1A,$19; 0
					; DATA XREF: ROM:0000B3AEo
		dc.b $1A, $A, $B,$23,$24,$25,$26,$FF; 16
byte_B723:	dc.b   0,  4,  5,$12,$17,$18,$17,$18,  0,  0,$2D,$2E,$12,$17,$18,$17; 0
					; DATA XREF: ROM:0000B3B4o
		dc.b $18,$12,$25,$26,$FF; 16
byte_B738:	dc.b   0,$19,$1A,  2,  3,$25,$26,  2,  3,$1B,$1C,$1D,$1E,  4,  5,$29; 0
					; DATA XREF: ROM:0000B3BAo
		dc.b $2A,  0,  0,$31,$32,  2,  3,$19,$1A,  2,  3,$19,$1A,$1D,$1E,$27; 16
		dc.b $28,$1D,$1E,$FF	; 32
byte_B75C:	dc.b $20,$1D,$1E,  4,  5,$13,$14, $A, $B,  6,  7,$27,$28,  0,  0,$1F; 0
					; DATA XREF: ROM:0000B3C2o
					; ROM:0000B3E2o
		dc.b $20,$17,$18,  2,  3,  6,  7, $A, $B,$19,$1A, $A, $B,$1B,$1C,$27; 16
		dc.b $28,$FF		; 32
byte_B77E:	dc.b   0,$27,$28,  2,  3,$15,$16,  2,  3,$10,$11,$12,$23,$24,$1D,$1E; 0
					; DATA XREF: ROM:0000B3CEo
		dc.b   0,  0,  2,  3,$1B,$1C,$27,$28,$1D,$1E,$FF; 16
byte_B799:	dc.b   0,$31,$32,$29,$2A,$27,$28,  2,  3,$15,$16,  2,  3,  0,  0,$25; 0
					; DATA XREF: ROM:0000B3D4o
					; ROM:0000B3E8o
		dc.b $26,$29,$2A, $E, $F,  2,  3,$1B,$1C,$1D,$1E,$FF; 16
byte_B7B5:	dc.b $20,$25,$26,$1F,$20, $A, $B,  6,  7,$12,  2,  3,$17,$18,$25,$26; 0
					; DATA XREF: ROM:0000B3DCo
					; ROM:0000B41Co
		dc.b $27,$28,  2,  3, $E, $F, $A, $B,$FF; 16
byte_B7CE:	dc.b   0,  6,  7,  2,  3,$23,$24,$1D,$1E,$17,$18,  0,  0,  2,  3,$1B; 0
					; DATA XREF: ROM:0000B4BCo
		dc.b $1C,$1B,$1C,  0,  0,$10,$11,  2,  3,$1B,$1C,$25,$26,$10,$11,  2; 16
		dc.b   3,$2D,$2E,$FF	; 32
byte_B7F2:	dc.b $20,$33,$34,$1D,$1E,$1B,$1C, $A, $B,  0,  0,  2,  3,$23,$24,$27; 0
					; DATA XREF: ROM:0000B3F0o
		dc.b $28,$12,$25,$26,$27,$28,$25,$26,$FF; 16
byte_B80B:	dc.b   0,  6,  7,$23,$24,  2,  3,$12, $E, $F,  0,  0,$25,$26,$27,$28; 0
					; DATA XREF: ROM:0000B3FCo
		dc.b $12,$27,$28,$27,$28,$FF; 16
byte_B821:	dc.b   0,  4,  5,$23,$24, $A, $B,$1B,$1C,  8,  9,  2,  3,  0,  0,$23; 0
					; DATA XREF: ROM:0000B402o
		dc.b $24,$1D,$1E,$25,$26,$25,$26,$FF; 16
byte_B839:	dc.b   0,$13,$14,$12,$1B,$1C,  2,  3,  0,  0,$12,$25,$26,$10,$11,$12; 0
					; DATA XREF: ROM:0000B408o
		dc.b $2D,$2E,  2,  3,$27,$28,  2,  3,$23,$24,$12,$FF; 16
byte_B855:	dc.b   0,$27,$28,$1D,$1E,$19,$1A,  0,  0,$1F,$20,  2,  3,$31,$32,$1B; 0
					; DATA XREF: ROM:0000B40Eo
		dc.b $1C, $A, $B,$FF	; 16
byte_B869:	dc.b   0,$1F,$20,$10,$11, $A, $B,$1B,$1C,$12,$2F,$30,  0,  0,$23,$24; 0
					; DATA XREF: ROM:0000B414o
		dc.b $12, $A, $B,$FF	; 16
byte_B87D:	dc.b $20,  2,  3,$23,$24,$27,$28,  0,  0,  2,  3,$1B,$1C,  8,  9,  0; 0
					; DATA XREF: ROM:0000B422o
		dc.b   0,  6,  7, $E, $F,$FF; 16
byte_B893:	dc.b   0,$27,$28,$12,$19,$1A,  0,  0,$25,$26,$15,$16, $A, $B,$17,$18; 0
					; DATA XREF: ROM:0000B428o
		dc.b $17,$18,$31,$32,$FF; 16
byte_B8A8:	dc.b   0,$1F,$20, $A, $B,$27,$28, $A, $B,$23,$24,  0,  0,$19,$1A,$1D; 0
					; DATA XREF: ROM:0000B42Eo
		dc.b $1E,$23,$24,  2,  3,$2D,$2E,$12, $A, $B,  6,  7,$FF; 16
byte_B8C5:	dc.b $20,$19,$1A,$29,$2A,$25,$26,$12,  6,  7,  0,  0,  6,  7,$1D,$1E; 0
					; DATA XREF: ROM:0000B436o
		dc.b $19,$1A,$1F,$20,$1D,$1E,$25,$26, $A, $B,$23,$24,$FF; 16
byte_B8E2:	dc.b   0,$19,$1A,  2,  3,$25,$26,  2,  3,$27,$28,$1D,$1E,  0,  0,$1B; 0
					; DATA XREF: ROM:0000B43Co
		dc.b $1C,  2,  3,$15,$16,  2,  3,$19,$1A,$29,$2A,$23,$24,  2,  3,$FF; 16
byte_B902:	dc.b   0,$37,  0,$3B,$3C,$3D,$3E,$3F,$3E,$3F,$35,$36,$FF; 0
					; DATA XREF: ROM:0000B442o
byte_B90F:	dc.b   0,  8,  9,$23,$24, $A, $B,  2,  3,$19,$1A,$25,$26,  0,  0,  6; 0
					; DATA XREF: ROM:0000B448o
		dc.b   7,$1D,$1E,$19,$1A, $A, $B,  0,  0,$27,$28,$23,$24,$29,$2A, $A; 16
		dc.b  $B,$38,$FF	; 32
byte_B932:	dc.b $20,$25,$26,$1D,$1E,$29,$2A,$1B,$1C,  8,  9,  0,  0,$1F,$20,$23; 0
					; DATA XREF: ROM:0000B450o
		dc.b $24,$1D,$1E, $E, $F,$23,$24,  2,  3,$19,$1A,$19,$1A, $A, $B,$23; 16
		dc.b $24,$FF		; 32
byte_B954:	dc.b   0,$27,$28,$1D,$1E,$19,$1A,$1D,$1E,$31,$32,$29,$2A,$15,$16,$12; 0
					; DATA XREF: ROM:0000B456o
		dc.b   0,  0,$25,$26,$10,$11,$12,$19,$1A,  2,  3,  8,  9,  2,  3,$FF; 16
byte_B974:	dc.b $20,$25,$26,$1D,$1E,$29,$2A,$1B,$1C,  8,  9,  0,  0,  2,  3,$25; 0
					; DATA XREF: ROM:0000B45Eo
		dc.b $26,$25,$26,$12,$25,$26,$27,$28,  2,  3,$1B,$1C,$27,$28,$25,$26; 16
		dc.b $FF		; 32
byte_B995:	dc.b   0,$19,$1A,  2,  3,  6,  7,$15,$16,$31,$32,$FF; 0
					; DATA XREF: ROM:0000B464o
byte_B9A1:	dc.b   0,$13,$14,$12,$19,$1A,$12,$27,$28,  2,  3,$FF; 0
					; DATA XREF: ROM:0000B46Ao
byte_B9AD:	dc.b   0,$19,$1A,$12,$17,$18,$1F,$20,$1D,$1E,$FF; 0
					; DATA XREF: ROM:0000B470o
byte_B9B8:	dc.b   0,$12,$1F,$20,$1F,$20,$1D,$1E,$FF; 0 ; DATA XREF: ROM:0000B476o
byte_B9C1:	dc.b   0,$25,$26,$3A,$1D,$1E,$FF; 0 ; DATA XREF: ROM:0000B47Co
byte_B9C8:	dc.b   0,$1D,$1E,$31,$32,$33,$34,$FF; 0	; DATA XREF: ROM:0000B482o
byte_B9D0:	dc.b   0,$1B,$1C,$3A, $E, $F, $A, $B, $A, $B,$FF; 0
					; DATA XREF: ROM:0000B488o
byte_B9DB:	dc.b $20,$1F,$20,$23,$24,$1D,$1E,$13,$14, $A, $B,  6,  7,$27,$28,  0; 0
					; DATA XREF: ROM:0000B490o
		dc.b   0,  2,  3,$25,$26,$25,$26,$12,$25,$26,$27,$28,  2,  3,$1B,$1C; 16
		dc.b $27,$28,$25,$26,$FF; 32
byte_BA00:	dc.b   0,$25,$26,$31,$32,$29,$2A,$12,  6,  7,$10,$11,$12,  0,  0,$15; 0
					; DATA XREF: ROM:0000B496o
		dc.b $16,  2,  3,$27,$28,  2,  3, $E, $F,$12,$FF; 16
byte_BA1B:	dc.b   0,$27,$28,  2,  3,$15,$16,  2,  3,$10,$11,$12,$23,$24,$1D,$1E; 0
					; DATA XREF: ROM:0000B49Co
		dc.b   0,  0,$10,$11,  2,  3,$19,$1A,  2,  3,$1B,$1C,$1D,$1E,$FF; 16
byte_BA3A:	dc.b   0,$31,$32,$1D,$1E,$25,$26,$10,$11,$12,$15,$16,$12,  0,  0,$1D; 0
					; DATA XREF: ROM:0000B4A2o
		dc.b $1E,$1D,$1E,$15,$16,  2,  3,$FF; 16
byte_BA52:	dc.b   0,$25,$26,$27,$28, $A, $B,$2B,$2C, $A, $B,  0,  0,$2D,$2E,$1D; 0
					; DATA XREF: ROM:0000B4A8o
		dc.b $1E,$12,$27,$28,  2,  3,$FF; 16
byte_BA69:	dc.b $20, $E, $F,  2,  3,$19,$1A, $A, $B,  0,  0,$19,$1A,  2,  3,$1B; 0
					; DATA XREF: ROM:0000B4B0o
		dc.b $1C,$29,$2A,  2,  3,$17,$18,$FF; 16
byte_BA81:	dc.b   0,$31,$32,$1D,$1E,$29,$2A,$12,  6,  7,$10,$11,$12,  0,  0,$27; 0
					; DATA XREF: ROM:0000B4B6o
		dc.b $28,  2,  3,$15,$16,  2,  3,$10,$11,  2,  3,$25,$26,$10,$11,$12; 16
		dc.b $FF		; 32
byte_BAA2:	dc.b $20,$25,$26,$29,$2A,$1F,$20,$1F,$20,$1D,$1E,$23,$24,$27,$28, $A; 0
					; DATA XREF: ROM:0000B4CAo
		dc.b  $B,$23,$24,$25,$26,$FF; 16
byte_BAB8:	dc.b   0,  8,  9,  2,  3,$12,$33,$34,  2,  3,  4,  5,$29,$2A,$23,$24; 0
					; DATA XREF: ROM:0000B4D0o
		dc.b $1D,$1E,$29,$2A,  0,  0,$25,$26,  2,  3,$15,$16,$29,$2A,$23,$24; 16
		dc.b   2,  3,$12,$FF	; 32
byte_BADC:	dc.b   0,$10,$11,$12,$25,$26,  2,  3,$25,$26,$10,$11,$12,  0,  0,$25; 0
					; DATA XREF: ROM:0000B4D6o
		dc.b $26,$29,$2A,$33,$34,$29,$2A,$15,$16,$12,$FF; 16
byte_BAF7:	dc.b   0,$27,$28,$10,$11,$1D,$1E,$19,$1A,  2,  3,$25,$26,  0,  0,$15; 0
					; DATA XREF: ROM:0000B4DCo
		dc.b $16,  2,  3,$17,$18,$12,$1B,$1C,$25,$26,$15,$16, $A, $B,$FF; 16
byte_BB16:	dc.b   0, $C, $D,$29,$2A,$13,$14,$12,$1D,$1E,  0,  0,$19,$1A,$12,$1B; 0
					; DATA XREF: ROM:0000B4E2o
		dc.b $1C, $A, $B, $E, $F,$12,$25,$26,$10,$11,$12,$FF; 16
byte_BB32:	dc.b   0,$27,$28,  2,  3,$15,$16,  2,  3,$10,$11,  2,  3,$23,$24,$29; 0
					; DATA XREF: ROM:0000B4E8o
		dc.b $2A,  0,$29,$2A,$27,$28,$25,$26,$29,$2A,$1B,$1C,$1D,$1E,$19,$1A; 16
		dc.b $12,$31,$32,  2,  3,$FF; 32
byte_BB58:	dc.b $20,$25,$26,$1F,$20, $A, $B,  6,  7,$12,  2,  3,$17,$18,  0,  0; 0
					; DATA XREF: ROM:0000B4F0o
					; ROM:0000B51Co
		dc.b $27,$28,$10,$11,  2,  3,$1B,$1C,$15,$16,$25,$26,$FF; 16
byte_BB75:	dc.b $20,$27,$28,$1D,$1E,$FF; 0	; DATA XREF: ROM:0000B4F6o
					; ROM:0000B522o
byte_BB7B:	dc.b   0,  6,  7,$12,$1B,$1C,  8,  9,$31,$32,  0,  0,  6,  7,$17,$18; 0
					; DATA XREF: ROM:0000B4FCo
		dc.b   2,  3,$2B,$2C, $A, $B,$23,$24,  2,  3,$1B,$1C,$FF; 16
byte_BB98:	dc.b   0,  8,  9, $A, $B,  4,  5,$1D,$1E,$23,$24,  2,  3,$10,$11,  0; 0
					; DATA XREF: ROM:0000B528o
		dc.b   0,$19,$1A,  6,  7,  6,  7,$23,$24,  2,  3,  6,  7,$15,$16, $A; 16
		dc.b  $B,$1B,$1C,$FF	; 32
byte_BBBC:	dc.b   0,$27,$28,  2,  3,$27,$28,$25,$26,$29,$2A,$1D,$1E,  0,  0,$31; 0
					; DATA XREF: ROM:0000B52Eo
		dc.b $32,  2,  3,$19,$1A,  2,  3,  8,  9,  2,  3,$FF; 16
byte_BBD8:	dc.b   0,  8,  9,  2,  3,$12,$25,$26,$29,$2A,$15,$16, $A, $B,  0,  0; 0
					; DATA XREF: ROM:0000B508o
		dc.b $25,$26,  2,  3,$12,$27,$28,$1D,$1E,$FF; 16
byte_BBF2:	dc.b   0,$15,$16,$29,$2A,$1B,$1C,$12,$27,$28,  2,  3,$15,$16, $A, $B; 0
					; DATA XREF: ROM:0000B50Eo
		dc.b   0,  0,  2,  3,$1D,$1E,$15,$16,$12,$FF; 16
byte_BC0C:	dc.b   0,$27,$28,$25,$26,$29,$2A,$1B,$1C, $A, $B,$15,$16,$1D,$1E,  0; 0
					; DATA XREF: ROM:0000B514o
		dc.b   0,  2,  3,$1D,$1E,$15,$16,$12,$FF; 16
byte_BC25:	dc.b   0,$19,$1A,  2,  3,$25,$26,  2,  3,  2,  3,$15,$16,$12,  0,  0; 0
					; DATA XREF: ROM:0000B540o
		dc.b $15,$16,  2,  3,$2D,$2E,  2,  3,$19,$1A,$29,$2A,$23,$24,  2,  3; 16
		dc.b $FF		; 32
byte_BC46:	dc.b   0,$25,$26,$1D,$1E,$1B,$1C,$12,  6,  7,$FF; 0
					; DATA XREF: ROM:0000B322o
byte_BC51:	dc.b $20,$35,$36,$FF	; 0 ; DATA XREF: ROM:0000B328o
byte_BC55:	dc.b   0,  6,  7,  2,  3,$25,$26,$27,$28,  0,  0,$1D,$1E, $C, $D,  0; 0
					; DATA XREF: ROM:0000B32Eo
		dc.b   0,  6,  7,$10,$11,  2,  3,$23,$24,  2,  3,  6,  7,$27,$28, $A; 16
		dc.b  $B,$23,$24,$25,$26,$FF; 32
byte_BC7B:	dc.b   0,$1F,$20,$23,$24, $A, $B,$25,$26, $A, $B,$1B,$1C,$27,$28, $A; 0
					; DATA XREF: ROM:0000B548o
		dc.b  $B,  8,  9,$FF	; 16
byte_BC8F:	dc.b   0,  4,  5,$31,$32,$FF; 0	; DATA XREF: ROM:0000B54Eo
byte_BC95:	dc.b   0,$25,$26, $A, $B, $E, $F,  2,  3,$FF; 0	; DATA XREF: ROM:0000B554o
byte_BC9F:	dc.b   0, $C, $D,$23,$24,  2,  3,$1B,$1C,  6,  7, $A, $B,  0,  0,$27; 0
					; DATA XREF: ROM:0000B502o
		dc.b $28,  2,  3,$1B,$1C,$27,$28,$12,  2,  3,  8,  9,$1D,$1E,$FF; 16
byte_BCBE:	dc.b   0,$23,$24,$12,  6,  7,$15,$16,  0,  0,$19,$1A,  2,  3,  6,  7; 0
					; DATA XREF: ROM:0000B534o
		dc.b   2,  3,$23,$24,  2,  3, $A, $B, $E, $F,$FF; 16
byte_BCD9:	dc.b   0,$17,$18,$1D,$1E,  6,  7,$15,$16,$31,$32,  0,  0,$1F,$20,$FF; 0
					; DATA XREF: ROM:0000B53Ao
byte_BCE9:	dc.b   5,$11,$1A,$1B,$FF; 0 ; DATA XREF: ROM:0000B2C2o
byte_BCEE:	dc.b   5,  1,  2,$1A,$1B,  7,  8,$FF; 0	; DATA XREF: ROM:0000B2B6o
byte_BCF6:	dc.b   5,$18,$19,$11,$16,$17,  9, $A,$24,$25,  0,$38,$26,$27,  1,  2; 0
					; DATA XREF: ROM:0000B2BCo
		dc.b $11,$16,$17,$24,$25,$38,  0,$1E,$1F,$22,$23,$1C,$1D,$2C,$2D,  9; 16
		dc.b  $A,$22,$23,$FF	; 32
byte_BD1A:	dc.b   5,$24,$25,$1C,$1D,$1A,$1B,$11,  5,  6,$FF,  0; 0
					; DATA XREF: ROM:0000B2B0o
	even