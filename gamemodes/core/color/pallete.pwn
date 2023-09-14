#define _HexToRGBA(%1,%2,%3,%4)        (((%4) & 0xFF) | (((%3) & 0xFF) << 8) | (((%2) & 0xFF) << 16) | ((%1) << 24))
#define _RGBAToHex(%0,%1,%2,%3,%4)    (((%1) = ((%0) >>> 24)),((%2) = (((%0) >>> 16) & 0xFF)),((%3) = (((%0) >>> 8) & 0xFF)),((%4) = ((%0) & 0xFF)))

stock GetMin(r, g)
{
    new highest;
    if(r > highest)
    {
        highest = g;
    }
    else highest = r;
    return highest;
}

stock AdjustDarkness(color, Float:adjust)
{
    new rgb_r, rgb_g, rgb_b, rgb_a;
    _RGBAToHex(color, rgb_r, rgb_g, rgb_b, rgb_a);
    rgb_r = GetMin(255, floatround(rgb_r / adjust));
    rgb_g = GetMin(255, floatround(rgb_g / adjust));
    rgb_b = GetMin(255, floatround(rgb_b / adjust));
    return _HexToRGBA(rgb_r, rgb_g, rgb_b, rgb_a);
}

stock hy_HexToRGBA(colour, &r, &g, &b, &a)
{
    r = (colour >> 24) & 0xFF;
    g = (colour >> 16) & 0xFF;
    b = (colour >> 8) & 0xFF;
    a = colour & 0xFF;
}

stock hy_RGBAToHex(r, g, b, a)
{
    return (r<<24 | g<<16 | b<<8 | a);
}

stock hy_RGBAToARGB(col)
{
    return ((((col) << 24) & 0xFF000000) | (((col) >>> 8) & 0xF7F7F7));
}

stock hy_ARGBToRGBA(col)
{
    return ((((col) << 8) & 0xF7F7F700) | (((col) >>> 24) & 0xFF));
}

stock Color_SetAlpha(color, alpha = 0xFF)
{
    return ((color & ~0xFF) | (clamp(alpha, 0x00, 0xFF)));
}

// Color pallete
#define COLOR_WHITE 0xF7F7F7FF
#define COL_WHITE "{F7F7F7}"

#define COLOR_RED 0xec4134FF
#define COL_RED "{ec4134}"

#define COLOR_ORANGE 0xe76f51FF
#define COL_ORANGE "{e76f51}"

#define COLOR_DARK_GREEN 0x2a9d8fFF
#define COL_DARK_GREEN "{2a9d8f}"

#define COLOR_GREEN 0x80E266FF
#define COL_GREEN "{80E266}"

#define COLOR_YELLOW 0xe9c46aFF
#define COL_YELLOW "{e9c46a}"

#define COLOR_LIGHT_ORANGE 0xf4a261FF
#define COL_LIGHT_ORANGE "{f4a261}"

#define COLOR_LIGHT_BLUE 0x3a86ffFF
#define COL_LIGHT_BLUE "{3a86ff}"

#define COLOR_ANTICHEAT 0xc14848FF
#define COL_ANTICHEAT "{c14848}"

#define COLOR_DARK_RED 0xb32424FF
#define COLOR_GREY 0x5c5c5cFF

#define COLOR_GREY_TWO 0xE3E3E3FF

#define COLOR_CYAN 0x1AC6DFFF

#define COLOR_FADE1 0xE6E6E6E6
#define COLOR_FADE2 0xE6E6E6E6
#define COLOR_FADE3 0xE6E6E6E6
#define COLOR_FADE4 0xE6E6E6E6
#define COLOR_FADE5 0xE6E6E6E6

#define PLAYER_COLOR 0xF7F7F700