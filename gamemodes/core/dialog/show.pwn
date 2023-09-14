ShowDialog(playerid, dialogid)
{
	PLAYER_TEMP[playerid][py_PLAYER_WAITING_MP3_HTTP] = false;
	PLAYER_TEMP[playerid][py_DIALOG_RESPONDED] = false;

	switch(dialogid)
	{
		case DIALOG_REGISTER:
		{
			new dialog[280];
			format(dialog, sizeof dialog, ""COL_WHITE"\
				Bienvenido, "COL_DARK_BLUE"%s"COL_WHITE".\n\n\
				Esta cuenta aún "COL_ORANGE"no está registrada"COL_WHITE", ingrese\n\
				una contraseña en el cuadro a continuación\n\
				para iniciar el proceso de registro.\n\n\
				\t{E3E3E3}1. Contraseña\n\
				\t{5c5c5c}2. Correo\n\
				\t{5c5c5c}3. Sexo"COL_WHITE"\n\n\
				Ingrese una contraseña entre 6-18 caracteres.", PLAYER_TEMP[playerid][py_RP_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PASSWORD, ""COL_RED"[1/3] Registrarse", dialog, "Aceptar", "Cancelar");
			return 1;
		}
		case DIALOG_LOGIN:
		{
			new dialog_login[164];
			format(dialog_login, sizeof dialog_login, ""COL_WHITE"\
				Bienvenido, "COL_DARK_BLUE"%s"COL_WHITE".\n\n\
				Esta cuenta ya está registrada, para ingresar escriba\n\
				su contraseña en el cuadro a continuación.\n\nContraseña:", PLAYER_TEMP[playerid][py_RP_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PASSWORD, ""COL_RED"Ingresa a tu cuenta", dialog_login, "Aceptar", "Cancelar");
			return 1;
		}
		case DIALOG_REGISTER_EMAIL: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"[2/3] Correo electrónico", ""COL_WHITE"Ingresa una dirección de correo electrónico.\n\n\
			\t{5c5c5c}1. Contraseña\n\
			\t{E3E3E3}2. Correo\n\
			\t{5c5c5c}3. Sexo"COL_WHITE"\n\n\
			Esto le va a servir para poder recuperar su contraseña\nen caso que se la olvide.", "Aceptar", "Cerrar");
        case DIALOG_REGISTER_SEX: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"[3/3] Sexo", ""COL_WHITE"Selecciona un sexo.\n\n\
        	\t{5c5c5c}1. Contraseña\n\
			\t{5c5c5c}2. Correo\n\
			\t{E3E3E3}3. Sexo"COL_WHITE"\n\n\
			Este va a ser el sexo inicial de su personaje.", "Hombre", "Mujer");
		case DIALOG_PLAYER_TOYS:
		{
			new dialog[96 * (MAX_PLAYER_ATTACHED_OBJECTS + 2)], line_str[64];
			format(dialog, sizeof dialog, ""COL_WHITE"Accesorio\t"COL_RED"Colocado\n");
			for(new i; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++)
			{
				if (ACCOUNT_INFO[playerid][ac_SU])
				{
					if (PLAYER_TOYS[playerid][i][player_toy_VALID])
					{
						if (PLAYER_TOYS[playerid][i][player_toy_ATTACHED]) format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_RED"Sí\n", i + 1, PLAYER_TOYS[playerid][i][player_toy_NAME]);
						else format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_RED"No\n", i + 1, PLAYER_TOYS[playerid][i][player_toy_NAME]);
					}
					else format(line_str, sizeof line_str, "{666666}%d. Slot vacío\n", i + 1);
				}
				else
				{
					if (i >= MAX_NU_TOYS)
					{
						if (PLAYER_TOYS[playerid][i][player_toy_VALID]) format(line_str, sizeof line_str, "{666666}%d. %s\t"COL_RED"No\n", i + 1, PLAYER_TOYS[playerid][i][player_toy_NAME]);
						else format(line_str, sizeof line_str, "{666666}%d. Slot vacío\n", i + 1);
					}
					else
					{
						if (PLAYER_TOYS[playerid][i][player_toy_VALID])
						{
							if (PLAYER_TOYS[playerid][i][player_toy_ATTACHED]) format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_RED"Sí\n", i + 1, PLAYER_TOYS[playerid][i][player_toy_NAME]);
							else format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_RED"No\n", i + 1, PLAYER_TOYS[playerid][i][player_toy_NAME]);
						}
						else format(line_str, sizeof line_str, "{666666}%d. Slot vacío\n", i + 1);
					}
				}
				strcat(dialog, line_str);
			}
			strcat(dialog, ""COL_RED"Eliminar todo\n");

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Mis accesorios", dialog, "Selecc.", "Cerrar");
			SavePlayerToysData(playerid);
			return 1;
		}
		case DIALOG_PLAYER_TOY_MENU:
		{
			if (!PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_VALID])
			{
			    ShowPlayerMessage(playerid, "~r~Este slot está vacío, puedes comprar accesorios en cualquier tienda de ropa.", 3);
				return 1;
			}

			new caption[48];
			format(caption, sizeof caption, ""COL_RED"Accesorio %s", PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_NAME]);

			new dialog[256];
			if (PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED]) format(dialog, sizeof dialog, ""COL_WHITE"Guardar este accesorio\n"COL_WHITE"Cambiar el nombre del accesorio\n"COL_WHITE"Configurar el accesorio\n"COL_WHITE"Color primario\n"COL_WHITE"Color secundario\n"COL_WHITE"Eliminar este accesorio");
			else
			{
				if (PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_BONE] == -1)
				{
				    ShowPlayerMessage(playerid, "Este accesorio es nuevo y aún no ha sido configurado, configuralo desde ~y~'Configurar el accesorio'", 4);
					format(dialog, sizeof dialog, ""COL_WHITE"Colocarte el accesorio\n"COL_WHITE"Cambiar el nombre del accesorio\n"COL_WHITE"Configurar el accesorio\n"COL_WHITE"Color primario\n"COL_WHITE"Color secundario\n"COL_WHITE"Eliminar este accesorio");
				}
				else format(dialog, sizeof dialog, ""COL_WHITE"Colocarte el accesorio\n"COL_WHITE"Cambiar el nombre del accesorio\n"COL_WHITE"Configurar el accesorio\n"COL_WHITE"Color primario\n"COL_WHITE"Color secundario\n"COL_WHITE"Eliminar este accesorio");
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_PLAYER_TOY_EDIT_NAME:
		{
			new dialog[144];
			format(dialog, sizeof dialog, ""COL_WHITE"Nombre actual: \"%s\"\nIndica el nuevo nombre:", PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Modificar nombre", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_TOY_CONFIRMDELETE:
		{
			new dialog[144];
			format(dialog, sizeof dialog, ""COL_WHITE"¿Estás seguro que quieres borrar el accesorio %s?", PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Eliminar accesorio", dialog, "Si", "No");
			return 1;
		}
		case DIALOG_PLAYER_TOY_SELECT_BONE:
		{
		    ShowPlayerMessage(playerid, "Selecciona en que parte del cuerpo quieres colocar este accesorio.", 3);

			new caption[48];
			format(caption, sizeof caption, ""COL_RED"Accesorio '%s'", PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_NAME]);

			new dialog[45 * sizeof Toys_Bones], line_str[45];
			for(new i = 0; i != sizeof Toys_Bones; i ++)
			{
				format(line_str, sizeof(line_str), ""COL_WHITE"%d. %s\n", i + 1, Toys_Bones[i]);
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_TOY_EDIT_BONE:
		{
			new caption[48];
			format(caption, sizeof caption, ""COL_WHITE"Accesorio '%s'", PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_NAME]);

			new dialog[144];
			format(dialog, sizeof(dialog), "¿Quieres cambiar la parte del cuerpo donde se coloca este accesorio?\nActualmente está colocado en: %s", Toys_Bones[ PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_BONE] - 1 ]);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, caption, dialog, "Sí", "No");
			return 1;
		}
		case DIALOG_PLAYER_TOY_COLOR_1:
		{
		    ShowPlayerMessage(playerid, "Selecciona el color 0 para poner el color original del accesorio.", 3);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, "Selecciona color", DIALOG_CREATE_CREW_COLOR_String, "Continuar", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_TOY_COLOR_2:
		{
			ShowPlayerMessage(playerid, "Selecciona el color 0 para poner el color original del accesorio.", 3);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, "Selecciona color", DIALOG_CREATE_CREW_COLOR_String, "Continuar", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_TOY_DELETE_ALL: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "Accesorios - Eliminar todo", "¿Está seguro de que quiere eliminar todos sus accesorios?\nEsta opción no se puede deshacer.", "Eliminar", "Atrás");
		case DIALOG_BANK:
		{
			if (BANK_ACCOUNT[playerid][bank_account_ID] == 0) return ShowPlayerMessage(playerid, "~r~No tienes cuenta bancaria.", 2);

			new caption[80];
			format(caption, sizeof caption, "ID: %s - Balance actual: "COL_GREEN"%s$", number_format_thousand(BANK_ACCOUNT[playerid][bank_account_ID]), number_format_thousand(BANK_ACCOUNT[playerid][bank_account_BALANCE]));

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption,
				""COL_WHITE"1. Retirar dinero\n"COL_WHITE"2. Depositar dinero\n"COL_WHITE"3. Transferir dinero\n"COL_WHITE"4. Últimas transacciones",
			"Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_CREATE_BANK_ACCOUNT:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_GREEN"Crear cuenta bancaria",
				""COL_WHITE"Presione en Crear para obtener su cuenta bancaria.",
			"Crear", "Salir");
			return 1;
		}
		case DIALOG_BANK_WITHDRAW:
		{
			new dialog[100];
			format(dialog, sizeof dialog, ""COL_WHITE"Dinero actual: "COL_GREEN"%s$\n"COL_WHITE"Ingrese la cantidad a retirar.", number_format_thousand(BANK_ACCOUNT[playerid][bank_account_BALANCE]));

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_GREEN"Retirar", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_BANK_DEPOSIT:
		{
			new dialog[100];
			format(dialog, sizeof dialog, ""COL_WHITE"Dinero actual: "COL_GREEN"%s$\n"COL_WHITE"Ingrese la cantidad a depositar.", number_format_thousand(CHARACTER_INFO[playerid][ch_CASH]));

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_GREEN"Depositar", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_BANK_TRANSFER: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_GREEN"Transferir", ""COL_WHITE"Ingrese el número de cuenta a donde quiere transferir dinero.\nAviso: Número de cuenta no es lo mismo que el id del jugador.\nPidale al otro jugador que le de su Número de cuenta.", "Selecc.", "Atrás");
		case DIALOG_BANK_TRANSFER_SEND:
		{
			if (ACCOUNT_INFO[playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~Debes ser nivel 2 para transferir.", 3);
			new dialog[170];
			format(dialog, sizeof dialog, ""COL_WHITE"Transferir a cuenta: "COL_GREEN"%s\n"COL_WHITE"Dinero actual: "COL_GREEN"%s$\n\n"COL_WHITE"Ingrese la cantidad a transferir.", number_format_thousand(PLAYER_TEMP[playerid][py_SELECT_BANK_TRANSFER_ACCOUNT]), number_format_thousand(BANK_ACCOUNT[playerid][bank_account_BALANCE]));
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_GREEN"Transferir", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_BANK_TRANSACTIONS:
		{
			new dialog[128 * 5];
			format(dialog, sizeof dialog, ""COL_WHITE"Fecha\t"COL_WHITE"Concepto\t"COL_WHITE"Importe\n");

			new DBResult:Result, transactions, DB_Query[140];
			format(DB_Query, sizeof DB_Query, "SELECT * FROM `BANK_TRANSACTIONS` WHERE `ID_ACCOUNT` = '%d' ORDER BY `DATE` DESC LIMIT %d;", BANK_ACCOUNT[playerid][bank_account_ID], MAX_BANK_TRANSACTIONS_DIALOG);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result) == 0) strcat(dialog, ""COL_GREEN"No hay transacciones en tu cuenta.");
			else
			{
				new line_str[125];
				for(new i; i < db_num_rows(Result); i++ )
				{
					new trasaction_type, ammount, extra, date[24];
					trasaction_type = db_get_field_assoc_int(Result, "TRANSACTION_TYPE");
					ammount = db_get_field_assoc_int(Result, "AMMOUNT");
					extra = db_get_field_assoc_int(Result, "EXTRA");
					db_get_field_assoc(Result, "DATE", date, 24);

					switch(trasaction_type)
					{
						case BANK_TRANSACTION_WITHDRAW:
						{
							format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_GREEN"RETIRADA EFECTIVO\t"COL_WHITE"-%s$\n", date, number_format_thousand(ammount));
							strcat(dialog, line_str);
						}
						case BANK_TRANSACTION_DEPOSIT:
						{
							format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_GREEN"INGRESO EN EFECTIVO\t"COL_WHITE"%s$\n", date, number_format_thousand(ammount));
							strcat(dialog, line_str);
						}
						case BANK_TRANSACTION_TRANSFER_SENT:
						{
							format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_GREEN"TRANSFERENCIA A LA ACCOUNTS %d\t"COL_WHITE"-%s$\n", date, extra, number_format_thousand(ammount));
							strcat(dialog, line_str);
						}
						case BANK_TRANSACTION_TRANSFER_RECE:
						{
							format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_GREEN"TRANSFERENCIA DE LA ACCOUNTS %d\t"COL_WHITE"%s$\n", date, extra, number_format_thousand(ammount));
							strcat(dialog, line_str);
						}
						case BANK_TRANSACTION_CREATE_ACCOUNT:
						{
							format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_GREEN"CREACION DE LA ACCOUNTS\t"COL_WHITE"%s$\n", date, number_format_thousand(ammount));
							strcat(dialog, line_str);
						}
						case BANK_TRANSACTION_BUY_PROPERTY:
						{
							format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_GREEN"PROPIEDAD COMPRADA\t"COL_WHITE"-%s$\n", date, number_format_thousand(ammount));
							strcat(dialog, line_str);
						}
						case BANK_TRANSACTION_SOLD_PROPERTY:
						{
							format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_GREEN"PROPIEDAD VENDIDA\t"COL_WHITE"%s$\n", date, number_format_thousand(ammount));
							strcat(dialog, line_str);
						}
						case BANK_TRANSACTION_BUY_VEHICLE:
						{
							format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_GREEN"VEHICULO COMPRADO\t"COL_WHITE"-%s$\n", date, number_format_thousand(ammount));
							strcat(dialog, line_str);
						}
						case BANK_TRANSACTION_SOLD_VEHICLE:
						{
							format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_GREEN"VEHICULO VENDIDO\t"COL_WHITE"%s$\n", date, number_format_thousand(ammount));
							strcat(dialog, line_str);
						}
					}

					transactions ++;
					db_next_row(Result);
				}
				format(line_str, sizeof line_str, ""COL_WHITE"DINERO ACTUAL:\t"COL_GREEN"%s$", number_format_thousand(BANK_ACCOUNT[playerid][bank_account_BALANCE]));
				strcat(dialog, line_str);
			}
			db_free_result(Result);

			new caption[40];
			format(caption, sizeof caption, ""COL_GREEN"Número de cuenta: %d", BANK_ACCOUNT[playerid][bank_account_ID]);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, caption, dialog, "Salir", "Atrás");
			return 1;
		}
		case DIALOG_HOSPITAL_SHOP:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Farmacia", ""COL_WHITE"Producto\t"COL_WHITE"Precio\n\
				"COL_WHITE"5 Vendas\t"COL_GREEN"70$\n\
				"COL_WHITE"10 Medicamentos\t"COL_GREEN"170$\n\
				"COL_WHITE"1 Botiquín\t"COL_GREEN"720$\n", "Comprar", "Salir");
			return 1;
		}
		case DIALOG_PHONE:
		{
			new caption[50];
			format(caption, sizeof caption, ""COL_RED"Teléfono - %d", PLAYER_PHONE[playerid][player_phone_NUMBER]);

			new dialog[200];
			if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_ON) format(dialog, sizeof dialog, "Llamar\nEnviar mensaje\nApagar teléfono");
			else format(dialog, sizeof dialog, ""COL_WHITE"Encender teléfono\nLlamar\nEnviar mensaje");
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_PHONE_BOOK:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[80 * (MAX_PHONE_CONTACTS + 3)];
			format(dialog, sizeof dialog, ""COL_WHITE"Nombre\t"COL_WHITE"Número\n");

			new line_str[80], contacts, listitem;
			for(new i = 0; i != MAX_PHONE_CONTACTS; i++ )
			{
				if (!PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_VALID]) continue;

				format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%d\n", listitem + 1, PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_NAME], PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_PHONE_NUMBER]);
				strcat(dialog, line_str);
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = i;

				contacts ++; listitem ++;
			}
			if (contacts < MAX_PHONE_CONTACTS)
			{
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = MAX_PHONE_CONTACTS + 10;
				strcat(dialog, ""COL_GREEN"+"COL_WHITE" Añadir contacto\n"); listitem ++;
			}
			if (contacts > 0)
			{
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = MAX_PHONE_CONTACTS + 20;
				strcat(dialog, ""COL_RED"Cerrar"COL_WHITE" Eliminar todo\n"); listitem ++;
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Contactos", dialog, "Ver", "Cerrar");
			return 1;
		}
		case DIALOG_PHONE_BOOK_ADD_NUMBER: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Agenda - Añadir contacto", "Está añadiendo un nuevo contacto en su agenda.\nIndique el número de teléfono del nuevo contacto.", "Selecc.", "Atrás");
		case DIALOG_PHONE_BOOK_ADD_NAME: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Agenda - Añadir contacto", "Está añadiendo un nuevo contacto en su agenda.\nIndique el nombre del nuevo contacto.", "Selecc.", "Atrás");
		case DIALOG_PHONE_BOOK_OPTIONS:
		{
			new caption[40];
			format(caption, sizeof caption, ""COL_RED"%s", PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_NAME]);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, ""COL_WHITE"Llamar\n"COL_WHITE"Enviar mensaje\n"COL_WHITE"Cambiar nombre del contacto\n"COL_WHITE"Eliminar este contacto", "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PHONE_BOOK_CHANGE_NAME:
		{
			new caption[40];
			format(caption, sizeof caption, ""COL_RED"%s", PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_NAME]);

			new dialog[140];
			format(dialog, sizeof dialog, ""COL_WHITE"Nombre actual: %s\nTeléfono: %d\n\nIndica el nuevo nombre de este contacto.", PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_NAME], PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_PHONE_NUMBER]);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, caption, dialog, "Cambiar", "Atrás");
			return 1;
		}
		case DIALOG_PHONE_BOOK_CONFIRM_DELET:
		{
			new caption[40];
			format(caption, sizeof caption, ""COL_RED"%s", PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_NAME]);

			new dialog[140];
			format(dialog, sizeof dialog, ""COL_WHITE"¿Está seguro de que desea eliminar el siguiente contacto?\n\nNombre: %s\nTeléfono: %d", PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_NAME], PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_PHONE_NUMBER]);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, caption, dialog, "Si", "No");
			return 1;
		}
		case DIALOG_PHONE_BOOK_DELETE_ALL: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Eliminar todo", ""COL_WHITE"¿Está seguro de que quiere eliminar todos sus contactos?\nEsta opción no se puede deshacer y perderás todos los contactos guardados.", "Eliminar", "Atrás");
		case DIALOG_PHONE_CALL_NUMBER: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Llamar", ""COL_WHITE"¿A quién quieres llamar?\nIndique el número al que desea llamar.", "Selecc.", "Atrás");
		case DIALOG_PHONE_SMS_NUMBER: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Mensaje", ""COL_WHITE"¿A quién quieres enviarle el mensaje?\nIndique el número al que desea enviar el mensaje.", "Selecc.", "Atrás");
		case DIALOG_PHONE_SMS_MESSAGE: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Mensaje", ""COL_WHITE"Escribe el mensaje que quieres enviar\nCaracteres: 1-64.", "Selecc.", "Atrás");
		case DIALOG_PHONE_BOOK_SEND_MESSAGE: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Mensaje", ""COL_WHITE"Escribe el mensaje que quieres enviar\nCaracteres: 1-64.", "Selecc.", "Atrás");
		case DIALOG_PHONE_SENT_MESSAGES:
		{
			new dialog[128 * 5];
			format(dialog, sizeof dialog, ""COL_WHITE"Fecha\t"COL_WHITE"Destinario\t"COL_WHITE"Mensaje\n");

			new DBResult:Result, DB_Query[140], messages;
			format(DB_Query, sizeof DB_Query, "SELECT * FROM `PHONE_MESSAGES` WHERE `FROM` = '%d' ORDER BY `DATE` DESC LIMIT 5;", PLAYER_PHONE[playerid][player_phone_NUMBER]);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result) == 0) strcat(dialog, ""COL_WHITE"No hay mensajes.");
			else
			{
				new line_str[150];
				for(new i; i < db_num_rows(Result); i++ )
				{
					new date[24], to, message[64];
					to = db_get_field_assoc_int(Result, "TO");
					db_get_field_assoc(Result, "MESSAGE", message, 64);
					db_get_field_assoc(Result, "DATE", date, 24);

					format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", date, convertPhoneNumber(playerid, to), message);
					strcat(dialog, line_str);

					messages ++;
					db_next_row(Result);
				}
			}
			db_free_result(Result);

			new caption[40];
			format(caption, sizeof caption, ""COL_RED"Últimos %d mensajes enviados", messages);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, caption, dialog, "Cerrar", "");
			return 1;
		}
		case DIALOG_PHONE_RECEIVED_MESSAGES:
		{
			new dialog[128 * 5];
			format(dialog, sizeof dialog, ""COL_WHITE"Fecha\t"COL_WHITE"Remitente\t"COL_WHITE"Mensaje\n");

			new DBResult:Result, DB_Query[140], messages;
			format(DB_Query, sizeof DB_Query, "SELECT * FROM `PHONE_MESSAGES` WHERE `TO` = '%d' ORDER BY `DATE` DESC LIMIT 5;", PLAYER_PHONE[playerid][player_phone_NUMBER]);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result) == 0) strcat(dialog, ""COL_WHITE"No hay mensajes.");
			else
			{
				new line_str[150];
				for(new i; i < db_num_rows(Result); i++ )
				{
					new date[24], from, message[64];
					from = db_get_field_assoc_int(Result, "FROM");
					db_get_field_assoc(Result, "MESSAGE", message, 64);
					db_get_field_assoc(Result, "DATE", date, 24);

					format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", date, convertPhoneNumber(playerid, from), message);
					strcat(dialog, line_str);

					messages ++;
					db_next_row(Result);
				}
			}
			db_free_result(Result);

			new caption[40];
			format(caption, sizeof caption, ""COL_RED"Últimos %d mensajes recibidos", messages);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, caption, dialog, "Cerrar", "");
			return 1;
		}
		case DIALOG_PHONE_MESSAGE_LIST:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Mensajes",  "Enviado\nRecibidos", "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_CONFIRM_BUY_PROPERTY:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Confirmar compra", ""COL_WHITE"Haga click en el botón de Comprar para confirmar.", "Comprar", "Salir");
			return 1;
		}
		case DIALOG_PLAYER_GPS:
		{
			HideInventory(playerid);
			ShowInventory(playerid);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"GPS",  "Lugares guardados\nPropiedades\nVehículos\nOtros\nTrabajos", "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_PLAYER_GPS_PLAYER:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[90 * (MAX_PLAYER_GPS_SAVES + 2)];
			format(dialog, sizeof dialog, ""COL_WHITE"Lugar\t"COL_WHITE"Distancia\n");

			new line_str[90], sites, listitem;
			for(new i = 0; i != MAX_PLAYER_GPS_SAVES; i++ )
			{
				if (!PLAYER_GPS[playerid][i][player_gps_VALID]) continue;

				format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%.2f Km\n", listitem + 1, PLAYER_GPS[playerid][listitem][player_gps_NAME], (GetPlayerDistanceFromPoint(playerid, PLAYER_GPS[playerid][listitem][player_gps_X], PLAYER_GPS[playerid][listitem][player_gps_Y], PLAYER_GPS[playerid][listitem][player_gps_Z]) * 0.01));
				strcat(dialog, line_str);
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = i;

				sites ++; listitem ++;
			}
			if (sites < MAX_PLAYER_GPS_SAVES)
			{
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = MAX_PLAYER_GPS_SAVES + 10;
				strcat(dialog, ""COL_GREEN"+"COL_WHITE" Añadir lugar actual\n"); listitem ++;
			}
			if (sites > 0)
			{
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = MAX_PLAYER_GPS_SAVES + 20;
				strcat(dialog, ""COL_RED"Cerrar"COL_WHITE" Eliminar todo\n"); listitem ++;
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Mis lugares", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_PLAYER_ADD:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Añadir lugar", ""COL_WHITE"Tu posición actual será guardada en este lugar para ir más tarde.\nIndica el nombre de este lugar para guardarlo.", "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_DELETE_ALL: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Eliminar todo", ""COL_WHITE"¿Está seguro de que quiere eliminar todos sus lugares?\nEsta opción no se puede deshacer y perderás todos los lugares guardados.", "Eliminar", "Atrás");
		case DIALOG_PLAYER_GPS_PLAYER_OPTION:
		{
			new caption[40];
			format(caption, sizeof caption, ""COL_RED"%s", PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_NAME]);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, ""COL_WHITE"1. Marcar coordenadas en el GPS\n"COL_WHITE"2. Cambiar nombre de este lugar\n"COL_WHITE"3. Eliminar este lugar del GPS", "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_CHANGE_NAME:
		{
			new dialog[90];
			format(dialog, sizeof dialog, "Nombre del lugar: %s\nIndica el nuevo nombre para este lugar.", PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Cambiar nombre de un lugar", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_CONFIRM_DELET:
		{
			new dialog[95];
			format(dialog, sizeof dialog, "Nombre del lugar: %s\n¿Está seguro de que quiere borrarlo del GPS?", PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Eliminar un lugar", dialog, "Eliminar", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITES:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Otros", "Hospitales\nTiendas de Ropa\nNegocios\nRestaurantes\nBancos\nCajeros\nGasolineras\nConcesionarios\nBanco Central\nPolicías\nTaller mecánico\nHelipuerto\nTienda Tecno", "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_WORKS:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[85 * (sizeof(work_info) + 1)], listitem;
			format(dialog, sizeof dialog, ""COL_WHITE"Trabajo\t"COL_WHITE"Nivel\t"COL_WHITE"Distancia\n");

			for(new i = 1; i != sizeof work_info; i ++)
			{
				if (work_info[i][work_info_TYPE] == WORK_TYPE_FAMILY) continue;

				new line_str[85];
				format(line_str, sizeof line_str, ""COL_WHITE"%c%s\t"COL_WHITE"%d\t"COL_WHITE"%.2f Km\n", toupper(work_info[i][work_info_NAME][0]), work_info[i][work_info_NAME][1], work_info[i][work_info_LEVEL], (GetPlayerDistanceFromPoint(playerid, obtain_work_coords[i][obtain_work_MAP_ICON_X], obtain_work_coords[i][obtain_work_MAP_ICON_Y], obtain_work_coords[i][obtain_work_MAP_ICON_Z]) * 0.01));
				strcat(dialog, line_str);

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = i;
				listitem ++;
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Trabajos", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_TRABAJOS_TELEPORTS:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[85 * (sizeof(work_info) + 1)], listitem;
			format(dialog, sizeof dialog, ""COL_WHITE"Trabajo\t"COL_WHITE"Nivel\n");

			for(new i = 1; i != sizeof work_info; i ++)
			{
				new line_str[85];
				format(line_str, sizeof line_str, ""COL_WHITE"%c%s (id: %d)\t"COL_WHITE"%d\n", toupper(work_info[i][work_info_NAME][0]), work_info[i][work_info_NAME][1], i, work_info[i][work_info_LEVEL]);
				strcat(dialog, line_str);

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = i;
				listitem ++;
			}
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Trabajos", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_0: //Hospitales
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Hospitales", DIALOG_PLAYER_GPS_SITE_0_String, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_1: //Tiendas de ropa
		{
			for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[90 * (MAX_LISTITEMS + 1)];
			format(dialog, sizeof dialog, ""COL_WHITE"Lugar\t"COL_WHITE"Distancia\n");

			new line_str[90], sites;
			for(new i = 0; i != sizeof(ENTER_EXIT); i++ )
			{
				if (sites >= MAX_LISTITEMS) break;
				if (ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_BINCO && ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_SUBURBAN && ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_PROLAPS && ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_DIDIER_SACHS && ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_VICTIM && ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_ZIP) continue;

				format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%.2f Km\n", sites + 1, ENTER_EXIT[i][ee_NAME], (GetPlayerDistanceFromPoint(playerid, ENTER_EXIT[i][ee_EXT_X], ENTER_EXIT[i][ee_EXT_Y], ENTER_EXIT[i][ee_EXT_Z]) * 0.01));
				strcat(dialog, line_str);

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][sites] = i;
				sites ++;
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Tiendas de ropa", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_2: //Tiendas 24 horas
		{
			for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[90 * (MAX_LISTITEMS + 1)];
			format(dialog, sizeof dialog, ""COL_WHITE"Lugar\t"COL_WHITE"Distancia\n");

			new line_str[90], sites;
			for(new i = 0; i != sizeof(ENTER_EXIT); i++ )
			{
				if (sites >= MAX_LISTITEMS) break;
				if (ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_247) continue;

				format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%.2f Km\n", sites + 1, ENTER_EXIT[i][ee_NAME], (GetPlayerDistanceFromPoint(playerid, ENTER_EXIT[i][ee_EXT_X], ENTER_EXIT[i][ee_EXT_Y], ENTER_EXIT[i][ee_EXT_Z]) * 0.01));
				strcat(dialog, line_str);

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][sites] = i;
				sites ++;
			}

			if (PLAYER_TEMP[playerid][py_TUTORIAL])
			{
				StopAudioStreamForPlayer(playerid);
				if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 3) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com/tutorial_3.mp3");
				PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 4;
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Negocios", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_3: //Comida rapida
		{
			for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[90 * (MAX_LISTITEMS + 1)];
			format(dialog, sizeof dialog, ""COL_WHITE"Lugar\t"COL_WHITE"Distancia\n");

			new line_str[90], sites;
			for(new i = 0; i != sizeof(ENTER_EXIT); i++ )
			{
				if (sites >= MAX_LISTITEMS) break;
				if (ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_PIZZA && ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_CLUCKIN_BELL && ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_BURGER_SHOT) continue;

				format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%.2f Km\n", sites + 1, ENTER_EXIT[i][ee_NAME], (GetPlayerDistanceFromPoint(playerid, ENTER_EXIT[i][ee_EXT_X], ENTER_EXIT[i][ee_EXT_Y], ENTER_EXIT[i][ee_EXT_Z]) * 0.01));
				strcat(dialog, line_str);

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][sites] = i;
				sites ++;
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Restaurantes", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_4: //Bancos
		{
			for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[90 * (MAX_LISTITEMS + 1)];
			format(dialog, sizeof dialog, ""COL_WHITE"Lugar\t"COL_WHITE"Distancia\n");

			new line_str[90], sites;
			for(new i = 0; i != sizeof(ENTER_EXIT); i++ )
			{
				if (sites >= MAX_LISTITEMS) break;
				if (ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_BANK_LS && ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_BANK_SF && ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_BANK_LV) continue;

				format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%.2f Km\n", sites + 1, ENTER_EXIT[i][ee_NAME], (GetPlayerDistanceFromPoint(playerid, ENTER_EXIT[i][ee_EXT_X], ENTER_EXIT[i][ee_EXT_Y], ENTER_EXIT[i][ee_EXT_Z]) * 0.01));
				strcat(dialog, line_str);

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][sites] = i;
				sites ++;
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Bancos", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_5: //Cajeros
		{
			new dialog[90 * (sizeof(ATM_BANK) + 1)];
			format(dialog, sizeof dialog, ""COL_WHITE"Lugar\t"COL_WHITE"Distancia\n");

			new line_str[90], sites;
			for(new i = 0; i != sizeof(ATM_BANK); i++ )
			{
				format(line_str, sizeof line_str, ""COL_WHITE"Cajero %d\t"COL_WHITE"%.2f Km\n", sites + 1, (GetPlayerDistanceFromPoint(playerid, ATM_BANK[i][atm_X], ATM_BANK[i][atm_Y], ATM_BANK[i][atm_Z]) * 0.01));
				strcat(dialog, line_str);

				sites ++;
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Cajeros", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_6: //Gasolineras
		{
			new dialog[90 * (sizeof(Fuel_Stations) + 1)];
			format(dialog, sizeof dialog, ""COL_WHITE"Lugar\t"COL_WHITE"Distancia\n");

			new line_str[90], sites;
			for(new i = 0; i != sizeof(Fuel_Stations); i++ )
			{
				format(line_str, sizeof line_str, ""COL_WHITE"Gasolinera %d\t%.2f Km\n", sites + 1, (GetPlayerDistanceFromPoint(playerid, Fuel_Stations[i][0], Fuel_Stations[i][1], Fuel_Stations[i][2]) * 0.01));
				strcat(dialog, line_str);

				sites ++;
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Gasolineras", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_7: //Concesionarios
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Concesionarios", DIALOG_PLAYER_GPS_SITE_7_String, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_8: //Policias
		{
			for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[90 * (MAX_LISTITEMS + 1)];
			format(dialog, sizeof dialog, ""COL_WHITE"Lugar\t"COL_WHITE"Distancia\n");

			new line_str[90], sites;
			for(new i = 0; i != sizeof(ENTER_EXIT); i++ )
			{
				if (sites >= MAX_LISTITEMS) break;
				if (ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_POLICE_LS && ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_POLICE_SF && ENTER_EXIT[i][ee_INTERIOR_TYPE] != INTERIOR_POLICE_LV) continue;

				format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t%.2f Km\n", sites + 1, ENTER_EXIT[i][ee_NAME], (GetPlayerDistanceFromPoint(playerid, ENTER_EXIT[i][ee_EXT_X], ENTER_EXIT[i][ee_EXT_Y], ENTER_EXIT[i][ee_EXT_Z]) * 0.01));
				strcat(dialog, line_str);

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][sites] = i;
				sites ++;
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Policías", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_PROPERTIES:
		{
			for(new i = 0; i != MAX_SU_PROPERTIES; i ++) PLAYER_TEMP[playerid][py_PLAYER_GPS_SELECTED_PROPERTY][i] = -1;

			new dialog[90 * (MAX_SU_PROPERTIES + 2)];
			format(dialog, sizeof dialog, ""COL_WHITE"Propiedad\t"COL_WHITE"Distancia\n");

			new DBResult:Result, DB_Query[250];
			format(DB_Query, sizeof DB_Query, "SELECT `PROPERTY_OWNER`.*, `PROPERTY`.`EXT_X`, `PROPERTY`.`EXT_Y`, `PROPERTY`.`EXT_Z` FROM `PROPERTY_OWNER`, `PROPERTY` WHERE `PROPERTY_OWNER`.`ID_USER` = '%d' AND `PROPERTY`.`ID` = `PROPERTY_OWNER`.`ID_PROPERTY`;", ACCOUNT_INFO[playerid][ac_ID]);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result) == 0) strcat(dialog, ""COL_WHITE"No tienes propiedades");
			else
			{
				new line_str[90], properties;
				for(new i; i < db_num_rows(Result); i++ )
				{
					if (properties >= MAX_SU_PROPERTIES) break;

					new property_name[24], Float:x, Float:y, Float:z;
					PLAYER_TEMP[playerid][py_PLAYER_GPS_SELECTED_PROPERTY][properties] = db_get_field_assoc_int(Result, "ID_PROPERTY");
					db_get_field_assoc(Result, "PROPERTY_NAME", property_name, 24);
					x = db_get_field_assoc_float(Result, "EXT_X");
					y = db_get_field_assoc_float(Result, "EXT_Y");
					z = db_get_field_assoc_float(Result, "EXT_Z");

					format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%.2f Km\n", properties + 1, property_name, (GetPlayerDistanceFromPoint(playerid, x, y, z) * 0.01));
					strcat(dialog, line_str);

					properties ++;
					db_next_row(Result);
				}
			}
			db_free_result(Result);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Mis propiedades", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_GPS_VEHICLES:
		{
			for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[115 * (MAX_SU_VEHICLES + 2)], total_vehicles;
			format(dialog, sizeof dialog, ""COL_WHITE"Vehículo\t"COL_WHITE"Matrícula\t"COL_WHITE"Distancia\n");
			for(new i = 0; i != MAX_VEHICLES; i ++)
			{
				if (!GLOBAL_VEHICLES[i][gb_vehicle_VALID]) continue;
				if (!PLAYER_VEHICLES[i][player_vehicle_VALID]) continue;
				if (total_vehicles > MAX_SU_VEHICLES) break;

				if (PLAYER_VEHICLES[i][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
				{
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][total_vehicles] = i;

					new Float:x, Float:y, Float:z;
					GetVehiclePos(i, x, y, z);

					new line_str[115];
					if (PLAYER_VEHICLES[i][player_vehicle_ACCESSIBLE]) format(line_str, sizeof line_str, ""COL_WHITE"%d. %s (%d)\t"COL_WHITE"%s\t"COL_WHITE"%.2f Km\n", total_vehicles + 1, VEHICLE_INFO[ GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME], i, GLOBAL_VEHICLES[i][gb_vehicle_NUMBER_PLATE], (GetPlayerDistanceFromPoint(playerid, x, y, z) * 0.01));
					else format(line_str, sizeof line_str, "{666666}%d. %s (%d)\t{666666}%s\t{666666}%.2f Km\n", total_vehicles + 1, VEHICLE_INFO[ GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME], i, GLOBAL_VEHICLES[i][gb_vehicle_NUMBER_PLATE], (GetPlayerDistanceFromPoint(playerid, x, y, z) * 0.01));

					strcat(dialog, line_str);
					total_vehicles ++;
				}
			}
			if (total_vehicles == 0) strcat(dialog, ""COL_WHITE"No tienes vehículos");

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Mis vehículos", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_GASOLINE:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Gasolinera", "Cargar gasolina\nLlenar tanque\nComprar bidón", "Comprar", "Cerrar");
			return 1;
		}
		case DIALOG_HELI_OPTIONS:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Vehículo", "Cargar gasolina\nModificar", "Comprar", "Cerrar");
			return 1;
		}
		case DIALOG_LOAD_GASOLINE:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Gasolinera", ""COL_WHITE"Ingrese la cantidad a cargar, cada litro cuesta 5$.", "Cargar", "Cerrar");
			return 1;
		}
		case DIALOG_PROPERTY_OPTIONS:
		{
			new caption[40];
			format(caption, sizeof caption, ""COL_RED"%s", PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_NAME]);

			new dialog[256];
			format(dialog, sizeof dialog, ""COL_WHITE"Cambiar nombre de la propiedad\n"COL_WHITE"Echar a todas las personas\n");
			if (PLAYER_CREW[playerid][player_crew_VALID])
			{
				if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_ADD_PROPERTIES])
				{
					strcat(dialog, "Convertir a propiedad de banda\n");
				}
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PROPERTY_NAME:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Cambiar nombre de la propiedad", ""COL_WHITE"Ingresa el nuevo nombre de la propiedad.", "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_MP3: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Buscar en YouTube", ""COL_WHITE"Introduce el nombre de un video de YouTube que quieras reproducir.", "Buscar", "Salir");
		case DIALOG_BUY_VEHICLE:
		{
			if (!GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][gb_vehicle_VALID]) return 0;
			if (GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][gb_vehicle_TYPE] != VEHICLE_TYPE_SELL) return 0;
			if (!SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_VALID]) return 0;

			new dialog[800];
			format(dialog, sizeof dialog,
				""COL_WHITE"Vehículo: %s\n\
				"COL_WHITE"Nivel necesario:{df423d} %d\n\
				"COL_WHITE"Precio del vehículo:{df423d} %s$\n\
				"COL_WHITE"Velocidad máxima: %d Km/h\n\
				"COL_WHITE"Capacidad de tanque:{67df3d} %.1f Litros\n\
				"COL_WHITE"Seguro: {dfbf3d}%s$"COL_GREEN"\n\n",
				VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME],
				SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_LEVEL],
				number_format_thousand(SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_PRICE]),
				floatround(VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][gb_vehicle_MODELID] - 400 ][vehicle_info_MAX_VEL]),
				VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][gb_vehicle_MODELID] - 400 ][vehicle_info_MAX_GAS],
				number_format_thousand(VEHICLE_INFO[GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][gb_vehicle_MODELID] - 400][vehicle_info_PRICE] / 100)
			);

			new str[144];
			if (SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_LEVEL] > ACCOUNT_INFO[playerid][ac_LEVEL])
			{
				format(str, sizeof str, "{dc0606}Necesitas ser al menos nivel %d para poder comprar este vehículo.", SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_LEVEL]);
				strcat(dialog, str);
				PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] = INVALID_VEHICLE_ID;
				ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Comprar vehículo", dialog, "Salir", "");
				return 1;
			}

			if (SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_VIP_LEVEL] > ACCOUNT_INFO[playerid][ac_SU])
			{
				format(str, sizeof str, "{dc0606}Necesitas membresía VIP%d para poder comprar este vehículo.", SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_VIP_LEVEL]);
				strcat(dialog, str);
				PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] = INVALID_VEHICLE_ID;
				ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Comprar vehículo", dialog, "Salir", "");
				return 1;
			}

			if (BANK_ACCOUNT[playerid][bank_account_ID] == 0)
			{
				strcat(dialog, "{dc0606}Necesitas una cuenta bancaria para poder comprar vehículos.");
				PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] = INVALID_VEHICLE_ID;
				ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Comprar vehículo", dialog, "Salir", "");
				return 1;
			}

			if (SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_PRICE] > BANK_ACCOUNT[playerid][bank_account_BALANCE])
			{
				new diff = SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_PRICE] - BANK_ACCOUNT[playerid][bank_account_BALANCE];
				format(str, sizeof str, "{dc0606}Te faltan %s$ en tu cuenta bancaria para poder comprar este vehículo.", number_format_thousand(diff));
				strcat(dialog, str);
				PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] = INVALID_VEHICLE_ID;
				ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Comprar vehículo", dialog, "Salir", "");
				return 1;
			}

			if (SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_EXTRA] > ACCOUNT_INFO[playerid][ac_SD])
			{
				format(str, sizeof str, "{dc0606}Te faltan %d "SERVER_COIN" para poder comprar este vehículo.", SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_EXTRA] - ACCOUNT_INFO[playerid][ac_SD]);
				strcat(dialog, str);
				PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] = INVALID_VEHICLE_ID;
				ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Comprar vehículo", dialog, "Salir", "");
				return 1;
			}

			if (!SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_EXTRA]) format(str, sizeof str, "Balance de tu cuenta bancaria: %s$\nBalance tras la compra: %s$\n\n¿De verdad desea comprar este vehículo?", number_format_thousand(BANK_ACCOUNT[playerid][bank_account_BALANCE]), number_format_thousand(BANK_ACCOUNT[playerid][bank_account_BALANCE] - SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_PRICE]));
			else format(str, sizeof str, "Tus monedas: %d "SERVER_COIN"\nMonedas tras la compra: %d "SERVER_COIN"\n\n¿De verdad desea comprar este vehículo?", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_SD] - SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_EXTRA]);
			strcat(dialog, str);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Comprar vehículo", dialog, "Comprar", "Salir");
			return 1;
		}
		case DIALOG_NOTARY:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Notaría",
				"Vender una propiedad al banco\n\
				Vender un vehículo al banco\n\
				Vender una propiedad a una persona\n\
				Vender un vehículo a una persona", "Ver", "Cerrar");
			return 1;
		}
		case DIALOG_NOTARY_SELECT_PROPERTY:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[45 * (MAX_SU_PROPERTIES + 2)];
			format(dialog, sizeof dialog, ""COL_WHITE"Propiedad\n");

			new DBResult:Result, DB_Query[80];
			format(DB_Query, sizeof DB_Query, "SELECT * FROM `PROPERTY_OWNER` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result) == 0) strcat(dialog, ""COL_WHITE"No tienes propiedades");
			else
			{
				new line_str[45], properties;
				for(new i; i < db_num_rows(Result); i++ )
				{
					if (properties >= MAX_SU_PROPERTIES) break;

					new property_name[24];
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][properties] = db_get_field_assoc_int(Result, "ID_PROPERTY");
					db_get_field_assoc(Result, "PROPERTY_NAME", property_name, 24);

					format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\n", properties + 1, property_name);
					strcat(dialog, line_str);

					properties ++;
					db_next_row(Result);
				}
			}
			db_free_result(Result);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Selecciona la propiedad", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PROPERTY_BANK_SELL:
		{
			new caption[40];
			format(caption, sizeof caption, ""COL_RED"Vender - %s", PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_NAME]);

			new Float:price, payment;
			price = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_PRICE_BASE];
			if (ACCOUNT_INFO[playerid][ac_SU]) payment = floatround( floatmul(price, 0.70) );
			else payment = floatround( floatmul(price, 0.70) );

			new dialog[160];
			format(dialog, sizeof dialog, ""COL_WHITE"Precio en mercado: %s$\nNosotros te pagaremos: %s$\n\n¿Está seguro de que quiere venderla?", number_format_thousand(PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_PRICE]), number_format_thousand(payment));
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, caption, dialog, "Vender", "Atrás");
			return 1;
		}
		case DIALOG_PROPERTY_SELL_PRICE:
		{
			new caption[40];
			format(caption, sizeof caption, ""COL_RED"Vender - %s", PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_NAME]);

			new Float:price, min_price, max_price;
			price = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_PRICE];
			min_price = floatround( floatmul(price, 0.15) );
			max_price = floatround( floatmul(price, 6.0) );

			new dialog[250];
			format(dialog, sizeof dialog,
			""COL_WHITE"Precio en mercado: %s$\n\nPrecio mínimo de venta: %s$\nPrecio máximo de venta: %s$\n\n¿Por cuánto quieres vender esta propiedad?",
			number_format_thousand(PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_PRICE]),
			number_format_thousand(min_price),
			number_format_thousand(max_price));
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PROPERTY_SELL_TO_PLAYER:
		{
			new caption[40];
			format(caption, sizeof caption, ""COL_RED"Vender - %s", PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_NAME]);

			new dialog[250];
			format(dialog, sizeof dialog, ""COL_WHITE"Quieres vender esta propiedad por %s$.\n\nIndica el nombre o playerid del comprador.\nEl comprador debe estar en la sala y cumplir todos los requisitos.", number_format_thousand(PLAYER_TEMP[playerid][py_NOTARY_PRICE]));

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_SELL_CONFIRM_PROPERTY:
		{
			new dialog[240];
			format(dialog, sizeof dialog,
				""COL_WHITE"%s te quiere vender una propiedad.\n\n\
				Propiedad: %d\n\
				Precio: %s$\n\n\
				Balance tras la compra: %s$\n\n\
				¿Quieres comprar esta propiedad?",
				PLAYER_TEMP[ PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] ][py_RP_NAME],
				PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID],
				number_format_thousand(PLAYER_TEMP[playerid][py_NOTARY_PRICE]),
				number_format_thousand( BANK_ACCOUNT[playerid][bank_account_BALANCE] - PLAYER_TEMP[playerid][py_NOTARY_PRICE] )
			);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Oferta recibida", dialog, "Comprar", "Salir");
			return 1;
		}
		case DIALOG_NOTARY_SELECT_VEHICLE:
		{
			for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[95 * (MAX_SU_VEHICLES + 2)], total_vehicles;
			format(dialog, sizeof dialog, ""COL_WHITE"Vehículo\t"COL_RED"Matrícula\n");
			for(new i = 0; i != MAX_VEHICLES; i ++)
			{
				if (!GLOBAL_VEHICLES[i][gb_vehicle_VALID]) continue;
				if (!PLAYER_VEHICLES[i][player_vehicle_VALID]) continue;
				if (total_vehicles > MAX_SU_VEHICLES) break;

				if (PLAYER_VEHICLES[i][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
				{
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][total_vehicles] = i;

					new line_str[95];
					format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_RED"%s\n", total_vehicles + 1, VEHICLE_INFO[ GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME], GLOBAL_VEHICLES[i][gb_vehicle_NUMBER_PLATE]);
					strcat(dialog, line_str);
					total_vehicles ++;
				}
			}
			if (total_vehicles == 0) strcat(dialog, ""COL_WHITE"No tienes vehículos");

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Selecciona el vehículo", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_VEHICLE_BANK_SELL:
		{
			new caption[40];
			format(caption, sizeof caption, ""COL_RED"Vender - %s", VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]);

			new Float:price, payment;
			price = VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][gb_vehicle_MODELID] - 400 ][vehicle_info_PRICE];
			if (ACCOUNT_INFO[playerid][ac_SU]) payment = floatround( floatmul(price, 0.70) );
			else payment = floatround( floatmul(price, 0.70) );

			new dialog[160];
			format(dialog, sizeof dialog, ""COL_WHITE"Precio en mercado: %s$\nNosotros te pagaremos: %s$\n\n¿Está seguro de que quiere venderlo?", number_format_thousand( VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][gb_vehicle_MODELID] - 400 ][vehicle_info_PRICE] ), number_format_thousand(payment));
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, caption, dialog, "Vender", "Atrás");
			return 1;
		}
		case DIALOG_VEHICLE_SELL_PRICE:
		{
			new caption[40];
			format(caption, sizeof caption, ""COL_RED"Vender - %s", VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]);

			new Float:price, min_price, max_price;
			price = VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][gb_vehicle_MODELID] - 400 ][vehicle_info_PRICE];
			min_price = floatround( floatmul(price, 0.15) );
			max_price = floatround( floatmul(price, 6.0) );

			new dialog[250];
			format(dialog, sizeof dialog,
			""COL_WHITE"Precio en mercado: %s$\n\nPrecio mínimo de venta: %s$\nPrecio máximo de venta: %s$\n\n¿Por cuánto quieres vender este vehículo?",
			number_format_thousand(VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][gb_vehicle_MODELID] - 400 ][vehicle_info_PRICE]),
			number_format_thousand(min_price),
			number_format_thousand(max_price));
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_VEHICLE_SELL_TO_PLAYER:
		{
			new caption[40];
			format(caption, sizeof caption, ""COL_RED"Vender - %s", VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]);

			new dialog[250];
			format(dialog, sizeof dialog, ""COL_WHITE"Quieres vender este vehículo por %s$.\n\nIndica el nombre o playerid del comprador.\nEl comprador debe estar en la sala y cumplir todos los requisitos.", number_format_thousand(PLAYER_TEMP[playerid][py_NOTARY_PRICE]));

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_SELL_CONFIRM_VEHICLE:
		{
			new dialog[300];
			format(dialog, sizeof dialog,
				""COL_WHITE"%s te quiere vender un vehículo.\n\n\
				"COL_WHITE"Vehículo: %s\n\
				"COL_WHITE"Matrícula: %s\n\
				"COL_WHITE"Precio:{df423d} %s$\n\n\
				"COL_WHITE"Balance tras la compra: "COL_GREEN"%s$\n\n\
				"COL_WHITE"¿Quieres comprar este vehículo?",
				PLAYER_TEMP[ PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] ][py_RP_NAME],
				VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME],
				GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][gb_vehicle_NUMBER_PLATE],
				number_format_thousand(PLAYER_TEMP[playerid][py_NOTARY_PRICE]),
				number_format_thousand( BANK_ACCOUNT[playerid][bank_account_BALANCE] - PLAYER_TEMP[playerid][py_NOTARY_PRICE] )
			);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Oferta recibida", dialog, "Comprar", "Salir");
			return 1;
		}
		case DIALOG_TUNING_MENU_PART:
		{
			new vehicleid = PLAYER_TEMP[playerid][py_SELECTED_MECHANIC_VEHICLE_ID];

			new caption[45];
			format(caption, sizeof caption, "Tuning - %s", VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]);

			new DBResult:Result, DB_Query[250], dialog[80 * TOTAL_TUNING_PARTS];
			format(DB_Query, sizeof DB_Query, "SELECT `COMPONENTS_INFO`.`PART`, `COMPONENTS_INFO`.`PIECES` FROM `COMPONENTS_INFO`, `VEHICLE_COMPONENTS` WHERE `VEHICLE_COMPONENTS`.`MODELID` = '%d' AND `VEHICLE_COMPONENTS`.`COMPONENT_ID` = `COMPONENTS_INFO`.`ID` GROUP BY `COMPONENTS_INFO`.`PART`;", GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID]);
			Result = db_query(Database, DB_Query);

			format(dialog, sizeof dialog, ""COL_WHITE"Categoría\tPiezas necesarias\tEstimación\n");

			if (db_num_rows(Result) == 0) strcat(dialog, "{666666}Este vehículo no se puede tunear");
			else
			{
				new line_str[80];
				for(new i; i < db_num_rows(Result); i++ )
				{
					if (i >= TOTAL_TUNING_PARTS)
					{
						printf("[debug]  Límite superado en array 'PLAYER_TUNING_MENU, dialog Parts' al intentar cargar de la base de datos.");
						break;
					}

					db_get_field_assoc(Result, "PART", PLAYER_TUNING_MENU[playerid][i][tuning_menu_NAME], 24);
					PLAYER_TUNING_MENU[playerid][i][tuning_menu_PIECES] = db_get_field_assoc_int(Result, "PIECES");
					format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_RED"%d\t{56CA2E}%s$\n", PLAYER_TUNING_MENU[playerid][i][tuning_menu_NAME], PLAYER_TUNING_MENU[playerid][i][tuning_menu_PIECES], number_format_thousand(PLAYER_TUNING_MENU[playerid][i][tuning_menu_PIECES] * 50));
					strcat(dialog, line_str);

					db_next_row(Result);
				}
			}
			db_free_result(Result);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_TUNING_MENU_COMPONENT:
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return 1;

			new DBResult:Result, DB_Query[300], dialog[40 * MAX_TUNING_PARTS_COMPONENTS];
			format(DB_Query, sizeof DB_Query, "SELECT `COMPONENTS_INFO`.`ID`, `COMPONENTS_INFO`.`NAME` FROM `COMPONENTS_INFO`, `VEHICLE_COMPONENTS` WHERE `COMPONENTS_INFO`.`PART` = '%s' AND `VEHICLE_COMPONENTS`.`MODELID` = '%d' AND `VEHICLE_COMPONENTS`.`COMPONENT_ID` = `COMPONENTS_INFO`.`ID`;", PLAYER_TEMP[playerid][py_TUNING_SELECTED_PART], GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID]);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result) == 0) printf("[ERROR] No hay componentes asignados en la base de datos");
			else
			{
				new line_str[40];
				for(new i; i < db_num_rows(Result); i++ )
				{
					if (i >= MAX_TUNING_PARTS_COMPONENTS)
					{
						printf("[debug]  Límite superado en array 'PLAYER_TUNING_MENU, dialog Partsnames' al intentar cargar de la base de datos.");
						break;
					}

					PLAYER_TUNING_MENU[playerid][i][tuning_menu_ID] = db_get_field_assoc_int(Result, "ID");
					db_get_field_assoc(Result, "NAME", PLAYER_TUNING_MENU[playerid][i][tuning_menu_NAME], 24);

					format(line_str, sizeof line_str, ""COL_WHITE"%s\n", PLAYER_TUNING_MENU[playerid][i][tuning_menu_NAME]);
					strcat(dialog, line_str);

					db_next_row(Result);
				}
			}
			db_free_result(Result);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Tunear", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_TUNING_SELECT_COL_SLOT:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Pintar vehículo", ""COL_WHITE"Color primario\n"COL_WHITE"Color secundario", "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_TUNING_SELECT_COLOR:
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return 1;

			new dialog[15 * (sizeof(VEHICLE_COLORS) + 1) ];
			for(new i = 0; i != sizeof VEHICLE_COLORS; i++)
			{
				new line_str[15];
				format(line_str, sizeof(line_str), "{%06x}%d\n", VEHICLE_COLORS[i] >>> 8, i);
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Pintar vehículo", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_TUNING_REMOVE:
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return 1;

			new dialog[80 * (MAX_VEHICLE_COMPONENTS + 2) ], listitem;

			for(new i = 0; i != MAX_VEHICLE_COMPONENTS; i ++)
			{
				if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_COMPONENTS][i]) continue;

				new DBResult:Result, DB_Query[60];
				format(DB_Query, sizeof DB_Query, "SELECT * FROM `COMPONENTS_INFO` WHERE `ID` = '%d';", GLOBAL_VEHICLES[vehicleid][gb_vehicle_COMPONENTS][i]);

				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					new part[24], name[24];
					db_get_field_assoc(Result, "PART", part, 24);
					db_get_field_assoc(Result, "NAME", name, 24);
					PLAYER_TUNING_MENU[playerid][listitem][tuning_menu_ID] = i;

					new line_str[80];
					format(line_str, sizeof line_str, ""COL_WHITE"%s > %s\n", part, name);
					strcat(dialog, line_str);
				}
				db_free_result(Result);
				listitem ++;
			}
			if (listitem == 0)
			{
				PLAYER_TUNING_MENU[playerid][listitem][tuning_menu_ID] = 0;
				strcat(dialog, ""COL_WHITE"Vehículo sin tunear");
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Componentes", dialog, "Eliminar", "Atrás");
			return 1;
		}
		case DIALOG_SEED_LIST:
		{
			new dialog[64 * (sizeof(seed_info) + 1)];
			format(dialog, sizeof dialog, ""COL_WHITE"Nombre\t"COL_WHITE"Precio por semilla\n");

			for(new i = 0; i != sizeof seed_info; i ++)
			{
				new line_str[64];
				format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_GREEN"%d$\n", seed_info[i][seed_info_NAME], seed_info[i][seed_info_PRICE]);
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Semillas", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_SEED_BUY:
		{
			new dialog[144];
			format(dialog, sizeof dialog, ""COL_WHITE"Ingresa la cantidad de semillas de %s que desea comprar.\nCada una vale "COL_GREEN"%d$"COL_WHITE".", seed_info[ PLAYER_TEMP[playerid][py_SELECTED_BUY_SEED_ID] ][seed_info_NAME], seed_info[ PLAYER_TEMP[playerid][py_SELECTED_BUY_SEED_ID] ][seed_info_PRICE]);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Semillas ", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLANT_PLANTS:
		{
			new dialog[95 * (sizeof(seed_info) + 1)];
			format(dialog, sizeof dialog, ""COL_WHITE"Planta\t"COL_WHITE"Semilla requerida\t"COL_WHITE"Semillas necesarias\n");

			for(new i = 0; i != sizeof plant_info; i ++)
			{
				new line_str[95];

				if (seed_info[i][seed_info_TYPE] == TYPE_LEGAL) format(line_str, sizeof line_str, "%s "COL_GREEN"(legal)\t"COL_WHITE"%s\t"COL_WHITE"%d\n", plant_info[i][plant_info_NAME], seed_info[i][seed_info_NAME], plant_info[i][plant_info_SEEDS]);
				else format(line_str, sizeof line_str, "%s "COL_ORANGE"(ilegal)\t"COL_WHITE"%s\t"COL_WHITE"%d\n", plant_info[i][plant_info_NAME], seed_info[i][seed_info_NAME], plant_info[i][plant_info_SEEDS]);

				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Plantar", dialog, "Selecc.", "Cerrar");
		}
		case DIALOG_BLACK_MARKET:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, "Mercado negro", "Comprar armas\nComprar munición", "Comprar", "Salir");
			return 1;
		}
		case DIALOG_BLACK_MARKET_WEAPONS:
		{
			new dialog[64 * (sizeof(BLACK_MARKT_WEAPONS) + 2)];
			format(dialog, sizeof dialog, ""COL_WHITE"Producto\t"COL_WHITE"Precio\n");

			for(new i = 0; i != sizeof BLACK_MARKT_WEAPONS; i ++)
			{
				new line_str[64];
				format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_GREEN"%s$\n", WEAPON_INFO[ BLACK_MARKT_WEAPONS[i][black_market_WEAPON_ID] ][weapon_info_NAME], number_format_thousand(BLACK_MARKT_WEAPONS[i][black_market_WEAPON_PRICE]));
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Armas", dialog, "Comprar", "Salir");
			return 1;
		}
		case DIALOG_BLACK_MARKET_AMMO_STOCK:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Cargadores", ""COL_WHITE"Producto\t"COL_WHITE"Precio\n\
				"COL_WHITE"Pistola\t"COL_GREEN"50$\n\
				"COL_WHITE"Subfusil\t"COL_GREEN"100$\n\
				"COL_WHITE"Rifle\t"COL_GREEN"400$\n\
				"COL_WHITE"Escopeta\t"COL_GREEN"250$\n", "Comprar", "Volver");
			return 1;
		}
		case DIALOG_BLACK_MARKET_SELECT_WEA:
		{
			for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[95 * 15], line_str[95], listitem;

			for(new i; i != 13; i ++)
			{
				if (!PLAYER_WEAPONS[playerid][i][player_weapon_VALID]) continue;

				format(line_str, sizeof line_str, ""COL_WHITE"%s\n", WEAPON_INFO[ PLAYER_WEAPONS[playerid][i][player_weapon_ID] ][weapon_info_NAME]);
				strcat(dialog, line_str);

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = i;
				listitem ++;
			}
			if (listitem == 0) strcat(dialog, ""COL_WHITE"No tienes armas");

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Seleccionar arma", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_BLACK_MARKET_AMMO:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Balas", ""COL_WHITE"Cantidad\t"COL_WHITE"Precio\n\
				"COL_WHITE"50 Balas\t"COL_GREEN"450$\n\
				"COL_WHITE"100 Balas\t"COL_GREEN"650$\n\
				"COL_WHITE"200 Balas\t"COL_GREEN"850$\n\
				"COL_WHITE"300 Balas\t"COL_GREEN"1350$\n", "Comprar", "Volver");
			return 1;
		}
		case DIALOG_SELECT_POLICE_SKIN:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[60 * sizeof(POLICE_SKINS)], line_str[60], listitem;
			format(dialog, sizeof dialog, ""COL_WHITE"Ropa\t"COL_WHITE"Rango necesario\n");
			for(new i = 0; i != sizeof POLICE_SKINS; i ++)
			{
				if (POLICE_SKINS[i][police_skin_TYPE] != CHARACTER_INFO[playerid][ch_SEX]) continue;

				if (POLICE_SKINS[i][police_skin_RANK] > PLAYER_SKILLS[playerid][WORK_POLICE]) format(line_str, sizeof line_str, "{666666}%d\t{666666}%s\n", POLICE_SKINS[i][police_skin_SKIN], POLICE_RANKS[ POLICE_SKINS[i][police_skin_RANK] ]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d\t"COL_WHITE"%s\n", POLICE_SKINS[i][police_skin_SKIN], POLICE_RANKS[ POLICE_SKINS[i][police_skin_RANK] ]);
				strcat(dialog, line_str);

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = i;
				listitem ++;
			}
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_LIGHT_BLUE"Seleccionar skin", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_POLICE_RADIOS:
		{
			new dialog[45 * 6], line_str[45];
			for(new i = 0; i != 6; i ++)
			{
				new players = CountPoliceRadioPlayers(i);

				if (PLAYER_TEMP[playerid][py_POLICE_RADIO] == i) format(line_str, sizeof line_str, ""COL_WHITE"Frecuencia %d: %d personas\n", i + 1, players);
				else format(line_str, sizeof line_str, "{666666}Frecuencia %d: %d personas\n", i, players);

				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, "Selecciona la frecuencia", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_POLICE_LIST:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[128 * 15],
				listitem,
				start_pos = PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] + 1;

			format(dialog, sizeof dialog, ""COL_WHITE"Nombre\t"COL_WHITE"Rango\t"COL_WHITE"Últ. conexión\n");

			new DBResult:Result, DB_Query[600];
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`ID`, `ACCOUNTS`.`NAME`, `ACCOUNTS`.`LAST_CONNECTION`, `ACCOUNTS`.`CONNECTED`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS`, `PLAYER_WORKS` WHERE `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_WORKS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`SET` = '1' ORDER BY `ACCOUNTS`.`CONNECTED` DESC, `PLAYER_SKILLS`.`TOTAL` DESC LIMIT %d, %d;", WORK_POLICE, WORK_POLICE, PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				new name[24],
					last_connection[24],
					connected,
					rank;

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = db_get_field_assoc_int(Result, "ID");	
				db_get_field_assoc(Result, "NAME", name, 24);
				db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 24);
				connected = db_get_field_assoc_int(Result, "CONNECTED");
				rank = db_get_field_assoc_int(Result, "TOTAL");

				new line_str[128];
				if (connected) format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t{82F11A}•\n", start_pos + listitem, name, POLICE_RANKS[rank]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", start_pos + listitem, name, POLICE_RANKS[rank], last_connection);

				strcat(dialog, line_str);
				listitem ++;
				db_next_row(Result);
			}
			
			db_free_result(Result);
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -2;

			strcat(dialog, "{c9c9c9}- Siguiente\n"); listitem ++;
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -3;

			strcat(dialog, "{c9c9c9}- Anterior\n"); listitem ++;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_LIGHT_BLUE"Policías", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_MAFIA_LIST:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[128 * 15],
				listitem,
				start_pos = PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] + 1;

			format(dialog, sizeof dialog, ""COL_WHITE"Nombre\t"COL_WHITE"Rango\t"COL_WHITE"Últ. conexión\n");

			new DBResult:Result, DB_Query[600];
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`ID`, `ACCOUNTS`.`NAME`, `ACCOUNTS`.`LAST_CONNECTION`, `ACCOUNTS`.`CONNECTED`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS`, `PLAYER_WORKS` WHERE `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_WORKS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`SET` = '1' ORDER BY `ACCOUNTS`.`CONNECTED` DESC, `PLAYER_SKILLS`.`TOTAL` DESC LIMIT %d, %d;", WORK_MAFIA, WORK_MAFIA, PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				new name[24],
					last_connection[24],
					connected,
					rank;

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = db_get_field_assoc_int(Result, "ID");	
				db_get_field_assoc(Result, "NAME", name, 24);
				db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 24);
				connected = db_get_field_assoc_int(Result, "CONNECTED");
				rank = db_get_field_assoc_int(Result, "TOTAL");

				new line_str[128];
				if (connected) format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t{82F11A}•\n", start_pos + listitem, name, MAFIA_RANKS[rank]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", start_pos + listitem, name, MAFIA_RANKS[rank], last_connection);

				strcat(dialog, line_str);
				listitem ++;
				db_next_row(Result);
			}
			
			db_free_result(Result);
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -2;

			strcat(dialog, "{c9c9c9}- Siguiente\n"); listitem ++;
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -3;

			strcat(dialog, "{c9c9c9}- Anterior\n"); listitem ++;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Family SaintBlood'S", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_MAFIA_MODIFY:
		{
			new DBResult:Result, DB_Query[256], name[24], current_rank, bool:found;
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_MAFIA);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result))
			{
				db_get_field_assoc(Result, "NAME", name, 24);
				current_rank = db_get_field_assoc_int(Result, "TOTAL");
				found = true;
			}
			else found = false;
			db_free_result(Result);

			if (!found) return 1;
			if (current_rank > PLAYER_SKILLS[playerid][WORK_MAFIA])
			{
				ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);
				return 1;
			}

			new caption[45];
			format(caption, sizeof caption, ""COL_RED"%s", name);

			new dialog[45 * sizeof(MAFIA_RANKS)], line_str[45];
			format(dialog, sizeof dialog, ""COL_WHITE"Civil (eliminar)\n");

			for(new i = 1; i != sizeof MAFIA_RANKS; i ++)
			{
				if (i > PLAYER_SKILLS[playerid][WORK_MAFIA])
				{
					if (current_rank == i) format(line_str, sizeof line_str, "{666666}%s (actual)\n", MAFIA_RANKS[i]);
					else format(line_str, sizeof line_str, "{666666}%s\n", MAFIA_RANKS[i]);
				}
				else
				{
					if (current_rank == i) format(line_str, sizeof line_str, ""COL_WHITE"%s (actual)\n", MAFIA_RANKS[i]);
					else format(line_str, sizeof line_str, ""COL_WHITE"%s\n", MAFIA_RANKS[i]);
				}
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_ENEMY_MAFIA_LIST:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[128 * 15],
				listitem,
				start_pos = PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] + 1;

			format(dialog, sizeof dialog, ""COL_WHITE"Nombre\t"COL_WHITE"Rango\t"COL_WHITE"Últ. conexión\n");

			new DBResult:Result, DB_Query[600];
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`ID`, `ACCOUNTS`.`NAME`, `ACCOUNTS`.`LAST_CONNECTION`, `ACCOUNTS`.`CONNECTED`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS`, `PLAYER_WORKS` WHERE `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_WORKS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`SET` = '1' ORDER BY `ACCOUNTS`.`CONNECTED` DESC, `PLAYER_SKILLS`.`TOTAL` DESC LIMIT %d, %d;", WORK_ENEMY_MAFIA, WORK_ENEMY_MAFIA, PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				new name[24],
					last_connection[24],
					connected,
					rank;

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = db_get_field_assoc_int(Result, "ID");	
				db_get_field_assoc(Result, "NAME", name, 24);
				db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 24);
				connected = db_get_field_assoc_int(Result, "CONNECTED");
				rank = db_get_field_assoc_int(Result, "TOTAL");

				new line_str[128];
				if (connected) format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t{82F11A}•\n", start_pos + listitem, name, ENEMY_MAFIA_RANKS[rank]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", start_pos + listitem, name, ENEMY_MAFIA_RANKS[rank], last_connection);

				strcat(dialog, line_str);
				listitem ++;
				db_next_row(Result);
			}
			
			db_free_result(Result);
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -2;

			strcat(dialog, "{c9c9c9}- Siguiente\n"); listitem ++;
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -3;

			strcat(dialog, "{c9c9c9}- Anterior\n"); listitem ++;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, "{f5e30a}Triade di San Andreas", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_ENEMY_MAFIA_MODIFY:
		{
			new DBResult:Result, DB_Query[256], name[24], current_rank, bool:found;
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_ENEMY_MAFIA);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result))
			{
				db_get_field_assoc(Result, "NAME", name, 24);
				current_rank = db_get_field_assoc_int(Result, "TOTAL");
				found = true;
			}
			else found = false;
			db_free_result(Result);

			if (!found) return 1;
			if (current_rank > PLAYER_SKILLS[playerid][WORK_ENEMY_MAFIA])
			{
				ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);
				return 1;
			}

			new caption[45];
			format(caption, sizeof caption, ""COL_RED"%s", name);

			new dialog[45 * sizeof(ENEMY_MAFIA_RANKS)], line_str[45];
			format(dialog, sizeof dialog, ""COL_WHITE"Civil (eliminar)\n");

			for(new i = 1; i != sizeof ENEMY_MAFIA_RANKS; i ++)
			{
				if (i > PLAYER_SKILLS[playerid][WORK_ENEMY_MAFIA])
				{
					if (current_rank == i) format(line_str, sizeof line_str, "{666666}%s (actual)\n", ENEMY_MAFIA_RANKS[i]);
					else format(line_str, sizeof line_str, "{666666}%s\n", ENEMY_MAFIA_RANKS[i]);
				}
				else
				{
					if (current_rank == i) format(line_str, sizeof line_str, ""COL_WHITE"%s (actual)\n", ENEMY_MAFIA_RANKS[i]);
					else format(line_str, sizeof line_str, ""COL_WHITE"%s\n", ENEMY_MAFIA_RANKS[i]);
				}
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_OSBORN_MAFIA_LIST:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[128 * 15],
				listitem,
				start_pos = PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] + 1;

			format(dialog, sizeof dialog, ""COL_WHITE"Nombre\t"COL_WHITE"Rango\t"COL_WHITE"Últ. conexión\n");

			new DBResult:Result, DB_Query[600];
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`ID`, `ACCOUNTS`.`NAME`, `ACCOUNTS`.`LAST_CONNECTION`, `ACCOUNTS`.`CONNECTED`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS`, `PLAYER_WORKS` WHERE `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_WORKS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`SET` = '1' ORDER BY `ACCOUNTS`.`CONNECTED` DESC, `PLAYER_SKILLS`.`TOTAL` DESC LIMIT %d, %d;", WORK_OSBORN, WORK_OSBORN, PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				new name[24],
					last_connection[24],
					connected,
					rank;

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = db_get_field_assoc_int(Result, "ID");	
				db_get_field_assoc(Result, "NAME", name, 24);
				db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 24);
				connected = db_get_field_assoc_int(Result, "CONNECTED");
				rank = db_get_field_assoc_int(Result, "TOTAL");

				new line_str[128];
				if (connected) format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t{82F11A}•\n", start_pos + listitem, name, OSBORN_RANKS[rank]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", start_pos + listitem, name, OSBORN_RANKS[rank], last_connection);

				strcat(dialog, line_str);
				listitem ++;
				db_next_row(Result);
			}
			
			db_free_result(Result);
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -2;

			strcat(dialog, "{c9c9c9}- Siguiente\n"); listitem ++;
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -3;

			strcat(dialog, "{c9c9c9}- Anterior\n"); listitem ++;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, "{3a3eab}Familia Osborn", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_OSBORN_MAFIA_MODIFY:
		{
			new DBResult:Result, DB_Query[256], name[24], current_rank, bool:found;
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_OSBORN);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result))
			{
				db_get_field_assoc(Result, "NAME", name, 24);
				current_rank = db_get_field_assoc_int(Result, "TOTAL");
				found = true;
			}
			else found = false;
			db_free_result(Result);

			if (!found) return 1;
			if (current_rank > PLAYER_SKILLS[playerid][WORK_OSBORN])
			{
				ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);
				return 1;
			}

			new caption[45];
			format(caption, sizeof caption, ""COL_RED"%s", name);

			new dialog[45 * sizeof(OSBORN_RANKS)], line_str[45];
			format(dialog, sizeof dialog, ""COL_WHITE"Civil (eliminar)\n");

			for(new i = 1; i != sizeof OSBORN_RANKS; i ++)
			{
				if (i > PLAYER_SKILLS[playerid][WORK_OSBORN])
				{
					if (current_rank == i) format(line_str, sizeof line_str, "{666666}%s (actual)\n", OSBORN_RANKS[i]);
					else format(line_str, sizeof line_str, "{666666}%s\n", OSBORN_RANKS[i]);
				}
				else
				{
					if (current_rank == i) format(line_str, sizeof line_str, ""COL_WHITE"%s (actual)\n", OSBORN_RANKS[i]);
					else format(line_str, sizeof line_str, ""COL_WHITE"%s\n", OSBORN_RANKS[i]);
				}
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_CONNOR_MAFIA_LIST:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[128 * 15],
				listitem,
				start_pos = PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] + 1;

			format(dialog, sizeof dialog, ""COL_WHITE"Nombre\t"COL_WHITE"Rango\t"COL_WHITE"Últ. conexión\n");

			new DBResult:Result, DB_Query[600];
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`ID`, `ACCOUNTS`.`NAME`, `ACCOUNTS`.`LAST_CONNECTION`, `ACCOUNTS`.`CONNECTED`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS`, `PLAYER_WORKS` WHERE `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_WORKS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`SET` = '1' ORDER BY `ACCOUNTS`.`CONNECTED` DESC, `PLAYER_SKILLS`.`TOTAL` DESC LIMIT %d, %d;", WORK_CONNOR, WORK_CONNOR, PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				new name[24],
					last_connection[24],
					connected,
					rank;

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = db_get_field_assoc_int(Result, "ID");	
				db_get_field_assoc(Result, "NAME", name, 24);
				db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 24);
				connected = db_get_field_assoc_int(Result, "CONNECTED");
				rank = db_get_field_assoc_int(Result, "TOTAL");

				new line_str[128];
				if (connected) format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t{82F11A}•\n", start_pos + listitem, name, CONNOR_RANKS[rank]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", start_pos + listitem, name, CONNOR_RANKS[rank], last_connection);

				strcat(dialog, line_str);
				listitem ++;
				db_next_row(Result);
			}
			
			db_free_result(Result);
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -2;

			strcat(dialog, "{c9c9c9}- Siguiente\n"); listitem ++;
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -3;

			strcat(dialog, "{c9c9c9}- Anterior\n"); listitem ++;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}The Family Connor", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_CONNOR_MAFIA_MODIFY:
		{
			new DBResult:Result, DB_Query[256], name[24], current_rank, bool:found;
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_CONNOR);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result))
			{
				db_get_field_assoc(Result, "NAME", name, 24);
				current_rank = db_get_field_assoc_int(Result, "TOTAL");
				found = true;
			}
			else found = false;
			db_free_result(Result);

			if (!found) return 1;
			if (current_rank > PLAYER_SKILLS[playerid][WORK_CONNOR])
			{
				ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);
				return 1;
			}

			new caption[45];
			format(caption, sizeof caption, ""COL_RED"%s", name);

			new dialog[45 * sizeof(CONNOR_RANKS)], line_str[45];
			format(dialog, sizeof dialog, ""COL_WHITE"Civil (eliminar)\n");

			for(new i = 1; i != sizeof CONNOR_RANKS; i ++)
			{
				if (i > PLAYER_SKILLS[playerid][WORK_CONNOR])
				{
					if (current_rank == i) format(line_str, sizeof line_str, "{666666}%s (actual)\n", CONNOR_RANKS[i]);
					else format(line_str, sizeof line_str, "{666666}%s\n", CONNOR_RANKS[i]);
				}
				else
				{
					if (current_rank == i) format(line_str, sizeof line_str, ""COL_WHITE"%s (actual)\n", CONNOR_RANKS[i]);
					else format(line_str, sizeof line_str, ""COL_WHITE"%s\n", CONNOR_RANKS[i]);
				}
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_DIVISO_MAFIA_LIST:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[128 * 15],
				listitem,
				start_pos = PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] + 1;

			format(dialog, sizeof dialog, ""COL_WHITE"Nombre\t"COL_WHITE"Rango\t"COL_WHITE"Últ. conexión\n");

			new DBResult:Result, DB_Query[600];
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`ID`, `ACCOUNTS`.`NAME`, `ACCOUNTS`.`LAST_CONNECTION`, `ACCOUNTS`.`CONNECTED`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS`, `PLAYER_WORKS` WHERE `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_WORKS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`SET` = '1' ORDER BY `ACCOUNTS`.`CONNECTED` DESC, `PLAYER_SKILLS`.`TOTAL` DESC LIMIT %d, %d;", WORK_DIVISO, WORK_DIVISO, PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				new name[24],
					last_connection[24],
					connected,
					rank;

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = db_get_field_assoc_int(Result, "ID");	
				db_get_field_assoc(Result, "NAME", name, 24);
				db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 24);
				connected = db_get_field_assoc_int(Result, "CONNECTED");
				rank = db_get_field_assoc_int(Result, "TOTAL");

				new line_str[128];
				if (connected) format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t{82F11A}•\n", start_pos + listitem, name, DIVISO_RANKS[rank]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", start_pos + listitem, name, DIVISO_RANKS[rank], last_connection);

				strcat(dialog, line_str);
				listitem ++;
				db_next_row(Result);
			}
			
			db_free_result(Result);
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -2;

			strcat(dialog, "{c9c9c9}- Siguiente\n"); listitem ++;
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -3;

			strcat(dialog, "{c9c9c9}- Anterior\n"); listitem ++;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, "{E55B5B}Guns N' Roses", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_DIVISO_MAFIA_MODIFY:
		{
			new DBResult:Result, DB_Query[256], name[24], current_rank, bool:found;
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_DIVISO);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result))
			{
				db_get_field_assoc(Result, "NAME", name, 24);
				current_rank = db_get_field_assoc_int(Result, "TOTAL");
				found = true;
			}
			else found = false;
			db_free_result(Result);

			if (!found) return 1;
			if (current_rank > PLAYER_SKILLS[playerid][WORK_DIVISO])
			{
				ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);
				return 1;
			}

			new caption[45];
			format(caption, sizeof caption, ""COL_RED"%s", name);

			new dialog[45 * sizeof(DIVISO_RANKS)], line_str[45];
			format(dialog, sizeof dialog, ""COL_WHITE"Civil (eliminar)\n");

			for(new i = 1; i != sizeof DIVISO_RANKS; i ++)
			{
				if (i > PLAYER_SKILLS[playerid][WORK_DIVISO])
				{
					if (current_rank == i) format(line_str, sizeof line_str, "{666666}%s (actual)\n", DIVISO_RANKS[i]);
					else format(line_str, sizeof line_str, "{666666}%s\n", DIVISO_RANKS[i]);
				}
				else
				{
					if (current_rank == i) format(line_str, sizeof line_str, ""COL_WHITE"%s (actual)\n", DIVISO_RANKS[i]);
					else format(line_str, sizeof line_str, ""COL_WHITE"%s\n", DIVISO_RANKS[i]);
				}
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_SINDACCO_MAFIA_LIST:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[128 * 15],
				listitem,
				start_pos = PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] + 1;

			format(dialog, sizeof dialog, ""COL_WHITE"Nombre\t"COL_WHITE"Rango\t"COL_WHITE"Últ. conexión\n");

			new DBResult:Result, DB_Query[600];
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`ID`, `ACCOUNTS`.`NAME`, `ACCOUNTS`.`LAST_CONNECTION`, `ACCOUNTS`.`CONNECTED`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS`, `PLAYER_WORKS` WHERE `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_WORKS`.`ID_WORK` = '%d' AND `PLAYER_WORKS`.`SET` = '1' ORDER BY `ACCOUNTS`.`CONNECTED` DESC, `PLAYER_SKILLS`.`TOTAL` DESC LIMIT %d, %d;", WORK_SINDACCO, WORK_SINDACCO, PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				new name[24],
					last_connection[24],
					connected,
					rank;

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = db_get_field_assoc_int(Result, "ID");	
				db_get_field_assoc(Result, "NAME", name, 24);
				db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 24);
				connected = db_get_field_assoc_int(Result, "CONNECTED");
				rank = db_get_field_assoc_int(Result, "TOTAL");

				new line_str[128];
				if (connected) format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t{82F11A}•\n", start_pos + listitem, name, SINDACCO_RANKS[rank]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d %s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", start_pos + listitem, name, SINDACCO_RANKS[rank], last_connection);

				strcat(dialog, line_str);
				listitem ++;
				db_next_row(Result);
			}
			
			db_free_result(Result);
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -2;

			strcat(dialog, "{c9c9c9}- Siguiente\n"); listitem ++;
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -3;

			strcat(dialog, "{c9c9c9}- Anterior\n"); listitem ++;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}The Family Sindacco", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_SINDACCO_MAFIA_MODIFY:
		{
			new DBResult:Result, DB_Query[256], name[24], current_rank, bool:found;
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_SINDACCO);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result))
			{
				db_get_field_assoc(Result, "NAME", name, 24);
				current_rank = db_get_field_assoc_int(Result, "TOTAL");
				found = true;
			}
			else found = false;
			db_free_result(Result);

			if (!found) return 1;
			if (current_rank > PLAYER_SKILLS[playerid][WORK_SINDACCO])
			{
				ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);
				return 1;
			}

			new caption[45];
			format(caption, sizeof caption, ""COL_RED"%s", name);

			new dialog[45 * sizeof(SINDACCO_RANKS)], line_str[45];
			format(dialog, sizeof dialog, ""COL_WHITE"Civil (eliminar)\n");

			for(new i = 1; i != sizeof SINDACCO_RANKS; i ++)
			{
				if (i > PLAYER_SKILLS[playerid][WORK_SINDACCO])
				{
					if (current_rank == i) format(line_str, sizeof line_str, "{666666}%s (actual)\n", SINDACCO_RANKS[i]);
					else format(line_str, sizeof line_str, "{666666}%s\n", SINDACCO_RANKS[i]);
				}
				else
				{
					if (current_rank == i) format(line_str, sizeof line_str, ""COL_WHITE"%s (actual)\n", SINDACCO_RANKS[i]);
					else format(line_str, sizeof line_str, ""COL_WHITE"%s\n", SINDACCO_RANKS[i]);
				}
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_POLICE_MODIFY:
		{
			new DBResult:Result, DB_Query[256], name[24], current_rank, bool:found;
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_POLICE);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result))
			{
				db_get_field_assoc(Result, "NAME", name, 24);
				current_rank = db_get_field_assoc_int(Result, "TOTAL");
				found = true;
			}
			else found = false;
			db_free_result(Result);

			if (!found) return 1;
			if (current_rank > PLAYER_SKILLS[playerid][WORK_POLICE])
			{
				ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);
				return 1;
			}

			new caption[45];
			format(caption, sizeof caption, "Policía - %s", name);

			new dialog[45 * sizeof(POLICE_RANKS)], line_str[45];
			format(dialog, sizeof dialog, ""COL_WHITE"Civil (eliminar)\n");

			for(new i = 1; i != sizeof POLICE_RANKS; i ++)
			{
				if (i > PLAYER_SKILLS[playerid][WORK_POLICE])
				{
					if (current_rank == i) format(line_str, sizeof line_str, "{666666}%s (actual)\n", POLICE_RANKS[i]);
					else format(line_str, sizeof line_str, "{666666}%s\n", POLICE_RANKS[i]);
				}
				else
				{
					if (current_rank == i) format(line_str, sizeof line_str, ""COL_WHITE"%s (actual)\n", POLICE_RANKS[i]);
					else format(line_str, sizeof line_str, ""COL_WHITE"%s\n", POLICE_RANKS[i]);
				}
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_POLICE_SHOP:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Equiparse", ""COL_WHITE"Armas\nChaleco antibalas y vida\nBalas", "Comprar", "Salir");
			return 1;
		}
		case DIALOG_POLICE_SELECT_WEAPON:
		{
			for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[95 * 15], line_str[95], listitem;
			format(dialog, sizeof dialog, ""COL_WHITE"Arma\t{90C3D4}Munición\t"COL_WHITE"Slot\n");

			for(new i; i != 13; i ++)
			{
				if (!PLAYER_WEAPONS[playerid][i][player_weapon_VALID]) continue;

				format(line_str, sizeof line_str, ""COL_WHITE"%s\t{90C3D4}%s\t"COL_WHITE"%d\n", WEAPON_INFO[ PLAYER_WEAPONS[playerid][i][player_weapon_ID] ][weapon_info_NAME], number_format_thousand(PLAYER_WEAPONS[playerid][i][player_weapon_AMMO]), i);
				strcat(dialog, line_str);

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = i;
				listitem ++;
			}
			if (listitem == 0) strcat(dialog, "{666666}No tienes armas");

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, "Selecciona la arma a la que quieres comprarle munición", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_POLICE_AMMO:
		{
			new dialog[144];
			format(dialog, sizeof dialog, "Arma: %s\nMunición: %s\n\nEl precio por bala es de 2$\n¿Cuánto munición quiere comprar?", WEAPON_INFO[ PLAYER_WEAPONS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_DIALOG_WEAPON_SLOT] ][player_weapon_ID] ][weapon_info_NAME], number_format_thousand(PLAYER_WEAPONS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_DIALOG_WEAPON_SLOT] ][player_weapon_AMMO]));

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Comprar munición", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_POLICE_ARMOUR:
		{
			SetPlayerHealthEx(playerid, 100.0);
			SetPlayerArmourEx(playerid, 50.0);
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
			return 1;
		}
		case DIALOG_POLICE_WEAPONS:
		{
			new dialog[64 * (sizeof(POLICE_SHOP_WEAPONS) + 2)];
			format(dialog, sizeof dialog, ""COL_WHITE"Arma\t"COL_WHITE"Rango\n");

			for(new i = 0; i != sizeof POLICE_SHOP_WEAPONS; i ++)
			{
				new line_str[64];
				format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_WHITE"%s\n", WEAPON_INFO[ POLICE_SHOP_WEAPONS[i][police_shop_WEAPON_ID] ][weapon_info_NAME], POLICE_RANKS[ POLICE_SHOP_WEAPONS[i][police_shop_WEAPON_PRICE] ]);
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Armas", dialog, "Usar", "Salir");
			return 1;
		}
		case DIALOG_HELP_HELPER:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "Comandos administrativos - Ayudante",

				"\
					"COL_WHITE"/muteard \n\
					"COL_WHITE"/desmuteard \n\
				"
			, "Salir", "");
			return 1;
		}
		case DIALOG_HELP_MOD:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "Comandos administrativos - Moderador",

				"\
					"COL_WHITE"/trabajos  \n\
					"COL_WHITE"/getid  \n\
				"COL_WHITE"/getname  \n\
				"COL_WHITE"/aka  \n\
				"COL_WHITE"/adv  \n\
				"COL_WHITE"/kick  \n\
				"COL_WHITE"/spec  \n\
				"COL_WHITE"/specoff  \n\
				"COL_WHITE"/freeze  \n\
				"COL_WHITE"/unfreeze  \n\
				"
			, "Salir", "");
			return 1;
		}
		case DIALOG_HELP_SMOD:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "Comandos administrativos - Super Moderador",

				"\
					"COL_WHITE"/pest   \n\
					"COL_WHITE"/pinv   \n\
				"COL_WHITE"/pexp   \n\
				"COL_WHITE"/pbank   \n\
				"COL_WHITE"/unjail   \n\
				"COL_WHITE"/kick  \n\
				"COL_WHITE"/traerveh   \n\
				"COL_WHITE"/goto   \n\
				"COL_WHITE"/get   \n\
				"COL_WHITE"/jail    \n\
				"COL_WHITE"/ban    \n\
				"COL_WHITE"/tban    \n\
				"COL_WHITE"/dban    \n\
				"COL_WHITE"/dtban    \n\
				"COL_WHITE"/jetpack    \n\
				"COL_WHITE"/rac    \n\
				"COL_WHITE"/rac2    \n\
				"COL_WHITE"/deletead     \n\
				"COL_WHITE"/setthirst     \n\
				"COL_WHITE"/sethungry     \n\
				"COL_WHITE"/setgas     \n\
				"COL_WHITE"/repairveh     \n\
				"COL_WHITE"/lsdb     \n\
				"COL_WHITE"/revivir     \n\
				"COL_WHITE"/borrarop      \n\
				"
			, "Salir", "");
			return 1;
		}
		case DIALOG_HELP_OPER:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "Comandos administrativos - Operador de Juego",

				"\
					"COL_WHITE"/ip \n\
					"COL_WHITE"/cls  \n\
					"COL_WHITE"/pm  \n\
					"COL_WHITE"/settime  \n\
					"COL_WHITE"/sethealth  \n\
					"COL_WHITE"/setarmour  \n\
				"
			, "Salir", "");
			return 1;
		}
		case DIALOG_HELP_ADMIN:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, "Comandos administrativos - Administrador",

				"\
					"COL_WHITE"/asay  \n\
					"COL_WHITE"/spos  \n\
					"COL_WHITE"/v \n\
					"COL_WHITE"/restart  \n\
					"COL_WHITE"/setname  \n\
					"COL_WHITE"/exproperty  \n\
					"COL_WHITE"/gotoproperty  \n\
					"COL_WHITE"/setpass  \n\
					"COL_WHITE"/delete  \n\
					"COL_WHITE"/eco  \n\
					"COL_WHITE"/setfstyle  \n\
					"COL_WHITE"/admac  \n\
				"
			, "Salir", "");
			return 1;
		}
		case DIALOG_HELP_SU:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Ayuda - VIP",

				"\
					"COL_WHITE"El VIP es una suscripción para obtener beneficios, puedes comprarlo con 12 "SERVER_COIN".\n\
					Si quieres adquirir "SERVER_COIN" puedes comprar en "COL_RED"www.hyaxe.com/hycoin"COL_WHITE" o comprándole a otro usuario.\n\n\
					"COL_RED"Ventajas del VIP:\n\
					"COL_WHITE"- Tener 6 vehículos.\n\
					"COL_WHITE"- Tener 10 accesorios.\n\
					"COL_WHITE"- Tener 6 propiedades.\n\
					"COL_WHITE"- No pagas seguro de propiedades y vehículos en el Payday.\n\
					"COL_WHITE"- Te recuperas el doble de rápido en el hospital.\n\
					"COL_WHITE"- Al recuperarte tu vida es del 100%.\n\
					"COL_WHITE"- Te pagaran más en algunos trabajos.\n\
					"COL_WHITE"- No pierdes chaleco al morir.\n\
					"COL_WHITE"- Rol especial en el Discord.\n\
					"COL_WHITE"- Acceso a contenido por anticipado.\n\
					"COL_WHITE"- Regalos secretos.\n\
					"COL_WHITE"- Desbloquear el acceso a propiedades y vehículos exclusivos.\n\
					\n\
					"COL_WHITE"Use el comando "COL_RED"/vip"COL_WHITE" si desea comprando.\n\
					\n\
				"

			, "Salir", "");
			return 1;
		}
		case DIALOG_ADMIN_LIST:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[128 * 15], listitem, start_pos = PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] + 1;
			format(dialog, sizeof dialog, ""COL_WHITE"Nombre\t"COL_WHITE"Rango\t"COL_WHITE"Últ. conexión\n");

			new DBResult:Result, DB_Query[400];
			format(DB_Query, sizeof DB_Query, "SELECT `ID`, `NAME`, `LAST_CONNECTION`, `CONNECTED`, `ADMIN_LEVEL` FROM `ACCOUNTS` WHERE `ADMIN_LEVEL` > 0 ORDER BY `CONNECTED` DESC, `ADMIN_LEVEL` DESC LIMIT %d, %d;", PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				new name[24], last_connection[24], connected, rank;

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = db_get_field_assoc_int(Result, "ID");
				db_get_field_assoc(Result, "NAME", name, 24);
				db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 24);
				connected = db_get_field_assoc_int(Result, "CONNECTED");
				rank = db_get_field_assoc_int(Result, "ADMIN_LEVEL");

				new line_str[128];
				if (connected) format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%s\t{82F11A}•\n", start_pos + listitem, name, ADMIN_LEVELS[rank]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", start_pos + listitem, name, ADMIN_LEVELS[rank], last_connection);

				strcat(dialog, line_str);
				listitem ++;

				db_next_row(Result);
			}
			db_free_result(Result);

			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -2;
			strcat(dialog, "{c9c9c9}- Siguiente\n"); listitem ++;

			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -3;
			strcat(dialog, "{c9c9c9}- Anterior\n"); listitem ++;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Hyaxe Staff", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_ADMIN_MODIFY:
		{
			new DBResult:Result, DB_Query[256], name[24], current_rank, bool:found;
			format(DB_Query, sizeof DB_Query, "SELECT `NAME`, `ADMIN_LEVEL` FROM `ACCOUNTS` WHERE `ID` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID]);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result))
			{
				db_get_field_assoc(Result, "NAME", name, 24);
				current_rank = db_get_field_assoc_int(Result, "ADMIN_LEVEL");
				found = true;
			}
			else found = false;
			db_free_result(Result);

			if (!found) return 1;
			if (current_rank > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
			{
			    ShowPlayerMessage(playerid, "~r~No puedes modificar el rango de este admin porque es un rango superior al tuyo.", 3);
				return 1;
			}

			new caption[45];
			format(caption, sizeof caption, ""COL_RED"%s", name);

			new dialog[45 * sizeof(ADMIN_LEVELS)], line_str[45];
			format(dialog, sizeof dialog, ""COL_WHITE"Normal (eliminar)\n");

			for(new i = 1; i != sizeof ADMIN_LEVELS; i ++)
			{
				if (i > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
				{
					if (current_rank == i) format(line_str, sizeof line_str, "{666666}%s (actual)\n", ADMIN_LEVELS[i]);
					else format(line_str, sizeof line_str, "{666666}%s\n", ADMIN_LEVELS[i]);
				}
				else
				{
					if (current_rank == i) format(line_str, sizeof line_str, ""COL_WHITE"%s (actual)\n", ADMIN_LEVELS[i]);
					else format(line_str, sizeof line_str, ""COL_WHITE"%s\n", ADMIN_LEVELS[i]);
				}
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_CHANGE_PASSWORD:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PASSWORD, ""COL_RED"Cambiar contraseña", ""COL_WHITE"Introduce tu contraseña actual.", "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_CHANGE_PASSWORD_PASS:
		{
			new dialog[128];
			format(dialog, sizeof dialog, ""COL_WHITE"Introduce tu nueva contraseña, recuerda que debe contener entre %d-%d caracteres.", MIN_PASS_LENGTH, MAX_PASS_LENGTH);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PASSWORD, ""COL_RED"Cambiar contraseña", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_ANTI_CHEAT:
		{
			if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < 4) return 0;

			new dialog[115 * sizeof(ac_Info) + 1], line_str[115];
			dialog = "Tipo\tEstado\tAccionar\tAcción\n";

			for(new i = 0; i != sizeof(ac_Info); i ++)
			{
				format(line_str, sizeof line_str, "%02d %s\t%s\t%d:%d\t%s\n", i, ac_Info[i][ac_Name], ac_Info[i][ac_Enabled] ? "Activado" : "Desactivado", ac_Info[i][ac_Detections], ac_Info[i][ac_Interval], ac_Info[i][ac_Kick] ? "Kick" : "Aviso");
				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Anti-Cheat", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_ANTI_CHEAT_MODIFY:
		{
			if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < 4) return 0;

			new caption[45], dialog[90];

			format(caption, sizeof caption, "ac %02d %s", PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM], ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Name]);
			format(dialog, sizeof dialog, "Estado\t%s\nAccionar\t(%d:%d)\nAccion\t%s", ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Enabled] ? "Activado" : "Desactivado", ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Detections], ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Interval], ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Kick] ? "Kick" : "Aviso");

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, caption, dialog, "Selecc.", "<<");
			return 1;
		}
		case DIALOG_ANTI_CHEAT_MODIFY_DETECT:
		{
			new caption[45], dialog[200];

			format(caption, sizeof caption, "ac %02d %s", PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM], ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Name]);
			format(dialog, sizeof dialog, "Estado actual de accioner en: (%d:%d)\n\nSintaxis: <detecciones>:<segundos>\nDeja segundos en 0 para que sea instantáneo.\n\nEjemplo de 2 detecciones en 10 segundos: 2:10", ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Detections], ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Interval]);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, caption, dialog, "Selecc.", "<<");
			return 1;
		}
		case DIALOG_SHOP_TOYS:
		{
			new subString[64];
    		static dialog_string[sizeof(Toys_Shop) * sizeof(subString)]; 

			for (new i; i < sizeof(Toys_Shop); i++)
			{
           		format(subString, sizeof(subString), "%i(0.0, 0.0, -50.0, 1.5)\t%s~n~~g~~h~$%i\n", Toys_Shop[i][shop_toy_modelid], Toys_Shop[i][shop_toy_model], Toys_Shop[i][shop_toy_price]);
            	strcat(dialog_string, subString);
        	}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar prendas", dialog_string, "Comprar", "Cerrar"); 
			return 1;
		}
		case DIALOG_SHOP_SKINS:
		{
			new subString[64];

			switch(ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE])
			{
				case INTERIOR_BINCO:
				{
					switch(CHARACTER_INFO[playerid][ch_SEX])
					{
						case SEX_MALE:
						{
							static dialog_string[sizeof(Binco_Shop_Male_Skins) * sizeof(subString)]; 

							for (new i; i < sizeof(Binco_Shop_Male_Skins); i++)
							{
								new cost = Binco_Shop_Male_Skins[i][2];

				           		format(subString, sizeof(subString), "%i\tID: %d~n~~g~~h~$%d\n", Binco_Shop_Male_Skins[i][0], Binco_Shop_Male_Skins[i][0], number_format_thousand(cost));
				            	strcat(dialog_string, subString);
				        	}

							ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar ropa", dialog_string, "Comprar", "Cerrar");
						}
						case SEX_FEMALE:
						{
							static dialog_string[sizeof(Binco_Shop_Female_Skins) * sizeof(subString)]; 

							for (new i; i < sizeof(Binco_Shop_Female_Skins); i++)
							{
								new cost = Binco_Shop_Female_Skins[i][2];

				           		format(subString, sizeof(subString), "%i\tID: %d~n~~g~~h~$%d\n", Binco_Shop_Female_Skins[i][0], Binco_Shop_Female_Skins[i][0], number_format_thousand(cost));
				            	strcat(dialog_string, subString);
				        	}

							ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar ropa", dialog_string, "Comprar", "Cerrar");
						}
					}
				}
				case INTERIOR_SUBURBAN:
				{
					switch(CHARACTER_INFO[playerid][ch_SEX])
					{
						case SEX_MALE:
						{
							static dialog_string[sizeof(Suburban_Shop_Male_Skins) * sizeof(subString)]; 

							for (new i; i < sizeof(Suburban_Shop_Male_Skins); i++)
							{
								new cost = Suburban_Shop_Male_Skins[i][2];

				           		format(subString, sizeof(subString), "%i\tID: %d~n~~g~~h~$%d\n", Suburban_Shop_Male_Skins[i][0], Suburban_Shop_Male_Skins[i][0], number_format_thousand(cost));
				            	strcat(dialog_string, subString);
				        	}

							ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar ropa", dialog_string, "Comprar", "Cerrar");
						}
						case SEX_FEMALE:
						{
							static dialog_string[sizeof(Suburban_Shop_Female_Skins) * sizeof(subString)]; 

							for (new i; i < sizeof(Suburban_Shop_Female_Skins); i++)
							{
								new cost = Suburban_Shop_Female_Skins[i][2];

				           		format(subString, sizeof(subString), "%i\tID: %d~n~~g~~h~$%d\n", Suburban_Shop_Female_Skins[i][0], Suburban_Shop_Female_Skins[i][0], number_format_thousand(cost));
				            	strcat(dialog_string, subString);
				        	}

							ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar ropa", dialog_string, "Comprar", "Cerrar");
						}
					}
				}
				case INTERIOR_PROLAPS:
				{
					switch(CHARACTER_INFO[playerid][ch_SEX])
					{
						case SEX_MALE:
						{
							static dialog_string[sizeof(Prolaps_Shop_Male_Skins) * sizeof(subString)]; 

							for (new i; i < sizeof(Prolaps_Shop_Male_Skins); i++)
							{
								new cost = Prolaps_Shop_Male_Skins[i][2];

				           		format(subString, sizeof(subString), "%i\tID: %d~n~~g~~h~$%d\n", Prolaps_Shop_Male_Skins[i][0], Prolaps_Shop_Male_Skins[i][0], number_format_thousand(cost));
				            	strcat(dialog_string, subString);
				        	}

							ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar ropa", dialog_string, "Comprar", "Cerrar");
						}
						case SEX_FEMALE:
						{
							static dialog_string[sizeof(Prolaps_Shop_Female_Skins) * sizeof(subString)]; 

							for (new i; i < sizeof(Prolaps_Shop_Female_Skins); i++)
							{
								new cost = Prolaps_Shop_Female_Skins[i][2];

				           		format(subString, sizeof(subString), "%i\tID: %d~n~~g~~h~$%d\n", Prolaps_Shop_Female_Skins[i][0], Prolaps_Shop_Female_Skins[i][0], number_format_thousand(cost));
				            	strcat(dialog_string, subString);
				        	}

							ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar ropa", dialog_string, "Comprar", "Cerrar");
						}
					}
				}
				case INTERIOR_DIDIER_SACHS:
				{
					switch(CHARACTER_INFO[playerid][ch_SEX])
					{
						case SEX_MALE:
						{
							static dialog_string[sizeof(Didier_Shop_Male_Skins) * sizeof(subString)]; 

							for (new i; i < sizeof(Didier_Shop_Male_Skins); i++)
							{
								new cost = Didier_Shop_Male_Skins[i][2];

				           		format(subString, sizeof(subString), "%i\tID: %d~n~~g~~h~$%d\n", Didier_Shop_Male_Skins[i][0], Didier_Shop_Male_Skins[i][0], number_format_thousand(cost));
				            	strcat(dialog_string, subString);
				        	}

							ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar ropa", dialog_string, "Comprar", "Cerrar");
						}
						case SEX_FEMALE:
						{
							static dialog_string[sizeof(Didier_Shop_Female_Skins) * sizeof(subString)]; 

							for (new i; i < sizeof(Didier_Shop_Female_Skins); i++)
							{
								new cost = Didier_Shop_Female_Skins[i][2];

				           		format(subString, sizeof(subString), "%i\tID: %d~n~~g~~h~$%d\n", Didier_Shop_Female_Skins[i][0], Didier_Shop_Female_Skins[i][0], number_format_thousand(cost));
				            	strcat(dialog_string, subString);
				        	}

							ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar ropa", dialog_string, "Comprar", "Cerrar");
						}
					}
				}
				case INTERIOR_VICTIM:
				{
					switch(CHARACTER_INFO[playerid][ch_SEX])
					{
						case SEX_MALE:
						{
							static dialog_string[sizeof(Victim_Shop_Male_Skins) * sizeof(subString)]; 

							for (new i; i < sizeof(Victim_Shop_Male_Skins); i++)
							{
								new cost = Victim_Shop_Male_Skins[i][2];

				           		format(subString, sizeof(subString), "%i\tID: %d~n~~g~~h~$%d\n", Victim_Shop_Male_Skins[i][0], Victim_Shop_Male_Skins[i][0], number_format_thousand(cost));
				            	strcat(dialog_string, subString);
				        	}

							ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar ropa", dialog_string, "Comprar", "Cerrar");
						}
						case SEX_FEMALE:
						{
							static dialog_string[sizeof(Victim_Shop_Female_Skins) * sizeof(subString)]; 

							for (new i; i < sizeof(Victim_Shop_Female_Skins); i++)
							{
								new cost = Victim_Shop_Female_Skins[i][2];

				           		format(subString, sizeof(subString), "%i\tID: %d~n~~g~~h~$%d\n", Victim_Shop_Female_Skins[i][0], Victim_Shop_Female_Skins[i][0], number_format_thousand(cost));
				            	strcat(dialog_string, subString);
				        	}

							ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar ropa", dialog_string, "Comprar", "Cerrar");
						}
					}
				}
				case INTERIOR_ZIP:
				{
					switch(CHARACTER_INFO[playerid][ch_SEX])
					{
						case SEX_MALE:
						{
							static dialog_string[sizeof(Zip_Shop_Male_Skins) * sizeof(subString)]; 

							for (new i; i < sizeof(Zip_Shop_Male_Skins); i++)
							{
								new cost = Zip_Shop_Male_Skins[i][2];

				           		format(subString, sizeof(subString), "%i\tID: %d~n~~g~~h~$%d\n", Zip_Shop_Male_Skins[i][0], Zip_Shop_Male_Skins[i][0], number_format_thousand(cost));
				            	strcat(dialog_string, subString);
				        	}

							ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar ropa", dialog_string, "Comprar", "Cerrar");
						}
						case SEX_FEMALE:
						{
							static dialog_string[sizeof(Zip_Shop_Female_Skins) * sizeof(subString)]; 

							for (new i; i < sizeof(Zip_Shop_Female_Skins); i++)
							{
								new cost = Zip_Shop_Female_Skins[i][2];

				           		format(subString, sizeof(subString), "%i\tID: %d~n~~g~~h~$%d\n", Zip_Shop_Female_Skins[i][0], Zip_Shop_Female_Skins[i][0], number_format_thousand(cost));
				            	strcat(dialog_string, subString);
				        	}

							ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar ropa", dialog_string, "Comprar", "Cerrar");
						}
					}
				}
			}
			return 1;
		}
		case DIALOG_CLOTH_STORE:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Tienda de ropa", "Vestimenta\nAccesorios", "Ver", "Cerrar");
			return 1;
		}
		case DIALOG_CRANE_SELECT_VEHICLE:
		{
			for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[95 * (MAX_SU_VEHICLES + 2)], total_vehicles;
			format(dialog, sizeof dialog, ""COL_WHITE"Vehículo\t"COL_WHITE"Matrícula\t"COL_WHITE"Precio\n");
			for(new i = 0; i != MAX_VEHICLES; i ++)
			{
				if (!GLOBAL_VEHICLES[i][gb_vehicle_VALID]) continue;
				if (!PLAYER_VEHICLES[i][player_vehicle_VALID]) continue;
				if (total_vehicles > MAX_SU_VEHICLES) break;

				if (PLAYER_VEHICLES[i][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
				{
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][total_vehicles] = i;

					new line_str[95], veh_money = (VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_PRICE] / 100) + 350;
					format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%s\t"COL_WHITE"%s$\n", total_vehicles + 1, VEHICLE_INFO[ GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME], GLOBAL_VEHICLES[i][gb_vehicle_NUMBER_PLATE], number_format_thousand(veh_money));
					strcat(dialog, line_str);
					total_vehicles ++;
				}
			}
			if (total_vehicles == 0) strcat(dialog, ""COL_WHITE"No tienes vehículos");

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Selecciona el vehículo", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_CRANE_SELECT_PLACE:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Selecciona el lugar", "Depósito municipal\nÚltimo estacionamiento\n", "Selecc.", "Cerrar");
			return 1;	
		}
		case DIALOG_USER_NOTIFICATIONS:
		{
			new dialog[128 * 10];

			new DBResult:Result, DB_Query[140];
			format(DB_Query, sizeof DB_Query, "SELECT * FROM `PLAYER_NOTIFICATIONS` WHERE `ID_USER` = '%d' ORDER BY `DATE` DESC LIMIT 10;", ACCOUNT_INFO[playerid][ac_ID]);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result) == 0) strcat(dialog, ""COL_WHITE"No tienes notificaciones.");
			else
			{
				for(new i; i < db_num_rows(Result); i++ )
				{
					new 
						line_str[125],
						message[128],
						date;

					date = db_get_field_assoc_int(Result, "DATE");
					db_get_field_assoc(Result, "MESSAGE", message, 128);

					format(line_str, sizeof line_str, ""COL_WHITE"%s\t%s\n", message, ReturnTimelapse(date, gettime()));
					strcat(dialog, line_str);

					db_next_row(Result);
				}
				db_free_result(Result);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, ""COL_RED"Notificaciones", dialog, "Cerrar", "");
			return 1;
		}
		case DIALOG_SEND_MONEY:
		{
			new dialog[100];
			format(dialog, sizeof dialog, ""COL_WHITE"Tiene %s$ en efectivo, ingrese la cantidad que quiere\nenviarle a %s.", number_format_thousand(CHARACTER_INFO[playerid][ch_CASH]), ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][ac_NAME]);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Dar dinero", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_SEND_REPORT:
		{
			new dialog[100];
			format(dialog, sizeof dialog, ""COL_WHITE"Ingrese la razón para reportar a %s.", ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][ac_NAME]);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Reportar", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_RANGE_USER:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new 
				caption[64],
				dialog[360],
				listitem;

			format(caption, sizeof caption, ""COL_RED"Interactuar con %s", ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][ac_NAME]);

			format(dialog, sizeof dialog, ""COL_WHITE"Reportar\n");
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = 0;
			listitem ++;

			if (CHARACTER_INFO[playerid][ch_CASH] > 0)
			{
				strcat(dialog, "Dar dinero\n");
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = 1;
				listitem ++;
			}

			if (PLAYER_WORKS[playerid][WORK_POLICE] && PLAYER_TEMP[playerid][py_WORKING_IN] == WORK_POLICE)
			{
				if (PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_CUFFED])
				{
					strcat(dialog, "Quitar esposas\n");
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = 2;
					listitem ++;
				}
				else
				{
					strcat(dialog, "Esposar\n");
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = 3;
					listitem ++;
				}
			}

			if (PlayerAlreadyHasItem(playerid, 0))
			{
				if (CHARACTER_INFO[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][ch_STATE] == ROLEPLAY_STATE_CRACK)
				{
					strcat(dialog, "Revivir\n");
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = 4;
					listitem ++;
				}
			}

			if (PLAYER_CREW[playerid][player_crew_VALID])
			{
				if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_INVITE])
				{
					strcat(dialog, "Invitar a banda\n");
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = 5;
					listitem ++;
				}
			}

			if (PLAYER_WORKS[playerid][WORK_POLICE])
			{
				if (PLAYER_SKILLS[playerid][WORK_POLICE] > 11)
				{
					strcat(dialog, "Invitar a SAPD\n");
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = 6;
					listitem ++;
				}
			}

			if (PLAYER_WORKS[playerid][WORK_MAFIA])
			{
				if (PLAYER_SKILLS[playerid][WORK_MAFIA] >= 15)
				{
					strcat(dialog, "Invitar a FSB\n");
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = 7;
					listitem ++;
				}
			}

			if (PLAYER_WORKS[playerid][WORK_ENEMY_MAFIA])
			{
				if (PLAYER_SKILLS[playerid][WORK_ENEMY_MAFIA] >= 5)
				{
					strcat(dialog, "Invitar a MFB\n");
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = 8;
					listitem ++;
				}
			}

			if (PLAYER_WORKS[playerid][WORK_OSBORN])
			{
				if (PLAYER_SKILLS[playerid][WORK_OSBORN] >= 19)
				{
					strcat(dialog, "Invitar a Familia Osborn\n");
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = 9;
					listitem ++;
				}
			}

			if (PLAYER_WORKS[playerid][WORK_CONNOR])
			{
				if (PLAYER_SKILLS[playerid][WORK_CONNOR] >= 11)
				{
					strcat(dialog, "Invitar a TFC\n");
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = 10;
					listitem ++;
				}
			}

			if (PLAYER_WORKS[playerid][WORK_DIVISO])
			{
				if (PLAYER_SKILLS[playerid][WORK_DIVISO] >= 11)
				{
					strcat(dialog, "Invitar a GNR\n");
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = 11;
					listitem ++;
				}
			}

			if (PLAYER_WORKS[playerid][WORK_SINDACCO])
			{
				if (PLAYER_SKILLS[playerid][WORK_SINDACCO] >= 22)
				{
					strcat(dialog, "Invitar a TFS\n");
					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = 12;
					listitem ++;
				}
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_CREATE_CREW:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Banda", ""COL_WHITE"Para crear una banda necesitas ser nivel 2 y tener 100.000$.\n¿Desea crearla?", "Sí", "No");
			return 1;
		}
		case DIALOG_CREATE_CREW_NAME:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Crear banda", ""COL_WHITE"Introduce el nombre de tu banda (24 caracteres max).", "Continuar", "Salir");
			return 1;
		}
		case DIALOG_CREATE_CREW_COLOR:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Selecciona un color para tu banda", DIALOG_CREATE_CREW_COLOR_String, "Continuar", "Atrás");
			return 1;
		}
		case DIALOG_CREATE_CREW_CONFIRM:
		{
			new dialog[360];
			format(dialog, sizeof dialog,

					"\
						"COL_WHITE"Nombre de la banda: %s\n\
						"COL_WHITE"Color de la banda: {%06x}%s\n\
						"COL_WHITE"Precio: 5.000$",
						PLAYER_TEMP[playerid][py_CREATE_CREW_NAME],
						CrewColors[ PLAYER_TEMP[playerid][py_CREATE_CREW_COLOR] ] >>> 8, CrewNameColors[ PLAYER_TEMP[playerid][py_CREATE_CREW_COLOR] ]
			);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Crear banda", dialog, "Crear", "Salir");
			return 1;
		}
		case DIALOG_CREW_MENU_ONE:
		{
			new caption[64];
			format(caption, sizeof caption, "{%06x}%s", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, ""COL_WHITE"Opciones\nGraffitis\nMercados", "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_CREW_MENU:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new caption[64], dialog[360], listitem;
			format(caption, sizeof caption, "{%06x}%s", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);

			format(dialog, sizeof dialog, "Ver miembros\n");
			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = CREW_RANK_SIZE;
			listitem ++;

			if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_CHANGE_NAME])
			{
				strcat(dialog, "Cambiar nombre y descripción\n");
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = CREW_RANK_CHANGE_NAME;
				listitem ++;
			}
			if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_CAST_MEMBERS])
			{
				strcat(dialog, "Expulsar gente\n");
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = CREW_RANK_CAST_MEMBERS;
				listitem ++;
			}
			if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_MEMBERS])
			{
				strcat(dialog, "Cambiar rangos\n");
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = CREW_RANK_MODIFY_MEMBERS;
				listitem ++;
			}
			if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_RANKS])
			{
				strcat(dialog, "Modificar rangos\n");
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = CREW_RANK_MODIFY_RANKS;
				listitem ++;
			}
			if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_CHANGE_COLOR])
			{
				strcat(dialog, "Cambiar color\n");
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = CREW_RANK_CHANGE_COLOR;
				listitem ++;
			}
			if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_DELETE])
			{
				strcat(dialog, "Eliminar banda\n");
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = CREW_RANK_DELETE;
				listitem ++;
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_CREW_MEMBER_LIST:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new caption[64];
			format(caption, sizeof caption, "Miembros de la banda '%s'", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);

			new dialog[128 * 15], listitem, start_pos = PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] + 1;
			format(dialog, sizeof dialog, ""COL_WHITE"Nombre\t"COL_WHITE"Rango\t"COL_WHITE"Últ. conexión\n");

			new DBResult:Result, DB_Query[320];
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `ACCOUNTS`.`LAST_CONNECTION`, `ACCOUNTS`.`CONNECTED`, `PLAYER_CREW`.`RANK` FROM `ACCOUNTS`, `PLAYER_CREW` WHERE `PLAYER_CREW`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_CREW`.`ID_CREW` = '%d' ORDER BY `ACCOUNTS`.`CONNECTED` DESC, `PLAYER_CREW`.`RANK` ASC LIMIT %d, %d;", PLAYER_CREW[playerid][player_crew_ID], PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				new name[24], last_connection[24], connected, rank;

				db_get_field_assoc(Result, "NAME", name, 24);
				db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 24);
				connected = db_get_field_assoc_int(Result, "CONNECTED");
				rank = db_get_field_assoc_int(Result, "RANK");

				new line_str[128];
				if (connected) format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%s\t{82F11A}•\n", start_pos + listitem, name, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ rank ][crew_rank_NAME]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", start_pos + listitem, name, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ rank ][crew_rank_NAME], last_connection);

				strcat(dialog, line_str);
				listitem ++;

				db_next_row(Result);
			}
			db_free_result(Result);

			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -2;
			strcat(dialog, "{c9c9c9}>>\n"); listitem ++;

			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -3;
			strcat(dialog, "{c9c9c9}<<\n"); listitem ++;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_CREW_CHANGE_NAME:
		{
			new dialog[128];
			format(dialog, sizeof dialog, ""COL_WHITE"Nombre actual de la banda: %s\nIndica el nuevo nombre (max 32 caracteres).", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Cambiar nombre de la banda", dialog, "Cambiar", "Atrás");
			return 1;
		}
		case DIALOG_CREW_CHANGE_DESC:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Cambiar descripción", ""COL_WHITE"Ingrese una descripción.", "Cambiar", "Atrás");
			return 1;
		}
		case DIALOG_CREW_MEMBER_LIST_DELETE:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[128 * 15], listitem, start_pos = PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] + 1;
			format(dialog, sizeof dialog, ""COL_WHITE"Nombre\t"COL_WHITE"Rango\t"COL_WHITE"Últ. conexión\n");

			new DBResult:Result, DB_Query[350];
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`ID`, `ACCOUNTS`.`NAME`, `ACCOUNTS`.`LAST_CONNECTION`, `ACCOUNTS`.`CONNECTED`, `PLAYER_CREW`.`RANK` FROM `ACCOUNTS`, `PLAYER_CREW` WHERE `PLAYER_CREW`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_CREW`.`ID_CREW` = '%d' ORDER BY `ACCOUNTS`.`CONNECTED` DESC, `PLAYER_CREW`.`RANK` ASC LIMIT %d, %d;", PLAYER_CREW[playerid][player_crew_ID], PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				new name[24], last_connection[24], connected, rank;

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = db_get_field_assoc_int(Result, "ID");
				db_get_field_assoc(Result, "NAME", name, 24);
				db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 24);
				connected = db_get_field_assoc_int(Result, "CONNECTED");
				rank = db_get_field_assoc_int(Result, "RANK");

				new line_str[128];
				if (connected) format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%s\t{82F11A}•\n", start_pos + listitem, name, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ rank ][crew_rank_NAME]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", start_pos + listitem, name, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ rank ][crew_rank_NAME], last_connection);

				strcat(dialog, line_str);
				listitem ++;

				db_next_row(Result);
			}
			db_free_result(Result);

			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -2;
			strcat(dialog, "{c9c9c9}>>\n"); listitem ++;

			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -3;
			strcat(dialog, "{c9c9c9}<<\n"); listitem ++;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Expulsar", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_CREW_CAST_MEMBER_CONFIRM:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Expulsar", ""COL_WHITE"¿Estás seguro de que quieres expulsar a este miembro?", "Si", "No");
			return 1;
		}
		case DIALOG_CREW_INVITE_RANK:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[64 * MAX_CREW_RANKS], line_str[64], listitem;
			for(new i = 0; i != MAX_CREW_RANKS; i ++)
			{
				if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_VALID]) continue;

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = i;
				if (i < PLAYER_CREW[playerid][player_crew_RANK]) format(line_str, sizeof line_str, "{666666}%d. %s\n", listitem + 1, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_NAME]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\n", listitem + 1, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_NAME]);
				strcat(dialog, line_str);

				listitem ++;
			}
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Invitar", dialog, "Invitar", "Salir");
			return 1;
		}
		case DIALOG_CREW_INVITE_ACCEPT:
		{
			new dialog[128];
			format(dialog, sizeof dialog, ""COL_WHITE"Te han ofrecio unirte a la banda %s con el rango de %s.", CREW_INFO[ PLAYER_TEMP[playerid][py_CREW_INVITE_INFO][1] ][crew_NAME], CREW_RANK_INFO[ PLAYER_TEMP[playerid][py_CREW_INVITE_INFO][1] ][ PLAYER_TEMP[playerid][py_CREW_INVITE_INFO][2] ][crew_rank_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Invitación", dialog, "Unirme", "Salir");
			return 1;
		}
		case DIALOG_CREW_RANKS:
		{
			new dialog[64 * MAX_CREW_RANKS], line_str[64];
			for(new i = 0; i != MAX_CREW_RANKS; i ++)
			{
				if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_VALID])
				{
					if (i < PLAYER_CREW[playerid][player_crew_RANK]) format(line_str, sizeof line_str, "{666666}%d. %s\n", i + 1, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_NAME]);
					else format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\n", i + 1, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_NAME]);
				}
				else
				{
					if (i < PLAYER_CREW[playerid][player_crew_RANK]) format(line_str, sizeof line_str, "{666666}%d. Slot vacío\n", i + 1, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_NAME]);
					else format(line_str, sizeof line_str, ""COL_WHITE"%d. Vacío\n", i + 1, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_NAME]);
				}
				strcat(dialog, line_str);
			}
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Rangos", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_CREW_RANK_MODIFY:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Modificar rango", "Cambiar nombre del rango\nModificar permisos\nEliminar rango", "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_CREW_RANK_MODIFY_NAME:
		{
			new dialog[144];
			format(dialog, sizeof dialog, ""COL_WHITE"Indica el nuevo nombre del rango %s (max 32 caracteres).", CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Modificar rango", dialog, "Cambiar", "Atrás");
			return 1;
		}
		case DIALOG_CREW_RANK_MODIFY_PERMISS:
		{
			new dialog[64 * (CREW_RANK_SIZE + 1)], line_str[64];
			format(dialog, sizeof dialog, ""COL_WHITE"Permiso\t"COL_WHITE"Activado\n");

			for(new i = 0; i != CREW_RANK_SIZE; i ++)
			{
				if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][i]) format(line_str, sizeof line_str, "%s\t%s\n", CREW_RANKS_PERMISSIONS[i], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][i] ? ""COL_GREEN"Sí" : ""COL_RED"No");
				else format(line_str, sizeof line_str, "{666666}%s\t{666666}%s\n", CREW_RANKS_PERMISSIONS[i], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][i] ? ""COL_GREEN"Sí" : ""COL_RED"No");

				strcat(dialog, line_str);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Modificar permisos", dialog, "Cambiar", "Atrás");
			return 1;
		}
		case DIALOG_CREW_RANK_CREATE:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Crear nuevo rango", ""COL_WHITE"Indica el nombre del rango (max 32 caracteres).", "Crear", "Atrás");
			return 1;
		}
		case DIALOG_CREW_RANK_DELETE:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[64 * MAX_CREW_RANKS], line_str[64], listitem;
			for(new i = 0; i != MAX_CREW_RANKS; i ++)
			{
				if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_VALID]) continue;
				if (i == PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK]) continue;

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = i;
				if (i < PLAYER_CREW[playerid][player_crew_RANK]) format(line_str, sizeof line_str, "{666666}%d. %s\n", listitem + 1, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_NAME]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\n", listitem + 1, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_NAME]);
				strcat(dialog, line_str);

				listitem ++;
			}
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Seleccionar nuevo rango", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_CREW_RANK_DELETE_CONFIRM:
		{
			new DBResult:Result, DB_Query[128], affected_members;
			format(DB_Query, sizeof DB_Query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d' AND `RANK` = '%d';", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID], PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK]);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result)) affected_members = db_get_field_int(Result, 0);
			db_free_result(Result);


			new dialog[400];
			format(dialog, sizeof dialog,

				"\
					"COL_WHITE"Rango a eliminar: %s\n\
					Miembros afectados: %d\n\
					El nuevo rango de estos miembros será: %s\n\
					\n\
					¿Seguro que quieres eliminar el rango?\n\
					\n\
				",
					CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_NAME],
					affected_members,
					CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_NEW_RANK] ][crew_rank_NAME]
			);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Eliminar rango", dialog, "Si", "No");
			return 1;
		}
		case DIALOG_CREW_MODIFY_COLOR:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Selecciona un color", DIALOG_CREATE_CREW_COLOR_String, "Cambiar", "Atrás");
			return 1;
		}
		case DIALOG_CREW_DELETE:
		{
			new DB_Query[190], affected_members;

			new DBResult:Result_memberts;
			format(DB_Query, sizeof DB_Query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d';", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID]);
			Result_memberts = db_query(Database, DB_Query);

			if (db_num_rows(Result_memberts)) affected_members = db_get_field_int(Result_memberts, 0);
			db_free_result(Result_memberts);


			//new DBResult:Result_territories;
			//format(DB_Query, sizeof DB_Query, "SELECT COUNT() FROM `CREW_TERRITORIES` WHERE `ID_CREW` = '%d';", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID]);
			//Result_territories = db_query(Database, DB_Query);

			//if (db_num_rows(Result_territories)) crew_territories = db_get_field_int(Result_territories, 0);
			//db_free_result(Result_territories);

			new dialog[128];
			format(dialog, sizeof dialog, ""COL_WHITE"¿Deseas borrar %s con %d miembros?",CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], affected_members);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Eliminar banda", dialog, "Si", "No");
			return 1;
		}
		case DIALOG_CREW_LEAVE:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Abandonar banda", ""COL_WHITE"¿Quieres abandonar la banda?", "Si", "No");
			return 1;
		}
		case DIALOG_CREW_MODIFY_MEMBERS:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[128 * 15], listitem, start_pos = PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] + 1;
			format(dialog, sizeof dialog, ""COL_WHITE"Nombre\t"COL_WHITE"Rango\t"COL_WHITE"Últ. conexión\n");

			new DBResult:Result, DB_Query[350];
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`ID`, `ACCOUNTS`.`NAME`, `ACCOUNTS`.`LAST_CONNECTION`, `ACCOUNTS`.`CONNECTED`, `PLAYER_CREW`.`RANK` FROM `ACCOUNTS`, `PLAYER_CREW` WHERE `PLAYER_CREW`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_CREW`.`ID_CREW` = '%d' ORDER BY `ACCOUNTS`.`CONNECTED` DESC, `PLAYER_CREW`.`RANK` ASC LIMIT %d, %d;", PLAYER_CREW[playerid][player_crew_ID], PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				new name[24], last_connection[24], connected, rank;

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = db_get_field_assoc_int(Result, "ID");
				db_get_field_assoc(Result, "NAME", name, 24);
				db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 24);
				connected = db_get_field_assoc_int(Result, "CONNECTED");
				rank = db_get_field_assoc_int(Result, "RANK");

				new line_str[128];
				if (connected) format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%s\t{82F11A}•\n", start_pos + listitem, name, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ rank ][crew_rank_NAME]);
				else format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", start_pos + listitem, name, CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ rank ][crew_rank_NAME], last_connection);

				strcat(dialog, line_str);
				listitem ++;

				db_next_row(Result);
			}
			db_free_result(Result);

			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -2;
			strcat(dialog, "{c9c9c9}>>\n"); listitem ++;

			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -3;
			strcat(dialog, "{c9c9c9}<<\n"); listitem ++;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Modificar rango de un miembro", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_CREW_MODIFY_MEMBER:
		{
			new DBResult:Result, DB_Query[256], name[24], current_rank, bool:found;
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `PLAYER_CREW`.`RANK` FROM `ACCOUNTS`, `PLAYER_CREW` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_CREW`.`ID_USER` = `ACCOUNTS`.`ID`;", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID]);
			Result = db_query(Database, DB_Query);

			if (db_num_rows(Result))
			{
				db_get_field_assoc(Result, "NAME", name, 24);
				current_rank = db_get_field_assoc_int(Result, "RANK");
				found = true;
			}
			else found = false;
			db_free_result(Result);

			if (!found) return 1;
			if (current_rank < PLAYER_CREW[playerid][player_crew_RANK]) return ShowPlayerMessage(playerid, "~r~No puedes modificar el rango de este miembro porque es un rango superior al tuyo.", 3);
			if (current_rank == 0)
			{
				new DBResult:Result_count, total;
				format(DB_Query, sizeof DB_Query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d' AND `RANK` = '0';", PLAYER_CREW[playerid][player_crew_ID]);
				Result_count = db_query(Database, DB_Query);

				if (db_num_rows(Result_count)) total = db_get_field_int(Result_count, 0);
				db_free_result(Result_count);

				if (total <= 1)
				{
					ShowPlayerMessage(playerid, "~r~No se puede modificar el rango de este miembro ya que es el único miembro con el rango principal.", 4);
					return 1;
				}
			}

			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new caption[45];
			format(caption, sizeof caption, "Miembro - %s", name);

			new dialog[45 * CREW_RANK_SIZE], line_str[45], listitem;
			for(new i = 0; i != CREW_RANK_SIZE; i ++)
			{
				if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_VALID]) continue;

				if (i < PLAYER_CREW[playerid][player_crew_RANK])
				{
					if (current_rank == i) format(line_str, sizeof line_str, "{666666}%s (actual)\n", CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_NAME]);
					else format(line_str, sizeof line_str, "{666666}%s\n", CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_NAME]);
				}
				else
				{
					if (current_rank == i) format(line_str, sizeof line_str, ""COL_WHITE"%s (actual)\n", CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_NAME]);
					else format(line_str, sizeof line_str, ""COL_WHITE"%s\n", CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i][crew_rank_NAME]);
				}
				strcat(dialog, line_str);

				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = i;
				listitem ++;
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_CREW_PROPERTY_CONFIRM:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Propiedad de banda", ""COL_WHITE"¿Estás seguro que quieres pasar esta propiedad a banda?\nEsta opción no se puede deshacer.", "Selecc.", "Cancelar");
			return 1;
		}
		case DIALOG_CREW_LEAVE_TERRITORY:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Abandonar territorio", ""COL_WHITE"¿Estás seguro que quieres abandonar este territorio?\nEsta opción no se puede deshacer.", "Selecc.", "Cancelar");
			return 1;
		}
		case DIALOG_CREW_LEAVE_PROPERTY:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Propiedad de banda", ""COL_WHITE"¿Estás seguro que quieres liberar esta propiedad?\nEsta opción no se puede deshacer.", "Selecc.", "Cancelar");
			return 1;
		}
		case DIALOG_POLICE_PENALTY:
		{
			new dialog[128];
			format(dialog, sizeof dialog, ""COL_WHITE"El policía %s te ha puesto una multa de "COL_GREEN"%s$\n", PLAYER_TEMP[ PLAYER_TEMP[playerid][py_POLICE_PEN_PID] ][py_RP_NAME], number_format_thousand(PLAYER_TEMP[playerid][py_POLICE_PEN_IM]));
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Multa", dialog, "Pagar", "Salir");
			return 1;
		}
		case DIALOG_SERVER_ECO:
		{
			new dialog[256];
			format(dialog, sizeof dialog,

				"\
					PROPIEDADES\t%.4f\n\
					VEHICULOS\t%.4f\n\
					TOYS\t%.4f\n\
					SKINS\t%.4f\n\
					ARMAS\t%.4f\n\
					VIP\t%d "SERVER_COIN"\n\
				",
					MULTIPLIER_PROPERITES,
					MULTIPLIER_VEHICLES,
					MULTIPLIER_TOYS,
					MULTIPLIER_SKINS,
					MULTIPLIER_WEAPONS,
					SU_SD_PRICE
			);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, "Multiplicadores", dialog, "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_SERVER_ECO_MODIFY:
		{
			new dialog[32];
			switch(PLAYER_TEMP[playerid][py_DIALOG_ECO_SELECTED])
			{
				case 0: format(dialog, sizeof dialog, "PROPIEDADES: %f", MULTIPLIER_PROPERITES);
				case 1: format(dialog, sizeof dialog, "VEHICULOS: %f", MULTIPLIER_VEHICLES);
				case 2: format(dialog, sizeof dialog, "TOYS: %f", MULTIPLIER_TOYS);
				case 3: format(dialog, sizeof dialog, "SKINS: %f", MULTIPLIER_SKINS);
				case 4: format(dialog, sizeof dialog, "ARMAS: %f", MULTIPLIER_WEAPONS);
				case 5: format(dialog, sizeof dialog, "Coste de VIP: %d "SERVER_COIN"", SU_SD_PRICE);
			}
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, "Multiplicador", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_SU_BUY:
		{
			new dialog[420];
			format(dialog, sizeof dialog, ""COL_WHITE"Ventajas del VIP Classic\n\
				- Tener hasta 6 vehículos\n\
				- Tener hasta 2 propiedades\n\
				- Te pagaran más en algunos trabajos\n\
				- Desbloquear el acceso a propiedades y vehículos exclusivos\n\
				- Rol especial en el Discord\n\
				El VIP se paga mensualmente, 30 días vale %d "SERVER_COIN".\n\
				Si desea el VIP Turbo, visite hyaxe.com/store", SU_SD_PRICE);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Comprar VIP", dialog, "Comprar", "Salir");
			return 1;
		}
		case DIALOG_SU:
		{
			new DBResult:Result, current_date[24];
			Result = db_query(Database, "SELECT CURRENT_TIMESTAMP;");

			if (db_num_rows(Result)) db_get_field(Result, 0, current_date, 24);
			db_free_result(Result);

			new
				dialog[256],
				caption[64]
			;

			format(caption, sizeof(caption), ""COL_YELLOW"VIP %s", getPlayerVip(playerid));

			format(dialog, sizeof dialog,

				"\
					Fecha actual:\t%s\n\
					Fecha caducidad:\t%s\n\
					Renovar\n",
					current_date,
					ACCOUNT_INFO[playerid][ac_SU_EXPIRE_DATE],
					SU_SD_PRICE
			);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, caption, dialog, "Selecc", "Cerrar");
			return 1;
		}
		case DIALOG_VOBJECT_MENU:
		{
			new caption[64];
			format(caption, sizeof(caption), ""COL_RED"%s", VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, "Mis objetos\nComprar objeto\nAñadir texto (500$)\nAñadir bandera de país (2.000$)\nAñadir panel de país (2.000$)", "Selecc.", "Cerrar");
			return 1;
		}
		case DIALOG_VOBJECT_OBJECTS:
		{
			new caption[45], dialog[145 * (MAX_SU_VOBJECTS + 2)], line_str[144];
			format(caption, sizeof caption,  ""COL_RED"%s", VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]);

			format(dialog, sizeof dialog, ""COL_WHITE"Objeto\t"COL_WHITE"Colocado\n");
			for(new i = 0; i != MAX_SU_VOBJECTS; i ++)
			{
				if (VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][i][vobject_VALID])
				{
					if (VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][i][vobject_ATTACHED]) format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\tSí\n", i + 1, VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][i][vobject_NAME]);
					else format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"No\n", i + 1, VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][i][vobject_NAME]);
				}
				else format(line_str, sizeof line_str, "{666666}%d. Vacío\n", i + 1);
				strcat(dialog, line_str);
			}
			strcat(dialog, ""COL_RED"Eliminar todo\n");

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_VOBJECT_OBJECT:
		{
			new caption[45], dialog[256];
			format(caption, sizeof caption, ""COL_RED"%s", VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_NAME]);

			switch(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_TYPE])
			{
				case VOBJECT_TYPE_OBJECT:
				{
					if (VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ATTACHED]) format(dialog, sizeof dialog, ""COL_WHITE"Guardar este objeto\n"COL_WHITE"Cambiar el nombre del objeto\n"COL_WHITE"Editar posición del objeto\n"COL_WHITE"Colores\n"COL_WHITE"Eliminar este objeto");
					else format(dialog, sizeof dialog, "Colocar este objeto\nCambiar el nombre del objeto\n{666666}Editar posición del objeto\n{666666}Colores\nEliminar este objeto");
				}
				case VOBJECT_TYPE_TEXT:
				{
					if (VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ATTACHED]) format(dialog, sizeof dialog, ""COL_WHITE"Guardar este objeto\n"COL_WHITE"Cambiar el nombre del objeto\n"COL_WHITE"Editar posición del objeto\n"COL_WHITE"Texto\n"COL_WHITE"Eliminar este objeto");
					else format(dialog, sizeof dialog, "Colocar este objeto\nCambiar el nombre del objeto\n{666666}Editar posición del objeto\n{666666}Texto\nEliminar este objeto");
				}
				case VOBJECT_TYPE_COUNTRY_FLAG, VOBJECT_TYPE_COUNTRY_PANEL:
				{
					if (VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ATTACHED]) format(dialog, sizeof dialog, ""COL_WHITE"Guardar este objeto\n"COL_WHITE"Cambiar el nombre del objeto\n"COL_WHITE"Editar posición del objeto\n"COL_WHITE"Eliminar este objeto");
					else format(dialog, sizeof dialog, "Colocar este objeto\nCambiar el nombre del objeto\n{666666}Editar posición del objeto\nEliminar este objeto");
				}
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_VOBJECT_OBJECT_CNAME:
		{
			new dialog[144];
			format(dialog, sizeof dialog, ""COL_WHITE"Nombre actual: \"%s\"\nIndica el nuevo nombre:", VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Modificar nombre", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_VOBJECT_OBJECT_COLORS:
		{
			new caption[64];
			format(caption, sizeof caption, ""COL_RED"%s", VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_NAME]);

			new dialog[45 * MAX_VEHICLE_OBJECTS_INDEXS], line_str[45];
			for(new i = 0; i != MAX_VEHICLE_OBJECTS_INDEXS; i ++)
			{
				if (!VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_COLORS][i]) format(line_str, sizeof line_str, ""COL_WHITE"Color #%d (original)\n", i + 1);
				else format(line_str, sizeof line_str, "{%06x}Color #%d\n", hy_ARGBToRGBA(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_COLORS][i]) >>> 8, i + 1);

				strcat(dialog, line_str);
			}
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_VOBJECT_OBJECT_COLOR:
		{
			new caption[64];
			format(caption, sizeof caption, ""COL_RED"Color (%d) de '%s'", PLAYER_TEMP[playerid][py_TUNING_EDIT_COLOR_SLOT], VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_NAME]);

			new dialog[144];
			format(dialog, sizeof dialog,

					"\
						Color original\n\
						{%06x}Color #1 del vehículo\n\
						{%06x}Color #2 del vehículo\n\
						Color personalizado\n\
					",
					VEHICLE_COLORS[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][gb_vehicle_COLOR_1] ] >>> 8,
					VEHICLE_COLORS[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][gb_vehicle_COLOR_2] ] >>> 8
			);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_VOBJECT_OBJECT_COLOR_HEX:
		{
			new caption[64];
			format(caption, sizeof caption, "Color (%d) de '%s'", PLAYER_TEMP[playerid][py_TUNING_EDIT_COLOR_SLOT], VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_NAME]);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, caption, "Introduce el color en formato AARRGGBB\nPor ejemplo: F0F0F0FF", "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_VOBJECT_OBJECT_CDELETE:
		{
			new dialog[144];
			format(dialog, sizeof dialog, ""COL_WHITE"¿Estás seguro que quieres eliminar el objeto %s?", VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Eliminar Objeto", dialog, "Si", "No");
			return 1;
		}
		case DIALOG_VOBJECT_DELETE_ALL: return ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Eliminar todo", ""COL_WHITE"¿Está seguro de que quiere eliminar todos los objetos de este vehículo?", "Si", "No");
		case DIALOG_VOBJECT_TEXT_MENU:
		{
			new caption[64];
			format(caption, sizeof caption, ""COL_RED"%s", VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_NAME]);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, "Editar texto\nCambiar fuente\nTamaño de letra\nNegrita\nColor de fuente", "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_VOBJECT_TEXT_TEXT:
		{
			new dialog[128];
			format(dialog, sizeof dialog, ""COL_WHITE"Texto actual: %s\nIndica el nuevo texto (1-32 caracteres).", VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_TEXT]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Modificar texto", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_VOBJECT_TEXT_FONT:
		{
			new dialog[128];
			format(dialog, sizeof dialog, ""COL_WHITE"Fuente actual: %s\nIndica la nueva fuente.", VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_FONT]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Modificar fuente", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_VOBJECT_TEXT_FONT_SIZE:
		{
			new dialog[128];
			format(dialog, sizeof dialog, ""COL_WHITE"Tamaño actual: %d\nIndica la nueva fuente.", VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_FONT_SIZE]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Modificar fuente", dialog, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_VOBJECT_TEXT_FONT_COLOR:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Selecciona color", DIALOG_CREATE_CREW_COLOR_String, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_VOBJECT_COUNTRY:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Selecciona país",

				"\
					Alemania\n\
					Argentina\n\
					Austria\n\
					Belgica\n\
					Bolivia\n\
					Bulgaria\n\
					Chile\n\
					Colombia\n\
					El Salvador\n\
					España\n\
					Estonia\n\
					Francia\n\
					Guatemala\n\
					Holanda\n\
					Hungría\n\
					India\n\
					Indonesia\n\
					Irlanda\n\
					Italia\n\
					Lituania\n\
					Luxemburgo\n\
					Madagascar\n\
					Malta\n\
					Malí\n\
					México\n\
					Nigeria\n\
					Panamá\n\
					Paraguay\n\
					Perú\n\
					Polonia\n\
					Rumanía\n\
					Rusia\n\
					Ucrania\n\
					Venezuela\n\
				"

			, "Selecc.", "Atrás");
			return 1;
		}
		case DIALOG_PLAYER_CONFIG:
		{
			new dialog[764];
			format(dialog, sizeof dialog,

				"\
					Contraseña\t*********\n\
					Correo\t%s\n\
					Número en guía telefónica\t%s\n\
					Canal de dudas\t%s\n\
					Canal global\t%s\n\
					Mostrar sed y hambre\t%s\n\
					Primera persona\t%s\n\
					Sexo\t%s\n\
					Recargar mapeos\t\n\
					Damage informer\t%s\n\
					Ver registros de IP\t\n\
					Color del nombre\t%s%s\n\
					Color del texto\t%s%s\n\
					Orden de inventario\t%s\n\
				",
					(ACCOUNT_INFO[playerid][ac_EMAIL]),
					(PLAYER_PHONE[playerid][player_phone_VISIBLE_NUMBER] ? ""COL_GREEN"Sí" : ""COL_RED"No"),
					(ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL] ? ""COL_GREEN"Sí" : ""COL_RED"No"),
					(PLAYER_MISC[playerid][MISC_GLOBAL_CHAT] ? ""COL_GREEN"Sí" : ""COL_RED"No"),
					(PLAYER_MISC[playerid][MISC_CONFIG_HUD] ? ""COL_GREEN"Sí" : ""COL_RED"No"),
					(PLAYER_MISC[playerid][MISC_CONFIG_FP] ? ""COL_GREEN"Sí" : ""COL_RED"No"),
					(CHARACTER_INFO[playerid][ch_SEX] ? "Mujer" : "Hombre"),
					(PLAYER_MISC[playerid][MISC_DAMAGE_INFORMER] ? ""COL_GREEN"Sí" : ""COL_RED"No"),
					COLOR_INFO[ PLAYER_MISC[playerid][MISC_GLOBAL_NAME_COLOR] ][color_HEX],
					COLOR_INFO[ PLAYER_MISC[playerid][MISC_GLOBAL_NAME_COLOR] ][color_NAME],
					COLOR_INFO[ PLAYER_MISC[playerid][MISC_GLOBAL_CHAT_COLOR] ][color_HEX],
					COLOR_INFO[ PLAYER_MISC[playerid][MISC_GLOBAL_CHAT_COLOR] ][color_NAME],
					INV_CONFIG[ PLAYER_MISC[playerid][MISC_INV_CONFIG] ]
			);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, ""COL_RED"Panel de configuración", dialog, "Cambiar", "Salir");
			return 1;
		}
		case DIALOG_POLICE_BYC:
		{
			new caption[128];
			format(caption, sizeof caption, ""COL_LIGHT_BLUE"Placa Nº%d | %c. %s", PLAYER_MISC[playerid][MISC_PLACA_PD], PLAYER_TEMP[playerid][py_FIRST_NAME][0], PLAYER_TEMP[playerid][py_SUB_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, caption, "Ver últimos registros\nBuscar una persona", "Ver", "Salir");
			return 1;
		}
		case DIALOG_POLICE_BYC_NAME_FIND:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_LIGHT_BLUE"Búsqueda", ""COL_WHITE"Introduce el nombre completo del sospechoso.\nUsa el guión bajo para separar nombre y apellido (Nombre_Apellido).", "Buscar", "Salir");
			return 1;
		}
		case DIALOG_POLICE_BYC_LAST_ALL:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[256 * 15], listitem, start_pos = PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] + 1;
			format(dialog, sizeof dialog, ""COL_WHITE"Sospechoso\t"COL_WHITE"Añadido por\t"COL_WHITE"Fecha\t"COL_WHITE"Razón\n");

			new DBResult:Result, DB_Query[256], name[24], by[24], reason[128], date[24];
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `POLICE_HISTORY`.* FROM `ACCOUNTS`, `POLICE_HISTORY` WHERE `ACCOUNTS`.`ID` = `POLICE_HISTORY`.`ID_USER` ORDER BY `DATE` DESC LIMIT %d, %d;", PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = db_get_field_assoc_int(Result, "ID");
				db_get_field_assoc(Result, "NAME", name, 24);
				db_get_field_assoc(Result, "BY", by, 24);
				db_get_field_assoc(Result, "TEXT", reason, 128);
				db_get_field_assoc(Result, "DATE", date, 24);

				new line_str[256];
				format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", start_pos + listitem, name, by, date, reason);

				strcat(dialog, line_str);
				listitem ++;

				db_next_row(Result);
			}
			db_free_result(Result);

			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -2;
			strcat(dialog, "{c9c9c9}- Siguiente\n"); listitem ++;

			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -3;
			strcat(dialog, "{c9c9c9}- Anterior\n"); listitem ++;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_LIGHT_BLUE"Registro", dialog, "Ver", "Cerrar");
			return 1;
		}
		case DIALOG_POLICE_BYC_LAST_PLAYER:
		{
			for(new i = 0; i != MAX_LISTITEMS; i++ ) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new dialog[256 * 15], listitem, start_pos = PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] + 1;
			format(dialog, sizeof dialog, ""COL_WHITE"Sospechoso\t"COL_WHITE"Añadido por\t"COL_WHITE"Fecha\t"COL_WHITE"Razón\n");

			new DBResult:Result, DB_Query[256], name[24], by[24], reason[128], date[24];
			format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `POLICE_HISTORY`.* FROM `ACCOUNTS`, `POLICE_HISTORY` WHERE `POLICE_HISTORY`.`ID_USER` = '%d' AND `ACCOUNTS`.`ID` = `POLICE_HISTORY`.`ID_USER` ORDER BY `DATE` DESC LIMIT %d, %d;", PLAYER_TEMP[playerid][py_SELECTED_BYC_USER_ID], PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = db_get_field_assoc_int(Result, "ID");
				db_get_field_assoc(Result, "NAME", name, 24);
				db_get_field_assoc(Result, "BY", by, 24);
				db_get_field_assoc(Result, "TEXT", reason, 128);
				db_get_field_assoc(Result, "DATE", date, 24);

				new line_str[256];
				format(line_str, sizeof line_str, ""COL_WHITE"%d. %s\t"COL_WHITE"%s\t"COL_WHITE"%s\t"COL_WHITE"%s\n", start_pos + listitem, name, by, date, reason);

				strcat(dialog, line_str);
				listitem ++;

				db_next_row(Result);
			}
			db_free_result(Result);

			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -2;
			strcat(dialog, "{c9c9c9}- Siguiente\n"); listitem ++;

			PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = -3;
			strcat(dialog, "{c9c9c9}- Anterior\n"); listitem ++;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_LIGHT_BLUE"Registro", dialog, "Ver", "Cerrar");
			return 1;
		}
		case DIALOG_POLICE_DELETE_BYC:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_LIGHT_BLUE"Borrar", ""COL_WHITE"¿Borrar esto del historial?", "Si", "No");
			return 1;
		}
    	case DIALOG_GIFT:
    	{
    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Canjear regalo", ""COL_WHITE"Ingrese el código a canjear, recuerde que cada\ncódigo solo se puede usar una sola vez.", "Canjear", "Cerrar");
    		return 1;
    	}
    	case DIALOG_BUY_ROD:
    	{
    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Caña de pescar", ""COL_WHITE"¿Comprar una caña de pescar?\n\n\
    			Costo:"COL_GREEN" $455", "Comprar", "Cerrar");
			return 1;
    	}
    	case DIALOG_BUY_FIXKIT:
    	{
    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Taller mecánico", ""COL_WHITE"¿Comprar un kit de reparación?\n\n\
    			Costo:"COL_GREEN" $800", "Comprar", "Cerrar");
			return 1;
    	}
    	case DIALOG_SELL_FISH:
    	{
    		new 
    			str_text[164],
    			payment = (PLAYER_TEMP[playerid][py_FISHS] * 200),
    			vip_payment = 0;

    		if (ACCOUNT_INFO[playerid][ac_SU])
			{
				vip_payment = (PLAYER_TEMP[playerid][py_FISHS] * 100);				
			}

    		format(str_text, sizeof(str_text), ""COL_WHITE"¿Desea vender sus %d peces?\n\n\
    			Paga:"COL_GREEN" $%d"COL_WHITE"\n\
    			Extra: "COL_GREEN" $%d", PLAYER_TEMP[playerid][py_FISHS], payment, vip_payment);

    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Vender peces", str_text, "Vender", "Cerrar");
			return 1;
    	}
    	case DIALOG_CONFIG_VOICE:
    	{
    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Cambiar tecla de chat de voz", "Z\nX\nB\nM\nL\nK\nJ\nP\nO\nI\nU", "Cambiar", "Atrás");
    		return 1;
    	}
    	case DIALOG_BUY_VOBJECT:
    	{
    		new subString[74];

			static dialog_string[sizeof(Tuning_Shop_Objects) * sizeof(subString)]; 

			for (new i; i < sizeof(Tuning_Shop_Objects); i++)
			{
				format(subString, sizeof(subString), "%i\t%s~n~~g~~h~$%d\n", Tuning_Shop_Objects[i][tuning_object_MODELID], Tuning_Shop_Objects[i][tuning_object_NAME], Tuning_Shop_Objects[i][tuning_object_PRICE]);
				strcat(dialog_string, subString);
			}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_PREVIEW_MODEL, "Comprar objetos", dialog_string, "Comprar", "Cerrar");
			return 1;
    	}
    	case DIALOG_RADIO_STATIONS:
    	{
    		new dialog[564];
    		format(dialog, sizeof(dialog), "Apagar\t\nBuscar en YouTube\t\n");

    		for(new i = 0; i != sizeof RADIO_STATIONS; i ++)
    		{
    			new line[128];
    			format(line, sizeof(line), "%s\t%s\n", RADIO_STATIONS[i][r_NAME], RADIO_STATIONS[i][r_TYPE]);
    			strcat(dialog, line);
    		}

    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, ""COL_RED"Emisoras", dialog, "Cambiar", "Cerrar");
    		return 1;
    	}
    	case DIALOG_VEHICLE_OPTIONS:
    	{
    		new vehicleid = GetPlayerVehicleID(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return 1;
			if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID]) return 1;

    		new 
    			dialog[564],
    			caption[128],
    			radio_station[64],
    			windows[4]
    		;

    		GetVehicleParamsCarWindows(vehicleid, windows[0], windows[1], windows[2], windows[3]);

    		if (PLAYER_MISC[playerid][MISC_RADIO_STATION] == 100) radio_station = ""COL_RED"Apagada";
    		else if (PLAYER_MISC[playerid][MISC_RADIO_STATION] == 666) radio_station = ""COL_YELLOW"YouTube";
    		else format(radio_station, sizeof(radio_station), ""COL_YELLOW"%s", RADIO_STATIONS[ PLAYER_MISC[playerid][MISC_RADIO_STATION] ][r_NAME]);

    		format(caption, sizeof(caption), ""COL_RED"%s", VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]);

    		format(dialog, sizeof(dialog), "\
    			Motor\t%s\n\
    			Luces\t%s\n\
    			Estación de radio\t%s\n\
    			Mapa\t%s\n\
    			Ventana\t%s\n\
    			Estacionar\t\n\
    			Gestionar llaves\t",
    			(GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] ? ""COL_GREEN"Encendido" : ""COL_RED"Apagado"),
    			(GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS] ? ""COL_GREEN"Encendido" : ""COL_RED"Apagado"),
    			radio_station,
    			(PLAYER_TEMP[playerid][py_GPS_MAP] ? ""COL_GREEN"Encendido" : ""COL_RED"Apagado"),
    			(windows[0] ? ""COL_RED"Cerrada" : ""COL_GREEN"Abierta")
    		);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, caption, dialog, "Cambiar", "Cerrar");
			return 1;
    	}
		case DIALOG_MINER_STORE:
    	{
    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, ""COL_RED"Minería", "\
				"COL_WHITE"Mazo\t"COL_GREEN"$150\n\
				"COL_WHITE"Potenciador x5\t"COL_GREEN"$500\n\
				"COL_WHITE"Potenciador x10\t"COL_GREEN"$1000\n\
				"COL_WHITE"Potenciador x15\t"COL_GREEN"$1500\n\
				"COL_WHITE"Potenciador x20\t"COL_GREEN"$2000\n\
				"COL_WHITE"Potenciador x25\t"COL_GREEN"$2500\n\
				"COL_WHITE"Potenciador x30\t"COL_GREEN"$3000\n\
				"COL_WHITE"Potenciador x35\t"COL_GREEN"$3500\n\
				"COL_WHITE"Potenciador x40\t"COL_GREEN"$4000\n",
			"Comprar", "Cerrar");
    		return 1;
    	}
    	case DIALOG_SELL_HYCOIN:
    	{
    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Canjear HyCoins", ""COL_WHITE"Ingrese la cantiad de HyCoins a vender, cada una\n\
    			vale en el mercado: "COL_GREEN"$150.000"COL_WHITE".", "Canjear", "Atrás");
    		return 1;
    	}
    	case DIALOG_DEATH:
    	{
    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Herido", ""COL_WHITE"Opción\t"COL_WHITE"Efecto\n\
    			"COL_WHITE"Ir al hospital\t"COL_RED"Pierdes armas\n\
    			"COL_WHITE"Pedir un médico\t"COL_YELLOW"Tarda en llegar\n", "Selecc.", "Cerrar");
    		return 1;
    	}
    	case DIALOG_PASSENGER_OPTIONS:
    	{
    		new vehicleid = GetPlayerVehicleID(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return 1;
			if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID]) return 1;

			if (VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_SEATS] > 4) return 1;

    		new 
    			dialog[128],
    			caption[128],
    			seat = GetPlayerVehicleSeat(playerid),
    			windows[4]
    		;

    		GetVehicleParamsCarWindows(vehicleid, windows[0], windows[1], windows[2], windows[3]);

    		format(caption, sizeof(caption), ""COL_RED"%s", VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]);

    		format(dialog, sizeof(dialog), "\
    			Ventana\t%s\n",
    			(windows[seat] ? ""COL_RED"Cerrada" : ""COL_GREEN"Abierta")
    		);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, caption, dialog, "Cambiar", "Cerrar");
			return 1;
    	}
    	case DIALOG_BOX_CLUB:
    	{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_YELLOW"Club de la pelea", "Reglas\nParticipar\nParticipantes\n", "Ver", "Cerrar");
			return 1;
    	}
    	case DIALOG_BOX_FIGHTERS:
    	{
    		for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

    		new dialog[40 * 20],
    			total_fighters
    		;

    		format(dialog, sizeof dialog, ""COL_WHITE"Jugador\t"COL_WHITE"Total\n");

    		for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
			{
				if (IsPlayerConnected(i))
				{
					if (PLAYER_TEMP[i][py_BOXING])
					{
						PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][total_fighters] = i;

						new line_str[128];
						format(line_str, sizeof line_str, ""COL_WHITE"%s\t"COL_GREEN"%d$\n", PLAYER_TEMP[i][py_NAME], PLAYER_TEMP[i][py_BOX_PAY]);
						strcat(dialog, line_str);

						total_fighters ++;
					}
				}
			}
			if (total_fighters == 0) strcat(dialog, ""COL_WHITE"No hay participantes\n");
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_YELLOW"Participantes", dialog, "Apostar", "Atrás");
    	}
    	case DIALOG_BOX_BET:
    	{
    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_YELLOW"Ingrese apuesta", ""COL_WHITE"Ingrese la cantidad a apostar:", "Apostar", "Atrás");	
    	}
		case DIALOG_BOOMBOX_OPTIONS:
		{
			new dialog[350];
			if (BOOMBOX[ PLAYER_TEMP[playerid][py_MUSIC_BOOMBOX] ][bb_PUBLIC]) format(dialog, sizeof(dialog), ""COL_WHITE"Opción\t"COL_WHITE"Estado\nParlante público\t< "COL_GREEN"Sí\n");
			else format(dialog, sizeof(dialog), ""COL_WHITE"Opción\t"COL_WHITE"Estado\nParlante público\t< "COL_RED"No\n");
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Opciones del parlante", dialog, "Cambiar", "Salir");
		}
		case DIALOG_ELECTRONIC_SHOP:
		{
			new dialog[350 * sizeof ELECTRONIC_PRODUCTS], line[150];
			format(dialog, sizeof(dialog), ""COL_WHITE"Nombre\t"COL_WHITE"Precio\n");
			for(new i = 0; i != sizeof ELECTRONIC_PRODUCTS; i++)
			{
				format(line, sizeof(line), "%s\t"COL_GREEN"$%d\n", ELECTRONIC_PRODUCTS[i][ep_NAME], ELECTRONIC_PRODUCTS[i][ep_PRICE]);
				strcat(dialog, line);
			}
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Productos electrónicos", dialog, "Comprar", "Salir");
		}
		case DIALOG_FURNITURE_LIST:
		{
			for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new 
				dialog[2064],
				line[150],
				total_furniture
			;

			format(dialog, sizeof(dialog), ""COL_WHITE"Nombre\t"COL_WHITE"Tipo\n");

			for(new i = 0; i != MAX_FURNITURE_OBJECTS; i++)
			{
				if (PROPERTY_OBJECT[i][pobj_VALID])
				{
					if (PROPERTY_OBJECT[i][pobj_PROPERTY_ID] == PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID])
					{
						PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][total_furniture] = i;

						format(line, sizeof(line), "%s\t%s\n", PROPERTY_OBJECT[i][pobj_NAME], GetFurnitureTypeName(PROPERTY_OBJECT[i][pobj_TYPE]));
						strcat(dialog, line);

						total_furniture ++;
					}
				}
			}
			if (total_furniture == 0) return ShowPlayerMessage(playerid, "~r~No tienes muebles", 4);

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Muebles", dialog, "Ver", "Atrás");
		}
		case DIALOG_FURNITURE_OPTIONS:
		{
			new caption[64];
			format(caption, 64, ""COL_RED"%s", PROPERTY_OBJECT[ PLAYER_TEMP[playerid][py_FURNITURE_SELECTED] ][pobj_NAME]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, "Editar\nVender\n", "Ver", "Atrás");
		}
		case DIALOG_SELECC_ANSWER:
		{
			new dialog[40 * 7];
			for (new i; i < sizeof(SECURITY_QUESTIONS); i++)
			{
			    strcat(dialog, SECURITY_QUESTIONS[i]);
			    strcat(dialog, "\n");
			}

			ShowPlayerNotification(playerid, "Seleccione una pregunta de seguridad, esto es para prevenir que le roben su cuenta.", 6);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Seguridad de la cuenta", dialog, "Selecc.", "Salir");
		}
		case DIALOG_QUESTION_CREATE:
		{
			new dialog[180];
			format(dialog, sizeof(dialog), ""COL_WHITE"Escriba la respuesta a la pregunta:\n"COL_RED"%s"COL_WHITE"\n\nAVISO: Si se olvida la respuesta no hay\nforma alguna de recuperar la cuenta.", SECURITY_QUESTIONS[ PLAYER_TEMP[playerid][py_ANSWER_INDEX] ]);

			ShowPlayerNotification(playerid, "Escriba la respuesta a su pregunta de seguridad.", 5);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Seguridad de la cuenta", dialog, "Terminar", "Atrás");
		}
		case DIALOG_QUESTION_RESPONSE:
		{
			new dialog[164];

			if (PLAYER_TEMP[playerid][py_ANSWER_INDEX] == 1337) PLAYER_TEMP[playerid][py_ANSWER_INDEX] = 0;
			format(dialog, sizeof(dialog), ""COL_WHITE"Hay actitudes sospechosas en su cuenta, por\nfavor escriba la respuesta a la pregunta:\n"COL_RED"%s", SECURITY_QUESTIONS[ PLAYER_TEMP[playerid][py_ANSWER_INDEX] ]);

			ShowPlayerNotification(playerid, "Escriba la respuesta a su pregunta de seguridad.", 5);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Seguridad de la cuenta", dialog, "Seguir", "Salir");
		}
		case DIALOG_SELECC_TYPE_AMMO:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Comprar balas", "Balas\nCargadores", "Ver", "Cerrar");
			return 1;
		}
		case DIALOG_BLACK_MARKET_SELECT:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Mercado negro", "Armas\nMunición", "Ver", "Cerrar");
			return 1;
		}
		case DIALOG_CLUB:
		{
			if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
			{
				new
					dialog[164],
					caption[40],
					club = PLAYER_TEMP[playerid][py_CLUB_INDEX]
				;

				format(dialog, 164, "Comidas\nPedir trago\n");

				if (CLUBS_INFO[club][club_USER_ID] == 0)
				{
					new price[128];
					format(price, 128, "Comprar local ("COL_YELLOW"%d "SERVER_COIN""COL_WHITE")", CLUBS_INFO[club][club_PRICE]);
					strcat(dialog, price);
				}

				format(caption, 40, ""COL_RED"%s", CLUBS_INFO[club][club_NAME]);
				ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, caption, dialog, "Ver", "Cerrar");
			}
			return 1;
		}
		case DIALOG_CLUB_BUY_FOOD:
		{
			if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
			{
				for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

				new
					dialog[40 * MAX_CLUB_PRODUCTS],
					club = PLAYER_TEMP[playerid][py_CLUB_INDEX],
					listitem
				;

				format(dialog, sizeof(dialog), ""COL_WHITE"Nombre\t"COL_WHITE"Precio\n");

				new DBResult:Result, DB_Query[164];
				format(DB_Query, 128, "SELECT * FROM `CLUB_PRODUCTS` WHERE `CLUB_ID` = '%d' AND `TYPE` = '1' LIMIT %d;", CLUBS_INFO[club][club_ID], MAX_CLUB_PRODUCTS);
				Result = db_query(Database, DB_Query);

				for(new i; i < db_num_rows(Result); i++ )
				{
					new name[32], price;

					PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = db_get_field_assoc_int(Result, "ID");	
					db_get_field_assoc(Result, "NAME", name, 32);
					price = db_get_field_assoc_int(Result, "PRICE");

					new line_str[64];
					format(line_str, sizeof(line_str), "%s\t"COL_GREEN"%d$\n", name, price);

					strcat(dialog, line_str);
					listitem ++;
					db_next_row(Result);
				}
				db_free_result(Result);

				if (listitem == 0) return ShowPlayerMessage(playerid, "~r~No hay productos disponibles", 4);
				ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Comidas", dialog, "Comprar", "Atrás");
			}
		}
		case DIALOG_CLUB_BUY_DRINK:
		{
			if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
			{
				for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

				new
					dialog[40 * MAX_CLUB_PRODUCTS],
					DBResult:Result,
					DB_Query[128],
					club = PLAYER_TEMP[playerid][py_CLUB_INDEX],
					total_products
				;

				format(dialog, sizeof(dialog), ""COL_WHITE"Nombre\t"COL_WHITE"Precio\n");

				format(DB_Query, 128, "SELECT * FROM `CLUB_PRODUCTS` WHERE `CLUB_ID` = '%d' AND `TYPE` = '0' LIMIT %d;", CLUBS_INFO[club][club_ID], MAX_CLUB_PRODUCTS);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					for(new i; i < db_num_rows(Result); i++ )
					{
						new 
							name[32],
							line[64],
							price,
							id
						;

						id = db_get_field_assoc_int(Result, "ID");
						price = db_get_field_assoc_int(Result, "PRICE");
						db_get_field_assoc(Result, "NAME", name, 32);

						PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][total_products] = id;

						format(line, sizeof(line), "%s\t"COL_GREEN"%d$\n", name, price);
						strcat(dialog, line);
						total_products ++;
						db_next_row(Result);
					}
				}
				db_free_result(Result);

				if (total_products == 0) return ShowPlayerMessage(playerid, "~r~No hay productos disponibles", 4);
				ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Bebidas", dialog, "Comprar", "Atrás");
			}
		}
		case DIALOG_CLUB_NAME:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Cambiar nombre", ""COL_WHITE"Ingrese un nombre para su negocio (max. 32).", "Cambiar", "Atrás");
		}
		case DIALOG_CLUB_PRODUCTS:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Productos", "Crear\nEliminar\n", "Ver", "Atrás");
		}
		case DIALOG_CLUB_WELCOME:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Cambiar bienvenida", ""COL_WHITE"Ingrese un mensaje para la bienvenida (max. 64).", "Cambiar", "Atrás");
		}
		case DIALOG_CLUB_RADIO:
		{
			new dialog[564];
    		format(dialog, sizeof(dialog), "Apagar\t\n");

    		for(new i = 0; i != sizeof RADIO_STATIONS; i ++)
    		{
    			new line[128];
    			format(line, sizeof(line), "%s\t%s\n", RADIO_STATIONS[i][r_NAME], RADIO_STATIONS[i][r_TYPE]);
    			strcat(dialog, line);
    		}

    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, ""COL_RED"Cambiar radio", dialog, "Cambiar", "Cerrar");
		}
		case DIALOG_CLUB_PRICE:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Precio de entrada", ""COL_WHITE"Ingrese un precio de entrada (ponga 0 para dejarlo gratis).", "Cambiar", "Atrás");
		}
		case DIALOG_PRODUCT_NAME:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Nombre del producto", ""COL_WHITE"Ingrese un nombre para el producto (max. 32).", "Seguir", "Atrás");
		}
		case DIALOG_PRODUCT_PRICE:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Precio del producto", ""COL_WHITE"Ingrese un precio para el producto (max. 32).", "Seguir", "Atrás");
		}
		case DIALOG_PRODUCT_TYPE:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Tipo del producto", "Para tomar\nPara comer\n", "Seguir", "Atrás");
		}
		case DIALOG_PRODUCT_EXTRA:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Calidad del producto", ""COL_WHITE"Ingrese lo que va a subir al consumirlo (max. 25).", "Seguir", "Atrás");
		}
		case DIALOG_PRODUCT_DELETE:
		{
			if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
			{
				for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

				new
					dialog[40 * MAX_CLUB_PRODUCTS],
					DBResult:Result,
					DB_Query[128],
					club = PLAYER_TEMP[playerid][py_CLUB_INDEX],
					total_products
				;

				format(dialog, sizeof(dialog), ""COL_WHITE"Nombre\t"COL_WHITE"Precio\n");

				format(DB_Query, 128, "SELECT * FROM `CLUB_PRODUCTS` WHERE `CLUB_ID` = '%d' LIMIT %d;", CLUBS_INFO[club][club_ID], MAX_CLUB_PRODUCTS);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					for(new i; i < db_num_rows(Result); i++ )
					{
						new 
							name[32],
							line[64],
							price,
							id
						;

						id = db_get_field_assoc_int(Result, "ID");
						price = db_get_field_assoc_int(Result, "PRICE");
						db_get_field_assoc(Result, "NAME", name, 32);

						PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][total_products] = id;

						format(line, sizeof(line), "%s\t"COL_GREEN"%d$\n", name, price);
						strcat(dialog, line);
						total_products ++;
						db_next_row(Result);
					}
				}
				db_free_result(Result);

				if (total_products == 0) return ShowPlayerMessage(playerid, "~r~No hay productos disponibles", 4);
				ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST_HEADERS, ""COL_RED"Seleccione para borrar", dialog, "Borrar", "Atrás");
			}
		}
		case DIALOG_VEHICLE_KEYS:
		{
			new vehicleid = INVALID_VEHICLE_ID;
			vehicleid = GetPlayerVehicleID(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return 0;

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, sprintf(""COL_RED"Llaves [%d/5]", GetUsedKeys(PLAYER_VEHICLES[vehicleid][player_vehicle_ID])), "Agregar\nEliminar\n", "Seguir", "Atrás");
		}
		case DIALOG_VEHICLE_KEYS_ADD:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Dar llave", ""COL_WHITE"Ingrese el nombre del usuario a agregar.", "Seguir", "Atrás");
		}
		case DIALOG_VEHICLE_KEYS_DEL:
		{
			for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;

			new
				dialog[25 * 5],
				listitem,
				vehicleid = INVALID_VEHICLE_ID
			;

			vehicleid = GetPlayerVehicleID(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return 0;

			new DBResult:Result, DB_Query[164];
			format(DB_Query, 164, "SELECT * FROM `VEHICLE_KEYS` WHERE `VEHICLE_ID` = '%d';", PLAYER_VEHICLES[vehicleid][player_vehicle_ID]);
			Result = db_query(Database, DB_Query);

			for(new i; i < db_num_rows(Result); i++ )
			{
				PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] = db_get_field_assoc_int(Result, "USER_ID");

				new line_str[64];
				format(line_str, sizeof(line_str), "%s\n", GetDatabaseUserName(PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem]));

				strcat(dialog, line_str);
				listitem ++;
				db_next_row(Result);
			}
			db_free_result(Result);

			if (listitem == 0) return ShowPlayerMessage(playerid, "~r~No hay llaves para eliminar", 4);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Seleccione el usuario", dialog, "Eliminar", "Atrás");
		}
		case DIALOG_REGISTER_CIVIL:
    	{
    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, ""COL_RED"Registro", ""COL_WHITE"Documento\t"COL_GREEN"$500\n"COL_WHITE"Licencia de conducir\t"COL_GREEN"$1000", "Comprar", "Cerrar");
    		return 1;
    	}
    	/*case DIALOG_SELL_PUMPKIN:
    	{
    		new 
    			str_text[164],
    			payment = (PLAYER_MISC[playerid][MISC_PUMPKIN] * 1000),
    			vip_payment = 0;

    		if (ACCOUNT_INFO[playerid][ac_SU])
			{
				vip_payment = (PLAYER_MISC[playerid][MISC_PUMPKIN] * 1500);				
			}

    		format(str_text, sizeof(str_text), ""COL_WHITE"¿Desea vender sus %d calabazas?\n\n\
    			Paga:"COL_GREEN" $%d"COL_WHITE"\n\
    			Extra: "COL_GREEN" $%d", PLAYER_MISC[playerid][MISC_PUMPKIN], payment, vip_payment);

    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Vender calabazas", str_text, "Vender", "Cerrar");
    		return 1;
    	}*/
    	case DIALOG_CLUB_SELL:
		{
			if (PLAYER_TEMP[playerid][py_CLUB_INDEX] == -1) return 0;

			new str_text[128];
			format(str_text, sizeof(str_text), ""COL_WHITE"¿Desea vender el local por %d "SERVER_COIN"?", CLUBS_INFO[ PLAYER_TEMP[playerid][py_CLUB_INDEX] ][club_PRICE]);
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_MSGBOX, ""COL_RED"Vender local", str_text, "Si", "No");
		}
		case DIALOG_BUY_ROCKET:
		{
    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, ""COL_RED"Fuegos artificiales", ""COL_WHITE"Pepaso Volador x10\t"COL_GREEN"1000$\n\
    			"COL_WHITE"Mortero x5\t"COL_GREEN"2000$\n\
    			"COL_WHITE"Petardo x5\t"COL_GREEN"1000$\n\
    			"COL_WHITE"Volcan x10\t"COL_GREEN"500$\n\
    			"COL_WHITE"Lavako x10\t"COL_GREEN"800$\n\
    			"COL_WHITE"12 Tiros x10\t"COL_GREEN"1500$\n", "Comprar", "Cerrar");
		}
		case DIALOG_CHANGE_ACCOUNT:
		{
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_INPUT, ""COL_RED"Cuenta", ""COL_WHITE"Ingrese el nombre de usuario:", "Entrar", "Cerrar");
		}
		case DIALOG_BUY_NAME_COLOR:
		{
			new dialog[332];

    		for(new i = 0; i != sizeof COLOR_INFO; i ++)
    		{
    			new line[144];
    			format(line, sizeof(line), "%s%s\t"COL_GREEN"10 Hycoins\n", COLOR_INFO[i][color_HEX], COLOR_INFO[i][color_NAME]);
    			strcat(dialog, line);
    		}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, ""COL_RED"Comprar color (nombre)", dialog, "Comprar", "Volver");
		}
		case DIALOG_BUY_CHAT_COLOR:
		{
			new dialog[332];

    		for(new i = 0; i != sizeof COLOR_INFO; i ++)
    		{
    			new line[144];
    			format(line, sizeof(line), "%s%s\t"COL_GREEN"10 Hycoins\n", COLOR_INFO[i][color_HEX], COLOR_INFO[i][color_NAME]);
    			strcat(dialog, line);
    		}

			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_TABLIST, ""COL_RED"Comprar color (chat)", dialog, "Comprar", "Volver");
		}
		case DIALOG_INV_ORDER:
    	{
    		ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""COL_RED"Cambiar orden del inventario", "Normal\nTipo\nCantidad", "Cambiar", "Atrás");
    		return 1;
    	}
		default: return 0;
	}
	return 1;
}