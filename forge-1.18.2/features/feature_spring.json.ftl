new SpringConfiguration(<#if field$state?starts_with("CUSTOM:")>
${JavaModName}Fluids.${field$state?ends_with(":Flowing")?then("FLOWING_","")}${generator.getRegistryNameForModElement(field$state?remove_ending(":Flowing"))?upper_case}.get()
<#else>
Fluids.${generator.map(field$state, "fluids")}
</#if>,
${field$requires_block_below}, ${field$rock_count}, ${field$hole_count}, List.of(${input$valid_blocks}))