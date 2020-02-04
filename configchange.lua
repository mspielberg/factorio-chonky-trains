local function fix_recipe_state()
  for _, f in pairs(game.forces) do
    for _, tech in pairs(f.technologies) do
      if tech.researched then
        for _, effect in pairs(tech.effects) do
          if effect.type == "unlock-recipe" and effect.recipe:find("^chonky%-") then
            f.recipes[effect.recipe].enabled = true
          end
        end
      end
    end
  end
end

return {
  fix_recipe_state = fix_recipe_state,
}
