<#include "mcelements.ftl">
<#include "mcitems.ftl">
<#-- @formatter:off -->
{
	BlockEntity _ent = world.getBlockEntity(${toBlockPos(input$x,input$y,input$z)});
	if (_ent != null)
		_ent.getCapability(CapabilityFluidHandler.FLUID_HANDLER_CAPABILITY, ${input$direction}).ifPresent(capability ->
			capability.fill(new FluidStack(${generator.map(field$fluid, "fluids")}, ${opt.toInt(input$amount)}), IFluidHandler.FluidAction.EXECUTE)
		);
}
<#-- @formatter:on -->