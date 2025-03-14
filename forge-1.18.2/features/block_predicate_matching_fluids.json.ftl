BlockPredicate.matchesFluids(#if field$fluid?starts_with("CUSTOM:")>
${JavaModName}Fluids.${field$fluid?ends_with(":Flowing")?then("FLOWING_","")}${generator.getRegistryNameForModElement(field$fluid?remove_ending(":Flowing"))?upper_case}.get()
<#else>
Fluids.${generator.map(field$fluid, "fluids")}
</#if>,
new Vec3i(${field$x}, ${field$y}, ${field$z}))