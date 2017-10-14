state("fceux")
{
	byte status: 0x003B1388, 0x5F;
	byte level: 0x003B1388, 0x34;
	byte end_of_level: 0x003B1388, 0x8b;
	byte timer: 0x003B1388, 0x44;
}

split
{
	// split on goal line
	if(settings["opt_split"] && current.level < 5 && current.level != old.level)
	   return(true);
	else if(settings["opt_split"] && current.level == 5 && old.level == 4)
	   return(true);
	// on load level except for ultimate which is on goal line crossed
	else if(settings["opt_split"] && current.level == 5 && current.end_of_level == 0 && current.end_of_level != old.end_of_level)
		return(true);
	// if runner wants splits on goal line
	else if(!settings["opt_split"] && current.end_of_level == 0 && current.end_of_level != old.end_of_level) 
		return(true);
	else
	   return(false);
}

start
{ 
	return(current.level == 0 && old.end_of_level != current.end_of_level && current.end_of_level == 1);
}

reset
{
	//	1) reload nes or savestate to menu
	if(current.timer == 0 && current.level == 0 && current.end_of_level == 0 && current.status != 255)
		return(true);
	//	2) load a previous level
	else if(current.level < old.level)
		return(true);
	//	3) skip a level
	else if(current.level > (old.level + 1))
		return(true);
	else
		return(false);
}

startup
{
	settings.Add("main", false, "Marble Madness AutoSplitter 0.10");
	settings.Add("main3", false, "https://github.com/saturnin55/MarbleMadnessAutoSplitter", "main");
	settings.Add("main2", false, "Don't forget to set 'Start Timer at' to '-6.606' in 'Edit Splits...'", "main");
	settings.Add("main1", false, "Currently only support FCEUX emulator", "main");
	settings.Add("options", false, "Options");
	settings.Add("opt_split", false, "Split at level load (checked) or at goal line (unchecked)", "options");
}


