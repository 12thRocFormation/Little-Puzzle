--[[Dev notes:
    +item 2 needs to be made into something  --check
    +make it so you can hold Items --check
    +add item descriptions --check
    +improve the mop room --check
    +improve ui --check
    +newgame plus --check
    +add a end screen after newgame+++ -- check
    -add a different ui when wearing the spectactles
]]
--[[Item List:
    1: chisil
    2: specticles
    3: save cartage
    4: rogues handbook
    5: Lockpick
    6: strength potion
    7: mop
    8: wormhole
    9: grabby gloves
    10: trophy
    11: pickaxe
    12: tome of corrupted knowledge
    13:
    14:
    15:
    16: potion bottle
    17: freezing potion
    18: flaming potion
    19: bolt potion
    20: null potion
    21: nil potion
    22: alchemical chaos
    23:
    24:
    25:
    26:
    27:
    28:
    29:
    30:
    31:
    32:
    33:
    34:
    35:
    36:
    37:
    38:
    39:
    40:
    41:
    42:
    43:
    44:
    45:
    46:
    47:
    48:
    49:
    50:
    51:
    52:
    53:
    54:
    55:
    56:
    57:
    58:
    59:
    60:
    61:
    62:
    63:
    64:
    65:
    66:
    67:
    68:
    69:
    70:
    71:
    72:
    73:
    74:
    75:
    76:
    77:
    78:
    79:
    80:
    81:
    82:
    83:
    84:
    85:
    86:
    87:
    88:
    89:
    90:
    91:
    92:
    93:
    94:
    95:
    96:
    97:
    98:
    99:
    100:
    101:
    102:
    103:
    104:
    105:
    106:
    107:
    108:
    109:
    110:
    111:
    112:
    113:
    114:
    115:
    116:
    117:
    118:
    119:
    120:
    121:
    122:
    123:
    124:
    125:
    126:
    127:
    128:
    129:
    130:
    131:
    132:
    133:
    134:
    135:
    136:
    137:
    138:
    139:
    140:
    141:
    142:
    143:
    144:
    145:
    146:
    147:
    148:
    149:
    150:
    151:
    152:
    153:
    154:
    155:
    156:
    157:
    158:
    159:
    160:
    161:
    162:
    163:
    164:
    165:
    166:
    167:
    168:
    169:
    170:
    171:
    172:
    173:
    174:
    175:
    176:
    177:
    178:
    179:
    180:
    181:
    182:
    183:
    184:
    185:
    186:
    187:
    188:
    189:
    190:
    191:
    192:
    193:
    194:
    195:
    196:
    197:
    198:
    199:
    200:
    201:
    202:
    203:
    204:
    205:
    206:
    207:
    208:
    209:
    210:
    211:
    212:
    213:
    214:
    215:
    216:
    217:
    218:
    219:
    220:
    221:
    222:
    223:
    224:
    225:
    226:
    227:
    228:
    229:
    230:
    231:
    232:
    233:
    234:
    235:
    236:
    237:
    238:
    239:
    240:
    241:
    242:
    243:
    244:
    245:
    246:
    247:
    248:
    249:
    250:
    251:
    252:
    253:
    254:
    255:
    256:
    257:
    258:
    259:
    260:
    261:
    262:
    263:
    264:
    265:
    266:
    267:
    268:
    269:
    270:
    271:
]]
function love.load()
    --i can't remember but font & canvas stuff
    love.graphics.setDefaultFilter("nearest")
    --love.graphics.setDefaultFilter("linear")
    screenheight = 300
    screenwidth = 450
    uiscreenpush = 17*16
    Canvas=love.graphics.newCanvas(screenwidth,screenheight)
    --Font = love.graphics.newFont(24)
    --love.graphics.setFont(Font)
    --love.graphics.setLineStyle("rough")
    love.graphics.setLineWidth(1)
    --vars
    framecount = 0
    floorcount = 0
    movecount = 0
    totalfloorcount = 0
    totalmovecount = 0
    newgamepluscount = 0
    handcheck = 1
    storage = 0
    wintitle = "You win"
    gamecondition = "game"
    --tables
    importantvars = {
        "loop"
    }
    pressed = {}
    colors = {
        black = {0,0,0},
        offblack = {0.1,0.1,0.1},
        blue = {0,0,0.8},
        cyan = {0.1,0.75,0.8},
        neongreen = {0,1,0},
        orange = {0.8,0.45,0.1},
        brown = {0.8,0.45,0.1,0.5},
        yellow = {0.8,0.8,0},
        offishyellow = {0.8,0.75,0.08},
        offyellow = {0.8,0.65,0.28},
        red = {0.8,0.1,0.1},
        green = {0.1,0.8,0.1},
        offgreen = {0.2,0.65,0.2},
    }
    --recipes
    recipes = {
        {1,1,11},
        --books
        {4,5,13},
        --tomes
        {13,16,14},
        --potions
        {0,6,16},
        {32,16,17},
        {33,16,18},
        {34,16,19},
        {35,16,6},
        {17,18,20},
        {19,6,21},
        {21,20,22},
        --pockets
        {8,3,48},
    }
    --player
    p={
        invobackup = {},
        invo = {
            9,11,3
        },
        handbackup = 0,
        hand = 2,
        direction = 0,
    }
    backup(p.invobackup,p.invo)
    --descriptions
    itemdescription = {
        [0] = "No item\nequiped",
        --misc
        "Chisil,\nallows you to break a rock.\nFrigile, breaks after use.",
        "Spectacles,\nallows you to see the\nhidden details in the\nwalls.",
        "Save Cartage,\nsave room state on\ncompletion.\nFrigile, breaks after use.",
        "Rogue's Handbook,\nallows you to open\nhidden pathways.",
        "Lockpick,\na key that can open\nlocked doors.\nFrigile, breaks after use.",
        "Potion of Strength,\nallows you to break\nblockages.\nConsumable, used up\nafter use",
        "Mop,\ncleans up slippery messes.",
        "Pocket Wormhole,\nrestarting sends you\nback a floor.",
        "Grippy Gloves,\nallows you to pull.",
        "Trophy,\nYou win",
        "Old Pickaxe,\nAllows you to mine\nthrough walls.\nFrigile, breaks after use.\n(can break rock for free)",
        "Tome of !/#\"$%^ Knowledge\n",
        "Rogue Master's Book,\n-Rogue's Handbook\n-You can unlock doors",
        "Tome of Alchemy Knowledge,\n0+6=16     | 32+16=17\n33+16=18 | 34+16=19\n35+16=6   | 17+18=20\n19+6=21   | 21+20=22",
        "15",
        --potions
        "Empty Bottle,\nI wonder what can\nbe crafted?",
        "Potion of Freezing,\ncreate a slippery patch\nwhen walking into a wall.",
        "Potion of Flames,\nmelt slippery patches.",
        "Potion of Bolt,\nmove double the speed.",
        "Potion of Null,\ndoes nothing?",
        "Potion of Nil,\ndoes nothing?",
        "Alchemical Choas,\nTransmute what you touch.",
        "23",
        "24",
        "25",
        "26",
        "27",
        "28",
        "29",
        "30",
        "31",
        --plants
        "Mintleaf,\ndoes nothing?",
        "Pepperleaf,\ndoes nothing?",
        "Thunderoot,\ndoes nothing?",
        "Caveroot,\ndoes nothing?",
        "36",
        "37",
        "38",
        "39",
        "40",
        "41",
        "42",
        "43",
        "44",
        "45",
        "46",
        "47",
        --pockets
        "Pocket Save,\nrestarting saves.\nFrigile, breaks after use.",
        "49",
        "50",
        "51",
        "52",
        "53",
        "54",
        "55",
        "56",
        "57",
        "58",
        "59",
        "60",
        "61",
    }
    tomeknowledge = {
        "The mailbox stores a item.",
        "With sticky hands\nkeys are needless.",
        "Pulling roadblocks\nprovide new paths.",
        "Why stop momentum\nbefore moving?",
        "Keep resources.\n(duh)",
        "Score is based on\nfloors switched.",
        "Crafting is possible.",
        "Saving on a secret\nallows for new paths.",
        "Saving and reloading\ncan copy items.",
        "Mining deeply can\nhave gems.",
    }
    --floors
        floor1 = {loop=5,
            0x100,0x850,0x100,0x100,0x100,
            0x100,0x200,0x000,0x900,0x100,
            0x100,0x600,0x140,0x100,0x100,
            0x100,0x000,0x000,0x030,0x100,
            0x100,0x700,0x100,0x100,0x100,
            0x100,0x400,0x140,0x00a,0x100,
            0x100,0x100,0x100,0x100,0x100,
        }
        floor2 = {loop=11,
            0x100,0x100,0x100,0x100,0x100,0x100,0x100,0x100,0x100,0x100,0x100,
            0x100,0x200,0x000,0x400,0x000,0x900,0x100,0x000,0x000,0x000,0x100,
            0x100,0x000,0x000,0x100,0x100,0x100,0x100,0x000,0x500,0x000,0x100,
            0x100,0x000,0x010,0x000,0x000,0x000,0x000,0x000,0x000,0x000,0x100,
            0x100,0x000,0x000,0x000,0x000,0x000,0x000,0x000,0x000,0x100,0x100,
            0x100,0x000,0x000,0x000,0x000,0x000,0x000,0x100,0x120,0x130,0x100,
            0x100,0x140,0x140,0x100,0x100,0x100,0x100,0x100,0x100,0x100,0x100,
            0x100,0x000,0x000,0x000,0x000,0x000,0x000,0x400,0x005,0x900,0x100,
            0x100,0x100,0x100,0x100,0x100,0x100,0x100,0x100,0x100,0x100,0x100,
        }
        floor3 = {loop=13,
            0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100,
            0x105, 0x000, 0x000, 0x700, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x200, 0x100,
            0x100, 0x100, 0x000, 0x100, 0x000, 0x000, 0x500, 0x000, 0x000, 0x000, 0x000, 0x000, 0x100,
            0x100, 0x000, 0x000, 0x100, 0x000, 0x000, 0x010, 0x000, 0x000, 0x000, 0x000, 0x000, 0x100,
            0x100, 0x000, 0x000, 0x100, 0x000, 0x000, 0x010, 0x000, 0x000, 0x000, 0x000, 0x000, 0x100,
            0x100, 0x000, 0x000, 0x100, 0x000, 0x000, 0x010, 0x000, 0x000, 0x000, 0x000, 0x000, 0x100,
            0x100, 0x000, 0x100, 0x100, 0x100, 0x100, 0x010, 0x100, 0x100, 0x100, 0x100, 0x106, 0x100,
            0x100, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x400, 0x000, 0x000, 0x000, 0x000, 0x100,
            0x100, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x100, 0x000, 0x000, 0x000, 0x900, 0x100,
            0x100, 0x000, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x130, 0x100,
            0x100, 0x010, 0x008, 0x100, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
            0x100, 0x000, 0x100, 0x100, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
            0x100, 0x100, 0x100, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        }
        floor4 = {loop=5,
            0x100,0x100,0x100,0x100,0x100,
            0x100,0x000,0x000,0x006,0x100,
            0x130,0x000,0x100,0x100,0x100,
            0x100,0x200,0x600,0x900,0x100,
            0x100,0x100,0x100,0x100,0x100,
            0x100,0x200,0x010,0x000,0x100,
            0x100,0x100,0x00b,0x100,0x100,
            0x000,0x100,0x100,0x100,0x000,
        }
        floor5 = {loop=7,
            0x100,0x100,0x100,0x000,0x000,0x000,0x000,
            0x100,0x006,0x100,0x100,0x100,0x100,0x100,
            0x100,0x000,0x000,0x000,0x000,0x006,0x100,
            0x100,0x000,0x100,0x100,0x000,0x100,0x100,
            0x100,0x000,0x200,0x600,0x700,0x000,0x130,
            0x100,0x400,0x100,0x100,0x600,0x002,0x100,
            0x100,0x003,0x100,0x101,0x900,0x100,0x000,
            0x100,0x100,0x100,0x100,0x100,0x100,0x000
        }
        --secret floors
        sfloor1 = {loop=7,
            0x100,0x100,0x100,0x100,0x100,0x100,0x100,
            0x100,0x000,0x000,0x000,0x000,0x004,0x100,
            0x100,0x000,0x100,0x100,0x000,0x100,0x100,
            0x100,0x000,0x200,0x100,0x140,0x030,0x100,
            0x100,0x100,0x100,0x100,0x900,0x100,0x100,
            0x000,0x000,0x000,0x100,0x100,0x100,0x000,
        }
        sfloor2 = { loop=5,
            0x100,0x100,0x850,0x100,0x100,
            0x100,0x200,0x061,0x900,0x100,
            0x100,0x140,0x100,0x100,0x100,
            0x800,0x000,0x000,0x000,0x80c,
            0x800,0x800,0x800,0x800,0x800,
        }
        sfloor3 = {loop=9,
            0x100,0x100,0x100,0x100,0x100,0x800,0x80a,0x800,0x800,
            0x100,0x001,0x200,0x002,0x100,0x000,0x800,0x000,0x800,
            0x100,0x100,0x000,0x100,0x100,0x000,0x800,0x000,0x800,
            0x100,0x003,0x000,0x004,0x100,0x000,0x800,0x000,0x800,
            0x100,0x100,0x000,0x100,0x10b,0x000,0x800,0x000,0x800,
            0x100,0x005,0x000,0x006,0x100,0x000,0x800,0x000,0x800,
            0x100,0x100,0x000,0x100,0x100,0x000,0x800,0x000,0x800,
            0x100,0x007,0x000,0x008,0x100,0x000,0x000,0x000,0x800,
            0x100,0x100,0x000,0x100,0x100,0x800,0x800,0x000,0x800,
            0x100,0x009,0x000,0x030,0x120,0x000,0x000,0x000,0x800,
            0x100,0x100,0x850,0x100,0x100,0x800,0x800,0x800,0x800,
        }
        sfloor4 = {loop=11,
            0x100,0x100,0x100,0x100,0x100,0x100,0x100,0x100,0x100,0x100,0x100,
            0x100,0x200,0x000,0x000,0x000,0x000,0x000,0x400,0x000,0x007,0x100,
            0x100,0x000,0x000,0x000,0x000,0x000,0x000,0x100,0x100,0x100,0x100,
            0x100,0x000,0x000,0x000,0x000,0x000,0x000,0x000,0x000,0x500,0x100,
            0x100,0x000,0x000,0x000,0x000,0x000,0x000,0x000,0x000,0x000,0x100,
            0x100,0x030,0x000,0x000,0x000,0x000,0x000,0x000,0x000,0x000,0x100,
            0x100,0x100,0x100,0x2100,0x2101,0x2102,0x2103,0x100,0x100,0x100,0x100,
        }
        sfloor5 = {loop=6,
            0x100,0x100,0x100,0x100,0x100,0x100,
            0x100,0x000,0x000,0x000,0x000,0x100,
            0x100,0x000,0x100,0x100,0x009,0x100,
            0x100,0x000,0x200,0x000,0x700,0x100,
            0x100,0x000,0x100,0x100,0x900,0x100,
            0x100,0x140,0x108,0x100,0x100,0x100,
            0x100,0x101,0x100,0x100,0x10d,0x100,
        }
        floors =       { floor1, floor2, floor3, floor4, floor5}
        basefloors = {}
        for z = 1,#floors do
            basefloors[z] = {}
            backup(basefloors[z],floors[z])
        end
        secretfloors = {sfloor1,sfloor2,sfloor3,sfloor4,sfloor5}
        basesecretfloors = {}
        for z = 1,#secretfloors do
            basesecretfloors[z] = {}
            backup(basesecretfloors[z],secretfloors[z])
        end
        floornum = 1
        curflr = {}
        backup(curflr,floors[floornum])
        --used for reseting 
        backupflr = {}
        backup(backupflr,curflr)
    --testing
end

function love.update()
    --testing
    framecount = framecount + 1
    --not testing
    if gamecondition == "game" then
        mapheight = (#curflr-1)/curflr.loop
        if newgamepluscount > 0 then
            itemdescription[10] = "Trophy,\nYou win. You swiched\nfloors "..floorcount.." times.\nAscend to new game+\nby going too the next\nlevel\nng"
            for z = 1,newgamepluscount do
                itemdescription[10] = itemdescription[10].."+"
            end
        else
            itemdescription[10] = "Trophy,\nYou win. You swiched\nfloors "..floorcount.." times.\nAscend to new game+\nby going too the next\nlevel"
        end
        playerhand()
        movement()
        restart()
    end
    local str = "Tome of !/#\"$%^ Knowledge\n"
    if insecret then 
        str = str .. tomeknowledge[floornum+5]
    else
        str = str .. tomeknowledge[floornum]
    end
    itemdescription[12] = str
    wintitle = "You win. You swiched\nfloors "..totalfloorcount.." times,\nand moved "..totalmovecount.."times."
end


function love.draw()
    --first draw steps
    love.graphics.setCanvas(Canvas)
    love.graphics.clear()
    --print map
    if gamecondition == "game" then 
        for i,v in ipairs(curflr) do
            local v0 = r0(v)
            local v1 = r1(v)
            local v2 = r2(v)
            local x = i
            local y = 0
            --setting y
            for z = 1 , 50 do
                if x > curflr.loop then
                    x = x - curflr.loop
                    y = y + 1
                else
                    break
                end
            end
            --printing floors
            if v1 == 1 then
                scrprint("block",x,y,colors.cyan)
            elseif v1 == 3 then
                scrprint("S",x,y)
            elseif v1 == 6 then 
                scrprint("block",x,y,colors.brown)
                if v2 == 0 then 
                    scrprint("C",x,y,colors.orange)
                end
            end
            --printing items
            if v2 > 0 then
                scrprint(v2,x,y,colors.orange)
            end
            --printing object
            if v0 == 1 then
                scrprint("block",x,y)
                if v1 == 4 then 
                    scrprint("block",x,y,colors.offishyellow)
                end
                if p.hand == 2 then 
                    if v2 > 0 then
                        scrprint("block",x,y,colors.orange)
                    end
                    scrprint(v1,x,y,colors.offyellow)
                end
                if v1 == 5 then
                    scrprint("block",x,y,colors.green)
                    if storage > 0 then 
                        scrprint(storage,x,y,colors.offgreen)
                    else
                        scrprint("M",x,y,colors.offgreen)
                    end
                end
            elseif v0 == 2 then
                scrprint("P",x,y,colors.neongreen)
            elseif v0 == 4 then
                scrprint("D",x,y)
            elseif v0 == 5 then
                scrprint("K",x,y)
            elseif v0 == 6 then
                scrprint("B",x,y)
            elseif v0 == 7 then
                scrprint("R",x,y)
            elseif v0 == 8 then
                scrprint("block",x,y,colors.black)
                if p.hand == 2 then 
                    scrprint("block",x,y,colors.offblack)
                    if v2 > 0 then
                        scrprint("block",x,y,colors.orange)
                    end
                    scrprint(v1,x,y,colors.offyellow)
                end
                if v1 == 5 then
                    scrprint("block",x,y,colors.green)
                    if storage > 0 then 
                        scrprint(storage,x,y,colors.offgreen)
                    else
                        scrprint("M",x,y,colors.offgreen)
                    end
                end
            elseif v0 == 9 then
                scrprint("F",x,y)
            elseif v0 > 0 then
                scrprint(v0,x,y)
            end
        end
    end
    --print ui
    local str = "["
    for i,v in ipairs(p.invo) do
        if not (i == #p.invo) then 
            str = str..v.."|"
        else
            str = str..v
        end
    end
    str = str.."]"
    local drawboost = 0
    for z = 1 , handcheck do
        drawboost = drawboost + #tostring(p.invo[z])*9
        if z ~= 1 then
            drawboost = drawboost + 3
        end
    end
    for z = 1 , 5 do
        love.graphics.print("\\/",uiscreenpush+drawboost-#tostring(p.invo[handcheck])*5,0)
        love.graphics.print(str,uiscreenpush,16)
        love.graphics.print(p.hand,uiscreenpush+1,2*16)
        if gamecondition == "win" then 
            love.graphics.print(wintitle,uiscreenpush,3*16)
        else
            if itemdescription[p.hand] then 
                love.graphics.print(itemdescription[p.hand],uiscreenpush,3*16)
            else
                love.graphics.print("nil",uiscreenpush,3*16)
            end
        end
        love.graphics.print("P=Player",uiscreenpush,screenheight-16*9)
        love.graphics.printf("F=Next Floor",0,screenheight-16*9,screenwidth-6,"right")
        love.graphics.print("D=Door",uiscreenpush,screenheight-16*8)
        love.graphics.printf("K=Key",0,screenheight-16*8,screenwidth-6,"right")
        love.graphics.print("R=Rock",uiscreenpush,screenheight-16*7)
        love.graphics.printf("B=Blockage",0,screenheight-16*7,screenwidth-6,"right")
        love.graphics.print("Orange are Items",uiscreenpush+28,screenheight-16*6)
        love.graphics.print("Arrows to move",uiscreenpush,screenheight-16*5)
        love.graphics.printf("R to restart",0,screenheight-16*5,screenwidth-6,"right")
        love.graphics.print("D to drop",uiscreenpush,screenheight-16*4)
        love.graphics.printf("Hold X to equip",0,screenheight-16*4,screenwidth-6,"right")
        love.graphics.print("M=Mailbox",uiscreenpush+50,screenheight-16*3)
        love.graphics.printf("Moves: "..movecount,0,screenheight-16*1,screenwidth-6,"right")
        love.graphics.print("Floors switched: "..floorcount,uiscreenpush,screenheight-16*2)
        if newgamepluscount > 0 then 
            love.graphics.printf("Ng+: "..newgamepluscount,0,screenheight-16*2,screenwidth-6,"right")
        end
        love.graphics.print("Floor: "..floornum,uiscreenpush,screenheight-16)
        love.graphics.line(uiscreenpush-8,0,uiscreenpush-8,screenheight)
        love.graphics.line(uiscreenpush-8,screenheight/2,screenwidth,screenheight/2)
    end
    --final draw steps
        love.graphics.setCanvas()
        love.graphics.scale(2,2)
        love.graphics.draw(Canvas)
end

function movement() -- detects movement imputs
    if not love.keyboard.isDown("x") then 
        if btnpressed("up") then
            p.direction=-curflr.loop
        end
        if btnpressed("down") then
            p.direction=curflr.loop
        end
        if btnpressed("left") then
            p.direction=-1
        end
        if btnpressed("right") then
            p.direction=1
        end
    end
    submovement()
end

function submovement() -- handles collision, movement, picking up items, etc.
    if p.direction ~= 0 then
        local moves = 1
        if p.hand == 19 then
            moves = 2
        elseif p.hand == 22 then
            for i,v in ipairs(curflr) do 
                local cont = true
                if math.abs(p.direction) == 1
                and ((i%curflr.loop == 0
                and p.direction == 1)
                or ((i-1)%curflr.loop == 0
                and p.direction == -1)) then 
                    cont = false
                end--to not walk off the table

                if r0(v) == 2
                and cont then 
                    --for ease
                    local target0 = curflr[i-p.direction]
                    local target = curflr[i+p.direction]
                    local target2 = curflr[i+p.direction*2]
                    if  r0(target) < 9
                    and 3 < r0(target) then
                        curflr[i+p.direction] = r(target) + unr0(r0(target)+1)
                        moves = 0
                    end
                end
            end
        end
        for rep = 1,moves do 
            for i,v in ipairs(curflr) do
                local cont = true
                if math.abs(p.direction) == 1
                and ((i%curflr.loop == 0
                and p.direction == 1)
                or ((i-1)%curflr.loop == 0
                and p.direction == -1)) then 
                    cont = false
                end--to not walk off the table

                if r0(v) == 2
                and cont then

                    --for ease
                    local target0 = curflr[i-p.direction]
                    local target = curflr[i+p.direction]
                    local target2 = curflr[i+p.direction*2]

                    if target then--to not walk off the table
                        --objects
                        --nothing
                        if r0(target) == 0 then
                            curflr[i] = r(v)
                            curflr[i+p.direction] = unr0(3) + r(target)
                            if  r0(target0) > 1
                            and p.hand == 9
                            and r0(target0) ~= 8 then
                                curflr[i] = unr0(r0(target0)) + r(v)
                                curflr[i-p.direction] = r(target0)
                            end
                        --wall
                        elseif r0(target) == 1 then
                            if p.hand == 11
                            and r1(target) ~= 5 then 
                                curflr[i] = r(v)
                                curflr[i+p.direction] = unr0(3) + r(target)
                                p.hand = 0
                            elseif p.hand == 17 then
                                curflr[i] = v - unr1(r1(v)) + unr1(1)
                            end
                        --2 & 3 are used for the player
                        --door
                        elseif r0(target) == 4 then
                            if p.hand == 5 then
                                p.hand = 0
                                curflr[i] = r(v)
                                curflr[i+p.direction] = 0x300 + r(target)
                            elseif p.hand == 13 then 
                                curflr[i] = r(v)
                                curflr[i+p.direction] = 0x300 + r(target)
                            end
                        --key
                        elseif r0(target) == 5 then
                            if r0(target2) == 0 then
                                if r1(target2) == 1 then
                                    local target1 = target
                                    local target21 = target2
                                    for z=1,math.max(curflr.loop,mapheight) do
                                        if r0(target21) == 0 then
                                            curflr[i+p.direction*(z)]   = r(target1)
                                            curflr[i+p.direction*(1+z)] = 0x500 + r(target21)
                                            if r1(target21) == 1 then
                                                target1  = curflr[i+p.direction*(1+z)]  
                                                target21 = curflr[i+p.direction*(2+z)]
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    end
                                else
                                    curflr[i+p.direction] = r(target)
                                    curflr[i+p.direction*2] = 0x500 + r(target2)
                                end
                            elseif r0(target2) == 4 then
                                curflr[i+p.direction] = r(target)
                                curflr[i+p.direction*2] = r(target2)
                            end
                        --blockage
                        elseif r0(target) == 6 then
                            if p.hand == 6 then 
                                p.hand = 0 
                                curflr[i+p.direction] = r(target)
                            end
                        --rock
                        elseif r0(target) == 7 then
                            local cont = true
                            if p.hand == 1 then 
                                p.hand = 0 
                                curflr[i+p.direction] = r(target)
                                cont = false
                            elseif p.hand == 11 then 
                                curflr[i+p.direction] = r(target)
                                cont = false
                            end
                            if r0(target2) == 0
                            and cont then
                                if r1(target2) == 1 then
                                    local target1 = target
                                    local target21 = target2
                                    for z=1,math.max(curflr.loop,mapheight) do
                                        if r0(target21) == 0 then
                                            curflr[i+p.direction*(z)]   = r(target1)
                                            curflr[i+p.direction*(1+z)] = 0x700 + r(target21)
                                            if r1(target21) == 1 then
                                                target1  = curflr[i+p.direction*(1+z)]  
                                                target21 = curflr[i+p.direction*(2+z)]
                                            else
                                                break
                                            end
                                        else
                                            break
                                        end
                                    end
                                else
                                    curflr[i+p.direction] = r(target)
                                    curflr[i+p.direction*2] = 0x700 + r(target2)
                                end
                            end
                        --void wall
                        elseif r0(target) == 8 then
                        --flag/finish
                        elseif r0(target) == 9 then
                            nextfloor()
                        end 
                        
                        --for ease
                        if not levelchanged then
                            local target0 = curflr[i-p.direction]
                            local target = curflr[i+p.direction]
                            local target2 = curflr[i+p.direction*2]
                        end

                        --floors
                        --nothing
                        if     r1(target) == 0 then
                        --ice
                        elseif r1(target) == 1 then
                            if p.hand == 7
                            or p.hand == 18 then
                                curflr[i+p.direction] = curflr[i+p.direction] - r1(target)*16
                            else
                                p.slide = true
                            end
                        --fragile
                        elseif r1(target) == 2 then
                            curflr[i] = r(v)
                            curflr[i+p.direction] = 0x300 + r(target)
                        --secret floor
                        elseif r1(target) == 3 then
                            secretfloor()
                        --weakness
                        elseif r1(target) == 4 then
                            if p.hand == 4
                            or p.hand == 13 then 
                                curflr[i] = r(v)
                                curflr[i+p.direction] = 0x300 + r(target)
                            end
                        --storage unit
                        elseif r1(target) == 5 then
                            if not storageused then 
                                storage = p.hand
                                p.hand = 0
                                storageused = true
                            end
                        --crafting station
                        elseif r1(target) == 6 then
                        elseif r1(target) == 7 then
                        elseif r1(target) == 8 then
                        elseif r1(target) == 9 then
                        end
                        
                        --for ease
                        if not levelchanged then
                            local target0 = curflr[i-p.direction]
                            local target = curflr[i+p.direction]
                            local target2 = curflr[i+p.direction*2]
                        end
                        --items
                        if r2(target) > 0 then
                            local cont = true
                            if r1(target) ~= 5 then 
                                for i2,v in ipairs(p.invo) do
                                    if v == 0 then
                                        p.invo[i2] = r2(curflr[i+p.direction])
                                        curflr[i+p.direction] = curflr[i+p.direction] - unr2(r2(curflr[i+p.direction]))
                                        cont = false
                                        break
                                    end
                                end
                            end
                            if r2(target) > 0
                            and cont 
                            and p.hand == 0 then
                                p.hand = r2(curflr[i+p.direction])
                                curflr[i+p.direction] = curflr[i+p.direction] - unr2(r2(curflr[i+p.direction]))
                            end
                        end
                    end
                end
            end
            for i,v in ipairs(curflr) do
                if r0(v) == 3 then
                    curflr[i] = 0x200 + r(v)
                end
            end
        end
        for i,v in ipairs(curflr) do 
            if r1(v) == 5 then
                if storage ~= r2(v) then
                    curflr[i] = v - unr2(r2(v)) + unr2(storage)
                end
            end
        end
        movecount = movecount + 1
        totalmovecount = totalmovecount + 1
    end
    levelchanged = false
    storageused = false
    if not p.slide then
        p.direction = 0
    else
        p.slide = false
    end
end

function playerhand() -- handles equiping, crafting and droping
    if btnpressed("d") then
        for i,v in ipairs(curflr) do
            if r0(v) == 2 then
                if r1(v) == 6 then --crafting
                    local cont = true
                    for i1,v1 in ipairs(recipes) do
                        if checkmatches(r2(v),p.hand,v1[1],v1[2]) then
                            p.hand = 0
                            curflr[i] = curflr[i] - unr2(r2(v)) + unr2(v1[3])
                            cont = false
                            break
                        end
                    end
                    if cont then --if it doesn't craft
                        local midway = r2(v)
                        curflr[i] = curflr[i] - unr2(r2(v)) + unr2(p.hand)
                        p.hand = midway
                    end
                else --dropping
                    local midway = r2(v)
                    curflr[i] = curflr[i] - unr2(r2(v)) + unr2(p.hand)
                    p.hand = midway
                end
            end
        end
    end
    if love.keyboard.isDown("x") then
        if btnpressed("right") then 
            handcheck = handcheck + 1
        end
        if btnpressed("left") then 
            handcheck = handcheck - 1
        end
        if handcheck > #p.invo then 
            handcheck = handcheck - #p.invo
        end
        if handcheck <= 0 then 
            handcheck = #p.invo
        end
        pressed.x = true
    else
        if pressed.x then 
            local midway = p.invo[handcheck]
            p.invo[handcheck] = p.hand
            p.hand = midway
        end
        pressed.x = false
    end
end

function nextfloor() -- moves to next floor
    --Save Cartage
    if p.hand == 3 then 
        roomsave()
        p.hand = 0
    end
    --newgame+
    if p.hand == 10 then
        for i,v in ipairs(floors) do
            backup(floors[i],basefloors[i])
        end
        for i,v in ipairs(secretfloors) do
            backup(secretfloors[i],basesecretfloors[i])
        end
        floornum = 1
        floorcount = 0
        movecount = 0
        newgamepluscount = newgamepluscount + 1
        for i,v in ipairs(p.invo) do
            if v == 10 then
                p.invo[i] = 0
            end
        end
        if storage == 10 then 
            storage = 0
        end
        if #p.invo>0 then
            p.hand = p.invo[#p.invo]
            table.remove(p.invo,#p.invo)
        else
            p.hand = 0
            gamecondition = "win"
        end
    else
        if floornum == #floors then
            floornum = 1
        else
            floornum = floornum + 1
        end
        floorcount = floorcount + 1
        totalfloorcount = totalfloorcount + 1
    end
    backup(curflr,floors[floornum])
    backup(backupflr,curflr)
    backup(p.invobackup,p.invo)
    p.handbackup = p.hand
    preset()
    levelchanged = true
    insecret = false
end

function secretfloor() -- switches floor between secret and normal varients
    --Save Cartage
    if p.hand == 3 then 
        roomsave()
        p.hand = 0
    end
    --switching floors
    if not insecret then
        backup(curflr,secretfloors[floornum])
        backup(backupflr,curflr)
        insecret = true
    else
        backup(curflr,floors[floornum])
        backup(backupflr,curflr)
        insecret = false
    end
    backup(p.invobackup,p.invo)
    p.handbackup = p.hand
    levelchanged = true
    preset()
    floorcount = floorcount + 1
    totalfloorcount = totalfloorcount + 1
end

function restart() -- restarts floor
    if btnpressed("r") then
        --wormhole
        if p.hand == 8 then 
            if floornum == 1 then
                floornum = #floors
            else
                floornum = floornum - 1
            end
            backup(curflr,floors[floornum])
            backup(backupflr,curflr)
            backup(p.invobackup,p.invo)
            preset()
            floorcount = floorcount + 1
            totalfloorcount = totalfloorcount + 1
            insecret = false
        --save
        elseif p.hand == 48 then
            roomsave()
            backup(p.invobackup,p.invo)
            p.handbackup = 0
            p.hand = 0
        --normal restart
        else
            backup(curflr,backupflr)
            backup(p.invo,p.invobackup)
            p.hand = p.handbackup
            preset()
        end
        levelchanged = true
    end
end

function roomsave()
    if insecret then 
        backup(secretfloors[floornum],curflr)
    else
        print(1)
        backup(floors[floornum],curflr)
    end
    backup(backupflr,curflr)
end

--subfunctions
function backup(t1,t2) -- copies one table on top of another
    --emptying table
    for i=#t1,1,-1 --[[needs to be set up like this so when a item's removed the entire table doesn't get shifted down. It's going from highest to lowest.]] do
        table.remove(t1,i)
    end
    --Copying varieables over
    for i,v in ipairs(t2) do
        t1[i]=v
    end
    for i,v in ipairs(importantvars) do
        if t2[v] then
            t1[v] = t2[v]
        end
    end
end
function preset() -- resets the player's movement (used reset unvotory, now it's just left over code)
    p.direction = 0
end
function btnpressed(btn) --checks whether a button is being pressed, not held.
    if love.keyboard.isDown(btn)
    and not pressed[btn] then
        pressed[btn] = true
        return true
    elseif not love.keyboard.isDown(btn) then
        pressed[btn] = false
        return false
    end
end
function scrprint(str,x,y,col) --prints stuff to the floor
    if col then
        love.graphics.setColor(col)
    else
        love.graphics.setColor(colors.yellow)
    end
    if str == "block" then
        love.graphics.polygon(
            "fill",
            x*16   ,y*16,
            x*16+16,y*16,
            x*16+16,y*16+16,
            x*16,   y*16+16)
    else
        for z = 1 , 5 do
            if #tostring(str) == 1 then 
                love.graphics.print(str,x*16+3,y*16)
            else
                love.graphics.print(str,x*16,y*16)
            end
        end
    end
    love.graphics.setColor(1,1,1)
end
function checkmatches(num1,num2,check1,check2) -- checks if a group of four can be matched 2 to 2
    if (num1 == check1 
    and num2 == check2)
    or (num1 == check2 
    and num2 == check1) then
        return true
    end
end
--reduce functions
function r(zed) -- returns everything other than the object value
    return zed-decodeTile(zed).id*16^2
end
function r0(zed) -- returns the object value
    return decodeTile(zed).id
end
function unr0(zed)
    return zed * 16 ^ 2
end
function r1(zed) -- returns the tag/floor value
    return decodeTile(zed).tag
end
function unr1(zed) -- returns accosiated map tag/floor value
    return zed * 16
end
function r2(zed) -- returns the item value
    return decodeTile(zed).item
end
function unr2(zed) -- returns accosiated map item value
    local stack = 0
    for z = 1,16 do
        if zed >=16 then
            zed = zed -16
            stack = stack + 1
        else
            break
        end
    end
    return zed + stack * 16 ^ 3
end
function decodeTile(value) -- decodes hexidecimal 
    local tile = {}
    if value == nil then 
        tile.id = 8
        tile.item = 0
        tile.tag = 0
    else
        if value >= 16 ^ 3 then
            local v =  math.floor(value / 16 ^ 3)
            tile.item = v*16
            value = value - v * (16 ^ 3)
        else
            tile.item = 0
        end
        if value >= 16 ^ 2 then
            local v =  math.floor(value / 16 ^ 2)
            tile.id = v
            value = value - v * (16 ^ 2)
        else
            tile.id = 0
        end
        if value >= 16 then
            local v =  math.floor(value / 16)
            tile.tag = v
            value = value - v * 16
        else
            tile.tag = 0
        end
        if value > 0 then
            tile.item = tile.item + value
        else
            tile.item = tile.item
        end
    end
    return tile
end