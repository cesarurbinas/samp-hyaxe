// Server
#define SERVER_HOSTNAME "Hyaxe | Roleplay en espa�ol"
#define SERVER_LANGUAGE "Espa�ol - Spanish"
#define SERVER_MODE "[#1] Roleplay"

// Item names
#define NAME_MEDICINE "Medicamento"
#define NAME_CANNABIS "Marihuana"
#define NAME_CRAK "Crack"
#define NAME_PHONE "Tel�fono"
#define NAME_PHONE_R "Gu�a telef�nica"

// Truck recos
#define T_REC_0 "Partes de Veh�culos"
#define T_REC_1 "Productos Agr�colas"
#define T_REC_2 "Bebidas"
#define T_REC_3 "Productos de Oficina"
#define T_REC_4 "Quesos Suaves"
#define T_REC_5 "Hardware"
#define T_REC_6 "Productos de Pesca"
#define T_REC_7 "Armas"

// Places names
#define P_BANK "Banco central"
#define P_TRUCKS "Camioneros"
#define P_SAPD "Departamento de Polic�a"
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
	/* 15 */ "Jefe Polic�al"
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
            case '�':   result_text[ASCII] = 151;
            case '�':   result_text[ASCII] = 152;
            case '�':   result_text[ASCII] = 153;
            case '�':   result_text[ASCII] = 154;
            case '�':   result_text[ASCII] = 128;
            case '�':   result_text[ASCII] = 129;
            case '�':   result_text[ASCII] = 130;
            case '�':   result_text[ASCII] = 131;
            case '�':   result_text[ASCII] = 157;
            case '�':   result_text[ASCII] = 158;
            case '�':   result_text[ASCII] = 159;
            case '�':   result_text[ASCII] = 160;
            case '�':   result_text[ASCII] = 134;
            case '�':   result_text[ASCII] = 135;
            case '�':   result_text[ASCII] = 136;
            case '�':   result_text[ASCII] = 137;
            case '�':   result_text[ASCII] = 161;
            case '�':   result_text[ASCII] = 162;
            case '�':   result_text[ASCII] = 163;
            case '�':   result_text[ASCII] = 164;
            case '�':   result_text[ASCII] = 138;
            case '�':   result_text[ASCII] = 139;
            case '�':   result_text[ASCII] = 140;
            case '�':   result_text[ASCII] = 141;
            case '�':   result_text[ASCII] = 165;
            case '�':   result_text[ASCII] = 166;
            case '�':   result_text[ASCII] = 167;
            case '�':   result_text[ASCII] = 168;
            case '�':   result_text[ASCII] = 142;
            case '�':   result_text[ASCII] = 143;
            case '�':   result_text[ASCII] = 144;
            case '�':   result_text[ASCII] = 145;
            case '�':   result_text[ASCII] = 169;
            case '�':   result_text[ASCII] = 170;
            case '�':   result_text[ASCII] = 171;
            case '�':   result_text[ASCII] = 172;
            case '�':   result_text[ASCII] = 146;
            case '�':   result_text[ASCII] = 147;
            case '�':   result_text[ASCII] = 148;
            case '�':   result_text[ASCII] = 149;
            case '�':   result_text[ASCII] = 174;
            case '�':   result_text[ASCII] = 173;
            case '�':   result_text[ASCII] = 64;
            case '�':   result_text[ASCII] = 175;
            case '`':   result_text[ASCII] = 177;
            case '#':   result_text[ASCII] = 35;
            case '&':   result_text[ASCII] = 38;
            default:    result_text[ASCII] = string[ASCII];
        }
    }
    return result_text;
}