# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" },{ name: "Lord of the Rings" }])
#   Character.create(name: "Luke",movie: movies.irst)
# car brands to seed db

# brands = ['ACADIAN', 'ACURA', 'ALFA ROMEO', 'AMERICAN MOTORS', 'ARO',
#           'ASIA MOTORS', 'ASTON MARTIN', 'AUDI', 'AUSTIN', 'AUTORRAD', 'BAIC',
#           'BEIGING', 'BENTLEY', 'BMW', 'BRILLIANCE', 'BUICK', 'BYD', 'CADILLAC',
#           'CATERHAM', 'CHANGAN', 'CHANGHE', 'CHERY', 'CHEVROLET', 'CHRYSLER',
#           'CITROEN', 'COMMER', 'DACIA', 'DAEWOO', 'DAIHATSU', 'DATSUN', 'DFSK',
#           'DODGE', 'DONGFENG', 'DS AUTOMOBILES', 'F.S.O.', 'FAW', 'FERRARI',
#           'FIAT', 'FORD', 'FOTON', 'FREIGHTLINER', 'G.M.C.', 'GAC GONOW',
#           'GEELY', 'GREAT WALL', 'HAFEI', 'HAIMA', 'HAVAL', 'HILLMAN', 'HONDA',
#           'HYUNDAI', 'INFINITI', 'INTERNATIONAL', 'ISUZU', 'IVECO', 'JAC',
#           'JAGUAR', 'JEEP', 'JINBEI', 'JMC', 'KARMA', 'KENBO', 'KIA MOTORS',
#           'LADA', 'LAMBORGHINI', 'LANCIA', 'LAND ROVER', 'LANDWIND', 'LEXUS',
#           'LIFAN', 'LINCOLN', 'LOTUS', 'MAHINDRA', 'MASERATI', 'MAXUS', 'MAZDA',
#           'MCLAREN', 'MERCEDES BENZ', 'MERCURY', 'MG', 'MINI', 'MITSUBISHI',
#           'MORGAN', 'MORRIS', 'NISSAN', 'NSU', 'OLDSMOBILE', 'OPEL', 'PEUGEOT',
#           'PLYMOUTH', 'POLSKI FIAT', 'PONTIAC', 'SUZUKI', 'TATA', 'TOYOTA',
#           'VOLKSWAGEN', 'VOLVO', 'WILLYS', 'YUGO', 'ZASTAVA', 'ZNA', 'ZOTYE',
#           'ZX']

brands_with_models = [
  {
    brand: 'CHEVROLET',
    models: [
      "1.300_KG",
      "APACHE-10",
      "APACHE-20",
      "ASKA",
      "ASTRA",
      "ASTRO",
      "AVALANCHE",
      "AVEO",
      "B-10",
      "B-20",
      "BEAUVILLE",
      "BEL-AIR",
      "BERETTA",
      "BLAZER",
      "BYSCAINE",
      "C10",
      "C100",
      "C1500",
      "C20",
      "C30",
      "CAMARO",
      "CAPRICE",
      "CAPTIVA",
      "CARAVAN",
      "CAVALIER",
      "CELEBRITY",
      "CHEVELLE",
      "CHEVETTE",
      "CHEVY",
      "CHEYENNE",
      "CITATION",
      "COBALT",
      "COLORADO",
      "COMODORE",
      "CORSA",
      "CORSICA",
      "CORVAIR",
      "CORVETTE",
      "CRUZE",
      "D-MAX",
      "DIPLOMATA",
      "EL_CAMINO",
      "EPICA",
      "EQUINOX",
      "EXPRESS",
      "EXPRESS PASSENGER VAN",
      "GEMINI",
      "GRAND LUV",
      "HATCH",
      "IMPALA",
      "LAGUNA",
      "LUMINA",
      "LUV",
      "LUV D-MAX",
      "MALIBU",
      "MARAJO",
      "MONTANA",
      "MONTANA",
      "MONTECARLO",
      "MONTEGO",
      "MONZA",
      "NG TRAVERSE",
      "ONIX",
      "OPALA",
      "OPTRA",
      "ORLANDO",
      "PRISMA",
      "RECORD",
      "S10",
      "SAIL",
      "SCOTTDALE",
      "SILVERADO",
      "SONIC",
      "SPARK",
      "SPECTRUM",
      "SPIN",
      "SUBURBAN",
      "TAHOE",
      "TRACKER",
      "TRAILBLAZER",
      "TRAVERSE",
      "TROOPER",
      "UPLANDER",
      "VECTRA",
      "VEGA",
      "VENTURE",
      "VERANEIRO",
      "VIVANT",
      "ZAFIRA"
    ]
  },
  {
    brand: 'AUDI',
    models: [
      "100",
      "80",
      "90",
      "A1",
      "A3",
      "A4",
      "A5",
      "A6",
      "A7",
      "A8",
      "ALLROAD",
      "CABRIOLET",
      "Q2",
      "Q3",
      "Q5",
      "Q7",
      "R8",
      "RS3",
      "RS4",
      "RS5",
      "RS6",
      "RS7",
      "RSQ3",
      "S1",
      "S2",
      "S3",
      "S4",
      "S5",
      "S6",
      "S7",
      "S8",
      "SQ5",
      "TT",
      "TTR",
      "TTRS",
      "TTS",
      "W12"        
    ]
  },
  {
    brand: 'ACADIAN',
    models: [
      "BEAUMONT",
      "SEDAN"
    ]
  },
  {
    brand: 'ACURA',
    models: [
      "INTEGRA",
      "LEGEND"
    ]
  },
  {
    brand: 'ALFA ROMEO',
    models: [
      "145",
      "146",
      "147",
      "155",
      "156",
      "159",
      "164",
      "166",
      "ALFA 33",
      "ALFA 75",
      "ALFA SPORTWAGON",
      "ALFA33",
      "ALFA75",
      "ALFA_SPORTWAGON",
      "ALFASUD",
      "ALFETTA",
      "BRERA",
      "GIULIETTA",
      "GIULIETTA1.4",
      "GT",
      "GTV",
      "MITO",
      "SEDAN",
      "SPIDER",
      "SPRINT"
    ]
  },
  {
    brand: 'AMERICAN MOTORS',
    models: [
      "CHEROKEE",
      "CJ-8",
      "CJ8",
      "COMANCHE",
      "HORNET",
      "LAREDO",
      "PACER",
      "RENEGADE"
    ]
  },
  {
    brand: 'ARO',
    models: [
      "DACIA",
      "STANDARD"
    ]
  },
  {
    brand: 'ASIA MOTORS',
    models: [
      "ROCSTA",
      "TOWNER"
    ]
  },
  {
    brand: 'ASTON MARTIN',
    models: [
      "DB11",
      "DB9",
      "DBS",
      "RAPIDE",
      "RAPIDE S",
      "VANQUISH",
      "VANQUISH S",
      "VANTAGE",
      "VIRAGE"
    ]
  },
  {
    brand: 'AUSTIN',
    models: [
      "1100",
      "500-KGS.",
      "500KG",
      "A-40",
      "A-7",
      "A40",
      "A7",
      "ALLEGRO",
      "GT",
      "METRO",
      "MG",
      "MINI",
      "MODELO-1.100"
    ]
  },
  {
    brand: 'AUTORRAD',
    models: [
      "CENTURY",
      "OUTSIDER",
      "RUDA"
    ]
  },
  {
    brand: 'BAIC',
    models: [
      "UP",
      "X25",
      "X35",
      "X55"
    ]
  },
  {
    brand: 'BEIGING',
    models: [
      "BJ"
    ]
  },
  {
    brand: 'BENTLEY',
    models: [
      "BENTAYGA",
      "CONTINENTAL",
      "FLYING",
      "FLYING SPUR",
      "MULSANNE"
    ]
  },
  {
    brand: 'BMW',
    models: [
      "1602",
      "114",
      "114I",
      "116",
      "116D",
      "116I",
      "118",
      "118I",
      "120",
      "120I",
      "125",
      "125D",
      "125I",
      "130",
      "135",
      "1602",
      "2002",
      "218",
      "218D",
      "218I",
      "220",
      "220I",
      "315",
      "316",
      "318",
      "318I",
      "320",
      "320I",
      "323",
      "325",
      "328",
      "328I",
      "330",
      "335",
      "335I",
      "340",
      "420",
      "420I",
      "428",
      "430",
      "430I",
      "435",
      "440",
      "440I",
      "500",
      "518",
      "520",
      "523",
      "525",
      "528",
      "530",
      "530E",
      "530I",
      "535",
      "540",
      "545",
      "550",
      "628",
      "630",
      "633",
      "635",
      "640",
      "640I",
      "645",
      "650",
      "650I",
      "728",
      "730",
      "732",
      "733",
      "735",
      "740",
      "740E",
      "745",
      "750",
      "760",
      "ACTIVE",
      "I3",
      "I8",
      "M",
      "M135",
      "M140",
      "M140I",
      "M2",
      "M235",
      "M240",
      "M240I",
      "M3",
      "M4",
      "M5",
      "M5",
      "M550",
      "M6",
      "X1",
      "X1 SDRIVE18",
      "X1 SDRIVE20",
      "X2 SDRIVE20",
      "X2 XDRIVE20",
      "X3",
      "X3 XDRIVE20",
      "X3 XDRIVE30",
      "X4",
      "X5",
      "X5 SDRIVE25",
      "X5 XDRIVE30",
      "X5 XDRIVE35",
      "X5 XDRIVE40E",
      "X6",
      "X6 XDRIVE30",
      "X6 XDRIVE35",
      "X6 XDRIVE40",
      "X6XDRIVE35",
      "Z3",
      "Z4"
    ]
  },
  {
    brand: 'BRILLIANCE',
    models: [
      "EUPHORIA",
      "FRV",
      "FSV",
      "H220",
      "H230",
      "SPLENDOR",
      "V3",
      "V5"
    ]
  },
  {
    brand: 'BUICK',
    models: [
      "APOLLO",
      "CENTURY",
      "COMPACTO",
      "GRAN SPORT",
      "GRAN-SPORT",
      "LE SABRE",
      "LE-SABRE",
      "REGAL",
      "RIVIERA",
      "SKYHAW",
      "SKYHAWK",
      "SKYLARK",
      "SPORT-WAGON"
    ]
  },
  {
    brand: 'BYD',
    models: [
      "F0",
      "F3",
      "F3-R",
      "F3R",
      "G3",
      "NEW",
      "S6"
    ]
  },
  {
    brand: 'CADILLAC',
    models: [
      "CALAIS",
      "DE VILLE",
      "DE-VILLE",
      "EL DORADO",
      "EL-DORADO",
      "FLEETWOOD",
      "FLEETWOOD BROUGHAM",
      "SEVILLE"
    ]
  },
  {
    brand: 'CATERHAM',
    models: [
      "SEVEN",
      "SIGMA"
    ]
  },
  {
    brand: 'CHANGAN',
    models: [
      "A500",
      "BENNI",
      "CS1",
      "CS15",
      "CS35",
      "CS75",
      "CV1",
      "CV2",
      "CX70",
      "EADO",
      "MD201",
      "MS201",
      "NEW CS35",
      "S100",
      "S200"
    ]
  },
  {
    brand: 'CHANGHE',
    models: [
      "SPLA"
    ]
  },
  {
    brand: 'CHERY',
    models: [
      "A516",
      "ARRIZO",
      "ARRIZO 3",
      "ARRIZO 5",
      "ARRIZO3",
      "ARRIZO5",
      "ARRIZO7",
      "BEAT",
      "DESTINY",
      "FACE",
      "FULWIN",
      "GRAND",
      "GRAND TIGGO",
      "IQ",
      "NEW",
      "S21",
      "SKIN",
      "TIGGO",
      "TIGGO 2",
      "TIGGO 3",
      "TIGGO 4",
      "TIGGO 7",
      "TIGGO1",
      "TIGGO2",
      "TIGGO3"
    ]
  },
  {
    brand: 'CHRYSLER',
    models: [
      "150",
      "300",
      "300 C",
      "300 M",
      "300C",
      "CARAVAN",
      "CHEROKEE",
      "CORDOBA",
      "CORDOVA",
      "CROSS-FIRE",
      "CROSSFIRE",
      "GRAND",
      "GRAND CARAVAN",
      "GRAND CHEROKEE",
      "GRAND TOWN COUNTRY",
      "IMPERIAL",
      "LE BARON",
      "LE-BARON",
      "NEON",
      "NEW CARAVAN",
      "NEW SEBRING",
      "PACIFICA",
      "PT",
      "PT CRUISER",
      "PT CRUISER",
      "SEBRING",
      "STRATUS",
      "TOWN COUNTRY",
      "VISION",
      "WRANGLER"
    ]
  },
  {
    brand: 'CITROEN',
    models: [
      "18 HP",
      "18-HP",
      "2CV6",
      "A.Z.U.",
      "ACADYANE",
      "AMI 8",
      "AMI-8",
      "AX",
      "AZU",
      "BERLINGO",
      "BX",
      "C-1",
      "C-3",
      "C-4",
      "C-5",
      "C-AZAM",
      "C-ELYSEE",
      "C1",
      "C2",
      "C3",
      "C3 AIRCROSS",
      "C3 PICASSO",
      "C4",
      "C4 PICASSO",
      "C5",
      "C6",
      "CX",
      "DS",
      "DS3",
      "DS4",
      "DS5",
      "DYANA",
      "GRAND",
      "GRAND C4",
      "GRAND C4 PICASSO",
      "GS",
      "GSA",
      "L.N.A.",
      "LNA",
      "MULTISPACE",
      "MULTISPACE",
      "MULTISPACE",
      "NEMO",
      "NUEVO",
      "REFLEX",
      "SAXO",
      "SPACEVAN",
      "VISA",
      "XANTIA",
      "XM",
      "XSARA",
      "XSARA PICASSO",
      "YAGAN",
      "ZX"
    ]
  },
  {
    brand: 'COMMER',
    models: [
      "350-KG"
    ]
  },
  {
    brand: 'DACIA',
    models: [
      "1.304 MIL KGS",
      "1410",
      "10,4",
      "43565",
      "1304 KG",
      "1410"
    ]
  },
  {
    brand: 'DAEWOO',
    models: [
      "ESPERO",
      "HEAVEN",
      "KORANDO",
      "LANOS",
      "LEGANZA",
      "MATIZ",
      "MUSSO",
      "NEW POINTER",
      "NEXIA",
      "NUBIRA",
      "POINTER",
      "PRINCE",
      "RACER",
      "REZZO",
      "SUPER SALON",
      "SUPER-SALON",
      "TICO"
    ]
  },
  {
    brand: 'DAIHATSU',
    models: [
      "APPLAUSE",
      "CHARADE",
      "CHARMANT",
      "COPEN",
      "CUORE",
      "FEROZA",
      "GIRO",
      "GRAN MOVE",
      "GRAN-MOVE",
      "HIJET",
      "MAX CUORE",
      "MAX-CUORE",
      "MIRA",
      "ROCKY",
      "SIRION",
      "SUPER CUORE",
      "SUPER-CUORE",
      "TAFT",
      "TERIOS",
      "YRV"
    ]
  },
  {
    brand: 'DATSUN',
    models: [
      "100-A",
      "100A",
      "120-A",
      "120-Y",
      "120A",
      "120Y",
      "130-A",
      "130A",
      "140-J",
      "140-Y",
      "140J",
      "140Y",
      "150-Y",
      "150Y",
      "160-B",
      "160-J",
      "160B",
      "160J",
      "180-B",
      "180-K",
      "180-SX",
      "180B",
      "180K",
      "180SX",
      "200-SX",
      "200SX",
      "260-C",
      "260-Z",
      "260C",
      "260Z",
      "280-ZX",
      "280ZX",
      "500 KG",
      "500KG",
      "B-210",
      "B210",
      "BLUEBIRD",
      "C/S",
      "C/S-STD",
      "CABINA Y MEDIA",
      "CABINA_Y_MEDIA",
      "CEDRIC",
      "CHASSIS CORTO",
      "CHASSIS LARGO",
      "CHASSIS-CORTO",
      "CHASSIS-LARGO",
      "CON ESTACAS",
      "CON-ESTACAS",
      "D/C",
      "KING CAB",
      "KING-CAB",
      "LAUREL",
      "SEDAN",
      "SUNNY"
    ]
  },
  {
    brand: 'DFSK',  
    models: [
      "580 1.5T COMFORT",	
      "580 1.5T LUXURY",	
      "580 1.8L COMFORT",	
      "CARGO BOX CS 1.3 R14 SERIE V EV",	
      "CARGO BOX CS C21",	
      "CARGO BOX CS C21 AC",	
      "CARGO BOX CS XL 1.3 DA EV",	
      "REFRITRUCK XL 1.3 DA EV",	
      "TRUCK CS 1.5 SERIE C",	
      "TRUCK CS C21",	
      "TRUCK CS C21 AC",	
      "TRUCK DC 1.3 R14 SERIE V EV",	
      "TRUCK DC 1.5 SERIE C",	
      "TRUCK DC C22",	
      "TRUCK DC C22 AC",	
      "TRUCK DC XXL 1.0 DA EV",	
      "TRUCK DC XXL 1.3 DA EV",	
      "TRUCK SC 1.3 R14 SERIE V EV",	
      "TRUCK SC XL 1.0 DA EV",	
      "TRUCK SC XL 1.3 DA EV"
    ]
  },
  {
    brand: 'DODGE',
    models: [
      "500 A",
      "500 A 750 KGS",
      "ARIES",
      "ASPEN",
      "CALIBER",
      "CHALLENGER",
      "CHARGER",
      "COLT",
      "CORONET",
      "CROWN",
      "DAKOTA",
      "DART",
      "DURANGO",
      "GALANT",
      "GRAND",
      "GRAND CARAVAN",
      "JOURNEY",
      "JOURNEY2.0",
      "JOURNEY2.4",
      "LANCER",
      "NEW",
      "NITRO",
      "RAM",
      "RAM3.0",
      "RAM3.6",
      "RAM5.7",
      "RAM6.7",
      "ROYAL",
      "SEDAN",
      "SWINGER",
      "VALIANT",
      "VIPER"
    ]
  },
  {
    brand: 'DONGFENG',
    models: [
      "580",
      "A30",
      "AX3",
      "AX5",
      "AX7",
      "CARGO",
      "CARGO BOX",
      "DF",
      "DF2500",
      "DF2900",
      "DFA1025F12QA",
      "H30",
      "JOYEAR",
      "JOYEAR S50",
      "JOYEAR SX5",
      "JOYEAR SX6",
      "MINISTAR",
      "MINISTAR",
      "MINITRUCK",
      "MINITRUCK",
      "MINITRUCK",
      "MULTIPROPOSITO",
      "OTING",
      "REFRI",
      "REFRITRUCK",
      "RICH",
      "S30",
      "SUCCE",
      "TRUCK",
      "VAN",
      "VAN SUCCE"
    ]
  },
  {
    brand: 'DS AUTOMOBILES',
    models: [
      "DS3",
      "DS4",
      "DS5",
      "DS7"
    ]
  },
  {
    brand: 'F.S.O',
    models: [
      "1.500 CC",
      "1.500-CC",
      "125",
      "125P",
      "POLONEZ"
    ]
  },
  {
    brand: 'FAW',
    models: [
      "B50",
      "B50/AT",
      "B50/MT",
      "BESTURN",
      "D60",
      "MAMUT",
      "OLEY",
      "T80",
      "V2",
      "V5",
      "V80",
      "X80"      
    ]
  },
  {
    brand: 'FERRARI',
    models: [
      "458",
      "488",
      "812",
      "CALIFORNIA",
      "F-360",
      "F-599",
      "F12",
      "F149",
      "F360",
      "F430",
      "F599",
      "FERRARI",
      "FF",
      "GTC"
    ]
  },
  {
    brand: 'FIAT',
    models: [
      "124",
      "125",
      "126",
      "128",
      "131",
      "132",
      "147",
      "500",
      "500L",
      "500X",
      "600",
      "700 ADVENTURE",
      "ARGENTA",
      "ARGO",
      "BARCHETTA",
      "BRAVA",
      "BRAVO",
      "CINQUECENTO",
      "CITY",
      "CRONOS",
      "DIGIT",
      "DOBLO",
      "DUNA",
      "FIAT",
      "FIORINO",
      "FULLBACK",
      "GRANDE",
      "GRANDE PUNTO",
      "IDEA",
      "LINEA",
      "MAREA",
      "NUEVO 500",
      "NUEVO 500C",
      "NVA",
      "NVO",
      "OGGI",
      "PALIO",
      "PANDA",
      "PANORAMA",
      "PICK UP",
      "PICK-UP",
      "PREMIO",
      "PUNTO",
      "QUBO",
      "RAM 700",
      "REGATA",
      "RITMO",
      "SIENA",
      "SILVER",
      "SPAZZIO",
      "STILO",
      "STRADA",
      "TEMPRA",
      "TIPO",
      "UNO",
      "WEEKEND",
      "X 1/9 BERTONE",
      "X-1/9"
    ]
  },
  {
    brand: 'FORD',
    models: [
      "12-M",
      "17-M",
      "750_KGS.",
      "BELINA",
      "BRONCO",
      "CAPRI",
      "CONSUL",
      "CONTOUR",
      "CORCEL",
      "CORTINA",
      "COUNTRY",
      "COURIER",
      "CROWN_VICTOR.LX",
      "CUSTOM",
      "DEL_REY",
      "E150",
      "E250",
      "E350",
      "ECOSPORT",
      "EDGE",
      "ESCAPE",
      "ESCORT",
      "EURO ESCORT",
      "EUROESCORT",
      "EXPEDITION",
      "EXPLORER",
      "F100",
      "F1000",
      "F150",
      "F250",
      "F350",
      "FAIRLAINE",
      "FAIRMONT",
      "FALCON",
      "FESTIVA",
      "FIESTA",
      "FOCUS",
      "FUSION",
      "FUTURA",
      "GALAXIE",
      "GRANADA",
      "HERITAGE",
      "KA",
      "LASER",
      "LTD",
      "MAVERICK",
      "MERCURY",
      "MONDEO",
      "MUSTANG",
      "NEW",
      "NEW ESCAPE",
      "NEW EXPLORER",
      "NEW FOCUS",
      "NUEVA",
      "PAMPA",
      "PINTO",
      "PREFECT",
      "PROBE",
      "RANCHERA",
      "RANGER",
      "SIERRA",
      "SIN MODELO",
      "SUPER_CLUB_WAGON",
      "TAUNUS",
      "TAURUS",
      "TELSTAR",
      "TEMPO",
      "THUNDERBIRD",
      "TORINO",
      "U50",
      "WINDSTAR",
      "ZEPHIR"
    ]
  },
  {
    brand: 'FOTON',
    models: [
      "FT-500",
      "FT500",
      "MIDI",
      "SAUVANA",
      "SUP",
      "TERRACOTA"
    ]
  },
  {
    brand: 'G.M.C',
    models: [
      "BLAZER",
      "JIMMY",
      "SIERRA",
      "SPRINT"
    ]
  },
  {
    brand: 'GAC GONOV',
    models: [
      "GA5",
      "GS5",
      "WAY"
    ]
  },
  {
    brand: 'GEELY',
    models: [
      "08MK",
      "CK",
      "CK3",
      "EC",
      "EX7",
      "GC7",
      "LC",
      "MK",
      "NEW",
      "SL"
    ]
  },
  {
    brand: 'GREAT WALL',
    models: [
      "DEER",
      "FLORID",
      "HAVAL",
      "HAVAL-H3",
      "HAVAL-H6",
      "HAVAL-M4",
      "HAVAL3",
      "HAVAL5",
      "HAVAL6",
      "HOVER",
      "PERI",
      "SAFE",
      "SOCOOL",
      "VOLEEX",
      "VOLEEX-C10",
      "VOLEEX-C20",
      "VOLEEX-C30",
      "VOLEEX-C50",
      "WINGLE",
      "WINGLE5",
      "WINGLE6"
    ]
  },
  {
    brand: 'HAFEI',
    models: [
      "LOBO",
      "MINITRUCK",
      "RUIYI"
    ]
  },
  {
    brand: 'HAIMA',
    models: [
      "HAIMA 3",
      "HAIMA2",
      "HAIMA3",
      "HAIMA7",
      "NEW"
    ]
  },
  {
    brand: 'HAVAL',
    models: [
      "H2",
      "H6",
      "H7"
    ]
  },
  {
    brand: 'HILLMAN',
    models: [
      "TRANSFORMADO"
    ]
  },
  {
    brand: 'HONDA',
    models: [
      "ACCORD",
      "ACTY",
      "BUGGI",
      "CITY",
      "CIVIC",
      "CR-V",
      "FIT",
      "FIT",
      "FIT",
      "HR-V",
      "INTEGRA",
      "LEGEND",
      "NEW",
      "ODYSSEY",
      "PILOT",
      "PRELUDE",
      "QUINTET",
      "RIDGELINE",
      "STREAM",
      "WR-V"
    ]
  },
  {
    brand: 'HYUNDAI',
    models: [
      "ACCENT",
      "ATOS",
      "AZERA",
      "CENTENNIAL",
      "COUPE",
      "CRETA",
      "ELANTRA",
      "EON",
      "EQUUS",
      "EXCEL",
      "GALLOPER",
      "GENESIS",
      "GETZ",
      "GRAND",
      "GRAND I-10",
      "GRAND I-10",
      "GRAND SANTA FE",
      "H-1",
      "H1",
      "HD 35",
      "HD 35 LIGHT",
      "I10",
      "I20",
      "I30",
      "I40",
      "IONIQ",
      "MATRIX",
      "NEW",
      "NEW CENTENNIAL",
      "PONY",
      "PORTER",
      "SANTA",
      "SANTA FE",
      "SANTAMO",
      "SONATA",
      "STELLAR",
      "TERRACAN",
      "TUCSON",
      "VELOSTER",
      "VERACRUZ",
      "XG"
    ]
  },
  {
    brand: 'INFINITI',
    models: [
      "EX37",
      "FX37",
      "G",
      "G25",
      "G37",
      "G60",
      "M37",
      "Q50",
      "Q60",
      "Q60S",
      "Q60SD",
      "Q70",
      "QX 30",
      "QX 50",
      "QX 70",
      "QX 80",
      "QX30",
      "QX50",
      "QX60",
      "QX70",
      "QX80"
    ]
  },
  {
    brand: 'INTERNATIONAL',
    models: [
      "1.000 KGS.",
      "1.000-KGS.",
      "750 KGS.",
      "750-KGS.",
      "CORTO",
      "SIN MODELO"
    ]
  },
  {
    brand: 'ISUZU',
    models: [
      "COUPE",
      "RANCHERA",
      "SEDAN",
      "XS"
    ]
  },
  {
    brand: 'JAC',
    models: [
      "A 137",
      "A-137",
      "A0",
      "A137",
      "BCLASS",
      "GRAND S3",
      "J4",
      "REFINE",
      "REIN",
      "S1",
      "S2",
      "S3",
      "S5",
      "T6",
      "TRIP",
      "X200"
    ]
  },
  {
    brand: 'JAGUAR',
    models: [
      "9000",
      "9000 GRIFFIN",
      "DAIMLER",
      "E-PACE",
      "F-PACE",
      "F-TYPE",
      "S-TYPE",
      "SOVEREIGN",
      "X-TYPE",
      "XE",
      "XF",
      "XFR",
      "XJ",
      "XJ6",
      "XJ6",
      "XJ8",
      "XJR",
      "XJS",
      "XK",
      "XK8",
      "XKR"
    ]
  },
  {
    brand: 'JEEP',
    models: [
      "CHEROKEE",
      "COMMANDER",
      "COMPASS",
      "GRAND",
      "GRAND CHEROKEE",
      "GRAND CHEROKEE",
      "PATRIOT",
      "RENEGADE",
      "WRANGLER"
    ]
  },
  {
    brand: 'JMC',
    models: [
      "BOARDING",
      "CARRYING"
    ]
  },
  {
    brand: 'KENBO',
    models: [
      "T205"
    ]
  },
  {
    brand: 'KIA MOTORS',
    models: [
      "AVELLA",
      "BRISA",
      "CADENZA",
      "CARENS",
      "CARNIVAL",
      "CERATO",
      "CERES",
      "CLARUS",
      "CLARUS",
      "FAMILY-WAGON",
      "FRONTIER",
      "GRAND",
      "GRAND CARNIVAL",
      "JOICE",
      "K2400",
      "KOUP",
      "MAGENTIS",
      "MOHAVE",
      "MORNING",
      "NUEVA",
      "NUEVO",
      "NVO",
      "OPIRUS",
      "OPTIMA",
      "PRIDE",
      "QUORIS",
      "RETONA",
      "RIO",
      "SEPHIA",
      "SORENTO",
      "SORENTOEX",
      "SOUL",
      "SPECTRA",
      "SPORTAGE",
      "STINGER",
      "TOWNER"
    ]
  },
  {
    brand: 'LADA',
    models: [
      "2104",
      "21043",
      "21044",
      "2105",
      "21053",
      "2106",
      "21060",
      "2107",
      "21070",
      "21073",
      "21074",
      "21083",
      "2109",
      "21093",
      "21099",
      "27151",
      "CARGO",
      "CHARLOTTE",
      "LARGUS",
      "NIEVA",
      "NIVA",
      "SAMARA",
      "SEDAN",
      "TAVRIA"
    ]
  },
  {
    brand: 'LAMBOGHINI',
    models: [
      "AVENTADOR",
      "GALLARDO",
      "HURACAN"
    ]
  },
  {
    brand: 'LANCIA',
    models: [
      "APPIA",
      "DEDRA",
      "DELTA",
      "EXECUTIVE",
      "GAMA",
      "GAMA COUPE",
      "GEMMA",
      "GEMMA BERLINA",
      "H-P",
      "H-P EXECUTIVE",
      "KAPPA",
      "PRISMA",
      "THEMA",
      "Y-10",
      "Y10"
    ]
  },
  {
    brand: 'LAND ROVER',
    models: [
      "CORTO",
      "DEFENDER",
      "DISCOVERY",
      "EVOQUE",
      "FREELANDER",
      "LARGO",
      "RANGE",
      "RANGE ROVER",
      "SANTANA"
    ]
  },
  {
    brand: 'LANDWIND',
    models: [
      "LUX"
    ]
  },
  {
    brand: 'LEXUS',
    models: [
      "CT200",
      "CT20010",
      "CT20020",
      "CT200F",
      "CT200H",
      "ES250",
      "ES350",
      "ES35020",
      "GS",
      "GS200",
      "GS250",
      "GS300",
      "GS350",
      "GS350F",
      "GS450",
      "GS460",
      "IS200",
      "IS250",
      "IS250T",
      "IS300",
      "IS350",
      "LS460",
      "LS500",
      "LS600",
      "LX570",
      "LX57020",
      "NEW",
      "NX200",
      "NX200T",
      "NX300",
      "NX300H",
      "RC",
      "RC350",
      "RX350",
      "RX35011",
      "RX450",
      "RX45011",
      "SC430"
    ]
  },
  {
    brand: 'LIFAN',
    models: [
      "320",
      "330",
      "520",
      "530",
      "620",
      "630",
      "TRUCK",
      "VAN",
      "X50",
      "X60",
      "X7"
    ]
  },
  {
    brand: 'LINCOLN',
    models: [
      "CONTINENTAL"
    ]
  },
  {
    brand: 'LOTUS',
    models: [
      "ELISE",
      "EXIGE"
    ]
  },
  {
    brand: 'MAHINDRA',
    models: [
      "GENIO",
      "NEW",
      "PICK UP",
      "PIK-UP",
      "QUANTO",
      "SCORPIO",
      "XUV500"
    ]
  },
  {
    brand: 'MASERATI',
    models: [
      "COUPE",
      "GHIBLI",
      "GRANCABRIO",
      "GRANSPORT",
      "GRANTURISMO",
      "LEVANTE",
      "QUATTROPORTE",
      "SPYDER"
    ]
  },
  {
    brand: 'MAXUS',
    models: [
      "G10",
      "T60"
    ]
  },
  {
    brand: 'MAZDA',
    models: [
      "121",
      "2",
      "3",
      "323",
      "5",
      "6",
      "616",
      "626",
      "808",
      "929",
      "ALL",
      "ARTIS",
      "B 2000",
      "B2000",
      "B2200",
      "B2500",
      "B2600",
      "B2900",
      "BT50",
      "CREW",
      "CX-9",
      "CX3",
      "CX5",
      "CX7",
      "E1600",
      "E2200",
      "MAZDA2",
      "MAZDA3",
      "MAZDA3",
      "MAZDA5",
      "MAZDA6",
      "MAZDA6",
      "MIATA",
      "MPV",
      "MX-5",
      "MX3",
      "MX5",
      "MX6",
      "NEW",
      "RX2",
      "RX7",
      "RX8",
      "SIN MODELO",
      "TRIBUTE"
    ]
  },
  {
    brand: 'MCLAREN',
    models: [
      "540",
      "540C",
      "570",
      "570GT",
      "570S",
      "570S SPIDER",
      "65+C17",
      "650",
      "650S",
      "675LT",
      "720S",
      "MP4-12C",
      "P1",
      "V180"
    ]
  },
  {
    brand: 'MERCEDES BENZ',
    models: [
      "180",
      "190",
      "200",
      "206",
      "220",
      "230",
      "230/6",
      "240",
      "250",
      "260",
      "280",
      "300",
      "307",
      "310",
      "320",
      "350",
      "380",
      "420",
      "450",
      "500",
      "560",
      "A",
      "A180",
      "A200",
      "A250",
      "A45",
      "AMG",
      "B",
      "B180",
      "B200",
      "C",
      "C180",
      "C200",
      "C220",
      "C250",
      "C300",
      "C350",
      "C400",
      "C43",
      "C450",
      "C63",
      "CL",
      "CL63",
      "CLA",
      "CLA180",
      "CLA200",
      "CLA220",
      "CLA250",
      "CLA45",
      "CLC",
      "CLK",
      "CLS",
      "CLS350",
      "CLS400",
      "CLS500",
      "CLS63",
      "E",
      "E200",
      "E220",
      "E240",
      "E250",
      "E300",
      "E350",
      "E400",
      "E43",
      "E500",
      "E63",
      "G",
      "G350",
      "G500",
      "G55",
      "G63",
      "GL",
      "GL350",
      "GL500",
      "GL63",
      "GLA",
      "GLA200",
      "GLA220",
      "GLA250",
      "GLA45",
      "GLC",
      "GLC220",
      "GLC250",
      "GLE",
      "GLE250",
      "GLE350",
      "GLE400",
      "GLE450",
      "GLE500",
      "GLE63",
      "GLK",
      "GLK220",
      "GLK350",
      "GLS350",
      "GLS500",
      "MB",
      "ML",
      "ML250",
      "ML350",
      "ML400",
      "ML500",
      "ML63",
      "R",
      "R500",
      "S",
      "S350",
      "S500",
      "S600",
      "S63",
      "S65",
      "SL",
      "SL350",
      "SL400",
      "SL500",
      "SL63",
      "SLC",
      "SLK",
      "SLK200",
      "SLK350",
      "SLK55",
      "SLS",
      "SPRINTER",
      "V",
      "VIANO"
    ]
  },
  {
    brand: 'MERCURY',
    models: [
      "BOBCAT",
      "CAPRI",
      "COMET",
      "COUGAR",
      "GRAND MARQUIS",
      "GRAND-MARQUIS",
      "HAT.",
      "LIFTGATE",
      "LYNX",
      "MARQUIS",
      "MONARCH",
      "MONTEGO",
      "SABLE",
      "ZEPHIR"
    ]
  },
  {
    brand: 'MG',
    models: [
      "350",
      "550",
      "6",
      "750",
      "DELUXE",
      "MG3",
      "MG350",
      "MG360",
      "MG5",
      "MG550",
      "MG6",
      "MG750",
      "MGGS",
      "MGGT",
      "RX 5",
      "RX5",
      "TF",
      "ZS",
      "ZT"
    ]
  },
  {
    brand: 'MINI',
    models: [
      "CLUBMAN",
      "COOPER",
      "COUNTRYMAN",
      "COUPE",
      "F54",
      "F55",
      "F55 5P COOPER",
      "F56",
      "F56 3P COOPER",
      "F56 3P COOPER S",
      "F57",
      "F60",
      "JCW",
      "JOHN",
      "JOHN COOPER WORKS",
      "PACEMAN",
      "ROADSTER"
    ]
  },
  {
    brand: 'MITSUBICHI',
    models: [
      "ASX",
      "COLT",
      "ECLIPSE",
      "GALANT",
      "GALANT",
      "I-MIEV",
      "L100",
      "L200",
      "L300",
      "LANCER",
      "MIRAGE",
      "MONTERO",
      "MONTERO SPORT",
      "NEW LANCER",
      "NEW MONTERO",
      "NEW OUTLANDER",
      "OUTLANDER",
      "SAPPORO",
      "STARION"
    ]
  },
  {
    brand: 'MORGAN',
    models: [
      "4",
      "4/4",
      "AERO",
      "AERO 8",
      "PLUS",
      "PLUS 4"
    ]
  },
  {
    brand: 'MORRIS',
    models: [
      "MARINA"
    ]
  },
  {
    brand: 'NISSAN',
    models: [
      "180",
      "200",
      "240",
      "280",
      "300",
      "350Z",
      "370Z",
      "500-KG",
      "AD-WAGON",
      "ALMERA",
      "ALTIMA",
      "BLUEBIRD",
      "C/S",
      "CABINA",
      "CEDRIC",
      "CHASSIS-CORTO",
      "CHASSIS-LARGO",
      "CORTA",
      "D/C",
      "D21",
      "D22",
      "GXE",
      "JUKE",
      "KICKS",
      "KING-CAB",
      "LAUREL",
      "LEAF",
      "MARCH",
      "MAXIMA",
      "MURANO",
      "NAVARA",
      "NEW",
      "NEW MURANO",
      "NEW PATHFINDER",
      "NINJA",
      "NOTE",
      "NP300",
      "PATHFINDER",
      "PATROL",
      "PLATINA",
      "PRAIRIE",
      "PRIMERA",
      "PULSAR",
      "QASHQAI",
      "SENTRA",
      "SILVIA",
      "STANZA",
      "SUNNY",
      "TEANA",
      "TERRANO",
      "TIIDA",
      "V16",
      "VERSA",
      "X-TRAIL"
    ]
  },
  {
    brand: 'NSU',
    models: [
      "PRINZ"
    ]
  },
  {
    brand: 'OLDSMOBILE',
    models: [
      "42",
      "CUSTOM CRUISER",
      "CUSTOM-CRUISER",
      "CUTLASS",
      "DELTA",
      "DELTA 88",
      "NINETY-EIGHT",
      "OMEGA",
      "STAR FIRE",
      "STAR-FIRE",
      "TORONADO",
      "VISTA CRUISSIER",
      "VISTA-CRUISSIER"
    ]
  },
  {
    brand: 'OPEL',
    models: [
      "ADAM",
      "ANTARA",
      "ASCONA",
      "ASTRA",
      "CALIBRA",
      "CARAVAN",
      "CARAVAN-OLIMPIA",
      "CASCADA",
      "COMMODORE",
      "CORSA",
      "CROSSLAND X",
      "GRANDLAND X",
      "INSIGNIA",
      "INSIGNIA GS",
      "KADDET",
      "KADET-CARAVAN",
      "KADETT",
      "KAPITAN",
      "MANTA",
      "MERIVA",
      "MOKKA",
      "MOKKA X",
      "OLIMPIA",
      "OMEGA",
      "REKORD",
      "VECTRA"
    ]
  },
  {
    brand: 'PEUGEOT',
    models: [
      "104",
      "106",
      "107",
      "108",
      "2008",
      "204",
      "205",
      "206",
      "207",
      "208",
      "208E",
      "208EACTIVE",
      "3008",
      "301",
      "304",
      "305",
      "306",
      "307",
      "308",
      "309",
      "4008",
      "404",
      "405",
      "406",
      "407",
      "5008",
      "504",
      "505",
      "508",
      "604",
      "605",
      "607",
      "806",
      "BIPPER",
      "BOXER",
      "EXPERT",
      "GRAN",
      "GRAN TEPEE",
      "NUEVA",
      "NUEVO",
      "NVO",
      "PARTNER",
      "RCZ",
      "TEPEE",
      "TRAVELLER"
    ]
  },
  {
    brand: 'PLYMOUTH',
    models: [
      "ACCLAIM",
      "BELVEDERE",
      "COLT-VISTA",
      "DUSTER",
      "FURY",
      "GRAND VOYAGER",
      "HORIZON",
      "SATELITE",
      "SIN MODELO",
      "VALIANT",
      "VOLARE",
      "VOLARE"
    ]
  },
  {
    brand: 'POLSKI FIAT',
    models: [
      "125- P",
      "POLONES"
    ]
  },
  {
    brand: 'PONTIAC',
    models: [
      "ASTRE",
      "BONEVILLE",
      "CATALINA",
      "COUPE",
      "FIREBIRD",
      "G.T.O.",
      "GRAN-PRIX",
      "GRAND PRIX",
      "LE MANS",
      "LE-MANS",
      "PHOENIX",
      "SUNBIRD",
      "TEMPEST",
      "TRANS AM",
      "TRANS AM",
      "TRANS-AM",
      "VENTURA"
    ]
  },
  {
    brand: 'PORSCHE',
    models: [
      "718",
      "910",
      "911",
      "918",
      "924",
      "BOXSTER",
      "CARRERA",
      "CAYENNE",
      "CAYMAN",
      "MACAN",
      "PANAMERA"
    ]
  },
  {
    brand: 'PROTON',
    models: [
      "EXORA",
      "NATURA",
      "PERSONA",
      "PREVE",
      "SATRIA"
    ]
  },
  {
    brand: 'PUMA',
    models: [
      "GTE",
      "GT5"
    ]
  },
  {
    brand: 'RENAULT',
    models: [
      "ALASKAN",
      "CAPTUR",
      "CLIO",
      "DUSTER",
      "ESPACE",
      "FLORIDE",
      "FLUENCE",
      "FUEGO",
      "IKA",
      "KANGOO",
      "KOLEOS",
      "LAGUNA",
      "LATITUDE",
      "LOGAN",
      "MEGANE",
      "MEGANE2",
      "MEGANE3",
      "OROCH",
      "R-11",
      "R-12",
      "R-18",
      "R-19",
      "R-21",
      "R-25",
      "R-30",
      "R-4",
      "R-5",
      "R-6",
      "R-9",
      "R11",
      "R12",
      "R18",
      "R19",
      "R21",
      "R25",
      "R30",
      "R4",
      "R5",
      "R6",
      "R9",
      "SAFRANE",
      "SANDERO",
      "SCENIC",
      "SYMBOL",
      "TWINGO",
      "ZOE"
    ]
  },
  {
    brand: 'ROLLS ROYCE',
    models: [
      "DAWN",
      "GHOST",
      "PHANTOM",
      "WRAITH"
    ]
  },
  {
    brand: 'ROVER',
    models: [
      "200",
      "214",
      "216",
      "220",
      "25",
      "400",
      "414",
      "416",
      "420",
      "45",
      "620",
      "623",
      "75",
      "800",
      "825",
      "827",
      "MG",
      "MINI",
      "SE"
    ]
  },
  {
    brand: 'SAAB',
    models: [
      "-5",
      "43711",
      "43713",
      "43715",
      "43711",
      "43713",
      "43715",
      "43533",
      "43594",
      "43655",
      "900",
      "9000",
      "SAAB"
    ]
  },
  {
    brand: 'SAEHAN',
    models: [
      "BIRD",
      "BIRD DELUXE",
      "MAX PICK UP",
      "MAX-PICK-UP",
      "ROYALE",
      "S-BIRD"
    ]
  },
  {
    brand: 'SAMSUNG',
    models: [
      "SM3",
      "SM5",
      "SM7",
      "SQ5",
      "TRUCK"
    ]
  },
  {
    brand: 'SEAT',
    models: [
      "127",
      "131",
      "133",
      "ALHAMBRA",
      "ALTA",
      "ALTA XL",
      "ALTEA",
      "CORDOBA",
      "FURA",
      "IBIZA",
      "LEON",
      "MALAGA",
      "MARBELLA",
      "PANDA",
      "RITMO",
      "RONDA",
      "TOLEDO"
    ]
  },
  {
    brand: 'SG',
    models: [
      "PLUTUS",
      "STEED"
    ]
  },
  {
    brand: 'SIMCA',
    models: [
      "GLS-SEDAN"
    ]
  },
  {
    brand: 'SKODA',
    models: [
      "120",
      "FABIA",
      "FAVORIT",
      "FELICIA",
      "FORMAN",
      "KODIAQ",
      "OCTAVIA",
      "PICK UP",
      "PICK-UP",
      "RAPID",
      "ROOMSTER",
      "SPACEBACK",
      "SUPER_COMFORT",
      "SUPERB",
      "YETI"
    ]
  },
  {
    brand: 'SMA',
    models: [
      "C52",
      "C61",
      "C81",
      "R51",
      "R80",
      "R81"
    ]
  },
  {
    brand: 'SSANGYONG',
    models: [
      "A.SPORTS",
      "ACTYON",
      "ACTYON SPORT",
      "KORANDO",
      "KYRON",
      "MUSSO",
      "NEW",
      "REXTON",
      "STAVIC",
      "TIVOLI",
      "XLV"
    ]
  },
  {
    brand: 'SUBARU',
    models: [
      "1,6",
      "1,8",
      "43617",
      "43678",
      "4WD",
      "600",
      "700",
      "ALL",
      "B9",
      "BAJA",
      "BRZ",
      "COUPE",
      "DL",
      "FORESTER",
      "GL",
      "GLF",
      "HARDTOP",
      "HATCHBACK",
      "IMPREZA",
      "J-10",
      "J-12",
      "J10",
      "J12",
      "JUSTY",
      "LEGACY",
      "LOYALE",
      "MV",
      "NEW",
      "OUTBACK",
      "SEDAN",
      "STI",
      "TRIBECA",
      "WRX",
      "WRX S",
      "WRX+L",
      "XV"
    ]
  },
  {
    brand: 'SUZUKI',
    models: [
      "600 KGS",
      "AERIO",
      "ALTO",
      "APV",
      "APV",
      "APV",
      "APV",
      "APV",
      "BALENO",
      "CARRY",
      "CELERIO",
      "CERVO",
      "CIAZ",
      "DZIRE",
      "ERTIGA",
      "FORZA",
      "FRONTE",
      "GRAND",
      "GRAND NOMADE",
      "GRAND VITARA",
      "IGNIS",
      "JAZZ",
      "JIMNY",
      "KIZASHI",
      "LIANA",
      "LJ60",
      "LJ80",
      "MARUTI",
      "MASTERVAN",
      "NOMADE",
      "PICK UP",
      "PICK-UP",
      "S-CROSS",
      "SAMURAI",
      "SB",
      "SIDEKICK",
      "SJ",
      "SJ408",
      "SJ410",
      "SJ413",
      "SS",
      "SWIFT",
      "SX4",
      "VITARA",
      "WAGON",
      "XL7"
    ]
  },
  {
    brand: 'TATA',
    models: [
      "XENON",
    ]
  },
  {
    brand: 'TOYOTA',
    models: [
      "4RUNNER",
      "ADVANTAGE",
      "ADVATAGE",
      "AURIS",
      "AVENSIS",
      "B-DC00",
      "CAMRY",
      "CARINA",
      "CELICA",
      "COROLLA",
      "CORONA",
      "CRESSIDA",
      "CROWN",
      "FJ",
      "FJ CRUISER",
      "FORTUNER",
      "HILUX",
      "LAND",
      "LAND CRUISER",
      "LEXUS",
      "NEW",
      "PASEO",
      "PRERUNNER",
      "PREVIA",
      "PRIUS",
      "RAV4",
      "RUSH",
      "SEQUOIA",
      "STARLET",
      "STOUT",
      "TERCEL",
      "TUNDRA",
      "URBAN",
      "URBAN CRUISER",
      "YARIS",
      "ZELAS"
    ]
  },
  {
    brand: 'VOLKSWAGEN',
    models: [
      "105",
      "261",
      "262",
      "265",
      "AMAROK",
      "AMAZON",
      "ATLANTIC",
      "ATLAS",
      "BEETLE",
      "BORA",
      "BRASILIA",
      "BUGGY",
      "CALIFORNIA",
      "CRAFTER",
      "CROSSFOX",
      "CROSSOVER",
      "ESCARABAJO",
      "FOX",
      "GOL",
      "GOLF",
      "JETTA",
      "KARGMAN-GHIA",
      "MULTIVAN",
      "NEW",
      "NUEVA",
      "NUEVO",
      "NVA",
      "PANAMERICANA",
      "PARATI",
      "PASSAT",
      "POLO",
      "QUANTUM",
      "SANTANA",
      "SAVEIRO",
      "SCIROCCO",
      "SCIROCO",
      "SEDAN",
      "SURAN",
      "T.L.",
      "TIGUAN",
      "TL",
      "TOUAREG",
      "TRANSPORTER",
      "VARIANT",
      "VENTO",
      "VIRTUS",
      "VOYAGE"
    ]
  },
  {
    brand: 'VOLVO',
    models: [
      "142",
      "144",
      "145",
      "164",
      "240",
      "242",
      "244",
      "245",
      "262",
      "264",
      "343",
      "345",
      "360",
      "440",
      "460",
      "740",
      "745",
      "760",
      "850",
      "940",
      "960",
      "C30",
      "C70",
      "S40",
      "S60",
      "S60CC",
      "S70",
      "S80",
      "S90",
      "V40",
      "V40CC",
      "V50",
      "V60",
      "V60CC",
      "V70",
      "V90",
      "V90CC",
      "XC40",
      "XC60",
      "XC70",
      "XC90"
    ]
  },
  {
    brand: 'WILLYS',
    models: [
      "WAGONIER"
    ]
  },
  {
    brand: 'YUGO',
    models: [
      "55",
      "65",
      "FLORIDA",
      "KORAL",
      "POLY",
      "SKALA"
    ]
  },
  {
    brand: 'ZASTAVA',
    models: [
      "1500",
      "750",
      "DOBLE CABINA",
      "DOBLE-CABINA",
      "SIN MODELO"
    ]
  },
  {
    brand: 'ZNA',
    models: [
      "NEW RICH 2.5 DIESEL"
    ]
  },
  {
    brand: 'ZOTYE',
    models: [
      "HUNTER"
    ]
  },
  {
    brand: 'ZX',
    models: [
      "ADMIRAL",
      "GRAND",
      "GRAND TIGER",
      "LANDMARK"
    ]
  },
]

# bodyworks = ['Sedan', 'SUV', 'Convertible', 'Pickup', 'Minivan', 'Hatchback', 'Coupe', 'Station Wagon']
# engine_types = ['Gasoline', 'Diesel', 'Electic', 'Hybrid']

brands_with_models.each do |brand|
  brand_name = brand[:brand]
  b = Brand.find_or_create_by(name: brand_name.downcase.titleize)
  next if b.nil?

  models = brand[:models]
  models.each do |model|
    VehicleModel.find_or_create_by(name: model.downcase.titleize, brand_id: b.id)
  end
end

if Fee.count.zero?
  Fee.find_or_create_by(body_type: 'citycar',engine_type: 'diesel', amount: 17142)
  Fee.find_or_create_by(body_type: 'citycar',engine_type: 'gasoline', amount: 14285)
  Fee.find_or_create_by(body_type: 'sedan',engine_type: 'diesel', amount: 18571)
  Fee.find_or_create_by(body_type: 'sedan',engine_type: 'gasoline', amount: 15714)
end

