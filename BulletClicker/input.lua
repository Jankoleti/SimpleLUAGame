InputData =
{
mouseX = 5,
mouseY = 5,
input = "default",
GetInput = function(x)
if InputData.input == x then
InputData.input = "default"
	return true
else
	return false
end
end
}

function ResetInputEvent()
InputData.input = "default"
end



return
{
InputData = InputData,
ResetInputEvent = ResetInputEvent
}
