/**
 * MAIN CONFIGURATION FILE
 * 
 * English and French comments
 * Commentaires anglais et français
 * 
 * (EN)
 * This file contains the configuration variables of the logistics system.
 * For the configuration of the creation factory, see the file "config_creation_factory.sqf".
 * IMPORTANT NOTE : when a logistics feature is given to an object/vehicle class name, all the classes which inherit
 *                  of the parent/generic class (according to the CfgVehicles) will also have this feature.
 *                  CfgVehicles tree view example : http://madbull.arma.free.fr/A3_stable_1.20.124746_CfgVehicles_tree.html
 * 
 * (FR)
 * Fichier contenant les variables de configuration du système de logistique.
 * Pour la configuration de l'usine de création, voir le fichier "config_creation_factory.sqf".
 * NOTE IMPORTANTE : lorsqu'une fonctionnalité logistique est accordée à un nom de classe d'objet/véhicule, les classes
 *                   héritant de cette classe mère/générique (selon le CfgVehicles) se verront également dotées de cette fonctionnalité.
 *                   Exemple d'arborescence du CfgVehicles : http://madbull.arma.free.fr/A3_stable_1.20.124746_CfgVehicles_tree.html
 */

/**
 * DISABLE LOGISTICS ON OBJECTS BY DEFAULT
 * 
 * (EN)
 * Define if objects and vehicles have logistics features by default,
 * or if it must be allowed explicitely on specific objects/vehicles.
 * 
 * If false : all objects are enabled according to the class names listed in this configuration file
 *            You can disable some objects with : object setVariable ["R3F_LOG_disabled", true];
 * If true :  all objects are disabled by default
 *            You can enable some objects with : object setVariable ["R3F_LOG_disabled", false];
 * 
 * 
 * (FR)
 * Défini si les objets et véhicules disposent des fonctionnalités logistiques par défaut,
 * ou si elles doivent être autorisés explicitement sur des objets/véhicules spécifiques.
 * 
 * Si false : tous les objets sont actifs en accord avec les noms de classes listés dans ce fichier
 *            Vous pouvez désactiver certains objets avec : objet setVariable ["R3F_LOG_disabled", true];
 * Si true :  tous les objets sont inactifs par défaut
 *            Vous pouvez activer quelques objets avec : objet setVariable ["R3F_LOG_disabled", false];
 */
R3F_LOG_CFG_disabled_by_default = false;

/**
 * LOCK THE LOGISTICS FEATURES TO SIDE, FACTION OR PLAYER
 * 
 * (EN)
 * Define the lock mode of the logistics features for an object.
 * An object can be locked to the a side, faction, a player (respawn) or a unit (life).
 * If the object is locked, the player can unlock it according to the
 * value of the config variable R3F_LOG_CFG_unlock_objects_timer.
 * 
 * If "none" : no lock features, everyone can used the logistics features.
 * If "side" : the object is locked to the last side which interacts with it.
 * If "faction" : the object is locked to the last faction which interacts with it.
 * If "player" : the object is locked to the last player which interacts with it. The lock is transmitted after respawn.
 * If "unit" : the object is locked to the last player which interacts with it. The lock is lost when the unit dies.
 * 
 * Note : for military objects (not civilian), the lock is initialized to the object's side.
 * 
 * See also the config variable R3F_LOG_CFG_unlock_objects_timer.
 * 
 * (FR)
 * Défini le mode de verrouillage des fonctionnalités logistics pour un objet donné.
 * Un objet peut être verrouillé pour une side, une faction, un joueur (respawn) ou une unité (vie).
 * Si l'objet est verrouillé, le joueur peut le déverrouiller en fonction de la
 * valeur de la variable de configiration R3F_LOG_CFG_unlock_objects_timer.
 * 
 * Si "none" : pas de verrouillage, tout le monde peut utiliser les fonctionnalités logistiques.
 * Si "side" : l'objet est verrouillé pour la dernière side ayant interagit avec lui.
 * Si "faction" : l'objet est verrouillé pour la dernière faction ayant interagit avec lui.
 * Si "player" : l'objet est verrouillé pour le dernier joueur ayant interagit avec lui. Le verrou est transmis après respawn.
 * Si "unit" : l'objet est verrouillé pour le dernier joueur ayant interagit avec lui. Le verrou est perdu quand l'unité meurt.
 * 
 * Note : pour les objets militaires (non civils), le verrou est initialisé à la side de l'objet.
 * 
 * Voir aussi la variable de configiration R3F_LOG_CFG_unlock_objects_timer.
 */
R3F_LOG_CFG_lock_objects_mode = "none";

/**
 * COUNTDOWN TO UNLOCK AN OBJECT
 * 
 * Define the countdown duration (in seconds) to unlock a locked object.
 * Set to -1 to deny the unlock of objects.
 * See also the config variable R3F_LOG_CFG_lock_objects_mode.
 * 
 * Défini la durée (en secondes) du compte-à-rebours pour déverrouiller un objet.
 * Mettre à -1 pour qu'on ne puisse pas déverrouiller les objets.
 * Voir aussi la variable de configiration R3F_LOG_CFG_lock_objects_mode.
 */
R3F_LOG_CFG_unlock_objects_timer = 10;

/**
 * ALLOW NO GRAVITY OVER GROUND
 * 
 * Define if movable objects with no gravity simulation can be set in height over the ground (no ground contact).
 * The no gravity objects corresponds to most of decoration and constructions items.
 * 
 * Défini si les objets déplaçable sans simulation de gravité peuvent être position en hauteur sans être contact avec le sol.
 * Les objets sans gravité correspondent à la plupart des objets de décors et de construction.
 */
R3F_LOG_CFG_no_gravity_objects_can_be_set_in_height_over_ground = true;

/**
 * LANGUAGE
 * 
 * Automatic language selection according to the game language.
 * New languages can be easily added (read below).
 * 
 * Sélection automatique de la langue en fonction de la langue du jeu.
 * De nouveaux langages peuvent facilement être ajoutés (voir ci-dessous).
 */
R3F_LOG_CFG_language = switch (language) do
{
	case "English":{"en"};
	case "French":{"fr"};
	
	// Feel free to create you own language file named "XX_strings_lang.sqf", where "XX" is the language code.
	// Make a copy of an existing language file (e.g. en_strings_lang.sqf) and translate it.
	// Then add a line with this syntax : case "YOUR_GAME_LANGUAGE":{"LANGUAGE_CODE"};
	// For example :
	
	//case "Czech":{"cz"}; // Not supported. Need your own "cz_strings_lang.sqf"
	//case "Polish":{"pl"}; // Not supported. Need your own "pl_strings_lang.sqf"
	//case "Portuguese":{"pt"}; // Not supported. Need your own "pt_strings_lang.sqf"
	//case "YOUR_GAME_LANGUAGE":{"LANGUAGE_CODE"};  // Need your own "LANGUAGE_CODE_strings_lang.sqf"
	
	default {"en"}; // If language is not supported, use English
};

/**
 * CONDITION TO ALLOW LOGISTICS
 * 
 * (EN)
 * This variable allow to set a dynamic SQF condition to allow/deny all logistics features only on specific clients.
 * The variable must be a STRING delimited by quotes and containing a valid SQF condition to evaluate during the game.
 * For example you can allow logistics only on few clients having a known game ID by setting the variable to :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Or based on the profile name : "profileName in [""john"", ""jack"", ""james""]"
 * Or only for the server admin : "serverCommandAvailable "#kick"""
 * The condition is evaluted in real time, so it can use condition depending on the mission progress : "alive officer && taskState task1 == ""Succeeded"""
 * Or to deny logistics in a circular area defined by a marker : "player distance getMarkerPos ""markerName"" > getMarkerSize ""markerName"" select 0"
 * Note that quotes of the strings inside the string condition must be doubled.
 * Note : if the condition depends of the aimed objects/vehicle, you can use the command cursorTarget
 * To allow the logistics to everyone, just set the condition to "true".
 * 
 * (FR)
 * Cette variable permet d'utiliser une condition SQF dynamique pour autoriser ou non les fonctions logistiques sur des clients spécifiques.
 * La variable doit être une CHAINE de caractères délimitée par des guillemets et doit contenir une condition SQF valide qui sera évaluée durant la mission.
 * Par exemple pour autoriser la logistique sur seulement quelques joueurs ayant un ID de jeu connu, la variable peut être défini comme suit :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Ou elle peut se baser sur le nom de profil : "profileName in [""maxime"", ""martin"", ""marc""]"
 * Ou pour n'autoriser que l'admin de serveur : "serverCommandAvailable "#kick"""
 * Les condition sont évaluées en temps réel, et peuvent donc dépendre du déroulement de la mission : "alive officier && taskState tache1 == ""Succeeded"""
 * Ou pour interdire la logistique dans la zone défini par un marqueur circulaire : "player distance getMarkerPos ""markerName"" > getMarkerSize ""markerName"" select 0"
 * Notez que les guillemets des chaînes de caractères dans la chaîne de condition doivent être doublés.
 * Note : si la condition dépend de l'objet/véhicule pointé, vous pouvez utiliser la commande cursorTarget
 * Pour autoriser la logistique chez tout le monde, il suffit de définir la condition à "true".
 */
R3F_LOG_CFG_string_condition_allow_logistics_on_this_client = "true";

/**
 * CONDITION TO ALLOW CREATION FACTORY
 * 
 * (EN)
 * This variable allow to set a dynamic SQF condition to allow/deny the access to the creation factory only on specific clients.
 * The variable must be a STRING delimited by quotes and containing a valid SQF condition to evaluate during the game.
 * For example you can allow the creation factory only on few clients having a known game ID by setting the variable to :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Or based on the profile name : "profileName in [""john"", ""jack"", ""james""]"
 * Or only for the server admin : "serverCommandAvailable "#kick"""
 * Note that quotes of the strings inside the string condition must be doubled.
 * Note : if the condition depends of the aimed objects/véhicule, you can use the command cursorTarget
 * Note also that the condition is evaluted in real time, so it can use condition depending on the mission progress :
 * "alive officer && taskState task1 == ""Succeeded"""
 * To allow the creation factory to everyone, just set the condition to "true".
 * 
 * (FR)
 * Cette variable permet d'utiliser une condition SQF dynamique pour rendre accessible ou non l'usine de création sur des clients spécifiques.
 * La variable doit être une CHAINE de caractères délimitée par des guillemets et doit contenir une condition SQF valide qui sera évaluée durant la mission.
 * Par exemple pour autoriser l'usine de création sur seulement quelques joueurs ayant un ID de jeu connu, la variable peut être défini comme suit :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Ou elle peut se baser sur le nom de profil : "profileName in [""maxime"", ""martin"", ""marc""]"
 * Ou pour n'autoriser que l'admin de serveur : "serverCommandAvailable "#kick"""
 * Notez que les guillemets des chaînes de caractères dans la chaîne de condition doivent être doublés.
 * Note : si la condition dépend de l'objet/véhicule pointé, vous pouvez utiliser la commande cursorTarget
 * Notez aussi que les condition sont évaluées en temps réel, et peuvent donc dépendre du déroulement de la mission :
 * "alive officier && taskState tache1 == ""Succeeded"""
 * Pour autoriser l'usine de création chez tout le monde, il suffit de définir la condition à "true".
 */
R3F_LOG_CFG_string_condition_allow_creation_factory_on_this_client = "true";

/*
 ********************************************************************************************
 * BELOW IS THE CLASS NAMES CONFIGURATION / CI-DESSOUS LA CONFIGURATION DES NOMS DE CLASSES *
 ********************************************************************************************
 * 
 * (EN)
 * There are two ways to manage new objects with the logistics system. The first one is to add these objects in the
 * following appropriate lists. The second one is to create a new external file in the /addons_config/ directory,
 * based on /addons_config/TEMPLATE.sqf, and to add a #include below to.
 * The first method is better to add/fix only some various class names.
 * The second method is better to take into account an additional addon.
 * 
 * These variables are based on the inheritance principle according to the CfgVehicles tree.
 * It means that a features accorded to a class name, is also accorded to all child classes.
 * Inheritance tree view : http://madbull.arma.free.fr/A3_1.32_CfgVehicles_tree.html
 * 
 * (FR)
 * Deux moyens existent pour gérer de nouveaux objets avec le système logistique. Le premier consiste à ajouter
 * ces objets dans les listes appropriées ci-dessous. Le deuxième est de créer un fichier externe dans le répertoire
 * /addons_config/ basé sur /addons_config/TEMPLATE.sqf, et d'ajouter un #include ci-dessous.
 * La première méthode est préférable lorsqu'il s'agit d'ajouter ou corriger quelques classes diverses.
 * La deuxième méthode est préférable s'il s'agit de prendre en compte le contenu d'un addon supplémentaire.
 * 
 * Ces variables sont basées sur le principe d'héritage utilisés dans l'arborescence du CfgVehicles.
 * Cela signifie qu'une fonctionnalité accordée à une classe, le sera aussi pour toutes ses classes filles.
 * Vue de l'arborescence d'héritage : http://madbull.arma.free.fr/A3_1.32_CfgVehicles_tree.html
 */

/****** LIST OF ADDONS CONFIG TO INCLUDE / LISTE DES CONFIG D'ADDONS A INCLURE ******/
#include "addons_config\A3_vanilla.sqf"
#include "addons_config\All_in_Arma.sqf"
#include "addons_config\R3F_addons.sqf"
//#include "addons_config\YOUR_ADDITIONAL_ADDON.sqf"

/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of ground vehicles which can tow objects.
 * Liste des noms de classes des véhicules terrestres pouvant remorquer des objets.
 */
R3F_LOG_CFG_can_tow = R3F_LOG_CFG_can_tow +
[
	// e.g. : "MyTowingVehicleClassName1", "MyTowingVehicleClassName2"
];

/**
 * List of class names of objects which can be towed.
 * Liste des noms de classes des objets remorquables.
 */
R3F_LOG_CFG_can_be_towed = R3F_LOG_CFG_can_be_towed +
[
	// e.g. : "MyTowableObjectClassName1", "MyTowableObjectClassName2"
];


/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of helicopters which can lift objects.
 * Liste des noms de classes des hélicoptères pouvant héliporter des objets.
 */
R3F_LOG_CFG_can_lift = R3F_LOG_CFG_can_lift +
[
	// e.g. : "MyLifterVehicleClassName1", "MyLifterVehicleClassName2"
	
	"CUP_B_AH64D_DL_USA", "CUP_B_AH6J_USA", "CUP_B_AH6M_USA", "CUP_B_CH47F_USA", "CUP_B_CH47F_VIV_USA", "CUP_B_MH47E_USA", "CUP_B_MH60L_DAP_2x_US", "CUP_B_MH60L_DAP_4x_US", "CUP_B_MH6J_USA", "CUP_B_MH6J_OBS_USA", "CUP_B_UH60M_US", 
"CUP_B_UH60M_FFV_US", "CUP_B_UH60M_Unarmed_US", "CUP_B_UH60M_Unarmed_FFV_US", "CUP_B_UH60M_Unarmed_FFV_MEV_US", "CFP_B_USARMY_AH64D_DL_USA", "CFP_B_USARMY_AH6J_USA", "CFP_B_USARMY_AH6M_USA", "CFP_B_USARMY_CH47F_USA",
 "CFP_B_USARMY_CH47F_VIV_USA", "CFP_B_USARMY_MH60L_DAP_2x_US", "CFP_B_USARMY_MH60L_DAP_4x_US", "CFP_B_USARMY_MH6J_USA", "CFP_B_USARMY_MH6J_OBS_USA", "CFP_B_USARMY_MH6M_USA", "CFP_B_USARMY_MH6M_OBS_USA", "CFP_B_USARMY_UH60M_US", 
 "CFP_B_USARMY_UH60M_FFV_US", "CFP_B_USARMY_UH60M_Unarmed_US", "CFP_B_USARMY_UH60M_Unarmed_FFV_US", "CFP_B_USARMY_UH60M_Unarmed_FFV_MEV_US", "CFP_B_USMC_AH_1Z_DES_01", "CFP_B_USMC_CH_53E_Super_Stallion_DES_01", 
 "CFP_B_USMC_CH_53E_Super_Stallion_VIV_DES_01", "CFP_B_USMC_MH_60S_Knighthawk_ESSS_x2_DES_01", "CFP_B_USMC_MH_60S_Knighthawk_ESSS_x4_DES_01", "CFP_B_USMC_MH_60S_Seahawk_DES_01", "CFP_B_USMC_MH_60S_Seahawk_FFV_DES_01", 
 "CFP_B_USMC_MH_60S_Seahawk_M3M_DES_01", "CFP_B_USMC_UH_1Y_Venom_Gunship_DES_01", "CFP_B_USMC_UH_1Y_Venom_MEV_DES_01", "CFP_B_USMC_UH_1Y_Venom_Transport_DES_01", "CUP_B_AH1Z_Dynamic_USMC", "CUP_B_CH53E_USMC", 
 "CUP_B_CH53E_VIV_USMC", "CUP_B_MH60L_DAP_2x_USN", "CUP_B_MH60L_DAP_4x_USN", "CUP_B_MH60S_USMC", "CUP_B_UH60S_USN", "CUP_B_UH1Y_Gunship_Dynamic_USMC", "CUP_B_UH1Y_MEV_USMC", "CUP_B_UH1Y_UNA_USMC", "RHS_AH64D", 
 "RHS_AH64DGrey", "RHS_AH64D_wd", "RHS_AH1Z", "rhsusf_CH53E_USMC_D", "RHS_UH1Y_FFAR_d", "RHS_UH1Y_d", "RHS_UH1Y_UNARMED_d", "RHS_AH1Z_wd", "rhsusf_CH53E_USMC", "RHS_UH1Y_FFAR", "RHS_UH1Y", "RHS_UH1Y_UNARMED"
];

/**
 * List of class names of objects which can be lifted.
 * Liste des noms de classes des objets héliportables.
 */
R3F_LOG_CFG_can_be_lifted = R3F_LOG_CFG_can_be_lifted +
[
	// e.g. : "MyLiftableObjectClassName1", "MyLiftableObjectClassName2"
	
	"plp_cts_RuggedCrateGrey", "CargoNet_01_box_F", "C_IDAP_supplyCrate_F", "B_supplyCrate_F", "plp_ct_WeathCrateBigGreen", "CUP_I_LCVP_RACS", "CUP_I_LCVP_VIV_RACS"
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
* (EN)
 * This section uses a numeric quantification of capacity and cost of the objets.
 * For example, in a vehicle has a capacity of 100, we will be able to load in 5 objects costing 20 capacity units.
 * The capacity doesn't represent a real volume or weight, but a choice made for gameplay.
 * 
 * (FR)
 * Cette section utilise une quantification numérique de la capacité et du coût des objets.
 * Par exemple, dans un véhicule d'une capacité de 100, nous pouvons charger 5 objets coûtant 20 unités de capacité.
 * La capacité ne représente ni un poids, ni un volume, mais un choix fait pour la jouabilité.
 */

/**
 * List of class names of vehicles or cargo objects which can transport objects.
 * The second element of the nested arrays is the load capacity (in relation with the capacity cost of the objects).
 * 
 * Liste des noms de classes des véhicules ou "objets contenant" pouvant transporter des objets.
 * Le deuxième élément des sous-tableaux est la capacité de chargement (en relation avec le coût de capacité des objets).
 */
R3F_LOG_CFG_can_transport_cargo = R3F_LOG_CFG_can_transport_cargo +
[
	// e.g. : ["MyTransporterClassName1", itsCapacity], ["MyTransporterClassName2", itsCapacity]
	["Land_Cargo10_military_green_F", 800], ["plp_cts_TrashBinBigBlack", 800], ["M1126_ICV_M2NEST_DG1_NOSLATDES", 120], ["M1126_ICV_M2NEST_DG1_NOSLATWOOD", 120], ["M1129_MC_DG1_NOSLATDES", 120], ["M1126_ICV_M134_DG1_NOSLATDES", 120], ["M1129_MC_DG1_NOSLATWOOD", 120], ["M1126_ICV_M134_DG1_NOSLATWOOD", 120], ["M1126_ICV_M134_DG1_SLATDES", 120], 
	["M1126_ICV_M134_DG1_SLATWOOD", 120], ["M1126_ICV_M2_DG1_NOSLATDES", 120], ["M1126_ICV_M2_DG1_NOSLATWOOD", 120], ["M1126_ICV_M2_DG1_SLATDES", 120], ["M1126_ICV_M2_DG1_SLATWOOD", 120], ["M1126_ICV_M2NEST_DG1_SLATDES", 120], 
	["M1126_ICV_M2NEST_DG1_SLATWOOD", 120], ["M1126_ICV_mk19_DG1_NOSLATDES", 120], ["M1126_ICV_mk19_DG1_NOSLATWOOD", 120], ["M1126_ICV_mk19_DG1_SLATDES", 120], ["M1126_ICV_mk19_DG1_SLATWOOD", 120], 
	["M1129_MC_DG1_SLATWOOD", 120], ["M1129_MC_DG1_SLATDES", 120], ["M1130_CV_DG1_NOSLATDES", 120], ["M1130_CV_DG1_NOSLATWOOD", 120], ["M1130_CV_DG1_SLATDES", 120], ["M1130_CV_DG1_SLATWOOD", 120], ["M1133_MEV_DG1_NOSLATWOOD", 120], 
	["M1133_MEV_DG1_NOSLATDES", 120], ["M1133_MEV_DG1_SLATDES", 120], ["M1133_MEV_DG1_SLATWOOD", 120], ["rhsusf_M1232_usarmy_d", 100], ["rhsusf_M1232_M2_usarmy_d", 100], ["rhsusf_M1232_MK19_usarmy_d", 100], ["rhsusf_M1237_M2_usarmy_d", 100], 
	["rhsusf_M1237_MK19_usarmy_d", 100], ["rhsusf_M1232_usarmy_wd", 100], ["rhsusf_M1232_M2_usarmy_wd", 100], ["rhsusf_M1232_MK19_usarmy_wd", 100], ["rhsusf_M1237_M2_usarmy_wd", 100], ["rhsusf_M1237_MK19_usarmy_wd", 100] 
];

/**
 * List of class names of objects which can be loaded in transport vehicle/cargo.
 * The second element of the nested arrays is the cost capacity (in relation with the capacity of the vehicles).
 * 
 * Liste des noms de classes des objets transportables.
 * Le deuxième élément des sous-tableaux est le coût de capacité (en relation avec la capacité des véhicules).
 */
R3F_LOG_CFG_can_be_transported_cargo = R3F_LOG_CFG_can_be_transported_cargo +
[
	["Land_HBarrierWall6_F", 1], ["Land_HBarrierWall_corner_F", 1], ["Land_HBarrierWall_corridor_F", 1], ["Land_HBarrierWall4_F", 1], ["Land_HBarrier_Big_F", 1], ["Land_HBarrier_5_F", 1],["Land_BagFence_Long_F", 1],["Land_BagFence_Round_F", 1],["Land_SandbagBarricade_01_half_F", 1],["Land_SandbagBarricade_01_F", 1],["Land_SandbagBarricade_01_hole_F", 1],["Land_CncWall4_F", 1],["Land_CncShelter_F", 1],["Land_BagBunker_Tower_F", 1],["Land_BagBunker_Small_F", 1],["Land_BagBunker_Large_F", 1],["Land_HBarrierTower_F", 1],["Land_Cargo_Patrol_V3_F", 1],["Land_HelipadCircle_F", 1],["Land_HelipadSquare_F", 1],["Heli_H_rescue", 1],["Windsock_01_F", 1],["Land_LandMark_F", 1],["Land_TentHangar_V1_F", 1],["Land_Airport_01_controlTower_F", 1],["PortableHelipadLight_01_blue_F", 1],["PortableHelipadLight_01_red_F", 1],["CUP_B_M119_US", 1],["CUP_B_M2StaticMG_US", 1],["CUP_B_TOW_TriPod_US", 1],["B_Mortar_01_F", 1],["B_GMG_01_high_F", 1],["PortableHelipadLight_01_green_F", 1],["PortableHelipadLight_01_yellow_F", 1],["PortableHelipadLight_01_white_F", 1],["Land_CzechHedgehog_01_F", 1],["EFM_tetrapod_line", 1],["StorageBladder_01_fuel_sand_F", 1],["ACE_Track", 1],["ACE_Wheel", 1],["21st_Cargo_Net", 1],["21st_SatCom_Station", 1],["WarfareBunkerSign", 1],["Sign_Checkpoint_US_EP1", 1],["Flag_US_F", 1],["21st_Vehicle_Spawner", 1],["Land_LampSolar_F", 1],["Land_LampAirport_F", 1],["Land_PortableLight_double_F", 1],["Campfire_burning_F", 1],["21st_CrashTeleporter", 1],["Land_PaperBox_01_small_closed_brown_food_F", 1],["Land_PaperBox_01_small_closed_white_med_F", 1],["Box_IED_Exp_F", 1],["Box_IND_AmmoOrd_F", 1],["plp_ct_MultiUtilOrange", 1],["21st_Humanitarian_Crate", 1],["21st_Medical_Aid_Box", 1],["21st_Intel_Case", 1],["21st_Virus_Box", 1],["ACE_medicalSupplyCrate", 1],["Land_Camping_Light_F", 1],["plp_cts_RuggedCrateGrey", 1],["21st_Insignia_Console", 1],["21st_Mobile_Command_Console", 1],["Land_RepairDepot_01_tan_F", 1],["A2_Tent_East", 1],["A2_West", 1],["A2_West_2", 1],["A2_land_tent_east_m", 1],["A2_land_tent_east_o", 1],["Jbad_Mil_Guardhouse", 1],["Land_Cargo_HQ_V3_F", 1],["Land_Cargo_House_V3_F", 1],["Land_Barrack2_EP1", 1],["Shed", 1],["EFM_stair_wood_3_5m", 1],["Land_fort_artillery_nest", 1],["Land_CampingChair_V2_F", 1],["Land_CampingTable_F", 1],["plp_ct_FootlockerBrown", 1],["plp_cts_TrashBinBigBlack", 1],["plp_bo_RadioSixties_Burning", 1],["Land_72nd_Straightrench_F", 1],["Land_72nd_TrenchMiddle_F", 1],["Land_72nd_Endtrench_F", 1],["Land_72nd_Straightrench_Half_F", 1],["Land_72nd_TrenchMiddle_Half_F", 1],["Land_72nd_Endtrench_Half_F", 1],["Land_72nd_Foxhole_1_F", 1],["Land_Sun_chair_green_F", 1],["B_supplyCrate_F", 1],["plp_ct_PlasticBoxRed", 1],["Box_NATO_Equip_F", 1],["plp_ct_WeathCrateBigGreen", 1],["Burnes_floorGate", 1],["Burnes_ironGate_2", 1],["Burnes_ironGate_3", 1],["Land_Shed_Big_F", 1],["21st_FieldHostpital_Desert", 1],["Land_ConcreteBlock", 1],["Land_QuayConcrete_01_20m_wall_F", 1],["Land_Mil_WallBig_4m_F", 1],["Land_CncBarrierMedium4_F", 1],["Land_CncBarrier_stripes_F", 1],["Land_Rampart_F", 1],["Land_Shoot_House_Tunnel_F", 1],["Land_Shoot_House_Wall_Long_F", 1],["Land_Cargo40_military_green_F", 1],["Land_Cargo20_military_green_F", 1],["Land_Cargo40_sand_F", 1],["Land_Cargo20_sand_F", 1],["21st_Guidon_Regimental", 1],["21st_Guidon_Nightmare", 1],["21st_Guidon_Viking", 1],["21st_Guidon_Guardian", 1],["21st_Guidon_Whiskey", 1],["plp_bo_MobileCoolerBlue_Use", 1],["Land_PaperBox_01_small_closed_brown_F", 1],["CargoNet_01_box_F", 1],["Land_WaterTank_04_F", 1],["Land_WaterCooler_01_new_F", 1],["C_IDAP_supplyCrate_F", 1],["FIR_Baseplate", 1],["CFP_B_USSEALS_RHIB_WDL_01", 1],["21st_VehicleAmmoCrate", 4],["Land_Billboard_F", 1],["ARP_Objects_boxmre", 1],["Box_NATO_AmmoVeh_F", 1]
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects which can be carried and moved by a player.
 * Liste des noms de classes des objets qui peuvent être portés et déplacés par le joueur.
 */
R3F_LOG_CFG_can_be_moved_by_player = R3F_LOG_CFG_can_be_moved_by_player +
[
	"Land_CargoBox_V1_F", "Box_NATO_Equip_F", "plp_ct_PlasticBoxRed", "B_supplyCrate_F", "21st_Cargo_Net", "21st_CrashTeleporter", "Land_PaperBox_01_small_closed_brown_food_F", "Land_PaperBox_01_small_closed_white_med_F", "Box_IED_Exp_F", "Box_IND_AmmoOrd_F", "plp_ct_MultiUtilOrange", "21st_Humanitarian_Crate", "21st_Medical_Aid_Box", "21st_Intel_Case", "21st_Virus_Box", "ACE_medicalSupplyCrate", "ARP_Objects_cocaine", "plp_cts_RuggedCrateGrey", "21st_Insignia_Console", "21st_Mobile_Command_Console", "Land_RepairDepot_01_tan_F", "Land_HBarrierWall6_F", "Land_HBarrierWall_corner_F", "Land_HBarrierWall_corridor_F", "Land_HBarrierWall4_F", "Land_HBarrier_Big_F", "Land_HBarrier_5_F", "Land_BagFence_Long_F", "Land_BagFence_Round_F", "Land_SandbagBarricade_01_half_F", "Land_SandbagBarricade_01_F", "Land_SandbagBarricade_01_hole_F", "Land_CncWall4_F", "Land_CncShelter_F", "Land_BagBunker_Tower_F", "Land_BagBunker_Small_F", "Land_BagBunker_Large_F", "Land_HBarrierTower_F", "Land_Cargo_Patrol_V3_F", "Land_HelipadCircle_F", "Land_HelipadSquare_F", "Heli_H_rescue", "Windsock_01_F", "Land_LandMark_F", "Land_TentHangar_V1_F", "Land_Airport_01_controlTower_F", "PortableHelipadLight_01_blue_F", "PortableHelipadLight_01_red_F", "PortableHelipadLight_01_green_F", "PortableHelipadLight_01_yellow_F", "PortableHelipadLight_01_white_F", "Land_CzechHedgehog_01_F", "EFM_tetrapod_line", "StorageBladder_01_fuel_sand_F", "ACE_Track", "ACE_Wheel", "WarfareBunkerSign", "Sign_Checkpoint_US_EP1", "Flag_US_F", "Land_LampSolar_F", "Land_LampAirport_F", "Land_PortableLight_double_F", "Campfire_burning_F", "Land_Camping_Light_F", "A2_Tent_East", "A2_West", "A2_West_2", "A2_land_tent_east_m", "A2_land_tent_east_o", "Jbad_Mil_Guardhouse", "Land_Cargo_HQ_V3_F", "Land_Cargo_House_V3_F", "Land_Barrack2_EP1", "Shed", "EFM_stair_wood_3_5m", "Land_fort_artillery_nest", "Land_CampingChair_V2_F", "Land_CampingTable_F", "plp_ct_FootlockerBrown", "plp_cts_TrashBinBigBlack", "plp_bo_RadioSixties_Burning", "Land_72nd_Straightrench_F", "Land_72nd_TrenchMiddle_F", "Land_72nd_Endtrench_F", "Land_72nd_Straightrench_Half_F", "Land_72nd_TrenchMiddle_Half_F", "Land_72nd_Endtrench_Half_F", "Land_72nd_Foxhole_1_F", "Land_Sun_chair_green_F", "21st_Vehicle_Spawner", "plp_ct_WeathCrateBigGreen", "Burnes_floorGate", "Burnes_ironGate_2", "Burnes_ironGate_3", "Land_Shed_Big_F", "21st_FieldHostpital_Desert", "21st_FieldHospital_Woodland", "Land_ConcreteBlock", "Land_QuayConcrete_01_20m_wall_F", "Land_Mil_WallBig_4m_F", "Land_CncBarrierMedium4_F", "Land_CncBarrier_stripes_F", "Land_Rampart_F", "Land_Shoot_House_Tunnel_F", "Land_Shoot_House_Wall_Long_F", "Land_Cargo40_military_green_F", "Land_Cargo20_military_green_F", "Land_Cargo40_sand_F", "Land_Cargo20_sand_F", "21st_Guidon_Regimental", "21st_Guidon_Nightmare", "21st_Guidon_Viking", "21st_Guidon_Guardian", "21st_Guidon_Whiskey", "plp_bo_MobileCoolerBlue_Use", "Land_PaperBox_01_small_closed_brown_F", "CargoNet_01_box_F", "Land_WaterTank_04_F", "Land_WaterCooler_01_new_F", "C_IDAP_supplyCrate_F", "FIR_Baseplate", "CFP_B_USSEALS_RHIB_WDL_01", "21st_VehicleAmmoCrate", "Land_Billboard_F", "ARP_Objects_boxmre", "Box_NATO_AmmoVeh_F"
];