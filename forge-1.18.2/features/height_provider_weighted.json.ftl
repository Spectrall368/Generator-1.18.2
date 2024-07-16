new WeightedListHeight(SimpleWeightedRandomList.<HeightProvider>builder()<#list input_list$entry as entry>.add(${entry}, ${field_list$weight[entry?index]})</#list>.build())
