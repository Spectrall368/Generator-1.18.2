$if(!(
  <#if field_list$x?size != 0>
    <#list 0..field_list$x?size-1 as i>
    (context.origin().getX() == ${field_list$x[i]} && context.origin().getY() == ${field_list$y[i]} && context.origin().getZ() == ${field_list$z[i]})
    <#sep> ||</#list>
  <#else>false</#if>
  ))
return false;$