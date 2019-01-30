
_config:

;ultrasonic-intr.c,23 :: 		void config ()
;ultrasonic-intr.c,25 :: 		ADCON1=0b00001111;                //CONVERT ANALOG TO DIGITAL FOR LAST 4 PINS
	MOVLW       15
	MOVWF       ADCON1+0 
;ultrasonic-intr.c,27 :: 		TRISC.F3=0;                       //TRIGER AS OUTPUT
	BCF         TRISC+0, 3 
;ultrasonic-intr.c,28 :: 		TRISB.F5=0;                       //ECHO AS INPUT
	BCF         TRISB+0, 5 
;ultrasonic-intr.c,29 :: 		TRISD.F0=0;                       //LED1 AS OUTPUT
	BCF         TRISD+0, 0 
;ultrasonic-intr.c,30 :: 		TRISD.F1=0;                       //LED2 AS OUTPUT
	BCF         TRISD+0, 1 
;ultrasonic-intr.c,31 :: 		TRISE.F3=1;                       //LCMR (RESET PIC) AS INPUT
	BSF         TRISE+0, 3 
;ultrasonic-intr.c,33 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;ultrasonic-intr.c,34 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ultrasonic-intr.c,35 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ultrasonic-intr.c,36 :: 		Lcd_Out(1,1,"welcome");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ultrasonic_45intr+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ultrasonic_45intr+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic-intr.c,37 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_config0:
	DECFSZ      R13, 1, 1
	BRA         L_config0
	DECFSZ      R12, 1, 1
	BRA         L_config0
	DECFSZ      R11, 1, 1
	BRA         L_config0
	NOP
	NOP
;ultrasonic-intr.c,38 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ultrasonic-intr.c,39 :: 		Lcd_Out(1,1,"ultrasonic");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_ultrasonic_45intr+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_ultrasonic_45intr+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic-intr.c,40 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_config1:
	DECFSZ      R13, 1, 1
	BRA         L_config1
	DECFSZ      R12, 1, 1
	BRA         L_config1
	DECFSZ      R11, 1, 1
	BRA         L_config1
	NOP
	NOP
;ultrasonic-intr.c,41 :: 		PORTD.F0=1;
	BSF         PORTD+0, 0 
;ultrasonic-intr.c,42 :: 		PORTD.F1=1;
	BSF         PORTD+0, 1 
;ultrasonic-intr.c,43 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_config2:
	DECFSZ      R13, 1, 1
	BRA         L_config2
	DECFSZ      R12, 1, 1
	BRA         L_config2
	DECFSZ      R11, 1, 1
	BRA         L_config2
	NOP
	NOP
;ultrasonic-intr.c,44 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;ultrasonic-intr.c,45 :: 		PORTD.F1=0;
	BCF         PORTD+0, 1 
;ultrasonic-intr.c,46 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_config3:
	DECFSZ      R13, 1, 1
	BRA         L_config3
	DECFSZ      R12, 1, 1
	BRA         L_config3
	DECFSZ      R11, 1, 1
	BRA         L_config3
	NOP
	NOP
;ultrasonic-intr.c,47 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_config4:
	DECFSZ      R13, 1, 1
	BRA         L_config4
	DECFSZ      R12, 1, 1
	BRA         L_config4
	NOP
	NOP
;ultrasonic-intr.c,49 :: 		T1CON=0b00000000;                         //RESET TIMER1
	CLRF        T1CON+0 
;ultrasonic-intr.c,50 :: 		RBIF_bit =1;
	BSF         RBIF_bit+0, 0 
;ultrasonic-intr.c,51 :: 		RBIE_bit =1;
	BSF         RBIE_bit+0, 3 
;ultrasonic-intr.c,52 :: 		PEIE_bit =1;
	BSF         PEIE_bit+0, 6 
;ultrasonic-intr.c,53 :: 		GIE_bit  =1;
	BSF         GIE_bit+0, 7 
;ultrasonic-intr.c,54 :: 		}
L_end_config:
	RETURN      0
; end of _config

_get_distsnce:

;ultrasonic-intr.c,56 :: 		void get_distsnce()
;ultrasonic-intr.c,58 :: 		TMR1H=0;            //RESET TIMER1 4BYTES FOR HGH EDGE
	CLRF        TMR1H+0 
;ultrasonic-intr.c,59 :: 		TMR1L=0;            //RESET TIMER1 4BYTES FOR LOW
	CLRF        TMR1L+0 
;ultrasonic-intr.c,60 :: 		PORTC.F3=1;         //trigger pulse
	BSF         PORTC+0, 3 
;ultrasonic-intr.c,61 :: 		delay_us(10);
	MOVLW       6
	MOVWF       R13, 0
L_get_distsnce5:
	DECFSZ      R13, 1, 1
	BRA         L_get_distsnce5
	NOP
;ultrasonic-intr.c,62 :: 		PORTC.F3=0;
	BCF         PORTC+0, 3 
;ultrasonic-intr.c,64 :: 		if(flag == 1 && _distance != distance)
	BTFSS       _flag+0, BitPos(_flag+0) 
	GOTO        L_get_distsnce8
	MOVF        __distance+1, 0 
	XORWF       _distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_distsnce26
	MOVF        _distance+0, 0 
	XORWF       __distance+0, 0 
L__get_distsnce26:
	BTFSC       STATUS+0, 2 
	GOTO        L_get_distsnce8
L__get_distsnce23:
;ultrasonic-intr.c,66 :: 		_distance=distance;
	MOVF        _distance+0, 0 
	MOVWF       __distance+0 
	MOVF        _distance+1, 0 
	MOVWF       __distance+1 
;ultrasonic-intr.c,68 :: 		wordtostr(time,time_txt);
	MOVF        _time+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        _time+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _time_txt+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_time_txt+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;ultrasonic-intr.c,69 :: 		wordtostr(distance,distance_txt);
	MOVF        _distance+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        _distance+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _distance_txt+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_distance_txt+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;ultrasonic-intr.c,71 :: 		Ltrim(time_txt);
	MOVLW       _time_txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_time_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;ultrasonic-intr.c,72 :: 		Ltrim(distance_txt);
	MOVLW       _distance_txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_distance_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;ultrasonic-intr.c,74 :: 		if(distance>=10 && distance<=400)
	MOVLW       0
	SUBWF       _distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_distsnce27
	MOVLW       10
	SUBWF       _distance+0, 0 
L__get_distsnce27:
	BTFSS       STATUS+0, 0 
	GOTO        L_get_distsnce11
	MOVF        _distance+1, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__get_distsnce28
	MOVF        _distance+0, 0 
	SUBLW       144
L__get_distsnce28:
	BTFSS       STATUS+0, 0 
	GOTO        L_get_distsnce11
L__get_distsnce22:
;ultrasonic-intr.c,76 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ultrasonic-intr.c,77 :: 		Lcd_Out(2,1,"time=");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_ultrasonic_45intr+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_ultrasonic_45intr+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic-intr.c,78 :: 		Lcd_Out(2,1,"distance=");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_ultrasonic_45intr+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_ultrasonic_45intr+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic-intr.c,79 :: 		Lcd_Out(2,6,time_txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _time_txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_time_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic-intr.c,80 :: 		Lcd_Out(2,11,distance_txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _distance_txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_distance_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic-intr.c,81 :: 		}
	GOTO        L_get_distsnce12
L_get_distsnce11:
;ultrasonic-intr.c,84 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ultrasonic-intr.c,86 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;ultrasonic-intr.c,87 :: 		while(1)
L_get_distsnce13:
;ultrasonic-intr.c,89 :: 		Lcd_Out(3,3,"OUT OF RANGE!!!");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_ultrasonic_45intr+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_ultrasonic_45intr+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic-intr.c,90 :: 		PORTD.F1=1;
	BSF         PORTD+0, 1 
;ultrasonic-intr.c,91 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_get_distsnce15:
	DECFSZ      R13, 1, 1
	BRA         L_get_distsnce15
	DECFSZ      R12, 1, 1
	BRA         L_get_distsnce15
	DECFSZ      R11, 1, 1
	BRA         L_get_distsnce15
	NOP
;ultrasonic-intr.c,92 :: 		Lcd_Out(3,3,"               ");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_ultrasonic_45intr+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_ultrasonic_45intr+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ultrasonic-intr.c,93 :: 		PORTD.F1=0;
	BCF         PORTD+0, 1 
;ultrasonic-intr.c,94 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_get_distsnce16:
	DECFSZ      R13, 1, 1
	BRA         L_get_distsnce16
	DECFSZ      R12, 1, 1
	BRA         L_get_distsnce16
	DECFSZ      R11, 1, 1
	BRA         L_get_distsnce16
	NOP
;ultrasonic-intr.c,95 :: 		}
	GOTO        L_get_distsnce13
;ultrasonic-intr.c,96 :: 		}
L_get_distsnce12:
;ultrasonic-intr.c,97 :: 		flag=0;
	BCF         _flag+0, BitPos(_flag+0) 
;ultrasonic-intr.c,98 :: 		}
L_get_distsnce8:
;ultrasonic-intr.c,100 :: 		}
L_end_get_distsnce:
	RETURN      0
; end of _get_distsnce

_main:

;ultrasonic-intr.c,102 :: 		void main() {
;ultrasonic-intr.c,103 :: 		config();
	CALL        _config+0, 0
;ultrasonic-intr.c,104 :: 		while (1)
L_main17:
;ultrasonic-intr.c,106 :: 		get_distsnce();
	CALL        _get_distsnce+0, 0
;ultrasonic-intr.c,107 :: 		}
	GOTO        L_main17
;ultrasonic-intr.c,108 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;ultrasonic-intr.c,110 :: 		void interrupt(){
;ultrasonic-intr.c,127 :: 		}
L_interrupt19:
;ultrasonic-intr.c,128 :: 		}
L_end_interrupt:
L__interrupt31:
	RETFIE      1
; end of _interrupt
