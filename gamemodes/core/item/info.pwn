GetItemObjectByType(type)
{
	new modelid;

	switch(type)
	{
		case 0: modelid = 11738;
		case 1: modelid = 11736;
		case 2: modelid = 11747;
		case 3: modelid = 1578;
		case 4: modelid = 1575;
		case 5: modelid = 1650;
		case 6: modelid = 11739;
		case 7: modelid = 11739;
		case 8: modelid = 11739;
		case 9: modelid = 19832;
		case 10: modelid = 19832;
		case 11: modelid = 19832;
		case 12: modelid = 336;//bat
		case 13: modelid = 334;//porra
		case 14: modelid = 335;//knife
		case 15: modelid = 337;//pala
		case 16: modelid = 338;//pool
		case 17: modelid = 343;
		case 18: modelid = 333;//golf
		case 19: modelid = 331;//punio
		case 22: modelid = 346;
		case 23: modelid = 347;
		case 24: modelid = 348;
		case 25: modelid = 349;
		case 26: modelid = 350;
		case 28: modelid = 352;
		case 29: modelid = 353;
		case 30: modelid = 355;
		case 31: modelid = 356;
		case 32: modelid = 372;
		case 33: modelid = 357;
		case 41: modelid = 365;
		case 43: modelid = 367;
		case 46: modelid = 371;
		case 50: modelid = 18866;
		case 51: modelid = 18632;
		case 52: modelid = 19631;
		case 53: modelid = 19921;
		case 54: modelid = 3027;
		case 55: modelid = 19832;
		case 56: modelid = 19942;
		case 57: modelid = 19320;
		case 58..60: modelid = 1636;
		case 61, 62, 63: modelid = 3013;
		case 64: modelid = 19057;
	}
	return modelid;
}