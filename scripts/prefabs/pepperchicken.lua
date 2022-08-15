local assets =
{
    Asset("ANIM", "anim/pepperchicken.zip"), 
    Asset("ATLAS", "images/pepperchicken.xml")
}


function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("pepperchicken")
    inst.AnimState:SetBuild("pepperchicken")
    inst.AnimState:PlayAnimation("idle") 

    --MakeInventoryFloatable(inst)
    --------------------------------------------------------------------------
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end
    --------------------------------------------------------------------------
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/pepperchicken.xml"

    inst:AddComponent("edible")
    inst.components.edible.foodtype = FOODTYPE.MEAT

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food" -- 腐烂后变成腐烂食物

    inst.components.edible.hungervalue = 0
    inst.components.edible.healthvalue = 0
    inst.components.edible.sanityvalue = 0

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("pepperchicken", fn, assets)