<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2025, Pylo, opensource contributors
 #
 # This program is free software: you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <https://www.gnu.org/licenses/>.
 #
 # Additional permission for code generator templates (*.ftl files)
 #
 # As a special exception, you may create a larger work that contains part or
 # all of the MCreator code generator templates (*.ftl files) and distribute
 # that work under terms of your choice, so long as that work isn't itself a
 # template for code generation. Alternatively, if you modify or redistribute
 # the template itself, you may (at your option) remove this special exception,
 # which will cause the template and the resulting code generator output files
 # to be licensed under the GNU General Public License without this special
 # exception.
-->

<#-- @formatter:off -->
package ${package}.item;

import net.minecraft.world.entity.EntitySelector;

<#assign variantSetterCode>
if(boat instanceof ${JavaModName}Boat boatt)
    boatt.setType(this.type);
</#assign>

public class ${JavaModName}BoatItem extends Item {
	private static final Predicate<Entity> ENTITY_PREDICATE = EntitySelector.NO_SPECTATORS.and(Entity::isPickable);
	private final ${JavaModName}Boat.Type type;

	public ${JavaModName}BoatItem(${JavaModName}Boat.Type type, Item.Properties properties) {
		super(properties.stacksTo(1));
		this.type = type;
	}

	<#assign useMethod = mcc.getMethod("net.minecraft.world.item.BoatItem", "use", "Level", "Player", "InteractionHand")>
	<#assign useMethod = useMethod.replace("boat.setType(this.type);", variantSetterCode)>
	@Override ${useMethod}

	private Boat getBoat(Level level, HitResult hitResult) {
		return new ${JavaModName}Boat(level, hitResult.getLocation().x, hitResult.getLocation().y, hitResult.getLocation().z);
	}
}
<#-- @formatter:on -->