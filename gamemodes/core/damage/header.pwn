#if defined DAMAGE_H
	#endinput
#endif

#define DAMAGE_H

#define DEFAULT_TEAM 			0x7FFFFFF8
#define Player_SetTeam(%0,%1)	g_iPlayerTeam[(%0)] = (%1)

enum _:E_DAMAGE_BODY_PART
{
	e_iBodyPartTorso = 3,
	e_iBodyPartGroin,
	e_iBodyPartLeftArm,
	e_iBodyPartRightArm,
	e_iBodyPartLeftLeg,
	e_iBodyPartRightLeg,
	e_iBodyPartHead
};

new
	g_iPlayerHealth[MAX_PLAYERS],
	g_iPlayerArmour[MAX_PLAYERS],
	g_iLastDamageTick[(MAX_PLAYERS + 1)],
	g_iPlayerTeam[MAX_PLAYERS],
	g_sDamageGivenText[MAX_PLAYERS][512],
	g_sDamageTakenText[MAX_PLAYERS][512],
	g_iDamageTaken[MAX_PLAYERS + 1][MAX_PLAYERS],
	g_iDamageGiven[MAX_PLAYERS + 1][MAX_PLAYERS],
	PlayerText:g_ptdDamageGiven[MAX_PLAYERS],
	PlayerText:g_ptdDamageTaken[MAX_PLAYERS];

new const g_rgszWeaponName[][] = {
	{"Golpe"            }, {"Golpe"			}, {"Palo de golf"        },
	{"Porra de polic��a" }, {"Cuchillo"      }, {"Bate"                 },
	{"Pala"             }, {"Taco de billar"}, {"Katana"              },
	{"Motocierra"       }, {"Dildo Morado"  }, {"Dildo"               },
	{"Vibrador"         }, {"Vibrador"      }, {"Ramo de flores"      },
	{"Ca�a"             }, {"Grenada"       }, {"Gases lacrim�genos"  },
	{"Molotov"          }, {"M4 de veh��culo"}, {"M4 de veh��culo"      },
	{""                 }, {"9mm"	        }, {"Tazer"   	  		  },
	{"Deagle"           }, {"Escopeta"      }, {"Escopeta recortada"  },
	{"Escopeta militar" }, {"Mac-10"        }, {"MP5"                 },
	{"AK-47"            }, {"M4"            }, {"Tec-9"               },
	{"Rifle"          	}, {"Sniper"        }, {"Rocket launcher"     },
	{"Heat seeking RPG" }, {"Llamas"  		}, {"Minigun"             },
	{"Cartera"          }, {"Detonator"     }, {"Spray"         	  },
	{"Extinguidor"		}, {"Camara"        }, {"Night vision goggles"},
	{"Infrared goggles" }, {"Paracaidas"    }, {"Fake pistol"         },
	{"Golpe de arma"    }, {"Vehiculo"      }, {"Helicopter blades"   },
	{"Explosion"        }, {"Car parking"   }, {"Ahogo"            	  },
	{"Colision"        	}, {"Golpe"         }, {"Desconocido"         }
},
	g_rgszBodyPart[][] = {
		"Torso",
		"Cadera",
		"Brazo izq.",
		"Brazo der.",
		"Pierna izq.",
		"Pierna der.",
		"Cabeza"
},
    g_rgiWeaponsDamage[][E_DAMAGE_BODY_PART] = {
        { 1, 1, 1, 1, 1, 1, 2 }, // Pu�o
		{ 1, 1, 1, 1, 1, 1, 2 }, // Manopla
		{ 1, 1, 1, 1, 1, 1, 2 }, // Palo de golf
		{ 7, 5, 5, 5, 5, 5, 10 }, // Porra
		{ 5, 2, 2, 2, 2, 2, 10 }, // Cuchillo
		{ 3, 3, 3, 3, 3, 3, 10 }, // Bate
		{ 4, 3, 3, 3, 3, 3, 10 }, // Pala
		{ 3, 1, 1, 1, 1, 1, 10 }, // Palo de pool
		{ 8, 8, 8, 8, 8, 8, 15 }, // Katana
		{ 10, 5, 5, 5, 5, 5, 10 }, // Motosierra
		{ 1, 1, 1, 1, 1, 1, 2 }, // Dildo morado
		{ 1, 1, 1, 1, 1, 1, 2 }, // Dildo
		{ 1, 1, 1, 1, 1, 1, 2 }, // Vibrador 
		{ 1, 1, 1, 1, 1, 1, 2 }, // Vibrador gris
		{ 1, 1, 1, 1, 1, 1, 2 }, // Flores
		{ 4, 1, 1, 1, 1, 1, 2 }, // Bast�n
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: Granada
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: Granada de gas
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: Molotov
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: Slot inv�lido
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: Slot inv�lido
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: Slot inv�lido
        { 8, 8, 5, 5, 5, 5, 20 }, // Colt45
		{ 8, 8, 5, 5, 5, 5, 20 }, // Silenced
		{ 20, 20, 20, 20, 20, 20, 30 }, // Deagle
		{ 15, 12, 12, 12, 12, 12, 15 }, // Escopeta
		{ 15, 10, 10, 10, 10, 10, 15 }, // Recortada
		{ 8, 8, 8, 8, 8, 8, 10 }, // Combate
		{ 6, 5, 5, 5, 5, 5, 10 }, // Uzi
		{ 5, 4, 4, 4, 4, 4, 10 }, // MP5
		{ 12, 10, 10, 10, 10, 10, 20 }, // AK-47
		{ 20, 15, 15, 15, 15, 15, 30 }, // M4
		{ 11, 10, 10, 10, 10, 10, 13 }, // Tec-9
		{ 25, 25, 25, 25, 25, 25, 35 }, // Rifle
		{ 100, 70, 70, 70, 70, 70, 100 }, // Sniper
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: RPG
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: Bazooka
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: Lanzallamas
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: Minigun
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: C4
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: Detonador
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: RPG
		{ 0, 0, 0, 0, 0, 0, 0 }, // Spray
		{ 0, 0, 0, 0, 0, 0, 0 }, // NO USADO: Extinguidor
		{ 1, 1, 1, 1, 1, 1, 2 }, // Nigh vision
		{ 1, 1, 1, 1, 1, 1, 2 }, // Thermal 
		{ 1, 1, 1, 1, 1, 1, 2 }, // Paracaidas
		{ 1, 1, 1, 1, 1, 1, 2 }, // Cellphone
		{ 1, 1, 1, 1, 1, 1, 2 }, // Jetpack
		{ 1, 1, 1, 1, 1, 1, 2 }, // Skate
		{ 1, 1, 1, 1, 1, 1, 2 }, // Vehicle
		{ 1, 1, 1, 1, 1, 1, 2 }, // Helicopter
		{ 1, 1, 1, 1, 1, 1, 2 }, // BOOM
		{ 1, 1, 1, 1, 1, 1, 2 }, // drowned
		{ 1, 1, 1, 1, 1, 1, 2 } // splat
    };

forward OnPlayerDamage(playerid, issuerid, amount, weaponid, bodypart);