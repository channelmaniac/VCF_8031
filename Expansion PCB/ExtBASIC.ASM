;        .command -ai    ; output Intel hex format
; ===============================================
; Add command table entry to start CamelForth on 8031
; Show Computer for VCF Southwest
;
;
				.ORG	2002H
				.DB	5AH				;Tell BASIC expansion options available
;
				.ORG	2048H
				SETB	2DH				;Set bit 45 to enable expansion
				RET					;command lookups in BASIC
;
				.ORG	2070H
				MOV	DPTR, #VECTOR_TABLE		;LOCATION BASIC CALLS TO GET
				RET					;USER VECTOR_TABLE LOOKUP ADDRESS
;
				.ORG	2078H
				MOV	DPTR, #USER_TABLE		;LOCATION BASIC CALLS TO GET 
				RET					;COMMAND TOKEN LOOKUP TABLE
;
USER_TABLE:		.ORG	2200H
				.DB	10H				;FIRST TOKEN
				.DB	"CAMEL"				;CAMEL KEYWORD
				.DB	0FFH				;END OF USER TABLE
;
VECTOR_TABLE:	.ORG	2300H
				.DW	RUN_CAMEL
;
RUN_CAMEL:		.ORG 	2400H
				LJMP	H'A000
				RET
;
