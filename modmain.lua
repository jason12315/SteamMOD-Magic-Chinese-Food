-- reference: preparedfoods.lua

require "./languages/chs"
local gongbaochicken = {
  test = function(cooker, names, tags)
      return tags.meat and names.pepper and names.honey and names.nightmarefuel --and not tags.inedible and not tags.egg 
  end,
  name = "gongbaochicken",
  weight = 1,
  priority = 10, 
  foodtype = GLOBAL.FOODTYPE.MEAT,
  health = 0,
  hunger = TUNING.CALORIES_SMALL,
  sanity = 150,
  perishtime = TUNING.PERISH_FAST,
  cooktime = 0, --BUG
  potlevel = "high",
  cookbook_tex = "./images/gongbaochicken.tex", 
  cookbook_atlas = "./images/gongbaochicken.xml", 
  -- working directory is main directory
  cookbook_category = "cookpot",
  tags = {"honeyed"},
        floater = {"med", nil, 0.55}
}

-- #TODO add more foods

AddCookerRecipe("cookpot", gongbaochicken)
AddCookerRecipe("portablecookpot", gongbaochicken)

PrefabFiles = {"gongbaochicken"}