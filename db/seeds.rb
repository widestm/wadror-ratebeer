# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
b1 = Brewery.create name:"Koff", year:1897 
b2 = Brewery.create name:"Malmgard", year:2001
b3 = Brewery.create name:"Weihenstephaner", year:1042

b1.beers.create name:"Iso 3", style_id:10
b1.beers.create name:"Karhu", style_id:12
b1.beers.create name:"Tuplahumala", style_id:14
b2.beers.create name:"Huvila Pale Ale", style_id:12
b2.beers.create name:"X Porter", style_id:11
b3.beers.create name:"Hefezeizen", style_id:14
b3.beers.create name:"Helles", style_id:11

Style.create style:"English India Pale Ale", description:"First brewed in England and exported for the British troops in India during the late 1700s. To withstand the voyage, IPA's were basically tweaked Pale Ales that were, in comparison, much more malty, boasted a higher alcohol content and were well-hopped, as hops are a natural preservative. Historians believe that an IPA was then watered down for the troops, while officers and the elite would savor the beer at full strength. The English IPA has a lower alcohol due to taxation over the decades. The leaner the brew the less amount of malt there is and less need for a strong hop presence which would easily put the brew out of balance. Some brewers have tried to recreate the origianl IPA with strengths close to 8-9% "

Style.create style:"
American Adjunct Lager
", description:"Light bodied, pale, fizzy lagers made popular by the large macro-breweries (large breweries) of America after prohibition. Low bitterness, thin malts, and moderate alcohol. Focus is less on flavor and more on mass-production and consumption, cutting flavor and sometimes costs with adjunct cereal grains, like rice and corn."

Style.create style:"
Low Alcohol Beer
", description:"Low Alcohol Beer is also commonly known as Non Alcohol (NA) beer, which is a fallacy as all of these beers still contain small amounts of alcohol. Low Alcohol Beers are generally subjected to one of two things: a controlled brewing process that results in a low alcohol content, or the alcohol is removed using a reverse-osmosis method which passes alcohol through a permeable membrane. "

Style.create style:"
Vienna Lager
", description:"Named after the city in which it orginated, a traditional Vienna lager is brewed using a three step decoction boiling process. Munich, Pilsner, Vienna toasted and dextrin malts are used, as well wheat in some cases. Subtle hops, crisp, with residual sweetness.

Although German in origin and rare these days, some classic examples come from Mexico, such as: Dos Equis and Negra Modelo. A result of late 19th century immigrant brewers from Austria.
"

Style.create style:"
Berliner Weissbier
", description:"Berliner Weisse is a top-fermented, bottle conditioned wheat beer made with both traditional warm-fermenting yeasts and lactobacillus culture. They have a rapidly vanishing head and a clear, pale golden straw-coloured appearance. The taste is refreshing, tart, sour and acidic, with a lemony-citric fruit sharpness and almost no hop bitterness."

Style.create style:"
Irish Dry Stout
", description:"One of the most common stouts, Dry Irish Stout tend to have light-ish bodies to keep them on the highly drinkable side. They're usually a lower carbonation brew and served on a nitro system for that creamy, masking effect. Bitterness comes from both roasted barley and a generous dose of hops, though the roasted character will be more noticeable. Examples of the style are, of course, the big three, Murphy's, Beamish, and Guinness, however there are many American brewed Dry Stouts that are comparable, if not better."

Style.create style:"
Czech Pilsener
", description:"The birth of Pilsner beer can be traced back to its namesake, the ancient city of Plzen (or Pilsen) which is situated in the western half of the Czech Republic in what was once Czechoslovakia and previously part of the of Bohemian Kingdom. Pilsner beer was first brewed back in the 1840's when the citizens, brewers and maltsters of Plzen formed a brewer's guild and called it the People's Brewery of Pilsen.

The Czech Pilsner, or sometimes known as the Bohemian Pilsner, is light straw to golden color and crystal clear. Hops are very prevalent usually with a spicy bitterness and or a spicy floral flavor and aroma, notably one of the defining characteristics of the Saaz hop. Smooth and crisp with a clean malty palate, many are grassy. Some of the originals will show some archaic yeast characteristics similar to very mild buttery or fusel (rose like alcohol) flavors and aromas."
