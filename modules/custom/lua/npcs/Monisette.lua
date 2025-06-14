local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G;
    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end
    ensureTable('xi.zones.Port_Jeuno.npcs.Monisette')

require("modules/module_utils")
require("scripts/globals/npc_util")
local ID = zones[xi.zone.PORT_JEUNO]

local m = Module:new("Monisette")
local afRArmorPlusOne =
{
[1] = { trade = {27663, {4069, 8}, 862, 8720}, reward = 27684}, -- pummelers mask +1
[2] = { trade = {27807, {4070, 8}, 862, 8722}, reward = 27828}, -- pummelers lorica +1
[3] = { trade = {27943, {4071, 8}, 862, 8724}, reward = 27964}, -- pummelers mufflers +1
[4] = { trade = {28090, {4072, 8}, 862, 8726}, reward = 28111}, -- pummelers cuisses +1
[5] = { trade = {28223, {4073, 8}, 862, 8728}, reward = 28244}, -- pummelers calligae +1
[6] = { trade = {27665, {4069, 8}, 2476, 8720}, reward = 27685}, -- anchorites crown +1
[7] = { trade = {27808, {4070, 8}, 2476, 8722}, reward = 27829}, -- anchorites cyclas +1
[8] = { trade = {27944, {4071, 8}, 2476, 8724}, reward = 27965}, -- anchorites gloves +1
[9] = { trade = {28091, {4072, 8}, 2476, 8726}, reward = 28112}, -- anchorites hose +1
[10] = { trade = {28224, {4073, 8}, 2476, 8728}, reward = 28245}, -- anchorites gaiters +1
[11] = { trade = {27665, {4069, 8}, 1132, 8720}, reward = 27686}, -- theophany cap +1
[12] = { trade = {27809, {4070, 8}, 1132, 8722}, reward = 27830}, -- theophany briault +1 
[13] = { trade = {27945, {4071, 8}, 1132, 8724}, reward = 27966}, -- theophany mitts +1
[14] = { trade = {28092, {4072, 8}, 1132, 8726}, reward = 28113}, -- theophany pantaloons +1
[15] = { trade = {28225, {4073, 8}, 1132, 8728}, reward = 28246}, -- theophany duckbills +1
[16] = { trade = {27666, {4069, 8}, 2200, 8720}, reward = 27687}, -- spaekonas petasos +1
[17] = { trade = {27810, {4070, 8}, 2200, 8722}, reward = 27831}, -- spaekonas coat +1
[18] = { trade = {27946, {4071, 8}, 2200, 8724}, reward = 27967}, -- spaekonas gloves +1
[19] = { trade = {28093, {4072, 8}, 2200, 8726}, reward = 28114}, -- spaekonas tonban +1
[20] = { trade = {28226, {4073, 8}, 2200, 8728}, reward = 28247}, -- spaekonas sabots +1
[21] = { trade = {27667, {4069, 8}, 1313, 8720}, reward = 27688}, -- atrophy chapeau +1
[22] = { trade = {27811, {4070, 8}, 1313, 8722}, reward = 27832}, -- atrophy tabard +1
[23] = { trade = {27947, {4071, 8}, 1313, 8724}, reward = 27968}, -- atrophy gloves +1
[24] = { trade = {28094, {4072, 8}, 1313, 8726}, reward = 28115},  -- atrophy tights +1
[25] = { trade = {28227, {4073, 8}, 1313, 8728}, reward = 28248}, -- atrophy boots +1
[26] = { trade = {27668, {4069, 8}, 2476, 8720}, reward = 27689}, -- pillagers bonnet +1
[27] = { trade = {27812, {4070, 8}, 2476, 8722}, reward = 27833}, -- pillagers vest +1
[28] = { trade = {27948, {4071, 8}, 2476, 8724}, reward = 27969}, -- pillagers armlets +1
[29] = { trade = {28095, {4072, 8}, 2476, 8726}, reward = 28116}, -- pillagers culottes +1
[30] = { trade = {28228, {4073, 8}, 2476, 8728}, reward = 28249}, -- pillagers poulaines +1
[31] = { trade = {27669, {4069, 8}, 668, 8720}, reward = 27690}, -- reverence coronet +1
[32] = { trade = {27813, {4070, 8}, 668, 8722}, reward = 27834}, -- reverence surcoat +1
[33] = { trade = {27949, {4071, 8}, 668, 8724}, reward = 27970}, -- reverence gauntlets +1
[34] = { trade = {28096, {4072, 8}, 668, 8726}, reward = 28117}, -- reverence breeches +1
[35] = { trade = {28229, {4073, 8}, 668, 8728}, reward = 28250}, -- reverence leggings +1
[36] = { trade = {27670, {4069, 8}, 758, 8720}, reward = 27691}, -- ignominy burgeonet +1
[37] = { trade = {27814, {4070, 8}, 758, 8722}, reward = 27835}, -- ignominy cuirass +1
[38] = { trade = {27950, {4071, 8}, 758, 8724}, reward = 27971}, -- ignominy gauntlets +1
[39] = { trade = {28097, {4072, 8}, 758, 8726}, reward = 28118}, -- ignominy flanchard +1
[40] = { trade = {28230, {4073, 8}, 758, 8728}, reward = 28251}, -- ignominy sollerets +1
[41] = { trade = {27671, {4069, 8}, 862, 8720}, reward = 27692}, -- totemic helm +1
[42] = { trade = {27815, {4070, 8}, 862, 8722}, reward = 27836}, -- totemic jackcoat +1
[43] = { trade = {27951, {4071, 8}, 862, 8724}, reward = 27972}, -- totemic gloves +1
[44] = { trade = {28098, {4072, 8}, 862, 8726}, reward = 28119}, -- totemic trousers +1
[45] = { trade = {28231, {4073, 8}, 862, 8728}, reward = 28252}, -- totemic gaiters +1
[46] = { trade = {27672, {4069, 8}, 1132, 8720}, reward = 27693}, -- brioso roundlet +1
[47] = { trade = {27816, {4070, 8}, 1132, 8722}, reward = 27837}, -- brioso justaucorps +1
[48] = { trade = {27952, {4071, 8}, 1132, 8724}, reward = 27973}, -- brioso cuffs +1
[49] = { trade = {28099, {4072, 8}, 1132, 8726}, reward = 28120}, -- brioso cannions +1
[50] = { trade = {28232, {4073, 8}, 1132, 8728}, reward = 28253}, -- brioso slippers +1
[51] = { trade = {27673, {4069, 8}, 2200, 8720}, reward = 27694}, -- orion beret +1
[52] = { trade = {27817, {4070, 8}, 2200, 8722}, reward = 27838}, -- orion jerkin +1
[53] = { trade = {27953, {4071, 8}, 2200, 8724}, reward = 27974}, -- orion bracers +1
[54] = { trade = {28100, {4072, 8}, 2200, 8726}, reward = 28121}, -- orion braccae +1
[55] = { trade = {28233, {4073, 8}, 2200, 8728}, reward = 28254}, -- orion socks +1
[56] = { trade = {27674, {4069, 8}, 658, 8720}, reward = 27695}, -- wakido kabuto +1
[57] = { trade = {27818, {4070, 8}, 658, 8722}, reward = 27839}, -- wakido domaru +1
[58] = { trade = {27954, {4071, 8}, 658, 8724}, reward = 27975}, -- wakido kote +1
[59] = { trade = {28101, {4072, 8}, 658, 8726}, reward = 28122}, -- wakido haidate +1
[60] = { trade = {28234, {4073, 8}, 658, 8728}, reward = 28255}, -- wakido sune-ate +1
[61] = { trade = {27675, {4069, 8}, 658, 8720}, reward = 27696}, -- hachiya hatsuburi +1
[62] = { trade = {27819, {4070, 8}, 658, 8722}, reward = 27840}, -- hachiya chainmail +1
[63] = { trade = {27955, {4071, 8}, 658, 8724}, reward = 27976}, -- hachiya tekko +1
[64] = { trade = {28102, {4072, 8}, 658, 8726}, reward = 28123}, -- hachiya hakama +1
[65] = { trade = {28235, {4073, 8}, 658, 8728}, reward = 28256}, -- hachiya kyahan +1
[66] = { trade = {27676, {4069, 8}, 668, 8720}, reward = 27697}, -- vishap armet +1
[67] = { trade = {27820, {4070, 8}, 668, 8722}, reward = 27841}, -- vishap mail +1
[68] = { trade = {27956, {4071, 8}, 668, 8724}, reward = 27977}, -- vishap finger gauntlets +1
[69] = { trade = {28103, {4072, 8}, 668, 8726}, reward = 28124}, -- vishap brais +1
[70] = { trade = {28236, {4073, 8}, 668, 8728}, reward = 28257}, -- vishap greaves +1
[71] = { trade = {27677, {4069, 8}, 1313, 8720}, reward = 27698}, -- convokers horn +1
[72] = { trade = {27821, {4070, 8}, 1313, 8722}, reward = 27842}, -- convokers doublet +1
[73] = { trade = {27957, {4071, 8}, 1313, 8724}, reward = 27978}, -- convokers bracers +1
[74] = { trade = {28104, {4072, 8}, 1313, 8726}, reward = 28125}, -- convokers spats +1
[75] = { trade = {28237, {4073, 8}, 1313, 8728}, reward = 28258}, -- convokers pigaches +1
[76] = { trade = {27678, {4069, 8}, 1132, 8720}, reward = 27699}, -- assimilators keffiyeh +1
[77] = { trade = {27822, {4070, 8}, 1132, 8722}, reward = 27843}, -- assimilators jubbah +1
[78] = { trade = {27958, {4071, 8}, 1132, 8724}, reward = 27979}, -- assimilators bazubands +1
[79] = { trade = {28105, {4072, 8}, 1132, 8726}, reward = 28126}, -- assimilators shalwar +1
[80] = { trade = {28238, {4073, 8}, 1132, 8728}, reward = 28259}, -- assimilators charuqs +1
[81] = { trade = {27679, {4069, 8}, 2200, 8720}, reward = 27700}, -- laksamanas tricorne +1
[82] = { trade = {27823, {4070, 8}, 2200, 8722}, reward = 27844}, -- laksamanas frac +1
[83] = { trade = {27959, {4071, 8}, 2200, 8724}, reward = 27980}, -- laksamanas gants +1
[84] = { trade = {28106, {4072, 8}, 2200, 8726}, reward = 28127}, -- laksamanas trews +1
[85] = { trade = {28239, {4073, 8}, 2200, 8728}, reward = 28260}, -- laksamanas bottes +1
[86] = { trade = {27680, {4069, 8}, 2200, 8720}, reward = 27701}, -- foire taj +1
[87] = { trade = {27824, {4070, 8}, 2200, 8722}, reward = 27845}, -- foire tobe +1
[88] = { trade = {27960, {4071, 8}, 2200, 8724}, reward = 27981}, -- foire dastanas +1
[89] = { trade = {28107, {4072, 8}, 2200, 8726}, reward = 28128}, -- foire churidars +1
[90] = { trade = {28240, {4073, 8}, 2200, 8728}, reward = 28261}, -- foire babouches +1
[91] = { trade = {27681, {4069, 8}, 2476, 8720}, reward = 27702}, -- maxixi tiara +1
[92] = { trade = {27825, {4070, 8}, 2476, 8722}, reward = 27846}, -- maxixi casaque +1
[93] = { trade = {27961, {4071, 8}, 2476, 8724}, reward = 27982}, -- maxixi bangles +1
[94] = { trade = {28108, {4072, 8}, 2476, 8726}, reward = 28129}, -- maxixi tights +1
[95] = { trade = {28241, {4073, 8}, 2476, 8728}, reward = 28262}, -- maxixi toe shoes +1
[96] = { trade = {27683, {4069, 8}, 1313, 8720}, reward = 27704}, -- academics mortarboard +1
[97] = { trade = {27827, {4070, 8}, 1313, 8722}, reward = 27848}, -- academics gown +1
[98] = { trade = {27963, {4071, 8}, 1313, 8724}, reward = 27984}, -- academics bracers +1
[99] = { trade = {28110, {4072, 8}, 1313, 8726}, reward = 28131}, -- academics pants +1
[100] = { trade = {28243, {4073, 8}, 1313, 8728}, reward = 28264}, -- academics loafers +1
[101] = { trade = {27786, {4069, 8}, 1132, 8720}, reward = 27705}, -- geomancy galero +1
[102] = { trade = {27926, {4070, 8}, 1132, 8722}, reward = 27849}, -- geomancy tunic +1
[103] = { trade = {28066, {4071, 8}, 1132, 8724}, reward = 27985}, -- geomancy mitaines +1
[104] = { trade = {28206, {4072, 8}, 1132, 8726}, reward = 28132}, -- geomancy pants +1
[105] = { trade = {28346, {4073, 8}, 1132, 8728}, reward = 28265}, -- geomancy sandals +1
[106] = { trade = {27787, {4069, 8}, 658, 8720}, reward = 27706}, -- runeist bandeau +1
[107] = { trade = {27927, {4070, 8}, 658, 8722}, reward = 27850}, -- runeist coat +1
[108] = { trade = {28067, {4071, 8}, 658, 8724}, reward = 27986}, -- runeist mitons +1
[109] = { trade = {28207, {4072, 8}, 658, 8726}, reward = 28133}, -- runeist trousers +1
[110] = { trade = {28347, {4073, 8}, 658, 8728}, reward = 28266}, -- runeist bottes +1
[111] = { trade = {26624, 3447, 3977, {4069, 8}}, reward = 26625}, -- agoge mask +1
[112] = { trade = {26800, 3447, 4014, {4070, 8}}, reward = 26801}, -- agoge lorica +1
[113] = { trade = {26976, 3447, 3980, {4071, 8}}, reward = 26977}, -- agoge mufflers +1
[114] = { trade = {27152, 3447, 4012, {4072, 8}}, reward = 27153}, -- agoge cuisses +1
[115] = { trade = {27328, 3447, 3979, {4073, 8}}, reward = 27329}, -- agoge calligae +1
[116] = { trade = {26626, 3492, 3977, {4069, 8}}, reward = 26627}, -- hesychasts crown +1
[117] = { trade = {26802, 3492, 4014, {4070, 8}}, reward = 26803}, -- hesychasts cyclas +1
[118] = { trade = {26978, 3492, 3980, {4071, 8}}, reward = 26979}, -- hesychasts gloves +1
[119] = { trade = {27154, 3492, 4012, {4072, 8}}, reward = 27155}, -- hesychasts hose +1
[120] = { trade = {27330, 3492, 3979, {4073, 8}}, reward = 27331}, -- hesychasts gaiters +1
[121] = { trade = {26628, 3491, 3977, {4069, 8}}, reward = 26629}, -- piety cap +1
[122] = { trade = {26804, 3491, 4014, {4070, 8}}, reward = 26805}, -- piety briault +1
[123] = { trade = {26980, 3491, 3980, {4071, 8}}, reward = 26981}, -- piety mitts +1
[124] = { trade = {27156, 3491, 4012, {4072, 8}}, reward = 27157}, -- piety pantaloons +1
[125] = { trade = {27332, 3491, 3979, {4073, 8}}, reward = 27333}, -- piety duckbills +1
[126] = { trade = {26630, 3491, 3977, {4069, 8}}, reward = 26631}, -- archmages petasos +1
[127] = { trade = {26806, 3491, 4014, {4070, 8}}, reward = 26807}, -- archmages coat +1
[128] = { trade = {26982, 3491, 3980, {4071, 8}}, reward = 26983}, -- archmages gloves +1
[129] = { trade = {27158, 3491, 4012, {4072, 8}}, reward = 27159}, -- archmages tonban +1
[130] = { trade = {27334, 3491, 3979, {4073, 8}}, reward = 27335}, -- archmages sabots +1
[131] = { trade = {26632, 3490, 3977, {4069, 8}}, reward = 26633}, -- vitiation chapeau +1
[132] = { trade = {26808, 3490, 4014, {4070, 8}}, reward = 26809}, -- vitiation tabard +1
[133] = { trade = {26984, 3490, 3980, {4071, 8}}, reward = 26985}, -- vitiation gloves +1
[134] = { trade = {27160, 3490, 4012, {4072, 8}}, reward = 27161}, -- vitiation tights +1
[135] = { trade = {27336, 3490, 3979, {4073, 8}}, reward = 27337}, -- vitiation boots +1
[136] = { trade = {26634, 3492, 3977, {4069, 8}}, reward = 26635}, -- plunderers bonnet +1
[137] = { trade = {26810, 3492, 4014, {4070, 8}}, reward = 26811}, -- plunderers vest +1
[138] = { trade = {26986, 3492, 3980, {4071, 8}}, reward = 26987}, -- plunderers armlets +1
[139] = { trade = {27162, 3492, 4012, {4072, 8}}, reward = 27163}, -- plunderers culottes +1
[140] = { trade = {27338, 3492, 3979, {4073, 8}}, reward = 27339}, -- plunderers poulaines +1
[141] = { trade = {26636, 3490, 3977, {4069, 8}}, reward = 26637}, -- caballarius coronet +1
[142] = { trade = {26812, 3490, 4014, {4070, 8}}, reward = 26813}, -- caballarius surcoat +1
[143] = { trade = {26988, 3490, 3980, {4071, 8}}, reward = 26989}, -- caballarius gauntlets +1
[144] = { trade = {27164, 3490, 4012, {4072, 8}}, reward = 27165}, -- caballarius breeches +1
[145] = { trade = {27340, 3490, 3979, {4073, 8}}, reward = 27341}, -- caballarius leggings +1
[146] = { trade = {26638, 3490, 3977, {4069, 8}}, reward = 26639}, -- fallens burgeonet +1
[147] = { trade = {26814, 3490, 4014, {4070, 8}}, reward = 26815}, -- fallens cuirass +1
[148] = { trade = {26990, 3490, 3980, {4071, 8}}, reward = 26991}, -- fallens finger gauntlets +1
[149] = { trade = {27166, 3490, 4012, {4072, 8}}, reward = 27167}, -- fallens flanchard +1
[150] = { trade = {27342, 3490, 3979, {4073, 8}}, reward = 27343}, -- fallens sollerets +1
[151] = { trade = {26640, 3445, 3977, {4069, 8}}, reward = 26641}, -- ankusa helm +1
[152] = { trade = {26816, 3445, 4014, {4070, 8}}, reward = 26817}, -- ankusa jackcoat +1
[153] = { trade = {26992, 3445, 3980, {4071, 8}}, reward = 26993}, -- ankusa gloves +1
[154] = { trade = {27168, 3445, 4012, {4072, 8}}, reward = 27169}, -- ankusa trousers +1
[155] = { trade = {27344, 3445, 3979, {4073, 8}}, reward = 27345}, -- ankusa gaiters +1
[156] = { trade = {26642, 3492, 3977, {4069, 8}}, reward = 26643}, -- bihu roundlet +1
[157] = { trade = {26818, 3492, 4014, {4070, 8}}, reward = 26819}, -- bihu justaucorps +1
[158] = { trade = {26994, 3492, 3980, {4071, 8}}, reward = 26995}, -- bihu cuffs +1
[159] = { trade = {27170, 3492, 4012, {4072, 8}}, reward = 27171}, -- bihu cannions +1
[160] = { trade = {27346, 3492, 3979, {4073, 8}}, reward = 27347}, -- bihu slippers +1
[161] = { trade = {26644, 3449, 3977, {4069, 8}}, reward = 26645}, -- arcadian beret +1
[162] = { trade = {26820, 3449, 4014, {4070, 8}}, reward = 26821}, -- arcadian jerkin +1
[163] = { trade = {26996, 3449, 3980, {4071, 8}}, reward = 26997}, -- arcadian bracers +1
[164] = { trade = {27172, 3449, 4012, {4072, 8}}, reward = 27173}, -- arcadian braccae +1
[165] = { trade = {27348, 3449, 3979, {4073, 8}}, reward = 27349}, -- arcadian socks +1
[166] = { trade = {26646, 3490, 3977, {4069, 8}}, reward = 26647}, -- sakonji kabuto +1
[167] = { trade = {26822, 3490, 4014, {4070, 8}}, reward = 26823}, -- sakonji domaru +1
[168] = { trade = {26998, 3490, 3980, {4071, 8}}, reward = 26999}, -- sakonji kote +1
[169] = { trade = {27174, 3490, 4012, {4072, 8}}, reward = 27175}, -- sakonji haidate +1
[170] = { trade = {27350, 3490, 3979, {4073, 8}}, reward = 27351}, -- sakonji sune-ate +1
[171] = { trade = {26648, 3447, 3977, {4069, 8}}, reward = 26649}, -- mochizuki hatsuburi +1
[172] = { trade = {26824, 3447, 4014, {4070, 8}}, reward = 26825}, -- mochizuki chainmail +1
[173] = { trade = {27000, 3447, 3980, {4071, 8}}, reward = 27001}, -- mochizuki tekko +1
[174] = { trade = {27176, 3447, 4012, {4072, 8}}, reward = 27177}, -- mochizuki hakama +1
[175] = { trade = {27352, 3447, 3979, {4073, 8}}, reward = 27353}, -- mochizuki kyahan +1
[176] = { trade = {26650, 3447, 3977, {4069, 8}}, reward = 26651}, -- pteroslaver armet +1
[177] = { trade = {26826, 3447, 4014, {4070, 8}}, reward = 26827}, -- pteroslaver mail +1
[178] = { trade = {27002, 3447, 3980, {4071, 8}}, reward = 27003}, -- pteroslaver finger gauntlets +1
[179] = { trade = {27178, 3447, 4012, {4072, 8}}, reward = 27179}, -- pteroslaver brais +1
[180] = { trade = {27354, 3447, 3979, {4073, 8}}, reward = 27355}, -- pteroslaver greaves +1
[181] = { trade = {26652, 3445, 3977, {4069, 8}}, reward = 26653}, -- glyphic horn +1
[182] = { trade = {26828, 3445, 4014, {4070, 8}}, reward = 26829}, -- glyphic doublet +1
[183] = { trade = {27004, 3445, 3980, {4071, 8}}, reward = 27005}, -- glyphic bracers +1
[184] = { trade = {27180, 3445, 4012, {4072, 8}}, reward = 27181}, -- glyphic spats +1
[185] = { trade = {27356, 3445, 3979, {4073, 8}}, reward = 27357}, -- glyphic pigaches +1
[186] = { trade = {26654, 3490, 3977, {4069, 8}}, reward = 26655}, -- luhlaza keffiyeh +1
[187] = { trade = {26830, 3490, 4014, {4070, 8}}, reward = 26831}, -- luhlaza jubbah +1
[188] = { trade = {27006, 3490, 3980, {4071, 8}}, reward = 27007}, -- luhlaza bazubands +1
[189] = { trade = {27182, 3490, 4012, {4072, 8}}, reward = 27183}, -- luhlaza shalwar +1
[190] = { trade = {27358, 3490, 3979, {4073, 8}}, reward = 27359}, -- luhlaza charuqs +1
[191] = { trade = {26656, 3492, 3977, {4069, 8}}, reward = 26657}, -- lanun tricorne +1
[192] = { trade = {26832, 3492, 4014, {4070, 8}}, reward = 26833}, -- lanun frac +1
[193] = { trade = {27008, 3492, 3980, {4071, 8}}, reward = 27009}, -- lanun gants +1
[195] = { trade = {27360, 3492, 3979, {4073, 8}}, reward = 27361}, -- lanun bottes +1
[196] = { trade = {26658, 3445, 3977, {4069, 8}}, reward = 26659}, -- pitre taj +1
[197] = { trade = {26834, 3445, 4014, {4070, 8}}, reward = 26835}, -- pitre tobe +1
[198] = { trade = {27010, 3445, 3980, {4071, 8}}, reward = 27011}, -- pitre dastanas +1
[199] = { trade = {27186, 3445, 4012, {4072, 8}}, reward = 27187}, -- pitre churidars +1
[200] = { trade = {27362, 3445, 3979, {4073, 8}}, reward = 27363}, -- pitre babouches +1
[201] = { trade = {26660, 3449, 3977, {4069, 8}}, reward = 26661}, -- horos tiara +1
[202] = { trade = {26836, 3449, 4014, {4070, 8}}, reward = 26837}, -- horos casaque +1
[203] = { trade = {27012, 3449, 3980, {4071, 8}}, reward = 27013}, -- horos bangles +1
[204] = { trade = {27188, 3449, 4012, {4072, 8}}, reward = 27189}, -- horos tights +1
[205] = { trade = {27364, 3449, 3979, {4073, 8}}, reward = 27365}, -- horos toe shoes +1
[206] = { trade = {26662, 3491, 3977, {4069, 8}}, reward = 26663}, -- pedagogy mortarboard +1
[207] = { trade = {26838, 3491, 4014, {4070, 8}}, reward = 26839}, -- pedagogy gown +1
[208] = { trade = {27014, 3491, 3980, {4071, 8}}, reward = 27015}, -- pedagogy bracers +1
[209] = { trade = {27190, 3491, 4012, {4072, 8}}, reward = 27191}, -- pedagogy pants +1
[210] = { trade = {27366, 3491, 3979, {4073, 8}}, reward = 27367}, -- pedagogy loafers +1
[211] = { trade = {26664, 3491, 3977, {4069, 8}}, reward = 26665}, -- bagua galero +1
[212] = { trade = {26840, 3491, 4014, {4070, 8}}, reward = 26841}, -- bagua tunic +1
[213] = { trade = {27016, 3491, 3980, {4071, 8}}, reward = 27017}, -- bagua mitaines +1
[214] = { trade = {27192, 3491, 4012, {4072, 8}}, reward = 27193}, -- bagua pants +1
[215] = { trade = {27368, 3491, 3979, {4073, 8}}, reward = 27369}, -- bagua sandals +1
[216] = { trade = {26666, 3449, 3977, {4069, 8}}, reward = 26667}, -- futhark bandeau +1
[217] = { trade = {26842, 3449, 4014, {4070, 8}}, reward = 26843}, -- futhark coat +1
[218] = { trade = {27018, 3449, 3980, {4071, 8}}, reward = 27019}, -- futhark mitons +1
[219] = { trade = {27194, 3449, 4012, {4072, 8}}, reward = 27195}, -- futhark trousers +1
[220] = { trade = {27370, 3449, 3979, {4073, 8}}, reward = 27371}, -- futhark boots +1
[221] = { trade ={ 26740, 9007, {4069, 8}, {9009, 15}}, reward = 26741}, -- boii mask +1
[222] = { trade ={ 26898, 9062, {4070, 8}, {9009, 25}}, reward = 26899}, -- boii lorica +1
[223] = { trade ={ 27052, 9005, {4071, 8}, {9009, 15}}, reward = 27053}, -- boii mufflers +1
[224] = { trade ={ 27237, 9064, {4072, 8}, {9009, 20}}, reward = 27238}, -- boii cuisses +1
[225] = { trade ={ 27411, 9002, {4073, 8}, {9009, 15}}, reward = 27412}, -- boii calligae +1
[226] = { trade ={ 26742, 9007, {4069, 8}, {9009, 15}}, reward = 26743}, -- bhikku crown +1
[227] = { trade ={ 26900, 9062, {4070, 8}, {9009, 25}}, reward = 26901}, -- bhikku cyclas +1
[228] = { trade ={ 27054, 9005, {4071, 8}, {9009, 15}}, reward = 27055}, -- bhikku gloves +1
[229] = { trade ={ 27239, 9064, {4072, 8}, {9009, 20}}, reward = 27240}, -- bhikku hose +1
[230] = { trade ={ 27413, 9002, {4073, 8}, {9009, 15}}, reward = 27414}, -- bhikku gaiters +1
[231] = { trade ={ 26744, 9007, {4069, 8}, {9009, 15}}, reward = 26745}, -- ebers cap +1
[232] = { trade ={ 26902, 9062, {4070, 8}, {9009, 25}}, reward = 26903}, -- ebers bliaud +1
[233] = { trade ={ 27056, 9005, {4071, 8}, {9009, 15}}, reward = 27057}, -- ebers mitts +1
[234] = { trade ={ 27241, 9064, {4072, 8}, {9009, 20}}, reward = 27242}, -- ebers pantaloons +1
[235] = { trade ={ 27415, 9002, {4073, 8}, {9009, 15}}, reward = 27416}, -- ebers duckbills +1
[236] = { trade ={ 26746, 9007, {4069, 8}, {9009, 15}}, reward = 26747}, -- wicce petasos +1
[237] = { trade ={ 26904, 9062, {4070, 8}, {9009, 25}}, reward = 26905}, -- wicce coat +1
[238] = { trade ={ 27058, 9005, {4071, 8}, {9009, 15}}, reward = 27059}, -- wicce gloves +1
[239] = { trade ={ 27243, 9064, {4072, 8}, {9009, 20}}, reward = 27244}, -- wicce chausses +1
[240] = { trade ={ 27417, 9002, {4073, 8}, {9009, 15}}, reward = 27418}, -- wicce sabots +1
[241] = { trade ={ 26748, 9007, {4069, 8}, {9009, 15}}, reward = 26749}, -- lethargy chappel +1
[242] = { trade ={ 26906, 9062, {4070, 8}, {9009, 25}}, reward = 26907}, -- lethargy sayon +1
[243] = { trade ={ 27060, 9005, {4071, 8}, {9009, 15}}, reward = 27061}, -- lethargy gantherots +1
[244] = { trade ={ 27245, 9064, {4072, 8}, {9009, 20}}, reward = 27246}, -- lethargy fuseau +1
[245] = { trade ={ 27419, 9002, {4073, 8}, {9009, 15}}, reward = 27420}, -- lethargy houseaux +1
[246] = { trade ={ 26750, 9007, {4069, 8}, {9009, 15}}, reward = 26751}, -- skulkers bonnet +1
[247] = { trade ={ 26908, 9062, {4070, 8}, {9009, 25}}, reward = 26909}, -- skulkers vest +1
[248] = { trade ={ 27062, 9005, {4071, 8}, {9009, 15}}, reward = 27063}, -- skulkers armlets +1
[249] = { trade ={ 27247, 9064, {4072, 8}, {9009, 20}}, reward = 27248}, -- skulkers culottes +1
[250] = { trade ={ 27421, 9002, {4073, 8}, {9009, 15}}, reward = 27422}, -- skulkers poulaines +1
[251] = { trade ={ 26752, 9007, {4069, 8}, {9009, 15}}, reward = 26753}, -- chevaliers armet +1
[252] = { trade ={ 26910, 9062, {4070, 8}, {9009, 25}}, reward = 26911}, -- chevaliers cuirass +1
[253] = { trade ={ 27064, 9005, {4071, 8}, {9009, 15}}, reward = 27065}, -- chevaliers gauntlets +1
[254] = { trade ={ 27249, 9064, {4072, 8}, {9009, 20}}, reward = 27250}, -- chevaliers cuisses +1
[255] = { trade ={ 27423, 9002, {4073, 8}, {9009, 15}}, reward = 27424}, -- chevaliers sabatons +1
[256] = { trade ={ 26754, 9007, {4069, 8}, {9009, 15}}, reward = 26755}, -- heathens burgeonet +1
[257] = { trade ={ 26912, 9062, {4070, 8}, {9009, 25}}, reward = 26913}, -- heathens cuirass +1
[258] = { trade ={ 27066, 9005, {4071, 8}, {9009, 15}}, reward = 27067}, -- heathens gauntlets +1
[259] = { trade ={ 27251, 9064, {4072, 8}, {9009, 20}}, reward = 27252}, -- heathens flanchard +1
[260] = { trade ={ 27425, 9002, {4073, 8}, {9009, 15}}, reward = 27426}, -- heathens sollerets +1
[261] = { trade ={ 26756, 9007, {4069, 8}, {9009, 15}}, reward = 26757}, -- nukumi cabasset +1
[262] = { trade ={ 26914, 9062, {4070, 8}, {9009, 25}}, reward = 26915}, -- nukumi gausape +1
[263] = { trade ={ 27068, 9005, {4071, 8}, {9009, 15}}, reward = 27069}, -- nukumi manoplas +1
[264] = { trade ={ 27253, 9064, {4072, 8}, {9009, 20}}, reward = 27254}, -- nukumi quijotes +1
[265] = { trade ={ 27427, 9002, {4073, 8}, {9009, 15}}, reward = 27428}, -- nukumi ocreae +1
[266] = { trade ={ 26758, 9007, {4069, 8}, {9009, 15}}, reward = 26759}, -- fili calot +1
[267] = { trade ={ 26916, 9062, {4070, 8}, {9009, 25}}, reward = 26917}, -- fili hongreline +1
[268] = { trade ={ 27070, 9005, {4071, 8}, {9009, 15}}, reward = 27071}, -- fili manchettes +1
[269] = { trade ={ 27255, 9064, {4072, 8}, {9009, 20}}, reward = 27256}, -- fili rhingrave +1
[270] = { trade ={ 27429, 9002, {4073, 8}, {9009, 15}}, reward = 27430}, -- fili cothurnes +1
[271] = { trade ={ 26760, 9007, {4069, 8}, {9009, 15}}, reward = 26761}, -- amini gapette +1
[272] = { trade ={ 26918, 9062, {4070, 8}, {9009, 25}}, reward = 26919}, -- amini caban +1
[273] = { trade ={ 27072, 9005, {4071, 8}, {9009, 15}}, reward = 27073}, -- amini glovelettes +1
[274] = { trade ={ 27257, 9064, {4072, 8}, {9009, 20}}, reward = 27258}, -- amini brague +1
[275] = { trade ={ 27431, 9002, {4073, 8}, {9009, 15}}, reward = 27432}, -- amini bottillons +1
[276] = { trade ={ 26762, 9007, {4069, 8}, {9009, 15}}, reward = 26763}, -- kasuga kabuto +1
[277] = { trade ={ 26920, 9062, {4070, 8}, {9009, 25}}, reward = 26921}, -- kasuga domaru +1
[278] = { trade ={ 27074, 9005, {4071, 8}, {9009, 15}}, reward = 27075}, -- kasuga kote +1
[279] = { trade ={ 27259, 9064, {4072, 8}, {9009, 20}}, reward = 27260}, -- kasuga haidate +1
[280] = { trade ={ 27433, 9002, {4073, 8}, {9009, 15}}, reward = 27434}, -- kasuga sune-ate +1
[281] = { trade ={ 26764, 9007, {4069, 8}, {9009, 15}}, reward = 26765}, -- hattori zukin +1
[282] = { trade ={ 26922, 9062, {4070, 8}, {9009, 25}}, reward = 26923}, -- hattori ningi +1
[283] = { trade ={ 27076, 9005, {4071, 8}, {9009, 15}}, reward = 27077}, -- hattori tekko +1
[284] = { trade ={ 27261, 9064, {4072, 8}, {9009, 20}}, reward = 27262}, -- hattori hakama +1
[285] = { trade ={ 27435, 9002, {4073, 8}, {9009, 15}}, reward = 27436}, -- hattori kyahan +1
[286] = { trade ={ 26766, 9007, {4069, 8}, {9009, 15}}, reward = 26767}, -- peltasts mezail +1
[287] = { trade ={ 26924, 9062, {4070, 8}, {9009, 25}}, reward = 26925}, -- peltasts plackart +1
[288] = { trade ={ 27078, 9005, {4071, 8}, {9009, 15}}, reward = 27079}, -- peltasts vambraces +1
[289] = { trade ={ 27263, 9064, {4072, 8}, {9009, 20}}, reward = 27264}, -- peltasts cuissots +1
[290] = { trade ={ 27437, 9002, {4073, 8}, {9009, 15}}, reward = 27438}, -- peltasts schynbalds +1
[291] = { trade ={ 26768, 9007, {4069, 8}, {9009, 15}}, reward = 26769}, -- beckoners horn +1
[292] = { trade ={ 26926, 9062, {4070, 8}, {9009, 25}}, reward = 26927}, -- beckoners doublet +1
[293] = { trade ={ 27080, 9005, {4071, 8}, {9009, 15}}, reward = 27081}, -- beckoners bracers +1
[294] = { trade ={ 27265, 9064, {4072, 8}, {9009, 20}}, reward = 27266}, -- beckoners spats +1
[295] = { trade ={ 27439, 9002, {4073, 8}, {9009, 15}}, reward = 27440}, -- beckoners pigaches +1
[296] = { trade ={ 26770, 9007, {4069, 8}, {9009, 15}}, reward = 26771}, -- hashishin kavuk +1
[297] = { trade ={ 26928, 9062, {4070, 8}, {9009, 25}}, reward = 26929}, -- hashishin mintan +1
[298] = { trade ={ 27082, 9005, {4071, 8}, {9009, 15}}, reward = 27083}, -- hashishin bazubands +1
[299] = { trade ={ 27267, 9064, {4072, 8}, {9009, 20}}, reward = 27268}, -- hashishin tayt +1
[300] = { trade ={ 27441, 9002, {4073, 8}, {9009, 15}}, reward = 27442}, -- hashishin basmak +1
[301] = { trade ={ 26772, 9007, {4069, 8}, {9009, 15}}, reward = 26773}, -- chasseurs tricorne +1
[302] = { trade ={ 26930, 9062, {4070, 8}, {9009, 25}}, reward = 26931}, -- chasseurs frac +1
[303] = { trade ={ 27084, 9005, {4071, 8}, {9009, 15}}, reward = 27085}, -- chasseurs gants +1
[304] = { trade ={ 27269, 9064, {4072, 8}, {9009, 20}}, reward = 27270}, -- chasseurs culottes +1
[305] = { trade ={ 27443, 9002, {4073, 8}, {9009, 15}}, reward = 27444}, -- chasseurs bottes +1
[306] = { trade ={ 26774, 9007, {4069, 8}, {9009, 15}}, reward = 26775}, -- karagoz capello +1
[307] = { trade ={ 26932, 9062, {4070, 8}, {9009, 25}}, reward = 26933}, -- karagoz farsetto +1
[308] = { trade ={ 27086, 9005, {4071, 8}, {9009, 15}}, reward = 27087}, -- karagoz guanti +1
[309] = { trade ={ 27271, 9064, {4072, 8}, {9009, 20}}, reward = 27272}, -- karagoz pantaloni +1
[310] = { trade ={ 27445, 9002, {4073, 8}, {9009, 15}}, reward = 27446}, -- karagoz scarpe +1
[311] = { trade ={ 26776, 9007, {4069, 8}, {9009, 15}}, reward = 26777}, -- maculele tiara +1
[312] = { trade ={ 26934, 9062, {4070, 8}, {9009, 25}}, reward = 26935}, -- maculele casaque +1
[313] = { trade ={ 27088, 9005, {4071, 8}, {9009, 15}}, reward = 27089}, -- maculele bangles +1
[314] = { trade ={ 27273, 9064, {4072, 8}, {9009, 20}}, reward = 27274}, -- maculele tights +1
[315] = { trade ={ 27447, 9002, {4073, 8}, {9009, 15}}, reward = 27448}, -- maculele toe shoes +1
[316] = { trade ={ 26778, 9007, {4069, 8}, {9009, 15}}, reward = 26779}, -- arbatel bonnet +1
[317] = { trade ={ 26936, 9062, {4070, 8}, {9009, 25}}, reward = 26937}, -- arbatel gown +1
[318] = { trade ={ 27090, 9005, {4071, 8}, {9009, 15}}, reward = 27091}, -- arbatel bracers +1
[319] = { trade ={ 27275, 9064, {4072, 8}, {9009, 20}}, reward = 27276}, -- arbatel pants +1
[320] = { trade ={ 27449, 9002, {4073, 8}, {9009, 15}}, reward = 27450}, -- arbatel loafers +1
[321] = { trade ={ 26780, 9007, {4069, 8}, {9009, 15}}, reward = 26781}, -- azimuth hood +1
[322] = { trade ={ 26938, 9062, {4070, 8}, {9009, 25}}, reward = 26939}, -- azimuth coat +1
[323] = { trade ={ 27092, 9005, {4071, 8}, {9009, 15}}, reward = 27093}, -- azimuth gloves +1
[324] = { trade ={ 27277, 9064, {4072, 8}, {9009, 20}}, reward = 27278}, -- azimuth tights +1
[325] = { trade ={ 27451, 9002, {4073, 8}, {9009, 15}}, reward = 27452}, -- azimuth gaiters +1
[326] = { trade ={ 26782, 9007, {4069, 8}, {9009, 15}}, reward = 26783}, -- erilaz galea +1
[327] = { trade ={ 26940, 9062, {4070, 8}, {9009, 25}}, reward = 26941}, -- erilaz surcoat +1
[328] = { trade ={ 27094, 9005, {4071, 8}, {9009, 15}}, reward = 27095}, -- erilaz gauntlets +1
[329] = { trade ={ 27279, 9064, {4072, 8}, {9009, 20}}, reward = 27280}, -- erilaz leg guards +1
[330] = { trade ={ 27453, 9002, {4073, 8}, {9009, 15}}, reward = 27454}, -- erilaz greaves +1
[331] = { trade = {12638, 855, 837, { 4065, 10}}, reward = 27807}, -- pummelers lorica
[332] = { trade = {12639, 823, 837, { 4065, 10}}, reward = 27808}, -- anchorites cyclas
[333] = { trade = {12640, 2340, 837, { 4065, 10}}, reward = 27809}, -- theophany briault
[334] = { trade = {12641, 2288, 837, { 4065, 10}}, reward = 27810}, -- spaekonas coat
[335] = { trade = {12642, 1699, 837, { 4065, 10}}, reward = 27811}, -- atrophy tabard
[336] = { trade = {12643, 823, 837, { 4065, 10}}, reward = 27812}, -- pillagers vest
[337] = { trade = {12644, 752, 837, { 4065, 10}}, reward = 27813}, -- reverence surcoat
[338] = { trade = {12645, 664, 837, { 4065, 10}}, reward = 27814}, -- ignominy cuirass
[339] = { trade = {12646, 855, 837, { 4065, 10}}, reward = 27815}, -- totemic jackcoat
[340] = { trade = {12647, 2340, 837, { 4065, 10}}, reward = 27816}, -- brioso justaucorps
[341] = { trade = {12648, 2288, 837, { 4065, 10}}, reward = 27817}, -- orion jerkin
[342] = { trade = {13781, 657, 837, { 4065, 10}}, reward = 27818}, -- wakido domaru
[343] = { trade = {13782, 657, 837, { 4065, 10}}, reward = 27819}, -- hachiya chainmail
[344] = { trade = {12649, 752, 837, { 4065, 10}}, reward = 27820}, -- vishap mail
[345] = { trade = {12650, 1699, 837, { 4065, 10}}, reward = 27821}, -- convokers doublet
[346] = { trade = {14521, 2340, 837, { 4065, 10}}, reward = 27822}, -- assimilators jubbah
[347] = { trade = {14522, 2288, 837, { 4065, 10}}, reward = 27823}, -- laksamanas frac
[348] = { trade = {14523, 2288, 837, { 4065, 10}}, reward = 27824}, -- foire tobe
[349] = { trade = {14578, 823, 837, { 4065, 10}}, reward = 27825}, -- maxixi casaque
[350] = { trade = {14580, 1699, 837, { 4065, 10}}, reward = 27827}, -- academics gown
[351] = { trade = {14583, 1699, 837, { 4065, 5}}, reward = 27926}, -- geomancy tunic
[352] = { trade = {12579, 823, 837, { 4065, 10}}, reward = 27927}, -- runeist coat
[353] = { trade = {14089, 855, 1311, { 4068, 10}}, reward = 28223}, -- pummelers calligae
[354] = { trade = {14090, 823, 1311, { 4068, 10}}, reward = 28224}, -- anchorites gaiters
[355] = { trade = {14091, 2340, 1311, { 4068, 10}}, reward = 28225}, -- theophany duckbills
[356] = { trade = {14092, 2288, 1311, { 4068, 10}}, reward = 28226}, -- spaekonas sabots
[357] = { trade = {14093, 1699, 1311, { 4068, 10}}, reward = 28227}, -- atrophy boots
[358] = { trade = {14094, 823, 1311, { 4068, 10}}, reward = 28228}, -- pillagers poulaines
[359] = { trade = {14095, 752, 1311, { 4068, 10}}, reward = 28229}, -- reverence leggings
[360] = { trade = {14096, 664, 1311, { 4068, 10}}, reward = 28230}, -- ignominy sollerets
[361] = { trade = {14097, 855, 1311, { 4068, 10}}, reward = 28231}, -- totemic gaiters
[362] = { trade = {14098, 2340, 1311, { 4068, 10}}, reward = 28232}, -- brioso slippers
[363] = { trade = {14099, 2288, 1311, { 4068, 10}}, reward = 28233}, -- orion socks
[364] = { trade = {14100, 657, 1311, { 4068, 10}}, reward = 28234}, -- wakido sune-ate
[365] = { trade = {14101, 657, 1311, { 4068, 10}}, reward = 28235}, -- hachiya kyahan
[366] = { trade = {14102, 752, 1311, { 4068, 10}}, reward = 28236}, -- vishap greaves
[367] = { trade = {14103, 1699, 1311, { 4068, 10}}, reward = 28237}, -- convokers pigaches
[368] = { trade = {15684, 2340, 1311, { 4068, 10}}, reward = 28238}, -- assimilators charuqs
[369] = { trade = {15685, 2288, 1311, { 4068, 10}}, reward = 28239}, -- laksamanas bottes
[370] = { trade = {15686, 2288, 1311, { 4068, 10}}, reward = 28240}, -- foire babouches
[371] = { trade = {15746, 823, 1311, { 4068, 10}}, reward = 28241}, -- maxixi toe shoes
[372] = { trade = {15748, 1699, 1311, { 4068, 10}}, reward = 28243}, -- academics loafers
[373] = { trade = {15751, 1699, 1311, { 4068, 10}}, reward = 28346}, -- geomancy sandals
[374] = { trade = {12963, 823, 1311, { 4068, 5}}, reward = 28347}, -- runeist bottes
[375] = { trade = {13961, 855, 1110, { 4066, 10}}, reward = 27943}, -- pummelers mufflers
[376] = { trade = {13962, 823, 1110, { 4066, 10}}, reward = 27944}, -- anchorites gloves
[377] = { trade = {13963, 2340, 1110, { 4066, 10}}, reward = 27945}, -- theophany mitts
[378] = { trade = {13964, 2288, 1110, { 4066, 10}}, reward = 27946}, -- spaekonas gloves
[379] = { trade = {13965, 1699, 1110, { 4066, 10}}, reward = 27947}, -- atrophy gloves
[380] = { trade = {13966, 823, 1110, { 4066, 10}}, reward = 27948}, -- pillagers armlets
[381] = { trade = {13967, 752, 1110, { 4066, 10}}, reward = 27949}, -- reverence gauntlets
[382] = { trade = {13968, 664, 1110, { 4066, 10}}, reward = 27950}, -- ignominy gauntlets
[383] = { trade = {13969, 855, 1110, { 4066, 10}}, reward = 27951}, -- totemic gloves
[384] = { trade = {13970, 2340, 1110, { 4066, 10}}, reward = 27952}, -- brioso cuffs
[385] = { trade = {13971, 2288, 1110, { 4066, 10}}, reward = 27953}, -- orion bracers
[386] = { trade = {13972, 657, 1110, { 4066, 10}}, reward = 27954}, -- wakido kote
[387] = { trade = {13973, 657, 1110, { 4066, 10}}, reward = 27955}, -- hachiya tekko
[388] = { trade = {13974, 752, 1110, { 4066, 10}}, reward = 27956}, -- vishap finger gauntlets
[389] = { trade = {13975, 1699, 1110, { 4066, 10}}, reward = 27957}, -- convokers bracers
[390] = { trade = {14928, 2340, 1110, { 4066, 10}}, reward = 27958}, -- assimilators bazubands
[391] = { trade = {14929, 2288, 1110, { 4066, 10}}, reward = 27959}, -- laksamanas gants
[392] = { trade = {14930, 2288, 1110, { 4066, 10}}, reward = 27960}, -- foire dastanas
[393] = { trade = {15002, 823, 1110, { 4066, 10}}, reward = 27961}, -- maxixi bangles
[394] = { trade = {15004, 1699, 1110, { 4066, 10}}, reward = 27963}, -- academics bracers
[395] = { trade = {15007, 1699, 1110, { 4066, 10}}, reward = 28066}, -- geomancy mitaines
[396] = { trade = {12707, 823, 1110, { 4066, 5}}, reward = 28067}, -- runeist mitons
[397] = { trade = {12511, 855, 844, { 4064, 10}}, reward = 27663}, -- pummelers mask
[398] = { trade = {12512, 823, 844, { 4064, 10}}, reward = 27664}, -- anchorites crown
[399] = { trade = {13855, 2340, 844, { 4064, 10}}, reward = 27665}, -- theophany cap
[400] = { trade = {13856, 2288, 844, { 4064, 10}}, reward = 27666}, -- spaekonas petasos
[401] = { trade = {12513, 1699, 844, { 4064, 10}}, reward = 27667}, -- atrophy chapeau
[402] = { trade = {12514, 823, 844, { 4064, 10}}, reward = 27668}, -- pillagers bonnet
[403] = { trade = {12515, 752, 844, { 4064, 10}}, reward = 27669}, -- reverence coronet
[404] = { trade = {12516, 664, 844, { 4064, 10}}, reward = 27670}, -- ignominy burgeonet
[405] = { trade = {12517, 855, 844, { 4064, 10}}, reward = 27671}, -- totemic helm
[406] = { trade = {13857, 2340, 844, { 4064, 10}}, reward = 27672}, -- brioso roundlet
[407] = { trade = {12518, 2288, 844, { 4064, 10}}, reward = 27673}, -- orion beret
[408] = { trade = {13868, 657, 844, { 4064, 10}}, reward = 27674}, -- wakido kabuto
[409] = { trade = {13869, 657, 844, { 4064, 10}}, reward = 27675}, -- hachiya hatsuburi
[410] = { trade = {12519, 752, 844, { 4064, 10}}, reward = 27676}, -- vishap armet
[411] = { trade = {12520, 1699, 844, { 4064, 10}}, reward = 27677}, -- convokers horn
[412] = { trade = {15265, 2340, 844, { 4064, 10}}, reward = 27678}, -- assimilators keffiyeh
[413] = { trade = {15266, 2288, 844, { 4064, 10}}, reward = 27679}, -- laksamanas tricorne
[414] = { trade = {15267, 2288, 844, { 4064, 10}}, reward = 27680}, -- foire taj
[415] = { trade = {16138, 823, 844, { 4064, 10}}, reward = 27681}, -- maxixi tiara
[416] = { trade = {16140, 1699, 844, { 4064, 10}}, reward = 27683}, -- academics mortarboard
[417] = { trade = {16143, 1699, 844, { 4064, 10}}, reward = 27786}, -- geomancy galero
[418] = { trade = {12451, 823, 844, { 4064, 5}}, reward = 27787}, -- runeist bandeau
[419] = { trade = {14214, 855, 836, { 4067, 10}}, reward = 28090}, -- pummelers cuisses
[420] = { trade = {14215, 823, 836, { 4067, 10}}, reward = 28091}, -- anchorites hose
[421] = { trade = {14216, 2340, 836, { 4067, 10}}, reward = 28092}, -- theophany pantaloons
[422] = { trade = {14217, 2288, 836, { 4067, 10}}, reward = 28093}, -- spaekonas tonban
[423] = { trade = {14218, 1699, 836, { 4067, 10}}, reward = 28094}, -- atrophy tights
[424] = { trade = {14219, 823, 836, { 4067, 10}}, reward = 28095}, -- pillagers culottes
[425] = { trade = {14220, 752, 836, { 4067, 10}}, reward = 28096}, -- reverence breeches
[426] = { trade = {14221, 664, 836, { 4067, 10}}, reward = 28097}, -- ignominy flanchard
[427] = { trade = {14222, 855, 836, { 4067, 10}}, reward = 28098}, -- totemic trousers
[428] = { trade = {14223, 2340, 836, { 4067, 10}}, reward = 28099}, -- brioso cannions
[429] = { trade = {14224, 2288, 836, { 4067, 10}}, reward = 28100}, -- orion braccae
[430] = { trade = {14225, 657, 836, { 4067, 10}}, reward = 28101}, -- wakido haidate
[431] = { trade = {14226, 657, 836, { 4067, 10}}, reward = 28102}, -- hachiya hakama
[432] = { trade = {14227, 752, 836, { 4067, 10}}, reward = 28103}, -- vishap brais
[433] = { trade = {14228, 1699, 836, { 4067, 10}}, reward = 28104}, -- convokers spats
[434] = { trade = {15600, 2340, 836, { 4067, 10}}, reward = 28105}, -- assimilators shalwar
[435] = { trade = {15601, 2288, 836, { 4067, 10}}, reward = 28106}, -- laksamanas trews
[436] = { trade = {15602, 2288, 836, { 4067, 10}}, reward = 28107}, -- foire churidars
[437] = { trade = {15659, 823, 836, { 4067, 10}}, reward = 28108}, -- maxixi tights
[438] = { trade = {16311, 1699, 836, { 4067, 10}}, reward = 28110}, -- academics pants
[439] = { trade = {16314, 1699, 836, { 4067, 5}}, reward = 28206}, -- geomancy pants
[440] = { trade = {12838, 823, 836, { 4067, 10}}, reward = 28207}, -- runeist trousers
[441] = { trade = {15561, 855, 836, { 4067, 5}}, reward = 28090}, -- pummelers cuisses
[442] = { trade = {15562, 823, 836, { 4067, 5}}, reward = 28091}, -- anchorites hose
[443] = { trade = {15563, 2340, 836, { 4067, 5}}, reward = 28092}, -- theophany pantaloons
[444] = { trade = {15564, 2288, 836, { 4067, 5}}, reward = 28093}, -- spaekonas tonban
[445] = { trade = {15565, 1699, 836, { 4067, 5}}, reward = 28094}, -- atrophy tights
[446] = { trade = {15566, 823, 836, { 4067, 5}}, reward = 28095}, -- pillagers culottes
[447] = { trade = {15567, 752, 836, { 4067, 5}}, reward = 28096}, -- reverence breeches
[448] = { trade = {15568, 664, 836, { 4067, 5}}, reward = 28097}, -- ignominy flanchard
[449] = { trade = {15569, 855, 836, { 4067, 5}}, reward = 28098}, -- totemic trousers
[450] = { trade = {15570, 2340, 836, { 4067, 5}}, reward = 28099}, -- brioso cannions
[451] = { trade = {15571, 2288, 836, { 4067, 5}}, reward = 28100}, -- orion braccae
[452] = { trade = {15572, 657, 836, { 4067, 5}}, reward = 28101}, -- wakido haidate
[453] = { trade = {15573, 657, 836, { 4067, 5}}, reward = 28102}, -- hachiya hakama
[454] = { trade = {15574, 752, 836, { 4067, 5}}, reward = 28103}, -- vishap brais
[455] = { trade = {15575, 1699, 836, { 4067, 5}}, reward = 28104}, -- convokers spats
[456] = { trade = {16345, 2340, 836, { 4067, 5}}, reward = 28105}, -- assimilators shalwar
[457] = { trade = {16348, 2288, 836, { 4067, 5}}, reward = 28106}, -- laksamanas trews
[458] = { trade = {16351, 2288, 836, { 4067, 5}}, reward = 28107}, -- foire churidars
[459] = { trade = {16357, 823, 836, { 4067, 5}}, reward = 28108}, -- maxixi tights
[460] = { trade = {16359, 1699, 836, { 4067, 5}}, reward = 28110}, -- academics pants
[461] = { trade = {14473, 855, 837, { 4065, 5}}, reward = 27807}, -- pummelers lorica
[462] = { trade = {14474, 823, 837, { 4065, 5}}, reward = 27808}, -- anchorites cyclas
[463] = { trade = {14475, 2340, 837, { 4065, 5}}, reward = 27809}, -- theophany briault
[464] = { trade = {14476, 2288, 837, { 4065, 5}}, reward = 27810}, -- spaekonas coat
[465] = { trade = {14477, 1699, 837, { 4065, 5}}, reward = 27811}, -- atrophy tabard
[466] = { trade = {14478, 823, 837, { 4065, 5}}, reward = 27812}, -- pillagers vest
[467] = { trade = {14479, 752, 837, { 4065, 5}}, reward = 27813}, -- reverence surcoat
[468] = { trade = {14480, 664, 837, { 4065, 5}}, reward = 27814}, -- ignominy cuirass
[469] = { trade = {14481, 855, 837, { 4065, 5}}, reward = 27815}, -- totemic jackcoat
[470] = { trade = {14482, 2340, 837, { 4065, 5}}, reward = 27816}, -- brioso justaucorps
[471] = { trade = {14483, 2288, 837, { 4065, 5}}, reward = 27817}, -- orion jerkin
[472] = { trade = {14484, 657, 837, { 4065, 5}}, reward = 27818}, -- wakido domaru
[473] = { trade = {14485, 657, 837, { 4065, 5}}, reward = 27819}, -- hachiya chainmail
[474] = { trade = {14486, 752, 837, { 4065, 5}}, reward = 27820}, -- vishap mail
[475] = { trade = {14487, 1699, 837, { 4065, 5}}, reward = 27821}, -- convokers doublet
[476] = { trade = {11291, 2340, 837, { 4065, 5}}, reward = 27822}, -- assimilators jubbah
[477] = { trade = {11294, 2288, 837, { 4065, 5}}, reward = 27823}, -- laksamanas frac
[478] = { trade = {11297, 2288, 837, { 4065, 5}}, reward = 27824}, -- foire tobe
[479] = { trade = {11302, 823, 837, { 4065, 5}}, reward = 27825}, -- maxixi casaque
[480] = { trade = {11304, 1699, 837, { 4065, 5}}, reward = 27827}, -- academics gown
[481] = { trade = {15352, 855, 1311, { 4068, 5}}, reward = 28223}, -- pummelers calligae
[482] = { trade = {15353, 823, 1311, { 4068, 5}}, reward = 28224}, -- anchorites gaiters
[483] = { trade = {15354, 2340, 1311, { 4068, 5}}, reward = 28225}, -- theophany duckbills
[484] = { trade = {15355, 2288, 1311, { 4068, 5}}, reward = 28226}, -- spaekonas sabots
[485] = { trade = {15356, 1699, 1311, { 4068, 5}}, reward = 28227}, -- atrophy boots
[486] = { trade = {15357, 823, 1311, { 4068, 5}}, reward = 28228}, -- pillagers poulaines
[487] = { trade = {15358, 752, 1311, { 4068, 5}}, reward = 28229}, -- reverence leggings
[488] = { trade = {15359, 664, 1311, { 4068, 5}}, reward = 28230}, -- ignominy sollerets
[489] = { trade = {15360, 855, 1311, { 4068, 5}}, reward = 28231}, -- totemic gaiters
[490] = { trade = {15361, 2340, 1311, { 4068, 5}}, reward = 28232}, -- brioso slippers
[491] = { trade = {15362, 2288, 1311, { 4068, 5}}, reward = 28233}, -- orion socks
[492] = { trade = {15363, 657, 1311, { 4068, 5}}, reward = 28234}, -- wakido sune-ate
[493] = { trade = {15364, 657, 1311, { 4068, 5}}, reward = 28235}, -- hachiya kyahan
[494] = { trade = {15365, 752, 1311, { 4068, 5}}, reward = 28236}, -- vishap greaves
[495] = { trade = {15366, 1699, 1311, { 4068, 5}}, reward = 28237}, -- convokers pigaches
[496] = { trade = {11381, 2340, 1311, { 4068, 5}}, reward = 28238}, -- assimilators charuqs
[497] = { trade = {11384, 2288, 1311, { 4068, 5}}, reward = 28239}, -- laksamanas bottes
[498] = { trade = {11387, 2288, 1311, { 4068, 5}}, reward = 28240}, -- foire babouches
[499] = { trade = {11393, 823, 1311, { 4068, 5}}, reward = 28241}, -- maxixi toe shoes
[500] = { trade = {11395, 1699, 1311, { 4068, 5}}, reward = 28243}, -- academics loafers
[501] = { trade = {14890, 855, 1110, { 4066, 5}}, reward = 27943}, -- pummelers mufflers
[502] = { trade = {14891, 823, 1110, { 4066, 5}}, reward = 27944}, -- anchorites gloves
[503] = { trade = {14892, 2340, 1110, { 4066, 5}}, reward = 27945}, -- theophany mitts
[504] = { trade = {14893, 2288, 1110, { 4066, 5}}, reward = 27946}, -- spaekonas gloves
[505] = { trade = {14894, 1699, 1110, { 4066, 5}}, reward = 27947}, -- atrophy gloves
[506] = { trade = {14895, 823, 1110, { 4066, 5}}, reward = 27948}, -- pillagers armlets
[507] = { trade = {14896, 752, 1110, { 4066, 5}}, reward = 27949}, -- reverence gauntlets
[508] = { trade = {14897, 664, 1110, { 4066, 5}}, reward = 27950}, -- ignominy gauntlets
[509] = { trade = {14898, 855, 1110, { 4066, 5}}, reward = 27951}, -- totemic gloves
[510] = { trade = {14899, 2340, 1110, { 4066, 5}}, reward = 27952}, -- brioso cuffs
[511] = { trade = {14900, 2288, 1110, { 4066, 5}}, reward = 27953}, -- orion bracers
[512] = { trade = {14901, 657, 1110, { 4066, 5}}, reward = 27954}, -- wakido kote
[513] = { trade = {14902, 657, 1110, { 4066, 5}}, reward = 27955}, -- hachiya tekko
[514] = { trade = {14903, 752, 1110, { 4066, 5}}, reward = 27956}, -- vishap finger gauntlets
[515] = { trade = {14904, 1699, 1110, { 4066, 5}}, reward = 27957}, -- convokers bracers
[516] = { trade = {15024, 2340, 1110, { 4066, 5}}, reward = 27958}, -- assimilators bazubands
[517] = { trade = {15027, 2288, 1110, { 4066, 5}}, reward = 27959}, -- laksamanas gants
[518] = { trade = {15030, 2288, 1110, { 4066, 5}}, reward = 27960}, -- foire dastanas
[519] = { trade = {15035, 823, 1110, { 4066, 5}}, reward = 27961}, -- maxixi bangles
[520] = { trade = {15037, 1699, 1110, { 4066, 5}}, reward = 27963}, -- academics bracers
[521] = { trade = {15225, 855, 844, { 4064, 5}}, reward = 27663}, -- pummelers mask
[522] = { trade = {15226, 823, 844, { 4064, 5}}, reward = 27664}, -- anchorites crown
[523] = { trade = {15227, 2340, 844, { 4064, 5}}, reward = 27665}, -- theophany cap
[524] = { trade = {15228, 2288, 844, { 4064, 5}}, reward = 27666}, -- spaekonas petasos
[525] = { trade = {15229, 1699, 844, { 4064, 5}}, reward = 27667}, -- atrophy chapeau
[526] = { trade = {15230, 823, 844, { 4064, 5}}, reward = 27668}, -- pillagers bonnet
[527] = { trade = {15231, 752, 844, { 4064, 5}}, reward = 27669}, -- reverence coronet
[528] = { trade = {15232, 664, 844, { 4064, 5}}, reward = 27670}, -- ignominy burgeonet
[529] = { trade = {15233, 855, 844, { 4064, 5}}, reward = 27671}, -- totemic helm
[530] = { trade = {15234, 2340, 844, { 4064, 5}}, reward = 27672}, -- brioso roundlet
[531] = { trade = {15235, 2288, 844, { 4064, 5}}, reward = 27673}, -- orion beret
[532] = { trade = {15236, 657, 844, { 4064, 5}}, reward = 27674}, -- wakido kabuto
[533] = { trade = {15237, 657, 844, { 4064, 5}}, reward = 27675}, -- hachiya hatsuburi
[534] = { trade = {15238, 752, 844, { 4064, 5}}, reward = 27676}, -- vishap armet
[535] = { trade = {15239, 1699, 844, { 4064, 5}}, reward = 27677}, -- convokers horn
[536] = { trade = {11464, 2340, 844, { 4064, 5}}, reward = 27678}, -- assimilators keffiyeh
[537] = { trade = {11467, 2288, 844, { 4064, 5}}, reward = 27679}, -- laksamanas tricorne
[538] = { trade = {11470, 2288, 844, { 4064, 5}}, reward = 27680}, -- foire taj
[539] = { trade = {11475, 823, 844, { 4064, 5}}, reward = 27681}, -- maxixi tiara
[540] = { trade = {11477, 1699, 844, { 4064, 5}}, reward = 27683}, -- academics mortarboard
[541] = { trade = {11184, 2929, 837, {4065, 10}}, reward = 26898},  -- boii lorica
[542] = { trade = {11185, 2962, 837, {4065, 10}}, reward = 26900},  -- bhikku cyclas
[543] = { trade = {11186, 3287, 837, {4065, 10}}, reward = 26902},  -- ebers bliaud
[544] = { trade = {11187, 2927, 837, {4065, 10}}, reward = 26904},  -- wicce coat
[545] = { trade = {11188, 2965, 837, {4065, 10}}, reward = 26906},  -- lethargy sayon
[546] = { trade = {11189, 3291, 837, {4065, 10}}, reward = 26908},  -- skulkers vest
[547] = { trade = {11190, 2932, 837, {4065, 10}}, reward = 26910},  -- chevaliers cuirass
[548] = { trade = {11191, 2929, 837, {4065, 10}}, reward = 26912},  -- heathens cuirass
[549] = { trade = {11192, 2930, 837, {4065, 10}}, reward = 26914},  -- nukumi gausape
[550] = { trade = {11193, 3288, 837, {4065, 10}}, reward = 26916},  -- fili hongreline
[551] = { trade = {11194, 2963, 837, {4065, 10}}, reward = 26918},  -- amini caban
[552] = { trade = {11195, 3289, 837, {4065, 10}}, reward = 26920},  -- kasuga domaru
[553] = { trade = {11196, 2966, 837, {4065, 10}}, reward = 26922},  -- hattori ningi
[554] = { trade = {11197, 3292, 837, {4065, 10}}, reward = 26924},  -- peltasts plackart
[555] = { trade = {11198, 2930, 837, {4065, 10}}, reward = 26926},  -- beckoners doublet
[556] = { trade = {11199, 3290, 837, {4065, 10}}, reward = 26928},  -- hashishin mintan
[557] = { trade = {11200, 2964, 837, {4065, 10}}, reward = 26930},  -- chasseurs frac
[558] = { trade = {11201, 2930, 837, {4065, 10}}, reward = 26932},  -- karagoz farsetto
[559] = { trade = {11202, 2928, 837, {4065, 10}}, reward = 26934},  -- maculele casaque
[560] = { trade = {11203, 2967, 837, {4065, 10}}, reward = 26936},  -- arbatel gown
[561] = { trade = {11283, 2967, 837, {4065, 10}}, reward = 26938},  -- azimuth coat
[562] = { trade = {11284, 2930, 837, {4065, 10}}, reward = 26940},  -- erilaz surcoat
[563] = { trade = {11244, 2929, 1311, {4068, 10}}, reward = 27411},  -- boii calligae
[564] = { trade = {11245, 2962, 1311, {4068, 10}}, reward = 27413},  -- bhikku gaiters
[565] = { trade = {11246, 3287, 1311, {4068, 10}}, reward = 27415},  -- ebers duckbills
[566] = { trade = {11247, 2927, 1311, {4068, 10}}, reward = 27417},  -- wicce sabots
[567] = { trade = {11248, 2965, 1311, {4068, 10}}, reward = 27419},  -- lethargy houseaux
[568] = { trade = {11249, 3291, 1311, {4068, 10}}, reward = 27421},  -- skulkers poulaines
[569] = { trade = {11250, 2932, 1311, {4068, 10}}, reward = 27423},  -- chevaliers sabatons
[570] = { trade = {11251, 2929, 1311, {4068, 10}}, reward = 27425},  -- heathens sollerets
[571] = { trade = {11252, 2930, 1311, {4068, 10}}, reward = 27427},  -- nukumi ocreae
[572] = { trade = {11253, 3288, 1311, {4068, 10}}, reward = 27429},  -- fili cothurnes
[573] = { trade = {11254, 2963, 1311, {4068, 10}}, reward = 27431},  -- amini bottillons
[574] = { trade = {11255, 3289, 1311, {4068, 10}}, reward = 27433},  -- kasuga sune-ate
[575] = { trade = {11256, 2966, 1311, {4068, 10}}, reward = 27435},  -- hattori kyahan
[576] = { trade = {11257, 3292, 1311, {4068, 10}}, reward = 27437},  -- peltasts schynbalds
[577] = { trade = {11258, 2930, 1311, {4068, 10}}, reward = 27439},  -- beckoners pigaches
[578] = { trade = {11259, 3290, 1311, {4068, 10}}, reward = 27441},  -- hashishin basmak
[579] = { trade = {11260, 2964, 1311, {4068, 10}}, reward = 27443},  -- chasseurs bottes
[580] = { trade = {11261, 2930, 1311, {4068, 10}}, reward = 27445},  -- karagoz scarpe
[581] = { trade = {11262, 2928, 1311, {4068, 10}}, reward = 27447},  -- maculele toe shose
[582] = { trade = {11263, 2967, 1311, {4068, 10}}, reward = 27449},  -- arbatel loafers
[583] = { trade = {11377, 2967, 1311, {4068, 10}}, reward = 27451},  -- azimuth gaiters
[584] = { trade = {11378, 2930, 1311, {4068, 10}}, reward = 27453},  -- erilaz greaves
[585] = { trade = {11204, 2929, 1110, {4066, 10}}, reward = 27052},  -- boii mufflers
[586] = { trade = {11205, 2962, 1110, {4066, 10}}, reward = 27054},  -- bhikku gloves
[587] = { trade = {11206, 3287, 1110, {4066, 10}}, reward = 27056},  -- ebers mitts
[588] = { trade = {11207, 2927, 1110, {4066, 10}}, reward = 27058},  -- wicce gloves
[589] = { trade = {11208, 2965, 1110, {4066, 10}}, reward = 27060},  -- lethargy gantherots
[590] = { trade = {11209, 3291, 1110, {4066, 10}}, reward = 27062},  -- skulkers armlets
[591] = { trade = {11210, 2932, 1110, {4066, 10}}, reward = 27064},  -- chevaliers gauntlets
[592] = { trade = {11211, 2929, 1110, {4066, 10}}, reward = 27066},  -- heathens gauntlets
[593] = { trade = {11212, 2930, 1110, {4066, 10}}, reward = 27068},  -- nukumi manoplas
[594] = { trade = {11213, 3288, 1110, {4066, 10}}, reward = 27070},  -- fili manchettes
[595] = { trade = {11214, 2963, 1110, {4066, 10}}, reward = 27072},  -- amini glovelettes
[596] = { trade = {11215, 3289, 1110, {4066, 10}}, reward = 27074},  -- kasuga kote
[597] = { trade = {11216, 2966, 1110, {4066, 10}}, reward = 27076},  -- hattori tekko
[598] = { trade = {11217, 3292, 1110, {4066, 10}}, reward = 27078},  -- peltasts vambraces
[599] = { trade = {11218, 2930, 1110, {4066, 10}}, reward = 27080},  -- beckoners bracers
[600] = { trade = {11219, 3290, 1110, {4066, 10}}, reward = 27082},  -- hashishin bazubands
[601] = { trade = {11220, 2964, 1110, {4066, 10}}, reward = 27084},  -- chasseurs gants
[602] = { trade = {11221, 2930, 1110, {4066, 10}}, reward = 27086},  -- karagoz guanti
[603] = { trade = {11222, 2928, 1110, {4066, 10}}, reward = 27088},  -- maculele bangles
[604] = { trade = {11223, 2967, 1110, {4066, 10}}, reward = 27090},  -- arbatel bracers
[605] = { trade = {15022, 2967, 1110, {4066, 10}}, reward = 27092},  -- azimuth gloves
[606] = { trade = {15023, 2930, 1110, {4066, 10}}, reward = 27094},  -- erilaz gauntlets
[607] = { trade = {11164, 2929, 844, {4064, 10}}, reward = 26740},  -- boii mask
[608] = { trade = {11165, 2962, 844, {4064, 10}}, reward = 26742},  -- bhikku crown
[609] = { trade = {11166, 3287, 844, {4064, 10}}, reward = 26744},  -- ebers cap
[610] = { trade = {11167, 2927, 844, {4064, 10}}, reward = 26746},  -- wicce petasos
[611] = { trade = {11168, 2965, 844, {4064, 10}}, reward = 26748},  -- lethargy chappel
[612] = { trade = {11169, 3291, 844, {4064, 10}}, reward = 26750},  -- skulkers bonnet
[613] = { trade = {11170, 2932, 844, {4064, 10}}, reward = 26752},  -- chevaliers armet
[614] = { trade = {11171, 2929, 844, {4064, 10}}, reward = 26754},  -- heathens burgeonet
[615] = { trade = {11172, 2930, 844, {4064, 10}}, reward = 26756},  -- nukumi cabasset
[616] = { trade = {11173, 3288, 844, {4064, 10}}, reward = 26758},  -- fili calot
[617] = { trade = {11174, 2963, 844, {4064, 10}}, reward = 26760},  -- amini gapette
[618] = { trade = {11175, 3289, 844, {4064, 10}}, reward = 26762},  -- kasuga kabuto
[619] = { trade = {11176, 2966, 844, {4064, 10}}, reward = 26764},  -- hattori zukin
[620] = { trade = {11177, 3292, 844, {4064, 10}}, reward = 26766},  -- peltasts mezail
[621] = { trade = {11178, 2930, 844, {4064, 10}}, reward = 26768},  -- beckoners horn
[622] = { trade = {11179, 3290, 844, {4064, 10}}, reward = 26770},  -- hashishin kavuk
[623] = { trade = {11180, 2964, 844, {4064, 10}}, reward = 26772},  -- chasseurs tricorne
[624] = { trade = {11181, 2930, 844, {4064, 10}}, reward = 26774},  -- karagoz capello
[625] = { trade = {11182, 2928, 844, {4064, 10}}, reward = 26776},  -- maculele tiara
[626] = { trade = {11183, 2967, 844, {4064, 10}}, reward = 26778},  -- arbatel bonnet
[627] = { trade = {16156, 2967, 844, {4064, 10}}, reward = 26780},  -- azimuth hood
[628] = { trade = {16157, 2930, 844, {4064, 10}}, reward = 26782},  -- erilaz galea
[629] = { trade = {11224, 2929, 836, {4067, 10}}, reward = 27237},  -- boii cuisses
[630] = { trade = {11225, 2962, 836, {4067, 10}}, reward = 27239},  -- bhikku hose
[631] = { trade = {11226, 3287, 836, {4067, 10}}, reward = 27241},  -- ebers pantaloons
[632] = { trade = {11227, 2927, 836, {4067, 10}}, reward = 27243},  -- wicce chausses
[633] = { trade = {11228, 2965, 836, {4067, 10}}, reward = 27245},  -- lethargy fuseau
[634] = { trade = {11229, 3291, 836, {4067, 10}}, reward = 27247},  -- skulkers culottes
[635] = { trade = {11230, 2932, 836, {4067, 10}}, reward = 27249},  -- chevaliers cuisses
[636] = { trade = {11231, 2929, 836, {4067, 10}}, reward = 27251},  -- heathens flanchard
[637] = { trade = {11232, 2930, 836, {4067, 10}}, reward = 27253},  -- nukumi quijotes
[638] = { trade = {11233, 3288, 836, {4067, 10}}, reward = 27255},  -- fili rhingrave
[639] = { trade = {11234, 2963, 836, {4067, 10}}, reward = 27257},  -- amini brague
[640] = { trade = {11235, 3289, 836, {4067, 10}}, reward = 27259},  -- kasuga haidate
[641] = { trade = {11236, 2966, 836, {4067, 10}}, reward = 27261},  -- hattori hakama
[642] = { trade = {11237, 3292, 836, {4067, 10}}, reward = 27263},  -- peltasts cuissots
[643] = { trade = {11238, 2930, 836, {4067, 10}}, reward = 27265},  -- beckoners spats
[644] = { trade = {11239, 3290, 836, {4067, 10}}, reward = 27267},  -- hashishin tayt
[645] = { trade = {11240, 2964, 836, {4067, 10}}, reward = 27269},  -- chasseurs culottes
[646] = { trade = {11241, 2930, 836, {4067, 10}}, reward = 27271},  -- karagoz pantaloni
[647] = { trade = {11242, 2928, 836, {4067, 10}}, reward = 27273},  -- maculele tights
[648] = { trade = {11243, 2967, 836, {4067, 10}}, reward = 27275},  -- arbatel pants
[649] = { trade = {16342, 2967, 836, {4067, 10}}, reward = 27277},  -- azimuth tights
[650] = { trade = {16343, 2930, 836, {4067, 10}}, reward = 27279},  -- erilaz leg guards
[651] = { trade = {11124, 2929, 836, {4067, 5}}, reward = 27237},  -- boii cuisses
[652] = { trade = {11125, 2962, 836, {4067, 5}}, reward = 27239},  -- bhikku hose
[653] = { trade = {11126, 3287, 836, {4067, 5}}, reward = 27241},  -- ebers pantaloons
[654] = { trade = {11127, 2927, 836, {4067, 5}}, reward = 27243},  -- wicce chausses
[655] = { trade = {11128, 2965, 836, {4067, 5}}, reward = 27245},  -- lethargy fuseau
[656] = { trade = {11129, 3291, 836, {4067, 5}}, reward = 27247},  -- skulkers culottes
[657] = { trade = {11130, 2932, 836, {4067, 5}}, reward = 27249},  -- chevaliers cuisses
[658] = { trade = {11131, 2929, 836, {4067, 5}}, reward = 27251},  -- heathens flanchard
[659] = { trade = {11132, 2930, 836, {4067, 5}}, reward = 27253},  -- nukumi quijotes
[660] = { trade = {11133, 3288, 836, {4067, 5}}, reward = 27255},  -- fili rhingrave
[661] = { trade = {11134, 2963, 836, {4067, 5}}, reward = 27257},  -- amini brague
[662] = { trade = {11135, 3289, 836, {4067, 5}}, reward = 27259},  -- kasuga haidate
[663] = { trade = {11136, 2966, 836, {4067, 5}}, reward = 27261},  -- hattori hakama
[664] = { trade = {11137, 3292, 836, {4067, 5}}, reward = 27263},  -- peltasts cuissots
[665] = { trade = {11138, 2930, 836, {4067, 5}}, reward = 27265},  -- beckoners spats
[666] = { trade = {11139, 3290, 836, {4067, 5}}, reward = 27267},  -- hashishin tayt
[667] = { trade = {11140, 2964, 836, {4067, 5}}, reward = 27269},  -- chasseurs culottes
[668] = { trade = {11141, 2930, 836, {4067, 5}}, reward = 27271},  -- karagoz pantaloni
[669] = { trade = {11142, 2928, 836, {4067, 5}}, reward = 27273},  -- maculele tights
[670] = { trade = {11143, 2967, 836, {4067, 5}}, reward = 27275},  -- arbatel pants
[671] = { trade = {11084, 2929, 837, {4065, 5}}, reward = 26898},  -- boii lorica
[672] = { trade = {11085, 2962, 837, {4065, 5}}, reward = 26900},  -- bhikku cyclas
[673] = { trade = {11086, 3287, 837, {4065, 5}}, reward = 26902},  -- ebers bliaud
[674] = { trade = {11087, 2927, 837, {4065, 5}}, reward = 26904},  -- wicce coat
[675] = { trade = {11088, 2965, 837, {4065, 5}}, reward = 26906},  -- lethargy sayon
[676] = { trade = {11089, 3291, 837, {4065, 5}}, reward = 26908},  -- skulkers vest
[677] = { trade = {11090, 2932, 837, {4065, 5}}, reward = 26910},  -- chevaliers cuirass
[678] = { trade = {11091, 2929, 837, {4065, 5}}, reward = 26912},  -- heathens cuirass
[679] = { trade = {11092, 2930, 837, {4065, 5}}, reward = 26914},  -- nukumi gausape
[680] = { trade = {11093, 3288, 837, {4065, 5}}, reward = 26916},  -- fili hongreline
[681] = { trade = {11094, 2963, 837, {4065, 5}}, reward = 26918},  -- amini caban
[682] = { trade = {11095, 3289, 837, {4065, 5}}, reward = 26920},  -- kasuga domaru
[683] = { trade = {11096, 2966, 837, {4065, 5}}, reward = 26922},  -- hattori ningi
[684] = { trade = {11097, 3292, 837, {4065, 5}}, reward = 26924},  -- peltasts plackart
[685] = { trade = {11098, 2930, 837, {4065, 5}}, reward = 26926},  -- beckoners doublet
[686] = { trade = {11099, 3290, 837, {4065, 5}}, reward = 26928},  -- hashishin mintan
[687] = { trade = {11100, 2964, 837, {4065, 5}}, reward = 26930},  -- chasseurs frac
[688] = { trade = {11101, 2930, 837, {4065, 5}}, reward = 26932},  -- karagoz farsetto
[689] = { trade = {11102, 2928, 837, {4065, 5}}, reward = 26934},  -- maculele casaque
[690] = { trade = {11103, 2967, 837, {4065, 5}}, reward = 26936},  -- arbatel gown
[691] = { trade = {11144, 2929, 1311, {4068, 5}}, reward = 27411},  -- boii calligae
[692] = { trade = {11145, 2962, 1311, {4068, 5}}, reward = 27413},  -- bhikku gaiters
[693] = { trade = {11146, 3287, 1311, {4068, 5}}, reward = 27415},  -- ebers duckbills
[694] = { trade = {11147, 2927, 1311, {4068, 5}}, reward = 27417},  -- wicce sabots
[695] = { trade = {11148, 2965, 1311, {4068, 5}}, reward = 27419},  -- lethargy houseaux
[696] = { trade = {11149, 3291, 1311, {4068, 5}}, reward = 27421},  -- skulkers poulaines
[697] = { trade = {11150, 2932, 1311, {4068, 5}}, reward = 27423},  -- chevaliers sabatons
[698] = { trade = {11151, 2929, 1311, {4068, 5}}, reward = 27425},  -- heathens sollerets
[699] = { trade = {11152, 2930, 1311, {4068, 5}}, reward = 27427},  -- nukumi ocreae
[700] = { trade = {11153, 3288, 1311, {4068, 5}}, reward = 27429},  -- fili cothurnes
[701] = { trade = {11154, 2963, 1311, {4068, 5}}, reward = 27431},  -- amini bottillons
[702] = { trade = {11155, 3289, 1311, {4068, 5}}, reward = 27433},  -- kasuga sune-ate
[703] = { trade = {11156, 2966, 1311, {4068, 5}}, reward = 27435},  -- hattori kyahan
[704] = { trade = {11157, 3292, 1311, {4068, 5}}, reward = 27437},  -- peltasts schynbalds
[705] = { trade = {11158, 2930, 1311, {4068, 5}}, reward = 27439},  -- beckoners pigaches
[706] = { trade = {11159, 3290, 1311, {4068, 5}}, reward = 27441},  -- hashishin basmak
[707] = { trade = {11160, 2964, 1311, {4068, 5}}, reward = 27443},  -- chasseurs bottes
[708] = { trade = {11161, 2930, 1311, {4068, 5}}, reward = 27445},  -- karagoz scarpe
[709] = { trade = {11162, 2928, 1311, {4068, 5}}, reward = 27447},  -- maculele toe shose
[710] = { trade = {11163, 2967, 1311, {4068, 5}}, reward = 27449},  -- arbatel loafers
[711] = { trade = {11104, 2929, 1110, {4066, 5}}, reward = 27052},  -- boii mufflers
[712] = { trade = {11105, 2962, 1110, {4066, 5}}, reward = 27054},  -- bhikku gloves
[713] = { trade = {11106, 3287, 1110, {4066, 5}}, reward = 27056},  -- ebers mitts
[714] = { trade = {11107, 2927, 1110, {4066, 5}}, reward = 27058},  -- wicce gloves
[715] = { trade = {11108, 2965, 1110, {4066, 5}}, reward = 27060},  -- lethargy gantherots
[716] = { trade = {11109, 3291, 1110, {4066, 5}}, reward = 27062},  -- skulkers armlets
[717] = { trade = {11110, 2932, 1110, {4066, 5}}, reward = 27064},  -- chevaliers gauntlets
[718] = { trade = {11111, 2929, 1110, {4066, 5}}, reward = 27066},  -- heathens gauntlets
[719] = { trade = {11112, 2930, 1110, {4066, 5}}, reward = 27068},  -- nukumi manoplas
[720] = { trade = {11113, 3288, 1110, {4066, 5}}, reward = 27070},  -- fili manchettes
[721] = { trade = {11114, 2963, 1110, {4066, 5}}, reward = 27072},  -- amini glovelettes
[722] = { trade = {11115, 3289, 1110, {4066, 5}}, reward = 27074},  -- kasuga kote
[723] = { trade = {11116, 2966, 1110, {4066, 5}}, reward = 27076},  -- hattori tekko
[724] = { trade = {11117, 3292, 1110, {4066, 5}}, reward = 27078},  -- peltasts vambraces
[725] = { trade = {11118, 2930, 1110, {4066, 5}}, reward = 27080},  -- beckoners bracers
[726] = { trade = {11119, 3290, 1110, {4066, 5}}, reward = 27082},  -- hashishin bazubands
[727] = { trade = {11120, 2964, 1110, {4066, 5}}, reward = 27084},  -- chasseurs gants
[728] = { trade = {11121, 2930, 1110, {4066, 5}}, reward = 27086},  -- karagoz guanti
[729] = { trade = {11122, 2928, 1110, {4066, 5}}, reward = 27088},  -- maculele bangles
[730] = { trade = {11123, 2967, 1110, {4066, 5}}, reward = 27090},  -- arbatel bracers
[731] = { trade = {11064, 2929, 844, {4064, 5}}, reward = 26740},  -- boii mask
[732] = { trade = {11065, 2962, 844, {4064, 5}}, reward = 26742},  -- bhikku crown
[733] = { trade = {11066, 3287, 844, {4064, 5}}, reward = 26744},  -- ebers cap
[734] = { trade = {11067, 2927, 844, {4064, 5}}, reward = 26746},  -- wicce petasos
[735] = { trade = {11068, 2965, 844, {4064, 5}}, reward = 26748},  -- lethargy chappel
[736] = { trade = {11069, 3291, 844, {4064, 5}}, reward = 26750},  -- skulkers bonnet
[737] = { trade = {11070, 2932, 844, {4064, 5}}, reward = 26752},  -- chevaliers armet
[738] = { trade = {11071, 2929, 844, {4064, 5}}, reward = 26754},  -- heathens burgeonet
[739] = { trade = {11072, 2930, 844, {4064, 5}}, reward = 26756},  -- nukumi cabasset
[740] = { trade = {11073, 3288, 844, {4064, 5}}, reward = 26758},  -- fili calot
[741] = { trade = {11074, 2963, 844, {4064, 5}}, reward = 26760},  -- amini gapette
[742] = { trade = {11075, 3289, 844, {4064, 5}}, reward = 26762},  -- kasuga kabuto
[743] = { trade = {11076, 2966, 844, {4064, 5}}, reward = 26764},  -- hattori zukin
[744] = { trade = {11077, 3292, 844, {4064, 5}}, reward = 26766},  -- peltasts mezail
[745] = { trade = {11078, 2930, 844, {4064, 5}}, reward = 26768},  -- beckoners horn
[746] = { trade = {11079, 3290, 844, {4064, 5}}, reward = 26770},  -- hashishin kavuk
[747] = { trade = {11080, 2964, 844, {4064, 5}}, reward = 26772},  -- chasseurs tricorne
[748] = { trade = {11081, 2930, 844, {4064, 5}}, reward = 26774},  -- karagoz capello
[749] = { trade = {11082, 2928, 844, {4064, 5}}, reward = 26776},  -- maculele tiara
[750] = { trade = {11083, 2967, 844, {4064, 5}}, reward = 26778},  -- arbatel bonnet
[751] = { trade = {15087, 1469, 837, {1456, 2},  {4065, 10}}, reward =  26800}, -- agoge lorica
[752] = { trade = {15088, 1516, 837, {1456, 2},  {4065, 10}}, reward =  26802}, -- hesychasts cyclas
[753] = { trade = {15089, 1470, 837, {1453, 2},  {4065, 10}}, reward =  26804}, -- piety briault
[754] = { trade = {15090, 1470, 837, {1450, 2},  {4065, 10}}, reward =  26806}, -- archmages coat
[755] = { trade = {15091, 1516, 837, {1453, 2},  {4065, 10}}, reward =  26808}, -- vitiation tabard
[756] = { trade = {15092, 1516, 837, {1450, 2},  {4065, 10}}, reward =  26810}, -- plunderers vest
[757] = { trade = {15093, 1469, 837, {1453, 2},  {4065, 10}}, reward =  26812}, -- caballarius surcoat
[758] = { trade = {15094, 1469, 837, {1456, 2},  {4065, 10}}, reward =  26814}, -- fallens cuirass
[759] = { trade = {15095, 1458, 837, {1450, 2},  {4065, 10}}, reward =  26816}, -- ankusa jackcoat
[760] = { trade = {15096, 1516, 837, {1456, 2},  {4065, 10}}, reward =  26818}, -- bihu justaucorps
[761] = { trade = {15097, 1516, 837, {1450, 2},  {4065, 10}}, reward =  26820}, -- arcadian jerkin
[762] = { trade = {15098, 1466, 837, {1456, 2},  {4065, 10}}, reward =  26822}, -- sakonji domaru
[763] = { trade = {15099, 1466, 837, {1456, 2},  {4065, 10}}, reward =  26824}, -- mochizuki chainmail
[764] = { trade = {15100, 1516, 837, {1453, 2},  {4065, 10}}, reward =  26826}, -- pteroslaver mail
[765] = { trade = {15101, 1464, 837, {1450, 2},  {4065, 10}}, reward =  26828}, -- glyphic doublet
[766] = { trade = {11292, 1516, 837, {1453, 2},  {4065, 10}}, reward =  26830}, -- luhlaza jubbah
[767] = { trade = {11295, 1470, 837, {1456, 2},  {4065, 10}}, reward =  26832}, -- lanun frac
[768] = { trade = {11298, 1464, 837, {1450, 2},  {4065, 10}}, reward =  26834}, -- pitre tobe
[769] = { trade = {11305, 1458, 837, {1453, 2},  {4065, 10}}, reward =  26836}, -- horos casaque
[770] = { trade = {11307, 1464, 837, {1456, 2},  {4065, 10}}, reward =  26838}, -- pedagogy gown
[771] = { trade = {27853, 1516, 837, {1456, 2},  {4065, 10}}, reward =  26840}, -- bagua tunic
[772] = { trade = {27852, 1469, 837, {1453, 2},  {4065, 10}}, reward =  26842}, -- futhark coat
[773] = { trade = {15132, 1469, 1311, {1456, 2},  {4068, 10}}, reward =  27328}, -- agoge calligae
[774] = { trade = {15133, 1516, 1311, {1456, 2},  {4068, 10}}, reward =  27330}, -- hesychasts gaiters
[775] = { trade = {15134, 1470, 1311, {1453, 2},  {4068, 10}}, reward =  27332}, -- piety duckbills
[776] = { trade = {15135, 1470, 1311, {1450, 2},  {4068, 10}}, reward =  27334}, -- archmages sabots
[777] = { trade = {15136, 1516, 1311, {1453, 2},  {4068, 10}}, reward =  27336}, -- vitiation boots
[778] = { trade = {15137, 1516, 1311, {1450, 2},  {4068, 10}}, reward =  27338}, -- plunderers poulaines
[779] = { trade = {15138, 1469, 1311, {1453, 2},  {4068, 10}}, reward =  27340}, -- caballarius leggings
[780] = { trade = {15139, 1469, 1311, {1456, 2},  {4068, 10}}, reward =  27342}, -- fallens sollerets
[781] = { trade = {15140, 1458, 1311, {1450, 2},  {4068, 10}}, reward =  27344}, -- ankusa gaiters
[782] = { trade = {15141, 1516, 1311, {1456, 2},  {4068, 10}}, reward =  27346}, -- bihu slippers
[783] = { trade = {15142, 1516, 1311, {1450, 2},  {4068, 10}}, reward =  27348}, -- arcadian socks
[784] = { trade = {15143, 1466, 1311, {1456, 2},  {4068, 10}}, reward =  27350}, -- sakonji sune-ate
[785] = { trade = {15144, 1466, 1311, {1456, 2},  {4068, 10}}, reward =  27352}, -- mochizuki kyahan
[786] = { trade = {15145, 1516, 1311, {1453, 2},  {4068, 10}}, reward =  27354}, -- pteroslaver greaves
[787] = { trade = {15146, 1464, 1311, {1450, 2},  {4068, 10}}, reward =  27356}, -- glyphic pigaches
[788] = { trade = {11382, 1516, 1311, {1453, 2},  {4068, 10}}, reward =  27358}, -- luhlaza charuqs
[789] = { trade = {11385, 1470, 1311, {1456, 2},  {4068, 10}}, reward =  27360}, -- lanun bottes
[790] = { trade = {11388, 1464, 1311, {1450, 2},  {4068, 10}}, reward =  27362}, -- pitre babouches
[791] = { trade = {11396, 1458, 1311, {1453, 2},  {4068, 10}}, reward =  27364}, -- horos toe shoes
[792] = { trade = {11398, 1464, 1311, {1456, 2},  {4068, 10}}, reward =  27366}, -- pedagogy loafers
[793] = { trade = {28279, 1516, 1311, {1456, 2},  {4068, 10}}, reward =  27368}, -- bagua sandals
[794] = { trade = {28278, 1469, 1311, {1453, 2},  {4068, 10}}, reward =  27370}, -- futhark boots
[795] = { trade = {15102, 1469, 1110, {1456, 2},  {4066, 10}}, reward =  26976}, -- agoge mufflers
[796] = { trade = {15103, 1516, 1110, {1456, 2},  {4066, 10}}, reward =  26978}, -- hesychasts gloves
[797] = { trade = {15104, 1470, 1110, {1453, 2},  {4066, 10}}, reward =  26980}, -- piety mitts
[798] = { trade = {15105, 1470, 1110, {1450, 2},  {4066, 10}}, reward =  26982}, -- archmages gloves
[799] = { trade = {15106, 1516, 1110, {1453, 2},  {4066, 10}}, reward =  26984}, -- vitiation gloves
[800] = { trade = {15107, 1516, 1110, {1450, 2},  {4066, 10}}, reward =  26986}, -- plunderers armlets
[801] = { trade = {15108, 1469, 1110, {1453, 2},  {4066, 10}}, reward =  26988}, -- caballarius gauntlets
[802] = { trade = {15109, 1469, 1110, {1456, 2},  {4066, 10}}, reward =  26990}, -- fallens finger gauntlets
[803] = { trade = {15110, 1458, 1110, {1450, 2},  {4066, 10}}, reward =  26992}, -- ankusa gloves
[804] = { trade = {15111, 1516, 1110, {1456, 2},  {4066, 10}}, reward =  26994}, -- bihu cuffs
[805] = { trade = {15112, 1516, 1110, {1450, 2},  {4066, 10}}, reward =  26996}, -- arcadian bracers
[806] = { trade = {15113, 1466, 1110, {1456, 2},  {4066, 10}}, reward =  26998}, -- sakonji kote
[807] = { trade = {15114, 1466, 1110, {1456, 2},  {4066, 10}}, reward =  27000}, -- mochizuki tekko
[808] = { trade = {15115, 1516, 1110, {1453, 2},  {4066, 10}}, reward =  27002}, -- pteroslaver finger gauntlets
[809] = { trade = {15116, 1464, 1110, {1450, 2},  {4066, 10}}, reward =  27004}, -- glyphic bracers
[810] = { trade = {15025, 1516, 1110, {1453, 2},  {4066, 10}}, reward =  27006}, -- luhlaza bazubands
[811] = { trade = {15028, 1470, 1110, {1456, 2},  {4066, 10}}, reward =  27008}, -- lanun gants
[812] = { trade = {15031, 1464, 1110, {1450, 2},  {4066, 10}}, reward =  27010}, -- pitre dastanas
[813] = { trade = {15038, 1458, 1110, {1453, 2},  {4066, 10}}, reward =  27012}, -- horos bangles
[814] = { trade = {15040, 1464, 1110, {1456, 2},  {4066, 10}}, reward =  27014}, -- pedagogy bracers
[815] = { trade = {27999, 1516, 1110, {1456, 2},  {4066, 10}}, reward =  27016}, -- bagua mitaines
[816] = { trade = {27998, 1469, 1110, {1453, 2},  {4066, 10}}, reward =  27018}, -- futhark mitons
[817] = { trade = {15072, 1469, 844, {1456, 2},  {4064, 10}}, reward =  26624}, -- agoge mask
[818] = { trade = {15073, 1516, 844, {1456, 2},  {4064, 10}}, reward =  26626}, -- hesychasts crown
[819] = { trade = {15074, 1470, 844, {1453, 2},  {4064, 10}}, reward =  26628}, -- piety cap
[820] = { trade = {15075, 1470, 844, {1450, 2},  {4064, 10}}, reward =  26630}, -- archmages petasos
[821] = { trade = {15076, 1516, 844, {1453, 2},  {4064, 10}}, reward =  26632}, -- vitiation chapeau
[822] = { trade = {15077, 1516, 844, {1450, 2},  {4064, 10}}, reward =  26634}, -- plunderers bonnet
[823] = { trade = {15078, 1469, 844, {1453, 2},  {4064, 10}}, reward =  26636}, -- caballarius coronet
[824] = { trade = {15079, 1469, 844, {1456, 2},  {4064, 10}}, reward =  26638}, -- fallens burgeonet
[825] = { trade = {15080, 1458, 844, {1450, 2},  {4064, 10}}, reward =  26640}, -- ankusa helm
[826] = { trade = {15081, 1516, 844, {1456, 2},  {4064, 10}}, reward =  26642}, -- bihu roundlet
[827] = { trade = {15082, 1516, 844, {1450, 2},  {4064, 10}}, reward =  26644}, -- arcadian beret
[828] = { trade = {15083, 1466, 844, {1456, 2},  {4064, 10}}, reward =  26646}, -- sakonji kabuto
[829] = { trade = {15084, 1466, 844, {1456, 2},  {4064, 10}}, reward =  26648}, -- mochizuki hatsuburi
[830] = { trade = {15085, 1516, 844, {1453, 2},  {4064, 10}}, reward =  26650}, -- pteroslaver armet
[831] = { trade = {15086, 1464, 844, {1450, 2},  {4064, 10}}, reward =  26652}, -- glyphic horn
[832] = { trade = {11465, 1516, 844, {1453, 2},  {4064, 10}}, reward =  26654}, -- luhlaza keffiyeh
[833] = { trade = {11468, 1470, 844, {1456, 2},  {4064, 10}}, reward =  26656}, -- lanun tricorne
[834] = { trade = {11471, 1464, 844, {1450, 2},  {4064, 10}}, reward =  26658}, -- pitre taj
[835] = { trade = {11478, 1458, 844, {1453, 2},  {4064, 10}}, reward =  26660}, -- horos tiara
[836] = { trade = {11480, 1464, 844, {1456, 2},  {4064, 10}}, reward =  26662}, -- pedagogy mortarboard
[837] = { trade = {26713, 1516, 844, {1456, 2},  {4064, 10}}, reward =  26664}, -- bagua galero
[838] = { trade = {26712, 1469, 844, {1453, 2},  {4064, 10}}, reward =  26666}, -- futhark bandeau
[839] = { trade = {15117, 1469, 836, {1456, 2},  {4067, 10}}, reward =  27152}, -- agoge cuisses
[840] = { trade = {15118, 1516, 836, {1456, 2},  {4067, 10}}, reward =  27154}, -- hesychasts hose
[841] = { trade = {15119, 1470, 836, {1453, 2},  {4067, 10}}, reward =  27156}, -- piety pantaloons
[842] = { trade = {15120, 1470, 836, {1450, 2},  {4067, 10}}, reward =  27158}, -- archmages tonban
[843] = { trade = {15121, 1516, 836, {1453, 2},  {4067, 10}}, reward =  27160}, -- vitiation tights
[844] = { trade = {15122, 1516, 836, {1450, 2},  {4067, 10}}, reward =  27162}, -- plunderers culottes
[845] = { trade = {15123, 1469, 836, {1453, 2},  {4067, 10}}, reward =  27164}, -- caballarius breeches
[846] = { trade = {15124, 1469, 836, {1456, 2},  {4067, 10}}, reward =  27166}, -- fallens flanchard
[847] = { trade = {15125, 1458, 836, {1450, 2},  {4067, 10}}, reward =  27168}, -- ankusa trousers
[848] = { trade = {15126, 1516, 836, {1456, 2},  {4067, 10}}, reward =  27170}, -- bihu cannions
[849] = { trade = {15127, 1516, 836, {1450, 2},  {4067, 10}}, reward =  27172}, -- arcadian braccae
[850] = { trade = {15128, 1466, 836, {1456, 2},  {4067, 10}}, reward =  27174}, -- sakonji haidate
[851] = { trade = {15129, 1466, 836, {1456, 2},  {4067, 10}}, reward =  27176}, -- mochizuki hakama
[852] = { trade = {15130, 1516, 836, {1453, 2},  {4067, 10}}, reward =  27178}, -- pteroslaver brais
[853] = { trade = {15131, 1464, 836, {1450, 2},  {4067, 10}}, reward =  27180}, -- glyphic spats
[854] = { trade = {16346, 1516, 836, {1453, 2},  {4067, 10}}, reward =  27182}, -- luhlaza shalwar
[856] = { trade = {16352, 1464, 836, {1450, 2},  {4067, 10}}, reward =  27186}, -- pitre churidars
[857] = { trade = {16360, 1458, 836, {1453, 2},  {4067, 10}}, reward =  27188}, -- horos tights
[858] = { trade = {16362, 1464, 836, {1456, 2},  {4067, 10}}, reward =  27190}, -- pedagogy pants
[859] = { trade = {28140, 1516, 836, {1456, 2},  {4067, 10}}, reward =  27192}, -- bagua pants
[860] = { trade = {28139, 1469, 836, {1453, 2},  {4067, 10}}, reward =  27194}, -- futhark trousers
[861] = { trade = {14500, 1469, 837, 1456,  {4065, 10}}, reward =  26800}, -- agoge lorica
[862] = { trade = {14501, 1516, 837, 1456,  {4065, 10}}, reward =  26802}, -- hesychasts cyclas
[863] = { trade = {14502, 1470, 837, 1453,  {4065, 10}}, reward =  26804}, -- piety briault
[864] = { trade = {14503, 1470, 837, 1450,  {4065, 10}}, reward =  26806}, -- archmages coat
[865] = { trade = {14504, 1516, 837, 1453,  {4065, 10}}, reward =  26808}, -- vitiation tabard
[866] = { trade = {14505, 1516, 837, 1450,  {4065, 10}}, reward =  26810}, -- plunderers vest
[867] = { trade = {14506, 1469, 837, 1453,  {4065, 10}}, reward =  26812}, -- caballarius surcoat
[868] = { trade = {14507, 1469, 837, 1456,  {4065, 10}}, reward =  26814}, -- fallens cuirass
[869] = { trade = {14508, 1458, 837, 1450,  {4065, 10}}, reward =  26816}, -- ankusa jackcoat
[870] = { trade = {14509, 1516, 837, 1456,  {4065, 10}}, reward =  26818}, -- bihu justaucorps
[871] = { trade = {14510, 1516, 837, 1450,  {4065, 10}}, reward =  26820}, -- arcadian jerkin
[872] = { trade = {14511, 1466, 837, 1456,  {4065, 10}}, reward =  26822}, -- sakonji domaru
[873] = { trade = {14512, 1466, 837, 1456,  {4065, 10}}, reward =  26824}, -- mochizuki chainmail
[874] = { trade = {14513, 1516, 837, 1453,  {4065, 10}}, reward =  26826}, -- pteroslaver mail
[875] = { trade = {14514, 1464, 837, 1450,  {4065, 10}}, reward =  26828}, -- glyphic doublet
[876] = { trade = {11293, 1516, 837, 1453,  {4065, 10}}, reward =  26830}, -- luhlaza jubbah
[877] = { trade = {11296, 1470, 837, 1456,  {4065, 10}}, reward =  26832}, -- lanun frac
[878] = { trade = {11299, 1464, 837, 1450,  {4065, 10}}, reward =  26834}, -- pitre tobe
[879] = { trade = {11306, 1458, 837, 1453,  {4065, 10}}, reward =  26836}, -- horos casaque
[880] = { trade = {11308, 1464, 837, 1456,  {4065, 10}}, reward =  26838}, -- pedagogy gown
[881] = { trade = {15665, 1469, 1311, 1456,  {4068, 10}}, reward =  27328}, -- agoge calligae
[882] = { trade = {15666, 1516, 1311, 1456,  {4068, 10}}, reward =  27330}, -- hesychasts gaiters
[883] = { trade = {15667, 1470, 1311, 1453,  {4068, 10}}, reward =  27332}, -- piety duckbills
[884] = { trade = {15668, 1470, 1311, 1450,  {4068, 10}}, reward =  27334}, -- archmages sabots
[885] = { trade = {15669, 1516, 1311, 1453,  {4068, 10}}, reward =  27336}, -- vitiation boots
[886] = { trade = {15670, 1516, 1311, 1450,  {4068, 10}}, reward =  27338}, -- plunderers poulaines
[887] = { trade = {15671, 1469, 1311, 1453,  {4068, 10}}, reward =  27340}, -- caballarius leggings
[888] = { trade = {15672, 1469, 1311, 1456,  {4068, 10}}, reward =  27342}, -- fallens sollerets
[889] = { trade = {15673, 1458, 1311, 1450,  {4068, 10}}, reward =  27344}, -- ankusa gaiters
[890] = { trade = {15674, 1516, 1311, 1456,  {4068, 10}}, reward =  27346}, -- bihu slippers
[891] = { trade = {15675, 1516, 1311, 1450,  {4068, 10}}, reward =  27348}, -- arcadian socks
[892] = { trade = {15676, 1466, 1311, 1456,  {4068, 10}}, reward =  27350}, -- sakonji sune-ate
[893] = { trade = {15677, 1466, 1311, 1456,  {4068, 10}}, reward =  27352}, -- mochizuki kyahan
[894] = { trade = {15678, 1516, 1311, 1453,  {4068, 10}}, reward =  27354}, -- pteroslaver greaves
[895] = { trade = {15679, 1464, 1311, 1450,  {4068, 10}}, reward =  27356}, -- glyphic pigaches
[896] = { trade = {11383, 1516, 1311, 1453,  {4068, 10}}, reward =  27358}, -- luhlaza charuqs
[897] = { trade = {11386, 1470, 1311, 1456,  {4068, 10}}, reward =  27360}, -- lanun bottes
[898] = { trade = {11389, 1464, 1311, 1450,  {4068, 10}}, reward =  27362}, -- pitre babouches
[899] = { trade = {11397, 1458, 1311, 1453,  {4068, 10}}, reward =  27364}, -- horos toe shoes
[900] = { trade = {11399, 1464, 1311, 1456,  {4068, 10}}, reward =  27366}, -- pedagogy loafers
[901] = { trade = {14909, 1469, 1110, 1456,  {4066, 10}}, reward =  26976}, -- agoge mufflers
[902] = { trade = {14910, 1516, 1110, 1456,  {4066, 10}}, reward =  26978}, -- hesychasts gloves
[903] = { trade = {14911, 1470, 1110, 1453,  {4066, 10}}, reward =  26980}, -- piety mitts
[904] = { trade = {14912, 1470, 1110, 1450,  {4066, 10}}, reward =  26982}, -- archmages gloves
[905] = { trade = {14913, 1516, 1110, 1453,  {4066, 10}}, reward =  26984}, -- vitiation gloves
[906] = { trade = {14914, 1516, 1110, 1450,  {4066, 10}}, reward =  26986}, -- plunderers armlets
[907] = { trade = {14915, 1469, 1110, 1453,  {4066, 10}}, reward =  26988}, -- caballarius gauntlets
[908] = { trade = {14916, 1469, 1110, 1456,  {4066, 10}}, reward =  26990}, -- fallens finger gauntlets
[909] = { trade = {14917, 1458, 1110, 1450,  {4066, 10}}, reward =  26992}, -- ankusa gloves
[910] = { trade = {14918, 1516, 1110, 1456,  {4066, 10}}, reward =  26994}, -- bihu cuffs
[911] = { trade = {14919, 1516, 1110, 1450,  {4066, 10}}, reward =  26996}, -- arcadian bracers
[912] = { trade = {14920, 1466, 1110, 1456,  {4066, 10}}, reward =  26998}, -- sakonji kote
[913] = { trade = {14921, 1466, 1110, 1456,  {4066, 10}}, reward =  27000}, -- mochizuki tekko
[914] = { trade = {14922, 1516, 1110, 1453,  {4066, 10}}, reward =  27002}, -- pteroslaver finger gauntlets
[915] = { trade = {14923, 1464, 1110, 1450,  {4066, 10}}, reward =  27004}, -- glyphic bracers
[916] = { trade = {15026, 1516, 1110, 1453,  {4066, 10}}, reward =  27006}, -- luhlaza bazubands
[917] = { trade = {15029, 1470, 1110, 1456,  {4066, 10}}, reward =  27008}, -- lanun gants
[918] = { trade = {15032, 1464, 1110, 1450,  {4066, 10}}, reward =  27010}, -- pitre dastanas
[919] = { trade = {15039, 1458, 1110, 1453,  {4066, 10}}, reward =  27012}, -- horos bangles
[920] = { trade = {15041, 1464, 1110, 1456,  {4066, 10}}, reward =  27014}, -- pedagogy bracers
[921] = { trade = {15245, 1469, 844, 1456,  {4064, 10}}, reward =  26624}, -- agoge mask
[922] = { trade = {15246, 1516, 844, 1456,  {4064, 10}}, reward =  26626}, -- hesychasts crown
[923] = { trade = {15247, 1470, 844, 1453,  {4064, 10}}, reward =  26628}, -- piety cap
[924] = { trade = {15248, 1470, 844, 1450,  {4064, 10}}, reward =  26630}, -- archmages petasos
[925] = { trade = {15249, 1516, 844, 1453,  {4064, 10}}, reward =  26632}, -- vitiation chapeau
[926] = { trade = {15250, 1516, 844, 1450,  {4064, 10}}, reward =  26634}, -- plunderers bonnet
[927] = { trade = {15251, 1469, 844, 1453,  {4064, 10}}, reward =  26636}, -- caballarius coronet
[928] = { trade = {15252, 1469, 844, 1456,  {4064, 10}}, reward =  26638}, -- fallens burgeonet
[929] = { trade = {15253, 1458, 844, 1450,  {4064, 10}}, reward =  26640}, -- ankusa helm
[930] = { trade = {15254, 1516, 844, 1456,  {4064, 10}}, reward =  26642}, -- bihu roundlet
[931] = { trade = {15255, 1516, 844, 1450,  {4064, 10}}, reward =  26644}, -- arcadian beret
[932] = { trade = {15256, 1466, 844, 1456,  {4064, 10}}, reward =  26646}, -- sakonji kabuto
[933] = { trade = {15257, 1466, 844, 1456,  {4064, 10}}, reward =  26648}, -- mochizuki hatsuburi
[934] = { trade = {15258, 1516, 844, 1453,  {4064, 10}}, reward =  26650}, -- pteroslaver armet
[935] = { trade = {15259, 1464, 844, 1450,  {4064, 10}}, reward =  26652}, -- glyphic horn
[936] = { trade = {11466, 1516, 844, 1453,  {4064, 10}}, reward =  26654}, -- luhlaza keffiyeh
[937] = { trade = {11469, 1470, 844, 1456,  {4064, 10}}, reward =  26656}, -- lanun tricorne
[938] = { trade = {11472, 1464, 844, 1450,  {4064, 10}}, reward =  26658}, -- pitre taj
[939] = { trade = {11479, 1458, 844, 1453,  {4064, 10}}, reward =  26660}, -- horos tiara
[940] = { trade = {11481, 1464, 844, 1456,  {4064, 10}}, reward =  26662}, -- pedagogy mortarboard
[941] = { trade = {15580, 1469, 836, 1456,  {4067, 10}}, reward =  27152}, -- agoge cuisses
[942] = { trade = {15581, 1516, 836, 1456,  {4067, 10}}, reward =  27154}, -- hesychasts hose
[943] = { trade = {15582, 1470, 836, 1453,  {4067, 10}}, reward =  27156}, -- piety pantaloons
[944] = { trade = {15583, 1470, 836, 1450,  {4067, 10}}, reward =  27158}, -- archmages tonban
[945] = { trade = {15584, 1516, 836, 1453,  {4067, 10}}, reward =  27160}, -- vitiation tights
[946] = { trade = {15585, 1516, 836, 1450,  {4067, 10}}, reward =  27162}, -- plunderers culottes
[947] = { trade = {15586, 1469, 836, 1453,  {4067, 10}}, reward =  27164}, -- caballarius breeches
[948] = { trade = {15587, 1469, 836, 1456,  {4067, 10}}, reward =  27166}, -- fallens flanchard
[949] = { trade = {15588, 1458, 836, 1450,  {4067, 10}}, reward =  27168}, -- ankusa trousers
[950] = { trade = {15589, 1516, 836, 1456,  {4067, 10}}, reward =  27170}, -- bihu cannions
[951] = { trade = {15590, 1516, 836, 1450,  {4067, 10}}, reward =  27172}, -- arcadian braccae
[952] = { trade = {15591, 1466, 836, 1456,  {4067, 10}}, reward =  27174}, -- sakonji haidate
[953] = { trade = {15592, 1466, 836, 1456,  {4067, 10}}, reward =  27176}, -- mochizuki hakama
[954] = { trade = {15593, 1516, 836, 1453,  {4067, 10}}, reward =  27178}, -- pteroslaver brais
[955] = { trade = {15594, 1464, 836, 1450,  {4067, 10}}, reward =  27180}, -- glyphic spats
[956] = { trade = {16347, 1516, 836, 1453,  {4067, 10}}, reward =  27182}, -- luhlaza shalwar
[958] = { trade = {16353, 1464, 836, 1450,  {4067, 10}}, reward =  27186}, -- pitre churidars
[959] = { trade = {16361, 1458, 836, 1453,  {4067, 10}}, reward =  27188}, -- horos tights
[960] = { trade = {16363, 1464, 836, 1456,  {4067, 10}}, reward =  27190}, -- pedagogy pants
[961] = { trade = {10710, 1469, 836,  {4067, 10}}, reward =  27152}, -- agoge cuisses
[962] = { trade = {10711, 1516, 836,  {4067, 10}}, reward =  27154}, -- hesychasts hose
[963] = { trade = {10712, 1470, 836,  {4067, 10}}, reward =  27156}, -- piety pantaloons
[964] = { trade = {10713, 1470, 836,  {4067, 10}}, reward =  27158}, -- archmages tonban
[965] = { trade = {10714, 1516, 836,  {4067, 10}}, reward =  27160}, -- vitiation tights
[966] = { trade = {10715, 1516, 836,  {4067, 10}}, reward =  27162}, -- plunderers culottes
[967] = { trade = {10716, 1469, 836,  {4067, 10}}, reward =  27164}, -- caballarius breeches
[968] = { trade = {10717, 1469, 836,  {4067, 10}}, reward =  27166}, -- fallens flanchard
[969] = { trade = {10718, 1458, 836,  {4067, 10}}, reward =  27168}, -- ankusa trousers
[970] = { trade = {10719, 1516, 836,  {4067, 10}}, reward =  27170}, -- bihu cannions
[971] = { trade = {10720, 1516, 836,  {4067, 10}}, reward =  27172}, -- arcadian braccae
[972] = { trade = {10721, 1466, 836,  {4067, 10}}, reward =  27174}, -- sakonji haidate
[973] = { trade = {10722, 1466, 836,  {4067, 10}}, reward =  27176}, -- mochizuki hakama
[974] = { trade = {10723, 1516, 836,  {4067, 10}}, reward =  27178}, -- pteroslaver brais
[975] = { trade = {10724, 1464, 836,  {4067, 10}}, reward =  27180}, -- glyphic spats
[976] = { trade = {10725, 1516, 836,  {4067, 10}}, reward =  27182}, -- luhlaza shalwar
[978] = { trade = {10727, 1464, 836,  {4067, 10}}, reward =  27186}, -- pitre churidars
[979] = { trade = {10728, 1458, 836,  {4067, 10}}, reward =  27188}, -- horos tights
[980] = { trade = {10729, 1464, 836,  {4067, 10}}, reward =  27190}, -- pedagogy pants
[981] = { trade = {10670, 1469, 837,  {4065, 10}}, reward =  26800}, -- agoge lorica
[982] = { trade = {10671, 1516, 837,  {4065, 10}}, reward =  26802}, -- hesychasts cyclas
[983] = { trade = {10672, 1470, 837,  {4065, 10}}, reward =  26804}, -- piety briault
[984] = { trade = {10673, 1470, 837,  {4065, 10}}, reward =  26806}, -- archmages coat
[985] = { trade = {10674, 1516, 837,  {4065, 10}}, reward =  26808}, -- vitiation tabard
[986] = { trade = {10675, 1516, 837,  {4065, 10}}, reward =  26810}, -- plunderers vest
[987] = { trade = {10676, 1469, 837,  {4065, 10}}, reward =  26812}, -- caballarius surcoat
[988] = { trade = {10677, 1469, 837,  {4065, 10}}, reward =  26814}, -- fallens cuirass
[989] = { trade = {10678, 1458, 837,  {4065, 10}}, reward =  26816}, -- ankusa jackcoat
[990] = { trade = {10679, 1516, 837,  {4065, 10}}, reward =  26818}, -- bihu justaucorps
[991] = { trade = {10680, 1516, 837,  {4065, 10}}, reward =  26820}, -- arcadian jerkin
[992] = { trade = {10681, 1466, 837,  {4065, 10}}, reward =  26822}, -- sakonji domaru
[993] = { trade = {10682, 1466, 837,  {4065, 10}}, reward =  26824}, -- mochizuki chainmail
[994] = { trade = {10683, 1516, 837,  {4065, 10}}, reward =  26826}, -- pteroslaver mail
[995] = { trade = {10684, 1464, 837,  {4065, 10}}, reward =  26828}, -- glyphic doublet
[996] = { trade = {10685, 1516, 837,  {4065, 10}}, reward =  26830}, -- luhlaza jubbah
[997] = { trade = {10686, 1470, 837,  {4065, 10}}, reward =  26832}, -- lanun frac
[998] = { trade = {10687, 1464, 837,  {4065, 10}}, reward =  26834}, -- pitre tobe
[999] = { trade = {10688, 1458, 837,  {4065, 10}}, reward =  26836}, -- horos casaque
[1000] = { trade = {10689, 1464, 837,  {4065, 10}}, reward =  26838}, -- pedagogy gown
[1001] = { trade = {10730, 1469, 1311,  {4068, 10}}, reward =  27328}, -- agoge calligae
[1002] = { trade = {10731, 1516, 1311,  {4068, 10}}, reward =  27330}, -- hesychasts gaiters
[1003] = { trade = {10732, 1470, 1311,  {4068, 10}}, reward =  27332}, -- piety duckbills
[1004] = { trade = {10733, 1470, 1311,  {4068, 10}}, reward =  27334}, -- archmages sabots
[1005] = { trade = {10734, 1516, 1311,  {4068, 10}}, reward =  27336}, -- vitiation boots
[1006] = { trade = {10735, 1516, 1311,  {4068, 10}}, reward =  27338}, -- plunderers poulaines
[1007] = { trade = {10736, 1469, 1311,  {4068, 10}}, reward =  27340}, -- caballarius leggings
[1008] = { trade = {10737, 1469, 1311,  {4068, 10}}, reward =  27342}, -- fallens sollerets
[1009] = { trade = {10738, 1458, 1311,  {4068, 10}}, reward =  27344}, -- ankusa gaiters
[1010] = { trade = {10739, 1516, 1311,  {4068, 10}}, reward =  27346}, -- bihu slippers
[1011] = { trade = {10740, 1516, 1311,  {4068, 10}}, reward =  27348}, -- arcadian socks
[1012] = { trade = {10741, 1466, 1311,  {4068, 10}}, reward =  27350}, -- sakonji sune-ate
[1013] = { trade = {10742, 1466, 1311,  {4068, 10}}, reward =  27352}, -- mochizuki kyahan
[1014] = { trade = {10743, 1516, 1311,  {4068, 10}}, reward =  27354}, -- pteroslaver greaves
[1015] = { trade = {10744, 1464, 1311,  {4068, 10}}, reward =  27356}, -- glyphic pigaches
[1016] = { trade = {10745, 1516, 1311,  {4068, 10}}, reward =  27358}, -- luhlaza charuqs
[1017] = { trade = {10746, 1470, 1311,  {4068, 10}}, reward =  27360}, -- lanun bottes
[1018] = { trade = {10747, 1464, 1311,  {4068, 10}}, reward =  27362}, -- pitre babouches
[1019] = { trade = {10748, 1458, 1311,  {4068, 10}}, reward =  27364}, -- horos toe shoes
[1020] = { trade = {10749, 1464, 1311,  {4068, 10}}, reward =  27366}, -- pedagogy loafers
[1021] = { trade = {10690, 1469, 1110,  {4066, 10}}, reward =  26976}, -- agoge mufflers
[1022] = { trade = {10691, 1516, 1110,  {4066, 10}}, reward =  26978}, -- hesychasts gloves
[1023] = { trade = {10692, 1470, 1110,  {4066, 10}}, reward =  26980}, -- piety mitts
[1024] = { trade = {10693, 1470, 1110,  {4066, 10}}, reward =  26982}, -- archmages gloves
[1025] = { trade = {10694, 1516, 1110,  {4066, 10}}, reward =  26984}, -- vitiation gloves
[1026] = { trade = {10695, 1516, 1110,  {4066, 10}}, reward =  26986}, -- plunderers armlets
[1027] = { trade = {10696, 1469, 1110,  {4066, 10}}, reward =  26988}, -- caballarius gauntlets
[1028] = { trade = {10697, 1469, 1110,  {4066, 10}}, reward =  26990}, -- fallens finger gauntlets
[1029] = { trade = {10698, 1458, 1110,  {4066, 10}}, reward =  26992}, -- ankusa gloves
[1030] = { trade = {10699, 1516, 1110,  {4066, 10}}, reward =  26994}, -- bihu cuffs
[1031] = { trade = {10700, 1516, 1110,  {4066, 10}}, reward =  26996}, -- arcadian bracers
[1032] = { trade = {10701, 1466, 1110,  {4066, 10}}, reward =  26998}, -- sakonji kote
[1033] = { trade = {10702, 1466, 1110,  {4066, 10}}, reward =  27000}, -- mochizuki tekko
[1034] = { trade = {10703, 1516, 1110,  {4066, 10}}, reward =  27002}, -- pteroslaver finger gauntlets
[1035] = { trade = {10704, 1464, 1110,  {4066, 10}}, reward =  27004}, -- glyphic bracers
[1036] = { trade = {10705, 1516, 1110,  {4066, 10}}, reward =  27006}, -- luhlaza bazubands
[1037] = { trade = {10706, 1470, 1110,  {4066, 10}}, reward =  27008}, -- lanun gants
[1038] = { trade = {10707, 1464, 1110,  {4066, 10}}, reward =  27010}, -- pitre dastanas
[1039] = { trade = {10708, 1458, 1110,  {4066, 10}}, reward =  27012}, -- horos bangles
[1040] = { trade = {10709, 1464, 1110,  {4066, 10}}, reward =  27014}, -- pedagogy bracers
[1041] = { trade = {10650, 1469, 844,  {4064, 10}}, reward =  26624}, -- agoge mask
[1042] = { trade = {10651, 1516, 844,  {4064, 10}}, reward =  26626}, -- hesychasts crown
[1043] = { trade = {10652, 1470, 844,  {4064, 10}}, reward =  26628}, -- piety cap
[1044] = { trade = {10653, 1470, 844,  {4064, 10}}, reward =  26630}, -- archmages petasos
[1045] = { trade = {10654, 1516, 844,  {4064, 10}}, reward =  26632}, -- vitiation chapeau
[1046] = { trade = {10655, 1516, 844,  {4064, 10}}, reward =  26634}, -- plunderers bonnet
[1047] = { trade = {10656, 1469, 844,  {4064, 10}}, reward =  26636}, -- caballarius coronet
[1048] = { trade = {10657, 1469, 844,  {4064, 10}}, reward =  26638}, -- fallens burgeonet
[1049] = { trade = {10658, 1458, 844,  {4064, 10}}, reward =  26640}, -- ankusa helm
[1050] = { trade = {10659, 1516, 844,  {4064, 10}}, reward =  26642}, -- bihu roundlet
[1051] = { trade = {10660, 1516, 844,  {4064, 10}}, reward =  26644}, -- arcadian beret
[1052] = { trade = {10661, 1466, 844,  {4064, 10}}, reward =  26646}, -- sakonji kabuto
[1053] = { trade = {10662, 1466, 844,  {4064, 10}}, reward =  26648}, -- mochizuki hatsuburi
[1054] = { trade = {10663, 1516, 844,  {4064, 10}}, reward =  26650}, -- pteroslaver armet
[1055] = { trade = {10664, 1464, 844,  {4064, 10}}, reward =  26652}, -- glyphic horn
[1056] = { trade = {10665, 1516, 844,  {4064, 10}}, reward =  26654}, -- luhlaza keffiyeh
[1057] = { trade = {10666, 1470, 844,  {4064, 10}}, reward =  26656}, -- lanun tricorne
[1058] = { trade = {10667, 1464, 844,  {4064, 10}}, reward =  26658}, -- pitre taj
[1059] = { trade = {10668, 1458, 844,  {4064, 10}}, reward =  26660}, -- horos tiara
[1060] = { trade = {10669, 1464, 844,  {4064, 10}}, reward =  26662}, -- pedagogy mortarboard
}

local remChapTrade = 
{
    {xi.item.COPY_OF_REMS_TALE_CHAPTER_1,   'rems_ch1',      0, 257, 1, 4064 },
    {xi.item.COPY_OF_REMS_TALE_CHAPTER_2,   'rems_ch2',  65536, 257, 2, 4065 }, 
    {xi.item.COPY_OF_REMS_TALE_CHAPTER_3,   'rems_ch3', 131072, 257, 3, 4066 },
    {xi.item.COPY_OF_REMS_TALE_CHAPTER_4,   'rems_ch4', 196608, 257, 4, 4067 }, 
    {xi.item.COPY_OF_REMS_TALE_CHAPTER_5,   'rems_ch5', 262144, 257, 5, 4068 }, 
    {xi.item.COPY_OF_REMS_TALE_CHAPTER_6,   'rems_ch6', 327680, 257, 6, 4069 },
    {xi.item.COPY_OF_REMS_TALE_CHAPTER_7,   'rems_ch7', 393216, 257, 7, 4070 },
    {xi.item.COPY_OF_REMS_TALE_CHAPTER_8,   'rems_ch8', 458752, 257, 8, 4071 },
    {xi.item.COPY_OF_REMS_TALE_CHAPTER_9,   'rems_ch9', 524288, 257, 9, 4072 },
    {xi.item.COPY_OF_REMS_TALE_CHAPTER_10, 'rems_ch10', 589824, 257, 10, 4073 }, 
}


m:addOverride("xi.zones.Port_Jeuno.npcs.Monisette.onTrade", function(player, npc, trade)

local countc = trade:getItemCount()
local remChap =
{
[1061] = { trade = {{4064, countc}}, item = 4064},
[1062] = { trade = {{4065, countc}}, item = 4065},
[1063] = { trade = {{4066, countc}}, item = 4066},
[1064] = { trade = {{4067, countc}}, item = 4067},
[1065] = { trade = {{4068, countc}}, item = 4068},
[1066] = { trade = {{4069, countc}}, item = 4069},
[1067] = { trade = {{4070, countc}}, item = 4070},
[1068] = { trade = {{4071, countc}}, item = 4071},
[1069] = { trade = {{4072, countc}}, item = 4072},
[1070] = { trade = {{4073, countc}}, item = 4073},
}

-------------------------------------ArmorUpgrade-------------------------------------------------
        local afUpgrade = player:getCharVar('AFRupgrade')
        local tradedCombo = 0
        -- check for armor upgrade trades
        if tradedCombo == 0 then
            for k, v in pairs(afRArmorPlusOne) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    break
                end
            end
        end
        -- found a match
        if tradedCombo > 0 then
            player:confirmTrade()
            player:setCharVar('AFRupgrade', tradedCombo)
            player:startEvent(388)
        else
-------------------------------------ChaptersTrade-------------------------------------------------
            local chaptrade = 0 
                if chaptrade == 0 then
                    for k, v in pairs(remChap) do
                        if npcUtil.tradeHasExactly(trade, v.trade) then
                            chaptrade = v.item
                            break
                        end
                    end
                end
                if chaptrade > 0 then
                    for _, entry in pairs(remChapTrade) do
                        local total = player:getCurrency(entry[2]) + countc
                            if chaptrade == entry[6] then
                               player:addCurrency(entry[2], countc)
                               remvala = tonumber(total * 256 + countc + entry[3])
                               player:tradeComplete()
                               player:startEvent(401, remvala)
                            end
                    end
                end
        end
end)

m:addOverride("xi.zones.Port_Jeuno.npcs.Monisette.onTrigger", function(player, npc)  
        local arg3 = 0
        local afUpgrade = player:getCharVar('AFRupgrade')
        if afUpgrade > 0 then
            for k, v in pairs(afRArmorPlusOne) do
                if afUpgrade == k then
                   arg3 = v.reward
                end
            end
        player:startEvent(386, arg3)
        

        elseif player:getCharVar('AFRupgrade') <= 0 then -- addin event 387 to need more time then start event 385

local remCount14 = player:getCurrency('rems_ch1') +
                   player:getCurrency('rems_ch2') *256 +
                   player:getCurrency('rems_ch3') *65536 +
                   player:getCurrency('rems_ch4') *16777216
local remCount58 = player:getCurrency('rems_ch5') +
                   player:getCurrency('rems_ch6') *256 +
                   player:getCurrency('rems_ch7') *65536 +
                   player:getCurrency('rems_ch8') *16777216
local remCount910 = player:getCurrency('rems_ch9') +
                    player:getCurrency('rems_ch10') *256 
player:startEvent(385, 0, 1, 1984, 1, remCount14, remCount58, remCount910, 0)
      end
end)

m:addOverride("xi.zones.Port_Jeuno.npcs.Monisette.onEventUpdate", function(player, csid, option, npc)
end)


local handleMainEvent = function(player, option, coinAmount)
            if option == 0 then
        local afUpgrade = player:getCharVar('AFRupgrade')
        local info = afRArmorPlusOne[afUpgrade]
        -- found a valid reward
        if info and npcUtil.giveItem(player, info.reward) then
            player:setCharVar('AFRupgrade', 0)
        end
    end
end

m:addOverride("xi.zones.Port_Jeuno.npcs.Monisette.onEventFinish", function(player, csid, option, npc)
    if csid == 386 then
        handleMainEvent(player, option, coinAmount) else
        -- retrieve stored Chapters
      local chapters = 
        {
          [1] = {reward = xi.item.COPY_OF_REMS_TALE_CHAPTER_1, currency = 'rems_ch1'},
          [2] = {reward = xi.item.COPY_OF_REMS_TALE_CHAPTER_2, currency = 'rems_ch2'}, 
          [3] = {reward = xi.item.COPY_OF_REMS_TALE_CHAPTER_3, currency = 'rems_ch3'}, 
          [4] = {reward = xi.item.COPY_OF_REMS_TALE_CHAPTER_4, currency = 'rems_ch4'}, 
          [5] = {reward = xi.item.COPY_OF_REMS_TALE_CHAPTER_5, currency = 'rems_ch5'}, 
          [6] = {reward = xi.item.COPY_OF_REMS_TALE_CHAPTER_6, currency = 'rems_ch6'},
          [7] = {reward = xi.item.COPY_OF_REMS_TALE_CHAPTER_7, currency = 'rems_ch7'},
          [8] = {reward = xi.item.COPY_OF_REMS_TALE_CHAPTER_8, currency = 'rems_ch8'},
          [9] = {reward = xi.item.COPY_OF_REMS_TALE_CHAPTER_9, currency = 'rems_ch9'},
          [10] = {reward = xi.item.COPY_OF_REMS_TALE_CHAPTER_10, currency = 'rems_ch10'},
         }
        option = bit.band(option, 65535) -- Only use the first 16 bits
        local chap = bit.band(bit.lshift(option, 0), 0x3F)
        local requestedQty = bit.rshift(option, 8)
          --  player:PrintToPlayer(string.format('%s %s %s %s event option qty item', csid, option, requestedQty, chap))
      local returnitem = 0
        if returnitem == 0 then           
                  for k, v in pairs(chapters) do
                      if chap == k then
                      npcUtil.giveItem(player, {{chapters[k].reward, requestedQty}})
                         player:delCurrency(chapters[k].currency, requestedQty)
                         break           
                       end
                  end
        end
    end
end)

return m