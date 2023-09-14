#define CALLBACK:%0(%1) forward%0(%1);public%0(%1)
#define HidePlayerDialog(%1)       ShowPlayerDialog(%1, COLOR_WHITE, 0, " ", " ", " ", " ")
#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

#define PRESSING(%0,%1) \
	(%0 & (%1))

#define HOLDING(%0) \
	((newkeys & (%0)) == (%0))