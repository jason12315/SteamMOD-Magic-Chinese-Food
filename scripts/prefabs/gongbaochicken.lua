local assets = {Asset("ANIM", "anim/gongbaochicken.zip"), Asset("IMAGE", "images/gbjd64.tex"), Asset("ATLAS", "images/gbjd64.xml")}

function fn()
    local assetname = "gongbaochicken"

    local inst = CreateEntity() -- 创建实体
    inst.entity:AddTransform() -- 添加xyz形变对象
    inst.entity:AddAnimState() -- 添加动画状态
    inst.entity:AddNetwork() -- 添加这一行才能让所有客户端都能看到这个实体

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank(assetname) -- 地上动画
    inst.AnimState:SetBuild(assetname) -- 材质包，就是anim里的zip包
    inst.AnimState:PlayAnimation("idle") -- 默认播放哪个动画

    MakeInventoryFloatable(inst)
    --------------------------------------------------------------------------
    if not TheWorld.ismastersim then
        return inst
    end
    --------------------------------------------------------------------------
    inst:AddComponent("inspectable") -- 可检查组件
    inst:AddComponent("inventoryitem") -- 物品组件

    inst.components.inventoryitem.atlasname = "images/gbjd64.xml" -- 在背包里的贴图

    inst:AddComponent("edible") -- 可食物组件
    inst.components.edible.foodtype = FOODTYPE.MEAT

    inst:AddComponent("perishable") -- 可腐烂的组件
    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food" -- 腐烂后变成腐烂食物

    inst.components.edible.hungervalue = TUNING.CALORIES_SMALL
    inst.components.edible.healthvalue = 0
    inst.components.edible.sanityvalue = 150

    inst:AddComponent("stackable") -- 可堆叠
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("gongbaochicken", fn, assets, prefabs)