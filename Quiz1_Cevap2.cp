#line 1 "C:/Users/USER/Desktop/QuizCevaplar/Quiz1_Cevap2/Quiz1_Cevap2.c"




unsigned int period;
int i=0;

void main() {

 period=PWM_TIM4_Init(10000);
 PWM_TIM4_Set_Duty((period/100)*0,_PWM_NON_INVERTED, _PWM_CHANNEL2);
 PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);

 GPIO_Digital_Input(&GPIOA_IDR, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2);

 while(1) {
 if( Button(&GPIOA_IDR, 0, 100, 1) ){
 i=i+10;
 if(i>=100) i=100;
 }
 if( Button(&GPIOA_IDR, 1, 100, 1) ){
 i=i-20;
 if(i<=0) i=0;
 }
 if( Button(&GPIOA_IDR, 2, 100, 1) ){
 i=0;
 }

 PWM_TIM4_Set_Duty((period/100)*i,_PWM_NON_INVERTED, _PWM_CHANNEL2);
 delay_ms(100);
 }
}
