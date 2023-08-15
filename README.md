# Xenon-japanese for QBCore Framework.
# Rework from randol_burgersho.
```
##  MLO: https://www.youtube.com/watch?v=MM2fFcFkE-A

## Add to your qb-core/shared/items.lua (Credit to https://github.com/Randolio/randol_burgershot for saving me the stress of making my own.)

```
```
QBShared.Items = {
        -- j cafe drinks
    ['ganmaicha'] = { ['name'] = 'ganmaicha', ['label'] = 'Ganmaicha', ['weight'] = 100, ['type'] = 'item', ['image'] = 'ganmaicha.png', ['unique'] = true, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'a traditional Japanese rice wine',},

    ['sakuratea'] = { ['name'] = 'sakuratea', ['label'] = 'Sakura Tea', ['weight'] = 100, ['type'] = 'item', ['image'] = 'sakuratea.png', ['unique'] = true, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'a classic Japanese tea that is often served with sushi',},

    ['amazake'] = { ['name'] = 'amazake', ['label'] = 'Amazake', ['weight'] = 100, ['type'] = 'item', ['image'] = 'amazake.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = ' a sweet and fruity wine made from Japanese plums',},

    -- j cafe foods
    ['sushi'] = { ['name'] = 'sushi', ['label'] = 'Sushi', ['weight'] = 100, ['type'] = 'item', ['image'] = 'sushi.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Fresh flavors rolled into every bite',},

    ['ramen'] = { ['name'] = 'ramen', ['label'] = 'Ramen', ['weight'] = 100, ['type'] = 'item', ['image'] = 'ramen.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'slices of raw tuna',},

    ['kare'] = { ['name'] = 'kare', ['label'] = 'Kare Raisu', ['weight'] = 100, ['type'] = 'item', ['image'] = 'kare.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Comfort in every bowl',},

    -- ingreds

    ['fish'] = { ['name'] = 'fish', ['label'] = 'Fish', ['weight'] = 0, ['type'] = 'item', ['image'] = 'fish.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'fish',},
    ['wasabi'] = { ['name'] = 'wasabi', ['label'] = 'Wasabi', ['weight'] = 0, ['type'] = 'item', ['image'] = 'wasabi.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'wasabi',},
    ['milk'] = { ['name'] = 'milk', ['label'] = 'Milk', ['weight'] = 0, ['type'] = 'item', ['image'] = 'milk.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Cow Milk',},
    ['rice'] = { ['name'] = 'rice', ['label'] = 'Rice', ['weight'] = 0, ['type'] = 'item', ['image'] = 'rice.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Rice',},
    ['noodles'] = { ['name'] = 'noodles', ['label'] = 'Noodles', ['weight'] = 0, ['type'] = 'item', ['image'] = 'noodles.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'noodles',},
    ['butter'] = { ['name'] = 'butter', ['label'] = 'Butter', ['weight'] = 0, ['type'] = 'item', ['image'] = 'butter.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Butter',},
    ['broth'] = { ['name'] = 'broth', ['label'] = 'Broth', ['weight'] = 0, ['type'] = 'item', ['image'] = 'broth.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'broth',},
    ['sugar'] = { ['name'] = 'sugar', ['label'] = 'sugar', ['weight'] = 0, ['type'] = 'item', ['image'] = 'sugar.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'sugar',},
    ['chicken'] = { ['name'] = 'chicken', ['label'] = 'Chicken', ['weight'] = 0, ['type'] = 'item', ['image'] = 'chicken.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Chicken',}, 
    ['tea'] = { ['name'] = 'tea', ['label'] = 'Tea', ['weight'] = 0, ['type'] = 'item', ['image'] = 'tea.png', ['unique'] = false, ['useable'] = false,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'tea',}, 
    ['sakura'] = { ['name'] = 'sakura', ['label'] = 'Sakura', ['weight'] = 0, ['type'] = 'item', ['image'] = 'sakura.png', ['unique'] = false, ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Sakura',}, 

}

```
## Add this to your @qb-core/shared/jobs.lua 
```
    ["japanese"] = {
		label = "japanese",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 25
            },
			['1'] = {
                name = "server",
                payment = 50
            },
            ['2'] = {
                name = "delivery",
                payment = 50
            },
            ['3'] = {
                name = "chef",
                payment = 75
            },
            ['4'] = {
                name = "manager",
                payment = 100
            },
			['5'] = {
                name = "Owner",
                isboss = true,
                payment = 150
            },
        },
	},
```

## Add these 3 to your dpemotes.
```
["bsdrink"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "BS Drink", AnimationOptions =
   {
       Prop = 'prop_food_bs_juice02',
       PropBone = 28422,
       PropPlacement = {0.02, 0.0, -0.10, 0.0, 0.0, -0.50},
       EmoteLoop = true,
       EmoteMoving = true,
   }},

["fries"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Fries", AnimationOptions =
    {
       Prop = 'prop_food_bs_chips',
       PropBone = 60309,
       PropPlacement = { -0.0100, 0.0200, -0.0100, -175.1935, 97.6975, 13.9598 },
       EmoteMoving = true,
   }},

["fbbq"] = {"amb@prop_human_bbq@male@idle_a", "idle_b", "fbbq", AnimationOptions =
   {
       Prop = "prop_fish_slice_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       --
       EmoteLoop = true,
       EmoteMoving = false,
   }},

```
# ko-fi https://ko-fi.com/xenongamestore
## Add the 2 .ogg files in [sounds] to interact-sound/client/html/sounds
