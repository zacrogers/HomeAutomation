#include "main.h"

Servo servo;
bool is_locked = false;
uint8_t current_angle = MIN_ANGLE;

void setup() 
{
	servo.attach(SERVO_PIN);
}

void loop() 
{

}

void open_lock(void)
{
	if(is_locked)
	{
		for(current_angle = MIN_ANGLE; current_angle < MAX_ANGLE; current_angle++)
		{                          
			servo.write(current_angle);
			delay(SERVO_DELAY_TIME);                       
		} 	

		is_locked = false;
	}

}
void close_lock(void)
{
	if(!is_locked)
	{
		for(current_angle = MAX_ANGLE; current_angle >= MIN_ANGLE; current_angle--)
		{                          
			servo.write(current_angle);
			delay(SERVO_DELAY_TIME);                       
		} 		
		is_locked = true;
	}
}