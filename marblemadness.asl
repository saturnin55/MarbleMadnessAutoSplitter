state("fceux")
{
	byte status: 		0x003B1388, 0x5F;
	byte level: 		0x003B1388, 0x34;
	byte end_of_level: 	0x003B1388, 0x8b;
	byte timer: 		0x003B1388, 0x44;
}

state("nestopia")
{
    	// base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
	byte status: 		"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xc7; // 0x5F;
	byte level: 		"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x9c; // 0x34;
	byte end_of_level: 	"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xf3; // 0x8b;
	byte timer: 		"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xac; // 0x44;
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
	//	4) time up!
	else if(current.end_of_level == 0 && current.status == 255 && current.timer == 0)	
		return(true);
	else
		return(false);
}

startup
{
	refreshRate = 70;
	
	settings.Add("main", false, "Marble Madness AutoSplitter 0.14");
	settings.Add("main3", false, "--https://github.com/saturnin55/MarbleMadnessAutoSplitter", "main");
	settings.Add("main2", false, "--Don't forget to set 'Start Timer at' to '-6.606' in 'Edit Splits...'", "main");
	settings.Add("main1", false, "--Supports FCEUX and Nestopia emulators", "main");
	settings.Add("options", true, "Options");
	settings.Add("opt_split", true, "Split at level load (checked) or at goal line (unchecked)", "options");
}
