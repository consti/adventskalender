adventskalender
===============

Alle Jahre wieder
=================

1. Set ENV variable YEAR to current year
2. Create `/views/home/kalenders/_kalender_$YEAR$.html.slim`
3. Create days: `Day.create_for_year(ENV['YEAR'])`
4. Import prizes and sponsors from CSV – look at `Importer.new(..)` and see Import
5. Add Logos `Importer.copy_logos!(ENV['YEAR'])`
6. Update prizes and sponsors in Admin interface

Import
=========

```ruby
data = Tempfile.new('import.csv')
data.write << <<IMPORT
[copy and paste all your csv data]
IMPORT
data.close

import = Importer.new(data, $YEAR$)
```

Config
=========
```yml
AWS_ACCESS_KEY_ID:          xxxxxxxxx
AWS_BUCKET_NAME:            xxxxxxxxx
AWS_SECRET_ACCESS_KEY:      xxxxxxxxx
YEAR: 2015
ALL_DOORS_OPEN: 'true'
```
