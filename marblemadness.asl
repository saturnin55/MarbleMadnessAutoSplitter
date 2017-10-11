state("fceux")
{
	byte status: 0x003B1388, 0x5F;
	byte level: 0x003B1388, 0x34;
	byte end_of_level: 0x003B1388, 0x8b;
	byte timer: 0x003B1388, 0x44;
	//byte controltype: 0x003B1388, 0x41;
	//byte cant_move: 0x003B1388, 0x7B;
}

split
{
	return(current.end_of_level != old.end_of_level && current.end_of_level == 0);
}

start
{ 
	return(current.level == 0 && old.status == 0 && current.status == 255);
}

reset
{
    return(current.timer == 0 && current.timer != old.timer && current.level == 0);	
}

init
{
}

startup
{
	settings.Add("dummy1", false, "ONLY FCEUX SUPPORTED ATM");
	settings.Add("dummy2", false, "Set 'Start Timer at' to '-6.65' in 'Edit Splits...'");
	settings.Add("dummy3", false, "https://github.com/saturnin55/MarbleMadnessAutoSplitter");
}
