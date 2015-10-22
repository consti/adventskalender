adventskalender
===============

Alle Jahre wieder:

1) Set ENV variable YEAR to current year
2) Create `/views/home/kalenders/_kalender_$YEAR$.html.slim`
3) Create days: `Day.create_for_year(ENV['YEAR'])`
4) Import prizes and sponsors from CSV – look at `Importer.new(..)`
5) Add Logos `Importer.copy_logos!(ENV['YEAR'])`
5) Update prizes and sponsors in Admin interface

Tempfiles:

```
data = Tempfile.new('import.csv')
data.write << <<-IMPORT
[copy and paste all your csv data]
IMPORT
data.close

import = Importer.new(data, $YEAR$)
```
