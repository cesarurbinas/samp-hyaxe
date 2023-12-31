new
	SERVER_TIME[2], SERVER_WEATHER = 1,
	Harvest_Area;

// Default valors of ECO.TXT
new
	Float:MULTIPLIER_PROPERITES   =    3.00,
	Float:MULTIPLIER_VEHICLES     =    6.00,
	Float:MULTIPLIER_TOYS         =    1.00,
	Float:MULTIPLIER_SKINS        =    1.00,
	Float:MULTIPLIER_WEAPONS      =    1.00,
	SU_SD_PRICE                   =    10,
	SU_WORK_EXTRA_PAY             =    500;

// Grua
new Float:CRANE_POINTS[][] =
{
	{1658.864013, -1038.086303, 23.625518, 92.747535}, 
	{1654.135131, -1037.792968, 23.625541, 92.747535}, 
	{1649.980468, -1037.617187, 23.625516, 92.747535}, 
	{1644.892456, -1037.193969, 23.625497, 92.747535}, 
	{1640.745361, -1037.967407, 23.625522, 92.747535}, 
	{1623.962646, -1009.688537, 23.625467, 92.747535}, 
	{1589.339843, -1054.775756, 23.633340, 92.747535}, 
	{1628.770507, -1094.266113, 23.637195, 92.747535}, 
	{1658.056762, -1093.479858, 23.633333, 92.747535}, 
	{1692.347412, -1086.318115, 23.633335, 92.747535}, 
	{1691.461669, -1060.534545, 23.641109, 92.747535}, 
	{1705.033203, -1069.053100, 23.633340, 92.747535}, 
	{1681.086914, -1042.888916, 23.631181, 92.747535}, 
	{1645.038940, -1046.957397, 23.625473, 92.747535}
};

new Float:HELI_POINTS[][] =
{
	{1870.8346, -2362.9595, 13.7278, 269.8760},
	{1877.5729, -2383.7332, 13.7307, 252.6994},
	{1864.0851, -2392.8496, 13.7327, 246.9217},
	{1861.9218, -2405.8162, 13.7297, 237.7592},
	{1855.1949, -2417.2051, 13.7307, 224.7173},
	{1844.7252, -2428.4856, 13.7188, 209.6956},
	{1833.5146, -2435.0205, 13.7300, 196.8707},
	{1820.1514, -2435.8320, 13.7207, 184.7957},
	{1807.0276, -2434.6238, 13.7317, 169.5225},
	{1792.3116, -2429.8816, 13.7321, 150.6726}
};

new Float:PLANE_POINTS[][] =
{
	{2020.7158, -2419.4592, 14.4656, 178.9933},
	{2016.9490, -2457.6599, 14.4687, 176.8121},
	{2072.1826, -2413.3657, 14.4651, 174.2038},
	{2068.7610, -2455.7781, 14.4660, 175.3726},
	{2113.3372, -2426.8018, 14.4686, 180.5357},
	{2113.6724, -2462.4329, 14.4680, 180.5425},
	{1937.9019, -2636.3164, 14.4689, 359.2863},
	{1989.2371, -2635.4951, 14.4680, 354.3646},
	{2054.7385, -2632.9377, 14.4655, 357.9577},
	{2129.2986, -2593.4890, 14.4676, 59.8919}
};

new Float:BOAT_POINTS[][] =
{
	{172.9222, -1917.1361, -0.0950, 265.9427},
	{175.6403, -1931.0542, -0.0779, 268.9010},
	{181.6037, -1955.8153, -0.0899, 243.0126},
	{173.9550, -1972.1232, -0.2489, 224.5322},
	{154.3737, -1976.0867, -0.2409, 180.1947},
	{133.9302, -1963.5691, -0.1877, 121.2339},
	{130.3156, -1949.4956, -0.1302, 84.0668},
	{136.0246, -1928.6366, -0.2281, 92.4318},
	{135.4398, -1911.5667, -0.0460, 90.0312},
	{137.1646, -1890.6742, -0.2532, 98.9070},
	{346.5135, -1943.6816, 0.0415, 184.4238},
	{319.0179, -1942.5690, -0.0714, 177.3454},
	{288.1750, -1939.6559, -0.2473, 173.3970},
	{262.9959, -1937.6232, -0.0981, 172.6946},
	{246.1451, -1945.2040, -0.0782, 174.6319},
	{218.3720, -1947.8490, 0.0021, 173.3334},
	{193.3145, -1946.1705, -0.0850, 205.7223}
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