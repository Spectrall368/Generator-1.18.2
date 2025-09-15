<#function toResourceLocation string>
    <#if string?matches('"[^+]*"')>
        <#return "new ResourceLocation(" + string?lower_case + ")">
    <#else>
        <#return "new ResourceLocation((" + string + ").toLowerCase(java.util.Locale.ENGLISH))">
    </#if>
</#function>

<#function toArmorSlot slot>
    <#if slot == "/*@int*/0">
        <#return "EquipmentSlot.FEET">
    <#elseif slot == "/*@int*/1">
        <#return "EquipmentSlot.LEGS">
    <#elseif slot == "/*@int*/2">
        <#return "EquipmentSlot.CHEST">
    <#elseif slot == "/*@int*/3">
        <#return "EquipmentSlot.HEAD">
    <#else>
        <#return "EquipmentSlot.byTypeAndIndex(EquipmentSlot.Type.ARMOR, ${opt.toInt(slot)})">
    </#if>
</#function>

<#function toAxis direction>
    <#if (direction == "Direction.EAST") || (direction == "Direction.WEST")>
        <#return "Direction.Axis.X">
    <#elseif (direction == "Direction.UP") || (direction == "Direction.DOWN")>
        <#return "Direction.Axis.Y">
    <#elseif (direction == "Direction.NORTH") || (direction == "Direction.SOUTH")>
        <#return "Direction.Axis.Z">
    <#else>
        <#return direction + ".getAxis()">
    </#if>
</#function>

<#function toBlockPos x y z>
    <#return "new BlockPos(" + opt.removeParentheses(x) + "," + opt.removeParentheses(y) + "," + opt.removeParentheses(z) +")">
</#function>

<#function toPlacedFeature featureType featureConfig placement="">
    <#local placementPattern = r'\$([^$]+)\$'>
    <#local placementMatches = placement?matches(placementPattern)>
    <#local hasHardcodedElements = (placementMatches?size > 0)>
    <#local nonHardcodedElements = placement>

    <#if hasHardcodedElements>
        <#local nonHardcodedElements = placement?replace(placementPattern, "", "r")>
    </#if>

	<#if featureType == "placed_feature_inline">
		<#return featureConfig>
	<#else>
        <#if featureType == "configured_feature_reference" && placement == "">
		        <#return 'PlacementUtils.inlinePlaced(' + featureConfig + ')'>
        <#elseif featureType == "configured_feature_reference">
		        <#return 'PlacementUtils.inlinePlaced(' + featureConfig + ',' + nonHardcodedElements?remove_ending(",") + ')'>
		<#elseif nonHardcodedElements == "">
		        <#return 'PlacementUtils.inlinePlaced(' + generator.map(featureType, "features", 2) + ', ' + featureConfig + ')'>
		<#else>
		        <#return 'PlacementUtils.inlinePlaced(' + generator.map(featureType, "features", 2) + ', ' + featureConfig + ',' + nonHardcodedElements?remove_ending(",") + ')'>
		</#if>
	</#if>
</#function>