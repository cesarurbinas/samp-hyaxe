enum Account_Enum
{
	ac_ID,
	ac_IP[16],
	ac_NAME[24],
	ac_EMAIL[32],
	ac_PASS[64 + 1],
	ac_SERIAL[50],
	ac_SALT[16],
	ac_LAST_CONNECTION[24],
	ac_TIME_PLAYING,
	ac_LEVEL,
	ac_REP,
	ac_STATE,
	reg_DATE[24], //Fecha de registro de la tabla REGISTRO
	ac_DOUBT_CHANNEL,
	ac_TIME_FOR_REP, // En MS
	ac_ADMIN_LEVEL,
	ac_PAYDAY_REP,
	ac_SU,
	ac_SU_EXPIRE_DATE[24],
	ac_SD
};
new ACCOUNT_INFO[MAX_PLAYERS][Account_Enum]; // AI (AccountInfo)

enum Bank_Account_Enum
{
	bank_account_ID,
	bank_account_BALANCE
};
new BANK_ACCOUNT[MAX_PLAYERS][Bank_Account_Enum]; //BA (BankAccount)

#define MIN_PASS_LENGTH  6
#define MAX_PASS_LENGTH  18

new const SECURITY_QUESTIONS[][40] =
{
	"¿Cuál es tu apodo?",
	"¿Quién es tu mejor amigo?",
	"¿Cómo se llama tu mascota?",
	"¿Cuál fue tu primer celular?",
	"¿Cuál es el nombre de tu escuela?",
	"¿Cuál es tu película favorita?",
	"¿Cuál es tu programa favorito?"
};