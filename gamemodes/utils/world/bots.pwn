/* Bot master */
new BotsMaster[16] = "31.214.141.206";
//31.214.141.206

enum bot_enum
{
	b_TIMER[5],
	bool:b_ACTIVE,
	bool:b_OCCUPIED,
	b_ACTION_TYPE,
	bool:b_FOLLOW_MODE,
	b_FOLLOW_ID
}
new BOTS[MAX_PLAYERS][bot_enum];

new TOTAL_MINER_BOTS = 0;

/* Positions */
new Float:Bots_Positions[][] =
{
	{1480.181030, -1683.928588, 14.522637, 179.181945} /*bot palza*/,
	{1186.477783, -1323.975830, 13.559117, 268.505828} /*bot hp*/,
	{2492.665283, -2628.914794, 13.648437, 264.072143} /*bot camionero*/,
	{1541.270996, -1654.173706, 13.558054, 184.531600} /*bot spawn*/,
	{1539.768066, -1694.171875, 13.546875, 184.218307} /*bot spawn*/,
	{1521.045410, -1704.387817, 13.391737, 172.624877} /*bot spawn*/,
	{1551.730834, -1721.438232, 13.554561, 268.819091} /*bot spawn*/,
	{1289.551757, -1387.193115, 13.468363, 87.531616} /*bot spawn*/,
	{1282.054077, -1358.565673, 13.353381, 27.684391} /*bot spawn*/,
	{1228.505249, -1377.348632, 13.355875, 299.636901} /*bot spawn*/,
	{1187.987548, -1353.171997, 13.569953, 8.884203} /*bot spawn*/,
	{1177.890258, -1339.086547, 13.912935, 65.284729} /*bot spawn*/,
	{1176.104736, -1308.734130, 13.991879, 4.184134} /*bot spawn*/,
	{1187.126708, -1289.350341, 13.546875, 265.169891} /*bot spawn*/,
	{2495.515625, -2652.133789, 13.665065, 139.747970} /*bot spawn*/,
	{2461.944335, -2652.469482, 13.661632, 343.706512} /*bot spawn*/,
	{2467.515625, -2582.313476, 13.660408, 259.105743} /*bot spawn*/,
	{2500.063232, -2579.709716, 13.649890, 143.484603} /*bot spawn*/,
	{583.644775, -683.129577, 9.779909, 339.319824} /*bot spawn*/,
	{492.167510, -701.666259, 19.419059, 87.420829} /*bot spawn*/,
	{2147.648437, -83.607513, 2.769458, 6.580016} /*bot spawn*/,
	{2147.520019, -92.283615, 2.748951, 171.684890} /*bot spawn*/,
	{-376.995727, -1429.330566, 25.726562, 175.444946} /*bot spawn*/,
	{-383.531616, -1453.716552, 25.726562, 109.957664} /*bot spawn*/,
	{-396.786407, -1463.379028, 25.726562, 109.644355} /*bot spawn*/,
	{-88.567047, -1209.008300, 2.703549, 80.504089} /*bot spawn*/,
	{-81.548759, -1192.984619, 1.789940, 15.956802} /*bot spawn*/,
	{-98.034164, -1179.274169, 2.186660, 324.256347} /*bot spawn*/,
	{-91.974952, -1164.069946, 2.342319, 6.243405} /*bot spawn*/,
	{-76.032310, -1153.429687, 1.750000, 233.702224} /*bot spawn*/,
	{-107.180534, -1124.314331, 1.642988, 358.073486} /*bot spawn*/,
	{-126.342201, -1143.734619, 2.396812, 141.894653} /*bot spawn*/,
	{2113.608886, -17.779638, -0.574620, 70.790580} /*bot spawn*/,
	{2108.189453, -41.550197, -0.401101, 160.091445} /*bot spawn*/,
	{2090.499511, -86.647727, -0.535778, 274.772491} /*bot spawn*/,
	{2100.885009, -114.268615, -0.518643, 141.917678} /*bot spawn*/,
	{2092.063964, -105.933883, -0.536938, 39.456710} /*bot spawn*/,
	{1522.878540, -1651.998413, 13.391737, 0.939619} /*bot spawn*/,
	{1519.385742, -1612.845703, 13.391737, 219.311996} /*bot spawn*/,
	{1743.739501, -1313.503173, 13.636115, 87.587188} /*bot spawn*/,
	{1758.650024, -1311.017822, 13.639430, 274.962249} /*bot spawn*/,
	{1759.026367, -1279.268432, 13.597202, 283.422332} /*bot spawn*/,
	{1743.107543, -1277.512939, 13.549413, 76.017097} /*bot spawn*/,
	{1727.793701, -1265.744995, 13.542278, 211.355010} /*bot spawn*/,
	{1727.059082, -1289.035156, 13.555088, 172.187957} /*bot spawn*/,
	{1706.638916, -1290.086914, 13.546875, 49.046791} /*bot spawn*/,
	{1692.642089, -1273.728515, 14.818303, 17.713163} /*bot spawn*/,
	{1692.919921, -1248.247680, 14.863128, 356.092956} /*bot spawn*/,
	{1722.863525, -1251.209472, 13.546875, 183.131332} /*bot spawn*/,
	{1729.333740, -1327.912719, 13.585937, 356.696258} /*bot spawn*/,
	{1703.369262, -1313.454223, 13.574313, 66.883560} /*bot spawn*/,
	{1591.318969, -1316.497070, 17.499000, 71.583595} /*bot spawn*/,
	{1587.817749, -1345.226196, 16.484375, 164.331130} /*bot spawn*/,
	{1559.322387, -1319.482055, 16.484375, 66.883537} /*bot spawn*/,
	{1595.993286, -1283.536743, 17.453125, 353.899627} /*bot spawn*/,
	{1576.100219, -1285.245239, 17.506065, 92.287208} /*bot spawn*/,
	{1614.028808, -1277.907104, 17.479578, 238.278594} /*bot spawn*/,
	{1634.455444, -1344.929321, 17.296875, 214.151657} /*bot spawn*/,
	{1650.002929, -1330.789428, 17.430965, 190.338180} /*bot spawn*/,
	{1310.020019, -1378.142211, 13.676912, 358.576324} /*bot spawn*/,
	{1233.846801, -1343.301025, 14.120267, 34.923385} /*bot spawn*/,
	{1143.276733, -1306.646118, 13.636245, 128.297668} /*bot spawn*/,
	{1140.013061, -1340.671875, 13.667320, 182.191528} /*bot spawn*/,
	{1722.480468, -1697.375732, 13.500000, 162.764602} /*bot spawn*/,
	{1712.129882, -1895.881347, 13.567260, 244.232025} /*bot spawn*/,
	{1713.694213, -1875.345092, 13.566878, 342.306274} /*bot spawn*/,
	{1839.697143, -1869.688232, 13.389747, 29.283348} /*bot spawn*/,
	{1799.288330, -1846.851562, 13.578125, 302.489196} /*bot spawn*/,
	{1837.291381, -1831.788330, 13.585382, 100.387260} /*bot spawn*/,
	{1854.030029, -1073.467773, 23.402790, 304.202667} /*bot spawn*/,
	{1825.381958, -1048.803588, 23.651519, 304.202667} /*bot spawn*/,
	{1821.245849, -1096.606445, 23.646205, 304.202667} /*bot spawn*/,
	{1790.062011, -1103.244384, 23.643041, 304.202667} /*bot spawn*/,
	{1750.193969, -1100.263671, 23.643798, 304.202667} /*bot spawn*/,
	{1704.124877, -1099.161376, 23.643785, 304.202667} /*bot spawn*/,
	{1665.484863, -1111.092773, 23.471267, 304.202667} /*bot spawn*/,
	{1623.395385, -1125.395507, 23.471324, 304.202667} /*bot spawn*/,
	{1612.836547, -1084.012084, 23.470859, 304.202667} /*bot spawn*/,
	{1582.722778, -1039.933593, 23.471195, 304.202667} /*bot spawn*/,
	{1541.923217, -1019.272155, 23.471614, 304.202667} /*bot spawn*/,
	{1578.031860, -1008.756103, 23.471633, 304.202667} /*bot spawn*/,
	{1636.024902, -1018.795104, 23.463842, 304.202667} /*bot spawn*/,
	{1700.132812, -1024.548950, 23.471485, 304.202667} /*bot spawn*/,
	{1764.025024, -1027.345092, 23.526485, 304.202667} /*bot spawn*/,
	{1751.946411, -1056.636108, 23.526262, 304.202667} /*bot spawn*/,
	{1707.583984, -1055.102416, 23.471662, 304.202667} /*bot spawn*/,
	{1650.714843, -1053.135864, 23.464273, 304.202667} /*bot spawn*/,
	{1596.713745, -1051.268798, 23.471138, 304.202667} /*bot spawn*/,
	{1144.610839, -1136.566040, 23.219509, 304.202667} /*bot spawn*/,
	{1162.642578, -1276.129516, 12.963074, 304.202667} /*bot spawn*/
};

new Float:Miner_Positions[][] =
{
	{1169.967895, 993.762939, -98.219497, 181.398300} /*bot minero*/,
	{1170.900878, 1008.600280, -97.501953, 341.826507} /*bot minero*/,
	{1175.677978, 994.970153, -98.359916, 188.291717} /*bot minero*/,
	{1176.892333, 1008.731506, -98.121566, 346.213226} /*bot minero*/,
	{1179.652954, 995.618713, -98.381454, 189.231811} /*bot minero*/,
	{1183.854858, 996.095825, -98.343696, 195.498535} /*bot minero*/,
	{1187.980224, 996.236145, -98.416107, 200.511917} /*bot minero*/,
	{1181.835937, 1007.804199, -98.922592, 315.193023} /*bot minero*/,
	{1186.167724, 1007.959167, -98.770439, 316.133056} /*bot minero*/,
	{1190.205688, 1008.057006, -98.675682, 323.026458} /*bot minero*/,
	{1193.586425, 1008.445495, -98.442939, 337.439941} /*bot minero*/,
	{1200.801269, 1007.572998, -98.743598, 4.700195} /*bot minero*/,
	{1201.522583, 1011.213317, -94.521461, 1.566605} /*bot minero*/,
	{1202.999877, 998.295410, -98.430534, 182.025177} /*bot minero*/,
	{1201.262451, 996.069580, -95.992492, 148.498138} /*bot minero*/,
	{1194.500488, 994.853942, -95.204582, 222.445510} /*bot minero*/,
	{1191.359375, 995.231018, -96.526504, 234.352294} /*bot minero*/,
	{1208.701538, 1009.083984, -98.524246, 334.933258} /*bot minero*/,
	{1215.900390, 1011.264282, -98.054458, 314.879760} /*bot minero*/,
	{1222.771484, 1010.125061, -98.539955, 296.392944} /*bot minero*/,
	{1231.744262, 1009.142639, -96.284683, 302.032989} /*bot minero*/,
	{1237.001831, 1008.279113, -95.597114, 303.286346} /*bot minero*/,
	{1246.551269, 1007.727111, -94.775711, 302.659667} /*bot minero*/,
	{1252.927001, 1006.475280, -96.012489, 302.972991} /*bot minero*/,
	{1261.942993, 1005.754333, -96.421676, 20.053758} /*bot minero*/,
	{1264.914794, 1005.978881, -95.995582, 320.833221} /*bot minero*/,
	{1267.650756, 998.063781, -98.895423, 178.578506} /*bot minero*/,
	{1259.251708, 999.985656, -99.040649, 152.571640} /*bot minero*/,
	{1250.423217, 998.839050, -96.370346, 130.638092} /*bot minero*/,
	{1244.374511, 1000.568908, -98.467742, 140.664855} /*bot minero*/,
	{1236.807495, 999.740295, -97.183174, 158.838348} /*bot minero*/,
	{1232.495239, 1000.575988, -98.425041, 190.485321} /*bot minero*/,
	{1225.937011, 998.961120, -96.804809, 142.858215} /*bot minero*/,
	{1217.345336, 997.955322, -96.076515, 171.058471} /*bot minero*/,
	{1204.093872, 998.657043, -98.528610, 213.985580} /*bot minero*/,
	{1268.061645, 998.815551, -99.126007, 190.485046} /*bot minero*/,
	{1265.949951, 999.277404, -99.069534, 150.064651} /*bot minero*/,
	{1262.217041, 1000.081359, -99.143722, 150.377975} /*bot minero*/,
	{1255.309082, 998.801208, -95.996559, 152.257995} /*bot minero*/,
	{1250.699829, 998.677368, -96.134056, 107.764244} /*bot minero*/,
	{1245.231567, 998.708496, -95.930656, 129.384445} /*bot minero*/,
	{1247.551025, 1007.219726, -95.468429, 355.903167} /*bot minero*/,
	{1252.002197, 1007.929748, -94.242866, 355.903289} /*bot minero*/,
	{1256.770996, 1007.482971, -94.553092, 316.736175} /*bot minero*/,
	{1263.882934, 1007.631469, -93.817970, 330.523010} /*bot minero*/,
	{1268.043823, 1005.138671, -97.122474, 286.342620} /*bot minero*/,
	{1264.636474, 998.749389, -98.939559, 187.665115} /*bot minero*/,
	{1229.071533, 999.930725, -97.876632, 130.637893} /*bot minero*/,
	{1214.445190, 1000.328125, -99.078819, 131.891235} /*bot minero*/,
	{1210.007690, 999.976867, -98.964157, 131.891235} /*bot minero*/,
	{1204.848022, 1007.047180, -99.013763, 30.056955} /*bot minero*/,
	{1200.275878, 1009.785339, -96.323822, 30.056955} /*bot minero*/,
	{1197.171752, 1012.265075, -94.064437, 75.056953} /*bot minero*/,
	{1158.241699, 1012.473937, -94.946891, 61.390567} /*bot minero*/,
	{1156.930297, 1008.137878, -96.591941, 62.643905} /*bot minero*/,
	{1159.537963, 1008.821655, -95.799079, 327.076354} /*bot minero*/,
	{1165.480224, 1010.530944, -96.254348, 320.496276} /*bot minero*/,
	{1156.032714, 998.572326, -99.214622, 171.974914} /*bot minero*/,
	{1160.454467, 997.427978, -99.214622, 171.974899} /*bot minero*/,
	{1162.744506, 997.070983, -99.214622, 192.655105} /*bot minero*/,
	{1166.271606, 997.419921, -99.214622, 185.448318} /*bot minero*/,
	{1169.253540, 992.808654, -97.882720, 178.241622} /*bot minero*/,
	{1170.900390, 990.880554, -94.442733, 178.241622} /*bot minero*/,
	{1165.903198, 993.613769, -94.347488, 117.767745} /*bot minero*/,
	{1154.436035, 998.263000, -99.214622, 215.818634} /*bot minero*/,
	{1148.364379, 1005.069396, -99.214622, 46.930355} /*bot minero*/,
	{1151.051025, 1006.415649, -99.214622, 1.809916} /*bot minero*/
};

/* Names */
new names[][] =
{
    "Danny",
    "Tyler",
    "Alan",
    "Juan",
    "Pedro",
    "Hernan",
    "Liam",
	"Emma",
	"Noah",
	"Olivia",
	"William",
	"Ava",
	"James",
	"Isabella",
	"Oliver",
	"Sophia",
	"Benjamin",
	"Charlotte",
	"Elijah",
	"Mia",
	"Lucas",
	"Amelia",
	"Mason",
	"Harper",
	"Logan",
	"Mikaela",
	"Palmer",
	"Lyra",
	"Mara",
	"Marina",
	"Kailey",
	"Liv",
	"Clementine",
	"Kenna",
	"Briar",
	"Emerie",
	"Galilea",
	"Tiffany",
	"Bonnie",
	"Elyse",
	"Cynthia",
	"Frida",
	"Kinslee",
	"Tatiana",
	"Liam",
	"Noah",
	"William",
	"James",
	"Oliver",
	"Benjamin",
	"Elijah",
	"Lucas",
	"Mason",
	"Logan",
	"Alexander",
	"Ethan",
	"Jacob",
	"Michael",
	"Daniel",
	"Henry",
	"Jackson",
	"Kaden",
	"Paxton",
	"Kyrie",
	"Kyle",
	"Griffin",
	"Josue",
	"Kenneth",
	"Beckett",
	"Enzo",
	"Adriel",
	"Arthur",
	"Felix",
	"Bryan",
	"Lukas",
	"Paul",
	"Brian",
	"Colt",
	"Caden",
	"Leon",
	"Archer",
	"Omar",
	"Israel",
	"Aidan",
	"Theo",
	"Javier",
	"Remington",
	"Jaden",
	"Bradley",
	"Emilio",
	"Colin",
	"Riley",
	"Cayden",
	"Phoenix",
	"Clayton",
	"Simon",
	"Ace",
	"Nash",
	"Derek",
	"Rafael",
	"Zander",
	"Brady",
	"Jorge",
	"Jake",
	"Louis",
	"Damien",
	"Karson",
	"Walker",
	"Amari",
	"Sean",
	"Chance",
	"Walter",
	"Martin",
	"Finley",
	"Andre",
	"Tobias",
	"Cash",
	"Corbin",
	"Arlo",
	"Iker",
	"Erick",
	"Emerson",
	"Gunner",
	"Cody",
	"Stephen",
	"Sebastian",
	"Aiden",
	"Matthew",
	"Samuel",
	"David",
	"Joseph",
	"Carter",
	"Owen",
	"Wyatt",
	"John",
	"Jack",
	"Luke",
	"Jayden",
	"Dylan",
	"Grayson",
	"Levi",
	"Isaac",
	"Gabriel",
	"Julian",
	"Mateo",
	"Anthony",
	"Jaxon",
	"Lincoln",
	"Joshua",
	"Andrew",
	"Theodore",
	"Caleb",
	"Ryan",
	"Asher",
	"Nathan",
	"Thomas",
	"Leo",
	"Isaiah",
	"Charles",
	"Josiah",
	"Hudson",
	"Christian",
	"Hunter",
	"Connor",
	"Eli",
	"Ezra",
	"Aaron",
	"Landon",
	"Adrian",
	"Jonathan",
	"Nolan",
	"Jeremiah",
	"Easton",
	"Elias",
	"Colton",
	"Cameron",
	"Carson",
	"Evelyn"
};

new surnames[][] =
{
    "Williams",
    "Adams",
    "Winxu",
    "Maxwell",
    "Simposon",
    "John Treasure",
	"Willemsen",
	"Richard",
	"Fogel",
	"Sauber",
	"Torsney",
	"Capozza",
	"Schmid",
	"Littler",
	"Sevcenko",
	"Glaeser",
	"Teal",
	"Coutaux",
	"Vespucci",
	"Parodi",
	"Sander",
	"Lazarus",
	"Kobrick",
	"Grindle",
	"Cooksy",
	"Cavalli",
	"Lamarre",
	"Zucconi",
	"Gravenor",
	"Juan",
	"Pennington",
	"Karabell",
	"Stotsky",
	"Matthaei",
	"Crowell",
	"Biron",
	"Metiu",
	"Hackman",
	"Scalia",
	"Saef",
	"Whitaker",
	"Pratt",
	"Seborg",
	"Calder",
	"Lecce",
	"Goldin",
	"Pellish",
	"Burnley",
	"Selvage",
	"Lockman",
	"Maslan",
	"Riedo",
	"Perrin",
	"Mcqueeney",
	"Kooperberg",
	"Seneca",
	"Yamamoto",
	"Edick",
	"Ciluaga",
	"Giommi",
	"Kohlberg",
	"Schoenbach",
	"Schiano",
	"Emory",
	"Miranda",
	"Lipponen",
	"Luntz",
	"Haines",
	"Kester",
	"Knell",
	"Viggiani",
	"Beyer",
	"Dohrman",
	"Endres",
    "Doblas"
};

/* Chat */
new fake_chat[][] =
{
    "Me prestas dinero?",
    "ola k ase",
    "hola!",
    "buenos dias",
    "hola como le va",
    "sapee",
    "donde hay un taxi?",
    "que lindo que se ve el dia",
    "buenos dias",
    "buenas tardes",
    "ando esperando a un amigo",
    "alo?",
    "ta qlia",
    "jaja",
    "siche",
    "que tal todo?",
    "te deseo suerte en tu jordana",
    "se perdio mi amigo donde fue",
    "lindo coche",
    "linda polla tio",
    "oliwis",
    "tengo hambre",
    "tengo sed",
    "me estoy muriendo de hambre",
    "me estoy muriendo de sed",
    "creo que tendre que ir a un 24/7",
    "llamen a la policia",
    "ostras",
    "ostias",
    "madre mia",
    "brutal",
    "vaya",
    "que haces",
    "todo bien",
    "eu",
    "ey",
    "joder",
    "me cago en todo",
    "jeje",
    "qlq perri"
};

/* Doubt */
new fake_doubt[][] =
{
    "No hay taxis?",
    "cuanto tarda en cargar el camion",
    "cuanto tarda en cargar el camion?",
    "se puede reportar por insultos?",
    "cual es el foro",
    "cual es el foro?",
    "todos los trabajos dan igual",
    "todos lso trabajos dan igual?",
    "cual es el mejor trabajo",
    "cual es el mejor trabajo?",
    "cuanto da minero?",
    "cuanto da camionero?",
    "cuando da pescador?",
    "como se pica",
    "como se pica?",
    "por que no se me carga el camion",
    "porq no se carga el camion",
    "porque no se carga el cmaion?",
    "como invito a banda",
    "como invito a alguien a mi banda",
    "como doy dinero",
    "como doy dinero?",
    "Puedo ver en el foro que casas puedo comprar?",
    "Disculpen como me postulo osea como abro un tema para poder poner mi info?",
    "Como miro cuantos meses tengo en mi cuenta?",
    "En el foro abro como nuevo mensaje, encuesta o notificar ?",
    "Si una persona viene y me mata de la nasa solo por ser de otra banda es dm?",
    "Como veo la informacion de un objeto?",
    "Alguien sabe porque me aparece que él usuario no existe cuando intentó entrar en él foro?",
    "Si compre una casa y no juego hace un buen tiempo sigo teniendo la casa?",
    "Como cambio mi contraseña?",
    "Hay algún método para cambiar mi procedencia IC?",
    "Los sapd pueden dejar armas al morir?",
    "hola?",
    "un admin",
    "un admin?",
    "Necesito ayuda",
    "Estan abiertas las convocatorias Sapd??",
    "Ayuda, no me deja crear cuenta en foro.",
    "Y como le hago para ponerme un avatar en el foro",
    "Como pongo una imagen en una publicacion de el foro?",
    "Esta off el foro? Llevo una hora intentando entrar y no puedo",
    "Me jailearon por un error",
    "tengo un problema",
    "deseo hablar con un admin",
    "Si uno bugea animacion muerto con un porro y dispara es baneable?",
    "en cuanto puedo vender hc precio recomendable ?",
    "que carro sin hc tiene mas espacio en baul que el regina?",
    "es baneable recos de camio antirol?",
    "como apago emisora?",
    "como me voy de una banda",
    "a que nivel puedo tener escoba",
    "Puedo vender mi banda roleandolo?",
    "como pongo traximetro?",
    "esto es un canal de dudas o global?",
    "como hago para ver quien quiere taxi",
    "donde se venden semillas de mariguana",
    "como es el comando para vender hycoins",
    "como me subo la vida?",
    "como cargo un camion?",
    "puedo vender mi carro?",
    "como vendo mi carro?",
    "que se puede hacer al lvl 7?"
};

new fake_damage[][] =
{
    "que haces",
    "que haces?",
    "basta eu",
    "basta",
    "marikon",
    "maricon",
    "no me toques",
    "aaaaaa",
    "waaaaaaa",
    "hijo de puta",
    "hdp",
    "que haces enfermo",
    "enfermo",
    "deja de pegarme",
    "basta o llamo a la policia",
    "policiaaaa",
    "policia!",
    "ayuda!",
    "ayudaaaaaa",
    "ayuda waaaaaa",
    "ayudenmeeee",
    "por favor ayudaa",
    "ayudenme por favor",
    "nooooooo",
    "BASTAAA",
    "llamare a la policia"
};

/* Utils */
forward UpdateBot(playerid);
public UpdateBot(playerid)
{
	//SetPlayerFakePing(playerid, minrand(170, 345));

	/*if (BOTS[playerid][b_OCCUPIED])
	{
		switch(BOTS[playerid][b_ACTION_TYPE])
		{
			case 0: ApplyAnimation(playerid, "SWORD", "SWORD_4", 4.1, true, true, true, true, 0, true);
		}
	}*/
	return 1;
}

forward RandomBotAction(playerid);
public RandomBotAction(playerid)
{
	if (BOTS[playerid][b_OCCUPIED])
	{
		KillTimer(BOTS[playerid][b_TIMER][1]);
		return 0;
	}

	Add_Hungry_Thirst(playerid, 100.0, 100.0);
	SetPlayerHealthEx(playerid, 100.0);

	new action = random(9);
	//printf("aciton: %d id: %d", action, playerid);

	switch(action)
	{
		case 0: CallLocalFunction("OnPlayerText", "ds[128]", playerid, fake_chat[random(sizeof(fake_chat))]);
		case 1: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
		case 2: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE4);
		case 3:
		{
			ApplyAnimation(playerid, "SUNBATHE", "ParkSit_M_in", 4.000000, 0, 1, 1, 1, 0);
			ApplyAnimation(playerid, "SUNBATHE", "ParkSit_M_in", 4.000000, 0, 1, 1, 1, 0);
			ApplyAnimation(playerid, "SUNBATHE", "ParkSit_M_in", 4.000000, 0, 1, 1, 1, 0);
		}
		case 4:
		{
			ApplyAnimation(playerid,"RAPPING","RAP_B_Loop",4.0,1,0,0,0,8000);
			ApplyAnimation(playerid,"RAPPING","RAP_B_Loop",4.0,1,0,0,0,8000);
			ApplyAnimation(playerid,"RAPPING","RAP_B_Loop",4.0,1,0,0,0,8000);
		}
		case 5:
		{
			ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0,0);
			ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0,0);
			ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0,0);
		}
		case 6: CallLocalFunction("OnPlayerText", "ds[128]", playerid, fake_chat[random(sizeof(fake_chat))]);
		case 7:
		{
			switch(random(2))
			{
				case 0: SendMessageToDoubtChannel(playerid, fake_doubt[random(sizeof(fake_doubt))]);
				case 1: RandomBotAction(playerid);
			}
		}
		case 8:
		{
			if (TOTAL_MINER_BOTS >= 15) return RandomBotAction(playerid);
			BOTS[playerid][b_OCCUPIED] = true;
			KillTimer(BOTS[playerid][b_TIMER][1]);

			new index = random(sizeof(Miner_Positions));
			SetPlayerPos(playerid, Miner_Positions[index][0], Miner_Positions[index][1], Miner_Positions[index][2]);
			SetPlayerFacingAngle(playerid, Miner_Positions[index][3]);
			SetPlayerVirtualWorld(playerid, 36);
			SetPlayerInterior(playerid, 25);
			SetPlayerAttachedObject(playerid, 9, 19631, 6, 0.0789, 0.0000, 0.2580, -86.0000, -97.5000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
			ApplyAnimation(playerid, "SWORD", "SWORD_4", 4.1, true, false, false, false, 0, true);
			TOTAL_MINER_BOTS ++;
		}
	}
	return 1;
}

SetBot(playerid)
{
	BOTS[playerid][b_ACTIVE] = true;
	PLAYER_TEMP[playerid][py_USER_VALID_NAME] = true;

	new name[MAX_PLAYER_NAME];

	format(name, sizeof(name), "%s_%s", names[random(sizeof(names))], surnames[random(sizeof(surnames))]);
	
	printf("[rakbig] Bot detected | fakename: %s", name);

	KillTimer(BOTS[playerid][b_TIMER][0]);
	KillTimer(BOTS[playerid][b_TIMER][1]);

	PLAYER_TEMP[playerid][py_NAME] = name;
	ACCOUNT_INFO[playerid][ac_NAME] = name;
	BOTS[playerid][b_OCCUPIED] = false;

	SetPlayerName(playerid, name);
	//SetPlayerFakePing(playerid, minrand(170, 345));
	SetPlayerScore(playerid, minrand(1, 7));

	BOTS[playerid][b_TIMER][0] = SetTimerEx("UpdateBot", 5000, true, "i", playerid);
	//BOTS[playerid][b_TIMER][1] = SetTimerEx("RandomBotAction", 30000 + random(10000), true, "i", playerid);
	CallLocalFunction("OnPlayerRequestSpawn", "dd", playerid, 0);
	return 1;
}

forward BotDamageResponse(playerid);
public BotDamageResponse(playerid)
{
	CallLocalFunction("OnPlayerText", "ds[128]", playerid, fake_damage[random(sizeof(fake_damage))]);

	if(!BOTS[playerid][b_OCCUPIED])
	{
		switch(random(4))
		{
			case 0: ApplyAnimation(playerid, "PED", "FIGHTA_1", 4.1, false, false, false, false, 0, true);
			case 1: ApplyAnimation(playerid, "PED", "FIGHTA_2", 4.1, false, false, false, false, 0, true);
			case 2: ApplyAnimation(playerid, "PED", "FIGHTA_3", 4.1, false, false, false, false, 0, true);
		}
	}
    return 1;
}

forward SetBotInitPosition(playerid);
public SetBotInitPosition(playerid)
{
	new 
		index = random(sizeof(Bots_Positions)),
		Float:pos[3]
	;

	pos[0] = Bots_Positions[index][0];
	pos[1] = Bots_Positions[index][1];
	pos[2] = Bots_Positions[index][2];

	ClearAnimations(playerid);

	RandomCordFromPoint(minrand(10, 50), minrand(3, 5), pos[0], pos[1]);

	SetPlayerPosEx(playerid, pos[0], pos[1], pos[2], 0, 0, false, true);
    
	index = random(2);
	switch(index)
	{
		case 0: SetPlayerFacingAngle(playerid, float( random(390) ));
		case 1: SetPlayerFacingAngle(playerid, float( -random(390) ));
	}
    
    PreloadAnimLibs(playerid);
    return 1;
}

RandomCordFromPoint(range, negative, &Float:x, &Float:y)
{
	x = ( x + ( random( range ) - negative ) );
	y = ( y + ( random( range ) - negative ) );
	return 1;
}

SetBotInit(playerid)
{
	SetPlayerScore(playerid, minrand(1, 5));
	SetPlayerFightingStyle(playerid, 0);
	SetPlayerHealthEx(playerid, 100.0);
	SetPlayerArmourEx(playerid, 0.0);

	SetPlayerVirtualWorld(playerid, 0);
	SetSpawnInfo(playerid, NO_TEAM, minrand(1, 73), 76.632553, -301.156829, 1.578125, 0.0, 0, 0, 0, 0, 0, 0);
	SetPlayerInterior(playerid, 0);

	TogglePlayerSpectatingEx(playerid, false);

	StopAudioStreamForPlayer(playerid);
	TogglePlayerControllableEx(playerid, true);

	PLAYER_TEMP[playerid][py_GAME_STATE] = GAME_STATE_NORMAL;
	PLAYER_TEMP[playerid][py_USER_LOGGED] = true;

	new skin = minrand(1, 263);
	if (skin == 74) skin = 250;

	CHARACTER_INFO[playerid][ch_SKIN] = skin;
    SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
    PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];

    SetTimerEx("SetBotInitPosition", 5000, false, "i", playerid);
    PreloadAnimLibs(playerid);
	return 1;
}