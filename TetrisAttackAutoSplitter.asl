//Tetris Attack Autosplitter
//
//Created By: murderbeam
//Twitch: twitch.tv/murderbeam_tv
//
//The stage is stored in a variable that increments once
//the game fades out and in to the new stage.
//You still have to start the timer manually, and you
//still have to split at the end manually, but it's nice
//to have some automation during the rest of it.

//TODO
//state("higan"){}
//state("bsnes"){}
//state("snes9x"){}
//state("emuhawk"){}
//state("retroarch"){}

state("snes9x-x64", "1.60")
	{
		byte versusstage : 0x08D8BE8, 0x2c0;
	}

init
{
	vars.split = 0;
}

startup
{
	settings.Add("option1", true, "Info");
	settings.SetToolTip("option1", "This autosplitter splits on new stage load, which is after the fade to black.");
}

//TODO
//Find a way to determine when P2's cursor disappears for final split
//Possibly using update to check for generic changes, then use that
//in conjunction with checking versusstage to make sure you're on Piranha plant's stage.
//This could of course be extrapolated and modified to other difficulties.

split
{
	if (current.versusstage != old.versusstage)
	{
	vars.split += 1;
	return true;
	}
}

//TODO
//Find a way to tell when the game has been reset
//reset
//{
//
//}
