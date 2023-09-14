BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "ACCOUNTS" (
	"ID"	INTEGER,
	"IP"	VARCHAR(16),
	"NAME"	VARCHAR(24),
	"GPCI" VARCHAR(50) NOT NULL DEFAULT "NULL",
	"EMAIL"	VARCHAR(32),
	"SALT"	VARCHAR(16),
	"PASS"	VARCHAR(65),
	"LAST_CONNECTION"	VARCHAR(24) DEFAULT CURRENT_TIMESTAMP,
	"TIME-PLAYING"	INTEGER DEFAULT '0',
	"LEVEL"	INTEGER DEFAULT '1',
	"REP"	INTEGER DEFAULT '1',
	"STATE"	INTEGER DEFAULT '0',
	"CONNECTED"	INTEGER NOT NULL,
	"PLAYERID"	INTEGER NOT NULL,
	"DOUBT_CHANNEL"	INTEGER DEFAULT '1',
	"TIME_FOR_REP"	INTEGER DEFAULT '0',
	"ADMIN_LEVEL"	INTEGER DEFAULT '0',
	"PAYDAY_REP"	INTEGER DEFAULT '0',
	"SU"	INTEGER DEFAULT '0',
	"SU_EXPIRE_DATE"	DATETIME DEFAULT '0',
	"SD"	INTEGER DEFAULT '0',
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "REGISTER_LOG" (
	"ID_USER"	INTEGER,
	"IP"	VARCHAR(16),
	"NAME"	VARCHAR(24),
	"EMAIL"	VARCHAR(32),
	"SALT"	VARCHAR(16),
	"PASS"	VARCHAR(65),
	"DATE"	VARCHAR(24) DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("ID_USER")
);
CREATE TABLE IF NOT EXISTS "PLAYER_TOYS" (
	"ID_USER"	INTEGER,
	"ID_TOY"	INTEGER,
	"NAME"	VARCHAR(24) NOT NULL,
	"ATTACHED"	INTEGER DEFAULT '0',
	"MODELID"	INTEGER NOT NULL,
	"BONE"	INTEGER DEFAULT '-1',
	"OFFSET_X"	FLOAT DEFAULT '0.0',
	"OFFSET_Y"	FLOAT DEFAULT '0.0',
	"OFFSET_Z"	FLOAT DEFAULT '0.0',
	"ROT_X"	FLOAT DEFAULT '0.0',
	"ROT_Y"	FLOAT DEFAULT '0.0',
	"ROT_Z"	FLOAT DEFAULT '0.0',
	"SCALE_X"	FLOAT DEFAULT '1.0',
	"SCALE_Y"	FLOAT DEFAULT '1.0',
	"SCALE_Z"	FLOAT DEFAULT '1.0',
	"COLOR_1"	INTEGER DEFAULT '0',
	"COLOR_2"	INTEGER DEFAULT '0',
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE,
	PRIMARY KEY("ID_TOY" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "BANK_ACCOUNTS" (
	"ID_ACCOUNT"	INTEGER,
	"ID_USER"	INTEGER,
	"BALANCE"	INTEGER DEFAULT '0',
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE,
	PRIMARY KEY("ID_ACCOUNT" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "BANK_TRANSACTIONS" (
	"ID_TRANSACTION"	INTEGER,
	"ID_ACCOUNT"	INTEGER NOT NULL,
	"TRANSACTION_TYPE"	INTEGER NOT NULL,
	"AMMOUNT"	INTEGER NOT NULL,
	"EXTRA"	INTEGER DEFAULT '-1',
	"DATE"	 DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY("ID_ACCOUNT") REFERENCES "BANK_ACCOUNTS"("ID_ACCOUNT") ON DELETE CASCADE,
	PRIMARY KEY("ID_TRANSACTION" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "PHONE" (
	"PHONE_NUMBER"	INTEGER,
	"ID_USER"	INTEGER,
	"PHONE_STATE"	INTEGER DEFAULT '0',
	"VISIBLE_NUMBER"	INTEGER DEFAULT '1',
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE,
	PRIMARY KEY("PHONE_NUMBER")
);
CREATE TABLE IF NOT EXISTS "PHONE_BOOK" (
	"CONTACT_ID"	INTEGER,
	"PHONE_ID"	INTEGER NOT NULL,
	"NAME"	VARCHAR(24),
	"PHONE_NUMBER"	INTEGER,
	FOREIGN KEY("PHONE_ID") REFERENCES "PHONE"("PHONE_NUMBER") ON DELETE CASCADE,
	PRIMARY KEY("CONTACT_ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PHONE_MESSAGES" (
	"ID_MESSAGE"	INTEGER,
	"FROM"	INTEGER NOT NULL,
	"TO"	INTEGER NOT NULL,
	"MESSAGE"	VARCHAR(64) NOT NULL,
	"DATE"	 DEFAULT CURRENT_TIMESTAMP,
	"OFFLINE"	 DEFAULT '0',
	PRIMARY KEY("ID_MESSAGE" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PROPERTY" (
	"ID"	INTEGER,
	"EXT_X"	FLOAT,
	"EXT_Y"	FLOAT,
	"EXT_Z"	FLOAT,
	"EXT_ANGLE"	FLOAT,
	"EXT_INTERIOR"	INTEGER DEFAULT '0',
	"EXT_FREEZE"	INTEGER DEFAULT '0',
	"ID_INTERIOR"	INTEGER NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PROPERTY_INFO" (
	"ID_PROPERTY"	INTEGER,
	"PRICE"	INTEGER,
	"LEVEL"	INTEGER DEFAULT '1',
	"EXTRA"	INTEGER DEFAULT '0',
	FOREIGN KEY("ID_PROPERTY") REFERENCES "PROPERTY"("ID") ON DELETE CASCADE,
	PRIMARY KEY("ID_PROPERTY")
);
CREATE TABLE IF NOT EXISTS "PROPERTY_OWNER" (
	"ID_PROPERTY"	INTEGER,
	"ID_USER"	INTEGER,
	"PROPERTY_NAME"	VARCHAR(24) DEFAULT 'PROPIEDAD',
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE,
	FOREIGN KEY("ID_PROPERTY") REFERENCES "PROPERTY"("ID") ON DELETE CASCADE,
	PRIMARY KEY("ID_PROPERTY","ID_USER")
);
CREATE TABLE IF NOT EXISTS "PLAYER_GPS" (
	"ID"	INTEGER,
	"ID_USER"	INTEGER,
	"NAME"	VARCHAR(24) NOT NULL,
	"X"	FLOAT DEFAULT '0.0',
	"Y"	FLOAT DEFAULT '0.0',
	"Z"	FLOAT DEFAULT '0.0',
	"WORLD"	INTEGER DEFAULT '0',
	"INTERIOR"	INTEGER DEFAULT '0',
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PLAYER_OBJECT" (
	"ID_USER"	INTEGER,
	"GPS"	INTEGER DEFAULT '0',
	"MP3"	INTEGER DEFAULT '0',
	"PHONE_RESOLVER"	INTEGER DEFAULT '0',
	"BOOMBOX" TINYINT DEFAULT '0',
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE,
	PRIMARY KEY("ID_USER")
);

CREATE TABLE IF NOT EXISTS "PLAYER_VEHICLES" (
	"ID"	INTEGER,
	"ID_USER"	INTEGER,
	"PLATE"	VARCHAR(32) DEFAULT 'ABC',
	"MODELID"	INTEGER NOT NULL,
	"SPAWN_X"	FLOAT NOT NULL,
	"SPAWN_Y"	FLOAT NOT NULL,
	"SPAWN_Z"	FLOAT NOT NULL,
	"SPAWN_ANGLE"	FLOAT NOT NULL,
	"HEALTH"	FLOAT DEFAULT '1000.0',
	"DAMAGE_PANELS"	INTEGER DEFAULT '0',
	"DAMAGE_DOORS"	INTEGER DEFAULT '0',
	"DAMAGE_LIGHTS"	INTEGER DEFAULT '0',
	"DAMAGE_TIRES"	INTEGER DEFAULT '0',
	"COLOR_1"	INTEGER DEFAULT '1',
	"COLOR_2"	INTEGER DEFAULT '1',
	"PAINTJOB"	INTEGER DEFAULT '3',
	"GAS"	FLOAT DEFAULT '100.0',
	"MAX_GAS"	FLOAT DEFAULT '100.0',
	"CLOSED"	INTEGER DEFAULT '0',
	"INTERIOR"	INTEGER DEFAULT '0',
	"WORLD"	INTEGER DEFAULT '0',
	"STATE"	INTEGER DEFAULT '0',
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PLAYER_VEHICLE_COMPONENTS" (
	"ID_VEHICLE"	INTEGER,
	"SLOT_0"	INTEGER DEFAULT '0',
	"SLOT_1"	INTEGER DEFAULT '0',
	"SLOT_2"	INTEGER DEFAULT '0',
	"SLOT_3"	INTEGER DEFAULT '0',
	"SLOT_4"	INTEGER DEFAULT '0',
	"SLOT_5"	INTEGER DEFAULT '0',
	"SLOT_6"	INTEGER DEFAULT '0',
	"SLOT_7"	INTEGER DEFAULT '0',
	"SLOT_8"	INTEGER DEFAULT '0',
	"SLOT_9"	INTEGER DEFAULT '0',
	"SLOT_10"	INTEGER DEFAULT '0',
	"SLOT_11"	INTEGER DEFAULT '0',
	"SLOT_12"	INTEGER DEFAULT '0',
	"SLOT_13"	INTEGER DEFAULT '0',
	FOREIGN KEY("ID_VEHICLE") REFERENCES "PLAYER_VEHICLES"("ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "VEHICLE_BOOT" (
	"ID_OBJECT"	INTEGER,
	"ID_VEHICLE"	INTEGER,
	"TYPE"	INTEGER DEFAULT '0',
	"INT"	INTEGER DEFAULT '0',
	"INT_EXTRA"	INTEGER DEFAULT '0',
	FOREIGN KEY("ID_VEHICLE") REFERENCES "PLAYER_VEHICLES"("ID") ON DELETE CASCADE,
	PRIMARY KEY("ID_OBJECT" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PLAYER_SKILLS" (
	"ID_USER"	INTEGER,
	"ID_WORK"	INTEGER,
	"TOTAL"	INTEGER DEFAULT '0',
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "PLAYER_MISC" (
	"ID_USER"	INTEGER,
	"ID"	INTEGER,
	"EXTRA"	INTEGER DEFAULT '0',
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "COMPONENTS_INFO" (
	"ID"	INTEGER,
	"PART"	VARCHAR(24),
	"NAME"	VARCHAR(24),
	"PIECES"	INTEGER DEFAULT '0',
	PRIMARY KEY("ID")
);
CREATE TABLE IF NOT EXISTS "VEHICLE_COMPONENTS" (
	"MODELID"	INTEGER,
	"COMPONENT_ID"	INTEGER,
	PRIMARY KEY("MODELID","COMPONENT_ID")
);

CREATE TABLE IF NOT EXISTS "BAD_HISTORY" (
	"ID"	INTEGER,
	"ID_USER"	INTEGER NOT NULL,
	"TYPE"	INTEGER NOT NULL,
	"BY"	INTEGER NOT NULL,
	"TEXT"	VARCHAR(128),
	"DATE"	 DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "BANS" (
	"NAME"	VARCHAR(24) NOT NULL UNIQUE,
	"IP"	VARCHAR(16) NOT NULL UNIQUE,
	"GPCI" VARCHAR(50) DEFAULT "NULL",
	"ID_HISTORY"	INTEGER NOT NULL,
	"EXPIRE_DATE"	DATETIME DEFAULT '0',
	FOREIGN KEY("ID_HISTORY") REFERENCES "BAD_HISTORY"("ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "SHOP" (
	"ID"	INTEGER,
	"ID_USER"	INTEGER NOT NULL,
	"TYPE"	INTEGER NOT NULL,
	"PRICE"	INTEGER NOT NULL,
	"TEXT"	VARCHAR(24),
	"MODELID"	INTEGER NOT NULL,
	"RX"	FLOAT NOT NULL,
	"RY"	FLOAT NOT NULL,
	"RZ"	FLOAT NOT NULL,
	"ZOOM"	FLOAT NOT NULL,
	"VCOL1"	INTEGER DEFAULT '0',
	"VCOL2"	INTEGER DEFAULT '0',
	"DATE"	 DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "PLAYER_WORKS" (
	"ID_USER"	INTEGER,
	"ID_WORK"	INTEGER,
	"SET"	INTEGER DEFAULT '0',
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "CREW_RANKS" (
	"ID"	INTEGER,
	"ID_CREW"	INTEGER,
	"RANK_POS"	INTEGER,
	"RANK_NAME"	VARCHAR(24),
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("ID_CREW") REFERENCES "CREW"("ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "RANK_PERMISSIONS" (
	"ID_RANK"	INTEGER,
	"PERMISSION"	INTEGER,
	"SET"	INTEGER,
	FOREIGN KEY("ID_RANK") REFERENCES "CREW_RANKS"("ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "PLAYER_CREW" (
	"ID_USER"	INTEGER,
	"ID_CREW"	INTEGER,
	"RANK"	INTEGER,
	FOREIGN KEY("ID_CREW") REFERENCES "CREW"("ID") ON DELETE CASCADE,
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "SA_ZONES" (
	"ID"	INTEGER,
	"ZONE"	VARCHAR(8),
	"PART"	VARCHAR(8),
	"NAME"	VARCHAR(32),
	"MIN_X"	FLOAT,
	"MIN_Y"	FLOAT,
	"MIN_Z"	FLOAT,
	"MAX_X"	FLOAT,
	"MAX_Y"	FLOAT,
	"MAX_Z"	FLOAT,
	"GANG_ZONE"	INTEGER DEFAULT '0',
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "CREW_TERRITORIES" (
	"ID_CREW"	INTEGER,
	"ID_TERRITORY"	INTEGER,
	FOREIGN KEY("ID_CREW") REFERENCES "CREW"("ID") ON DELETE CASCADE,
	FOREIGN KEY("ID_TERRITORY") REFERENCES "SA_ZONES"("ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "PROPERTY_TERRITORY" (
	"ID_PROPERTY"	INTEGER,
	"ID_TERRITORY"	INTEGER,
	FOREIGN KEY("ID_TERRITORY") REFERENCES "SA_ZONES"("ID") ON DELETE CASCADE,
	FOREIGN KEY("ID_PROPERTY") REFERENCES "PROPERTY"("ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "VEHICLE_OBJECTS" (
	"ID"	INTEGER,
	"ID_VEHICLE"	INTEGER,
	"TYPE"	INTEGER,
	"NAME"	VARCHAR(32),
	"MODELID"	INTEGER,
	"OFF_X"	FLOAT,
	"OFF_Y"	FLOAT,
	"OFF_Z"	FLOAT,
	"ROT_X"	FLOAT,
	"ROT_Y"	FLOAT,
	"ROT_Z"	FLOAT,
	"ATTACHED"	INTEGER,
	"COLOR_0"	INTEGER DEFAULT '0',
	"COLOR_1"	INTEGER DEFAULT '0',
	"COLOR_2"	INTEGER DEFAULT '0',
	"COLOR_3"	INTEGER DEFAULT '0',
	"COLOR_4"	INTEGER DEFAULT '0',
	"TEXT"	VARCHAR(32),
	"FONT"	VARCHAR(24),
	"FONT_SIZE"	INTEGER DEFAULT '0',
	"FONT_BOLD"	INTEGER DEFAULT '0',
	"FONT_COLOR"	INTEGER DEFAULT '0',
	FOREIGN KEY("ID_VEHICLE") REFERENCES "PLAYER_VEHICLES"("ID") ON DELETE CASCADE,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "POLICE_HISTORY" (
	"ID"	INTEGER,
	"ID_USER"	INTEGER,
	"BY"	VARCHAR(24) NOT NULL,
	"TEXT"	VARCHAR(128) NOT NULL,
	"DATE"	VARCHAR(24) DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PLAYER_NOTIFICATIONS" (
	"ID_USER"	INTEGER,
	"MESSAGE"	TEXT,
	"DATE"	INTEGER
);
CREATE TABLE IF NOT EXISTS "GRAFFITIS" (
	"GRAFF_ID"	INTEGER,
	"ID_CREW"	INTEGER
);
CREATE TABLE IF NOT EXISTS "GIFTS_CODES" (
	"CODE"	TEXT,
	"TYPE"	INTEGER,
	"EXTRA"	INTEGER,
	"USED"	INTEGER
);
CREATE TABLE IF NOT EXISTS "BLACK_MARKETS" (
	"MARKET_ID"	INTEGER,
	"ID_CREW"	INTEGER,
	"LAST_START"	INTEGER
);
CREATE TABLE IF NOT EXISTS "CREW" (
	"ID"	INTEGER,
	"NAME"	VARCHAR(32),
	"COLOR"	INTEGER,
	"GRAFFITIS_COUNT"	INTEGER,
	"MARKETS_COUNT"	INTEGER,
	"DESC"	TEXT,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PROPERTY_OBJECTS" (
	"ID" INTEGER PRIMARY KEY AUTOINCREMENT,
	"ID_PROPERTY"	INTEGER,
	"MODELID"	INTEGER,
	"X"	FLOAT,
	"Y"	FLOAT,
	"Z"	FLOAT,
	"RX"	FLOAT,
	"RY"	FLOAT,
	"RZ"	FLOAT
);
CREATE TABLE IF NOT EXISTS "ADDRESS_LOG" (
	"ID_USER" INTEGER, 
	"CONTENT" TEXT,
	"DATE" INTEGER
);
CREATE TABLE IF NOT EXISTS "PROXY_WHITELIST" (
	"ID" INTEGER PRIMARY KEY AUTOINCREMENT,
	"NAME" TEXT
);
CREATE TABLE IF NOT EXISTS "SECURITY_QUESTIONS" ( 
	"ID_USER" INTEGER,
	"QUESTION" INTEGER,
	"RESPONSE" TEXT
);
CREATE TABLE IF NOT EXISTS "CHARACTER" (
	"ID_USER"	INTEGER,
	"SKIN"	INTEGER NOT NULL,
	"CASH"	INTEGER DEFAULT '0',
	"POS_X"	FLOAT NOT NULL,
	"POS_Y"	FLOAT NOT NULL,
	"POS_Z"	FLOAT NOT NULL,
	"ANGLE"	FLOAT NOT NULL,
	"STATE"	INTEGER DEFAULT '0',
	"INTERIOR"	INTEGER DEFAULT '0',
	"LOCAL_INTERIOR"	INTEGER DEFAULT '0',
	"FIGHT_STYLE"	INTEGER DEFAULT '4',
	"HEALTH"	FLOAT DEFAULT '100.0',
	"ARMOUR"	FLOAT DEFAULT '0.0',
	"SEX"	INTEGER DEFAULT '0',
	"HUNGRY"	FLOAT DEFAULT '100.0',
	"THIRST"	FLOAT DEFAULT '100.0',
	"BLACK_MARKET_LEVEL"	INTEGER DEFAULT '0',
	"WANTED_LEVEL"	INTEGER DEFAULT '0',
	"POLICE_JAIL_TIME"	INTEGER DEFAULT '0',
	"POLICE_JAIL_ID"	INTEGER DEFAULT '0',
	"STYLE"	INTEGER DEFAULT '0',
	"WORLD"	INTEGER,
	"JAIL_REASON"	VARCHAR(64),
	"JAILED_BY"	INTEGER NOT NULL DEFAULT 0,
	FOREIGN KEY("ID_USER") REFERENCES "ACCOUNTS"("ID") ON DELETE CASCADE,
	PRIMARY KEY("ID_USER")
);

CREATE TABLE IF NOT EXISTS "SERVER_PROPERTIES" (
	"SAWMILL_STOCK" INTEGER NOT NULL DEFAULT 0,
	"LAST_GRAFFITI" INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS "STORAGE_OBJECTS" (
	"ID" INTEGER PRIMARY KEY AUTOINCREMENT,
	"MISC_ID" INTEGER,
	"EXTRA"	INTEGER DEFAULT '0'
);

CREATE TABLE IF NOT EXISTS "CLUB_INFO" (
	"ID" INTEGER PRIMARY KEY AUTOINCREMENT,
	"USER_ID" INTEGER DEFAULT '0',
	"NAME" VARCHAR(32),
	"WELCOME" TEXT,
	"X" FLOAT DEFAULT '0.0',
	"Y" FLOAT DEFAULT '0.0',
	"Z" FLOAT DEFAULT '0.0',
	"ANGLE" FLOAT DEFAULT '0.0',
	"STATE" INTEGER DEFAULT '1',
	"INTERIOR" INTEGER DEFAULT '0',
	"BALANCE" INTEGER DEFAULT '0',
	"ENTER_PRICE" INTEGER DEFAULT '0',
	"RADIO" INTEGER DEFAULT '100',
	"PRICE" INTEGER DEFAULT '0'
);

CREATE TABLE IF NOT EXISTS "CLUB_PRODUCTS" (
	"ID" INTEGER PRIMARY KEY AUTOINCREMENT,
	"CLUB_ID" INTEGER,
	"NAME" VARCHAR(32),
	"TYPE" INTEGER DEFAULT '0',
	"EXTRA" INTEGER DEFAULT '0',
	"PRICE" INTEGER DEFAULT '0'
);

CREATE TABLE IF NOT EXISTS "VEHICLE_KEYS" (
	"VEHICLE_ID" INTEGER,
	"USER_ID" INTEGER
);

CREATE TABLE IF NOT EXISTS "PROPERTY_STORAGE" (
	"ID" INTEGER PRIMARY KEY AUTOINCREMENT,
	"ID_PROPERTY" INTEGER,
	"TYPE" INTEGER,
	"EXTRA" INTEGER
);

CREATE TABLE IF NOT EXISTS "VEHICLE_STORAGE" (
	"ID" INTEGER PRIMARY KEY AUTOINCREMENT,
	"ID_VEHICLE" INTEGER,
	"TYPE" INTEGER,
	"EXTRA" INTEGER
);

CREATE TABLE IF NOT EXISTS "PLAYER_INVENTORY" (
	"ID" INTEGER PRIMARY KEY AUTOINCREMENT,
	"ID_USER" INTEGER,
	"TYPE" INTEGER,
	"EXTRA" INTEGER
);
COMMIT;
