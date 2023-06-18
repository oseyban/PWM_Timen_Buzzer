_main:
;Quiz1_Cevap2.c,8 :: 		void main() {
;Quiz1_Cevap2.c,10 :: 		period=PWM_TIM4_Init(10000);
MOVW	R0, #10000
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(_period+0)
MOVT	R1, #hi_addr(_period+0)
STRH	R0, [R1, #0]
;Quiz1_Cevap2.c,11 :: 		PWM_TIM4_Set_Duty((period/100)*0,_PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM4_Set_Duty+0
;Quiz1_Cevap2.c,12 :: 		PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVS	R0, #1
BL	_PWM_TIM4_Start+0
;Quiz1_Cevap2.c,14 :: 		GPIO_Digital_Input(&GPIOA_IDR, _GPIO_PINMASK_0 |  _GPIO_PINMASK_1 |  _GPIO_PINMASK_2);
MOVW	R1, #7
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;Quiz1_Cevap2.c,16 :: 		while(1) {
L_main0:
;Quiz1_Cevap2.c,17 :: 		if(butonArttir){
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main2
;Quiz1_Cevap2.c,18 :: 		i=i+10;
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, #10
SXTH	R0, R0
STRH	R0, [R1, #0]
;Quiz1_Cevap2.c,19 :: 		if(i>=100)  i=100;
CMP	R0, #100
IT	LT
BLT	L_main3
MOVS	R1, #100
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main3:
;Quiz1_Cevap2.c,20 :: 		}
L_main2:
;Quiz1_Cevap2.c,21 :: 		if(butonAzalt){
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main4
;Quiz1_Cevap2.c,22 :: 		i=i-20;
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
SUBS	R0, #20
SXTH	R0, R0
STRH	R0, [R1, #0]
;Quiz1_Cevap2.c,23 :: 		if(i<=0)  i=0;
CMP	R0, #0
IT	GT
BGT	L_main5
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main5:
;Quiz1_Cevap2.c,24 :: 		}
L_main4:
;Quiz1_Cevap2.c,25 :: 		if(butonSifirla){
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main6
;Quiz1_Cevap2.c,26 :: 		i=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;Quiz1_Cevap2.c,27 :: 		}
L_main6:
;Quiz1_Cevap2.c,29 :: 		PWM_TIM4_Set_Duty((period/100)*i,_PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
MULS	R0, R1, R0
MOVS	R2, #1
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;Quiz1_Cevap2.c,30 :: 		delay_ms(100);
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_main7:
SUBS	R7, R7, #1
BNE	L_main7
NOP
NOP
NOP
;Quiz1_Cevap2.c,31 :: 		}
IT	AL
BAL	L_main0
;Quiz1_Cevap2.c,32 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
