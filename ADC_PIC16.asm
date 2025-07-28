
_Move_Delay:

;ADC_PIC16.c,19 :: 		void Move_Delay() {                  // Function used for text moving
;ADC_PIC16.c,20 :: 		Delay_ms(500);                     // You can change the moving speed here
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_Move_Delay0:
	DECFSZ     R13+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R12+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R11+0, 1
	GOTO       L_Move_Delay0
	NOP
	NOP
;ADC_PIC16.c,21 :: 		}
L_end_Move_Delay:
	RETURN
; end of _Move_Delay

_main:

;ADC_PIC16.c,25 :: 		void main() {
;ADC_PIC16.c,26 :: 		ADC_Init();
	CALL       _ADC_Init+0
;ADC_PIC16.c,27 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;ADC_PIC16.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADC_PIC16.c,30 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADC_PIC16.c,31 :: 		Lcd_Out(1,6,"SANKET");                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ADC_PIC16+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADC_PIC16.c,33 :: 		Lcd_Out(2,2,"ADC_Data1:");                 // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_ADC_PIC16+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADC_PIC16.c,36 :: 		TRISA  = 0xff;              // PORTA is input
	MOVLW      255
	MOVWF      TRISA+0
;ADC_PIC16.c,39 :: 		do {
L_main1:
;ADC_PIC16.c,40 :: 		temp_res = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;ADC_PIC16.c,41 :: 		Lcd_Cmd(0XCB);
	MOVLW      203
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADC_PIC16.c,42 :: 		Lcd_Chr_Cp(temp_res/1000+'0');
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _temp_res+0, 0
	MOVWF      R0+0
	MOVF       _temp_res+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;ADC_PIC16.c,43 :: 		Lcd_Chr_Cp(((temp_res/100)%10)+'0');
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _temp_res+0, 0
	MOVWF      R0+0
	MOVF       _temp_res+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;ADC_PIC16.c,44 :: 		Lcd_Chr_Cp(((temp_res/10)%10)+'0');
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _temp_res+0, 0
	MOVWF      R0+0
	MOVF       _temp_res+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;ADC_PIC16.c,45 :: 		Lcd_Chr_Cp((temp_res%10)+'0');
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _temp_res+0, 0
	MOVWF      R0+0
	MOVF       _temp_res+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;ADC_PIC16.c,48 :: 		} while(1);
	GOTO       L_main1
;ADC_PIC16.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
