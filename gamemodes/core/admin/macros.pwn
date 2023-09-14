#define HidePlayerDialog(%1)       ShowPlayerDialog(%1, COLOR_WHITE, 0, " ", " ", " ", " ")
#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

#define PRESSING(%0,%1) \
	(%0 & (%1))

#define HOLDING(%0) \
	((newkeys & (%0)) == (%0))

stock GetXYInFrontOfPlayer(playerid, &Float:x2, &Float:y2, Float:distance) // ******
{
    new Float:a;

    GetPlayerPos(playerid, x2, y2, a);
    GetPlayerFacingAngle(playerid, a);

    if(GetPlayerVehicleID(playerid))
    {
        GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
    }

    x2 += (distance * floatsin(-a, degrees));
    y2 += (distance * floatcos(-a, degrees));
}

new INTRO_MUSIC[][] =
{
	"http://tmp6.hyaxe.com:20100/intro0.mp3",
	"http://tmp6.hyaxe.com:20100/intro3.mp3",
	"http://tmp6.hyaxe.com:20100/intro1.mp3",
	"http://tmp6.hyaxe.com:20100/intro2.mp3"
};