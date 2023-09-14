/* 
>> FakeOnline plugin v2.2 by urShadow
*/
 
#if defined _fakeonline_included
  #endinput
#endif
#define _fakeonline_included

enum 
{
	FO_ABSOLUTE, // online = value
	FO_RELATIVE, // online = real + value
	FO_DISABLE // online = real (disable fake online)
}

native FO_SetValue(value);
native FO_SetMode(mode);

/* Example
#include <FakeOnline>

forward UpdateFakeOnline();
public UpdateFakeOnline()
{
	FO_SetValue(996 + random(5));
}

public OnGameModeInit()
{
	FO_SetMode(FO_ABSOLUTE);
	SetTimer("UpdateFakeOnline", 1000, true);
	// ...
}
*/
