from psychopy import parallel
from psychopy import core

port=0xAFF8
#port=0xDFF8


parallel.setPortAddress(port)


num_of_triggers=range(0,10)

for idx,val in enumerate(num_of_triggers):
	parallel.setData(val)
	print idx, parallel.readPin(val) #this will print out each value and then tell you if the port is clear or not. 0 = clear, 1= not. 
	core.wait(1)
	parallel.setData(0)
	parallel.readPin(val)