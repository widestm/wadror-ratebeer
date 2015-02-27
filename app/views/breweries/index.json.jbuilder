json.array!(@breweries) do |brewery|
  json.extract! brewery, :id, :name, :year
  json.amount_of_beers brewery.beers.count
end
