// Server
#define SERVER_HOSTNAME "Hyaxe | Roleplay en español"
#define SERVER_LANGUAGE "Español - Spanish"
#define SERVER_MODE "[#1] Roleplay"

// Item names
#define NAME_MEDICINE "Medicamento"
#define NAME_CANNABIS "Marihuana"
#define NAME_CRAK "Crack"
#define NAME_PHONE "Teléfono"
#define NAME_PHONE_R "Guía telefónica"

// Truck recos
#define T_REC_0 "Partes de Vehículos"
#define T_REC_1 "Productos Agrícolas"
#define T_REC_2 "Bebidas"
#define T_REC_3 "Productos de Oficina"
#define T_REC_4 "Quesos Suaves"
#define T_REC_5 "Hardware"
#define T_REC_6 "Productos de Pesca"
#define T_REC_7 "Armas"

// Places names
#define P_BANK "Banco central"
#define P_TRUCKS "Camioneros"
#define P_SAPD "Departamento de Policía"
#define P_GARAGE "Garaje"
#define P_CHURCH "Iglesia"
#define P_D_BM "Mercado negro (Drogas)"
#define P_W_BM "Mercado negro (Armas)"

// Police Ranks
new POLICE_RANKS[][] =
{
	/* 0 */ "Civil",
	/* 1 */ "Cadete",
	/* 2 */ "Oficial I",
	/* 3 */ "Oficial II",
	/* 4 */ "Oficial III",
	/* 5 */ "Oficial III+",
	/* 6 */ "Detective I",
	/* 7 */ "Detective II",
	/* 8 */ "Detective III",
	/* 9 */ "Sargento I",
	/* 10 */ "Sargento II",
	/* 11 */ "Soldado",
	/* 12 */ "Cabo",
	/* 13 */ "Teniente",
	/* 14 */ "General",
	/* 15 */ "Jefe Policíal"
};

// Mafia Ranks
new MAFIA_RANKS[][] =
{
	"Civil",
	/* 0 */ "Associato",
	/* 1 */ "Soldato",
	/* 2 */ "Avvocato",
	/* 3 */ "Caporegime",
	/* 4 */ "Casetto",
	/* 5 */ "Numerale",
	/* 6 */ "Sottocapo",
	/* 7 */ "Consigliere",
	/* 8 */ "Don",
	/* 9 */ "Capo di tutti capo",
	/* 10 */ "Ricardo."
};

// enemy mafia
new ENEMY_MAFIA_RANKS[][] =
{
	"Civil",
	"Bartender",
	"Seguridad",
	"Traficante",
	"Armero",
	"Negociante",
	"Jefe de Seguridad",
	"Jefe de Traficantes",
	"Jefe de Armeros",
	"Jefe de Negociantes",
	"Representante",
	"Lider"
};

new OSBORN_RANKS[][] =
{
	"Civil",
	/* 0 */ "Associato",
	/* 1 */ "Soldato",
	/* 2 */ "Avvocato",
	/* 3 */ "Caporegime",
	/* 4 */ "Casetto",
	/* 5 */ "Numerale",
	/* 6 */ "Sottocapo",
	/* 7 */ "Consigliere",
	/* 8 */ "Don",
	/* 9 */ "Capo di tutti capo"
};

TextToSpanish(const string[])
{
    new result_text[1024],
        ASCII,
        Len;

    for (Len = strlen(string); ASCII < Len; ASCII ++)
    {
        switch (string[ASCII])
        {
            case 'à':   result_text[ASCII] = 151;
            case 'á':   result_text[ASCII] = 152;
            case 'â':   result_text[ASCII] = 153;
            case 'ä':   result_text[ASCII] = 154;
            case 'À':   result_text[ASCII] = 128;
            case 'Á':   result_text[ASCII] = 129;
            case 'Â':   result_text[ASCII] = 130;
            case 'Ä':   result_text[ASCII] = 131;
            case 'è':   result_text[ASCII] = 157;
            case 'é':   result_text[ASCII] = 158;
            case 'ê':   result_text[ASCII] = 159;
            case 'ë':   result_text[ASCII] = 160;
            case 'È':   result_text[ASCII] = 134;
            case 'É':   result_text[ASCII] = 135;
            case 'Ê':   result_text[ASCII] = 136;
            case 'Ë':   result_text[ASCII] = 137;
            case 'ì':   result_text[ASCII] = 161;
            case 'í':   result_text[ASCII] = 162;
            case 'î':   result_text[ASCII] = 163;
            case 'ï':   result_text[ASCII] = 164;
            case 'Ì':   result_text[ASCII] = 138;
            case 'Í':   result_text[ASCII] = 139;
            case 'Î':   result_text[ASCII] = 140;
            case 'Ï':   result_text[ASCII] = 141;
            case 'ò':   result_text[ASCII] = 165;
            case 'ó':   result_text[ASCII] = 166;
            case 'ô':   result_text[ASCII] = 167;
            case 'ö':   result_text[ASCII] = 168;
            case 'Ò':   result_text[ASCII] = 142;
            case 'Ó':   result_text[ASCII] = 143;
            case 'Ô':   result_text[ASCII] = 144;
            case 'Ö':   result_text[ASCII] = 145;
            case 'ù':   result_text[ASCII] = 169;
            case 'ú':   result_text[ASCII] = 170;
            case 'û':   result_text[ASCII] = 171;
            case 'ü':   result_text[ASCII] = 172;
            case 'Ù':   result_text[ASCII] = 146;
            case 'Ú':   result_text[ASCII] = 147;
            case 'Û':   result_text[ASCII] = 148;
            case 'Ü':   result_text[ASCII] = 149;
            case 'ñ':   result_text[ASCII] = 174;
            case 'Ñ':   result_text[ASCII] = 173;
            case '¡':   result_text[ASCII] = 64;
            case '¿':   result_text[ASCII] = 175;
            case '`':   result_text[ASCII] = 177;
            case '#':   result_text[ASCII] = 35;
            case '&':   result_text[ASCII] = 38;
            default:    result_text[ASCII] = string[ASCII];
        }
    }
    return result_text;
}