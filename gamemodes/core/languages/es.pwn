// Server
#define SERVER_HOSTNAME "Hyaxe Role Play | Chat de voz"
#define SERVER_LANGUAGE "Espa�ol / Spanish"
#define SERVER_MODE "RP/RPG/Multigames"

// Special hostnames
#define HALLOWEEN_HOSTNAME "Hyaxe Role Play | Evento de Halloween"
#define CHRISTMAS_HOSTNAME "Hyaxe Role Play | Feliz Navidad"
#define EASTER_HOSTNAME "Hyaxe Role Play | Evento de Pascuas"

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
new const POLICE_RANKS[][] =
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
new const MAFIA_RANKS[][] =
{
	"Civil",
	"Nuevo Recluta",
	"Personal de Seguridad",
	"Sicario Experimentado",
	"Vendedor de armas",
	"Cosechador de Droga",
	"Vendedor de droga",
	"Jefe de seguridad",
	"Jefe de sicarios",
	"Jefe de armeros",
	"Jefe de Traficantes",
	"Jefe de negociantes",
	"Jefe de tropas",
	"Representante",
	"Segundo Jefe",
	"Jefe General"
};

// enemy mafia
new const ENEMY_MAFIA_RANKS[][] =
{
	"Civil",
	"Bartender",
	"Seguridad I",
	"Seguridad II",
	"Seguridad III",
	"Seguridad IIII",
	"Traficante I",
	"Traficante II",
	"Armero I",
	"Armero II",
	"Negociante I",
	"Negociante II",
	"Supervisor",
	"Jefe de bartender",
	"Jefe de seguridad",
	"Jefe de traficantes",
	"Jefe de armeros",
	"Jefe de negociantes",
	"Gerente",
	"Representante",
	"Lider"
};

new const OSBORN_RANKS[][] =
{
	"Civil",
	"ASOCCIATO",
	"FIDUCCIA",
	"SOLDATO 1",
	"SOLDATO 2", 
	"SOLDATO 3",
	"GRAN SOLDATO",
	"MASTER SOLDATO",
	"CAPODECIME 1",
	"CAPODECIME 2",
	"CAPODECIME 3",
	"CAPOREGIME 1",
	"CAPOREGIME 2",
	"CAPOREGIME 3",
	"AVVOCTO",
	"NUMERALE",
	"CASETTO",
	"SOTTOCAPO",
	"CONSIGLIERE",
	"DON / DONA",
	"THE VENDETTA",
	"CAPO DI TUTI CAPI"
};

new const CONNOR_RANKS[][] =
{
	"Civil",
	"Novice Connor",
	"Security Connor",
	"White Selling Connor",
	"Assasins Connor",
	"Black Security Connor",
	"Red Assasins Connor",
	"Red Selling connor",
	"Doctor Connor",
	"Spy Connor",
	"Negotiating Connor",
	"Leader Spy Connor",
	"Leader Security Connor",
	"Leader Assasin Connor",
	"The Black Connor",
	"The Real Connor"
};

new const DIVISO_RANKS[][] =
{
	"Civil",
	"Recluta", // $5.000
	"Vigilante l", // $10.000
	"Vigilante ll", // $15.000
	"Vigilante lll", // $20.000
	"Jefe de vigilantes", // $35.000
	"Traficantes l", // $40.000 
	"Traficantes ll", // $45.000
	"Jefe de traficantes", // $50.000
	"Sicario l", // $55.000
	"Sicario ll", // $60.000
	"Jefe de sicarios", // $65.000
	"Supervisor de jefes", // $70.000
	"Gerente",
	"Jefes Bajos", // $80.000
	"Jefes Altos" // $100.000
};

TextToSpanish(const base[])
{
	new result[1024];

	strcat(result, base);

	for (new i = (strlen(result) - 1); i != -1; --i)
	{
        switch (result[i])
        {
            case '�': result[i] = 151;
            case '�': result[i] = 152;
            case '�': result[i] = 153;
            case '�': result[i] = 154;
            case '�': result[i] = 128;
            case '�': result[i] = 129;
            case '�': result[i] = 130;
            case '�': result[i] = 131;
            case '�': result[i] = 157;
            case '�': result[i] = 158;
            case '�': result[i] = 159;
            case '�': result[i] = 160;
            case '�': result[i] = 134;
            case '�': result[i] = 135;
            case '�': result[i] = 136;
            case '�': result[i] = 137;
            case '�': result[i] = 161;
            case '�': result[i] = 162;
            case '�': result[i] = 163;
            case '�': result[i] = 164;
            case '�': result[i] = 138;
            case '�': result[i] = 139;
            case '�': result[i] = 140;
            case '�': result[i] = 141;
            case '�': result[i] = 165;
            case '�': result[i] = 166;
            case '�': result[i] = 167;
            case '�': result[i] = 168;
            case '�': result[i] = 142;
            case '�': result[i] = 143;
            case '�': result[i] = 144;
            case '�': result[i] = 145;
            case '�': result[i] = 169;
            case '�': result[i] = 170;
            case '�': result[i] = 171;
            case '�': result[i] = 172;
            case '�': result[i] = 146;
            case '�': result[i] = 147;
            case '�': result[i] = 148;
            case '�': result[i] = 149;
            case '�': result[i] = 174;
            case '�': result[i] = 173;
            case '�': result[i] = 64;
            case '�': result[i] = 175;
            case '`': result[i] = 177;
            case '#': result[i] = 35;
            case '&': result[i] = 38;
        }
    }
    return result;
}