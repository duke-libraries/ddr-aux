#
# Licenses
#
License.create(
  title: "Creative Commons Attribution 4.0 International",
  url: "https://creativecommons.org/licenses/by/4.0/",
  terms: <<-EOS
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/80x15.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.
EOS
)
License.create(
  title: "Creative Commons Attribution-NonCommercial 4.0 International",
  url: "https://creativecommons.org/licenses/by-nc/4.0/",
  terms: <<-EOS
<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/80x15.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.
EOS
)
License.create(
  title: "Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International",
  url: "https://creativecommons.org/licenses/by-nc-nd/4.0/",
  terms: <<-EOS
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/80x15.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.
EOS
)
License.create(
  title: "Creative Commons 1.0 Universal (CC0 Public Domain Dedication)",
  url: "https://creativecommons.org/publicdomain/zero/1.0/"
)

#
# Contacts
#
Contact.create(
  slug: "rubenstein",
  name: "David M. Rubenstein Rare Book & Manuscript Library",
  short_name: "Rubenstein Library",
  url: "http://library.duke.edu/rubenstein/",
  phone: "919-660-5822",
  email: "special-collections@duke.edu",
  ask: "http://library.duke.edu/rubenstein/ask"
)
Contact.create(
  slug: "hartman",
  name: "John W. Hartman Center for Sales, Advertising & Marketing History",
  short_name: "Hartman Center",
  url: "http://library.duke.edu/rubenstein/hartman/",
  phone: "919-660-5827",
  email: "hartman-center@duke.edu",
  ask: "http://library.duke.edu/rubenstein/hartman/ask"
)
Contact.create(
  slug: "bingham",
  name: "Sallie Bingham Center for Women's History & Culture",
  short_name: "Bingham Center",
  url: "http://library.duke.edu/rubenstein/bingham/",
  phone: "919-660-5967",
  email: "cwhc@duke.edu",
  ask: "http://library.duke.edu/rubenstein/ask"
)
Contact.create(
  slug: "docarts",
  name: "Archive of Documentary Arts",
  url: "http://library.duke.edu/rubenstein/documentaryarts/",
  phone: "919-660-5822",
  email: "special-collections@duke.edu",
  ask: "http://library.duke.edu/rubenstein/ask"
)
Contact.create(
  slug: "franklin",
  name: "John Hope Franklin Research Center",
  short_name: "Franklin Research Center",
  url: "http://library.duke.edu/rubenstein/franklin/",
  phone: "919-660-5922",
  email: "franklin-collection@duke.edu",
  ask: "http://library.duke.edu/rubenstein/ask"
)
Contact.create(
  slug: "hom",
  name: "History of Medicine Collections",
  url: "http://library.duke.edu/rubenstein/history-of-medicine/",
  phone: "919-684-8549",
  email: "special-collections@duke.edu",
  ask: "http://library.duke.edu/rubenstein/ask"
)
Contact.create(
  slug: "humanrights",
  name: "Human Rights Archive",
  url: "http://library.duke.edu/rubenstein/human-rights/",
  phone: "919-660-5822",
  email: "special-collections@duke.edu",
  ask: "http://library.duke.edu/rubenstein/ask"
)
Contact.create(
  slug: "uarchives",
  name: "Duke University Archives",
  short_name: "University Archives",
  url: "http://library.duke.edu/rubenstein/uarchives/",
  phone: "919-660-5822",
  email: "uarchives@duke.edu",
  ask: "http://library.duke.edu/rubenstein/uarchives/ask"
)
Contact.create(
  slug: "divinity",
  name: "Divinity School Library",
  url: "http://library.divinity.duke.edu/",
  phone: "919-660-3453",
  email: "divlib@duke.edu",
  ask: "http://library.divinity.duke.edu/ask-us"
)
Contact.create(
  slug: "libraries",
  name: "Duke University Libraries",
  url: "http://library.duke.edu",
  phone: "919-660-5880",
  email: "askref@duke.edu",
  ask: "http://library.duke.edu/research/ask"
)

#
# Admin sets
#
AdminSet.create(
  code: "researchdata",
  title: "Duke Research Data"
)
AdminSet.create(
  code: "duke_scholarship",
  title: "Duke Scholarship"
)
AdminSet.create(
  code: "rubenstein",
  title: "Rubenstein Library"
)
AdminSet.create(
  code: "dvs",
  title: "Data and Visualization Services"
)
AdminSet.create(
  code: "dc",
  title: "Digital Collections"
)
AdminSet.create(
  code: "nescent",
  title: "NESCent: National Evolutionary Synthesis Center"
)

#
# External urls
#
ExternalUrl.create(
  title: "Ad*Access Research Guide: Getting Started",
  url: "http://guides.library.duke.edu/adaccess"
)
ExternalUrl.create(
  title: "Emergence of Advertising in America Research Guide",
  url: "http://guides.library.duke.edu/eaa"
)

