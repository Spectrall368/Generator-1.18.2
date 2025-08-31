<#include "mcitems.ftl">
<#include "mcelements.ftl">
new RootSystemConfiguration(${toPlacedFeature(input_id$feature, input$feature)}, ${field$required_vertical_space_for_tree},
${field$root_radius}, BlockTags.create(new ResourceLocation("${field$root_replaceable}")), ${toStateProvidertoFeatureState(input$root_state_provider)}, ${field$root_placement_attempts},
${field$root_column_max_height}, ${field$hanging_root_radius}, ${field$hanging_roots_vertical_span}, ${toStateProvidertoFeatureState(input$hanging_root_state_provider)},
${field$hanging_root_placement_attempts}, ${field$allowed_vertical_water_for_tree}, ${input$allowed_tree_position})