-- Recipe data as a plain Lua table. Strings are plain text (LaTeX special
-- characters such as & % _ are escaped for you).
return {
  title  = "Green salad with grated carrot and pistachio",
  source = "Ottolenghi",
  intro  = "This is a spin on the humble, ubiquitous and very French carottes râpées salad. "
        .. "You can even make the carrot component in full the night before, if you like: "
        .. "it only gets better with time. If you can’t get hold of carrots with leafy green "
        .. "tops attached, don’t worry: just use extra chopped parsley instead.",

  times  = { {"Prep", "20 min"}, {"Marinate", "30 min+"}, {"Cook", "25 min"} },
  serves = "4",

  ingredients = {
    { qty = "4",    name = "carrots", note = "trimmed, peeled and grated (180g), plus 10g green tops, washed and finely chopped" },
    { qty = "1 tsp",  name = "Dijon mustard" },
    { qty = "20g",    name = "sultanas" },
    { qty = "5 tsp",  name = "white-wine vinegar" },
    { qty = "60ml",   name = "olive oil" },
    { name = "Fine sea salt and black pepper" },
    { qty = "1 small", name = "garlic clove", note = "peeled and crushed" },
    { qty = "100g",   name = "plain yoghurt" },
    { qty = "½ tsp",  name = "caster sugar" },
    { qty = "10g",    name = "mint leaves", note = "finely chopped" },
    { qty = "10g",    name = "parsley leaves", note = "finely chopped (or 20g if your carrots didn’t come with green tops)" },
    { qty = "1",      name = "baby gem lettuce", note = "leaves separated and halved lengthways (100g)" },
    { qty = "1 white", name = "chicory", note = "root trimmed, leaves separated and halved lengthways (100g)" },
    { qty = "1",      name = "butterhead lettuce", note = "leaves separated, larger leaves halved lengthways (200g)" },
    { qty = "30g",    name = "pistachio kernels", note = "toasted, lightly crushed in a mortar" },
  },

  steps = {
    "In a small bowl, mix the grated carrots with the mustard, sultanas, four teaspoons of vinegar, a tablespoon of oil and a half-teaspoon of salt, then set aside to marinate for at least half an hour.",
    "Meanwhile, in a large bowl, make the dressing by mixing the remaining teaspoon of vinegar and three tablespoons of oil with the garlic, yoghurt, sugar, a quarter-teaspoon of salt and a good grind of black pepper. In a small bowl, combine the herbs with the carrot tops (or extra chopped parsley).",
    "Put the salad leaves and half the herbs in the dressing bowl, then toss gently to coat.",
    "Arrange the leaves on a shallow serving platter and scatter the grated carrot on top. Serve with the remaining herbs and the pistachios sprinkled on top.",
  },
}
