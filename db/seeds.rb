# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

License.create(
  code: "cc-by-40",
  title: "Creative Commons Attribution 4.0 International",
  url: "https://creativecommons.org/licenses/by/4.0/"
)
License.create(
  code: "cc-by-nc-40",
  title: "Creative Commons Attribution-NonCommercial 4.0 International",
  url: "https://creativecommons.org/licenses/by-nc/4.0/"
)
License.create(
  code: "cc-by-nc-nd-40",
  title: "Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International",
  url: "https://creativecommons.org/licenses/by-nc-nd/4.0/"
)
