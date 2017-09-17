button1.states.a =
	opacity: 0
	scale: 0.5
	y:button1.y + 20

button2.states.a =
	opacity: 0
	scale: 0.5
	y: button1.y + 20

button3.states.a =
	opacity: 0
	scale: 0.5
	y: button1.y + 20
	

addicon.states.a = 
	rotation: 0
	
	


button1.states.animationOptions =
	curve: Spring

button2.states.animationOptions =
	curve: Spring
	delay: 0.05

button3.states.animationOptions =
	curve: Spring
	delay: 0.1

fab.states.animationOptions = button1.states.animationOptions

addicon.states.animationOptions = button1.states.animationOptions

fab.states.a =
	backgroundColor: "rgba(238,68,68,0.8)"

button1.states.switchInstant "a"
button2.states.switchInstant "a"
button3.states.switchInstant "a"
fab.states.switchInstant "a"
addicon.states.switchInstant "a"

fab.onClick -> 
	button1.stateCycle()
	button2.stateCycle()
	button3.stateCycle()
	addicon.stateCycle()
	fab.stateCycle()