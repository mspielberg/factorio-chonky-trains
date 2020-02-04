local function fix_recipe_state()
  for _, f in pairs(game.forces) do
    for _, tech in pairs(f.technologies) do
      if tech.researched then
        for _, effect in pairs(tech.effects) do
          if effect.type == "unlock-recipe"
            and (effect.recipe:find("^chonky%-")
            or f.recipes["chonky-"..effect.recipe]) then
            f.recipes[effect.recipe].enabled = true
          end
        end
      end
    end

    for _, recipe in pairs(f.recipes) do
      if recipe.enabled
        and f.recipes["chonky-"..recipe.name]
        and settings.startup["chonky-trains-remove-normal"].value then
        recipe.enabled = false
      end
    end
  end
end

return {
  fix_recipe_state = fix_recipe_state,
}
