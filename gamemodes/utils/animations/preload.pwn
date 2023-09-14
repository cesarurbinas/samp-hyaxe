PreloadAnimLibs(playerid)
{
  	for(new i = 0; i < sizeof(AnimLibs); i++)
  	{
    	ApplyAnimation(playerid, AnimLibs[i], "null", 4.0, 0, 0, 0, 0, 0, 1);
  	}
  	return 1;
}
