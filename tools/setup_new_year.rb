year       = 2017
logos_root = '/Users/consti/Downloads/logos/'
csv_file   = '/Users/consti/Downloads/sponsors.csv'
# csv.headers
# [:year, :name, :person, :address, :city, :phone, :fax, :email, :image]

Kalender.destroy_all
Day.destroy_all
Prize.destroy_all
Day.create_for_year(year)

csv = CSV.read(csv_file, headers: true, header_converters: %i(symbol downcase))
csv.each do |row|
  # name
  # person
  # address
  # city
  # phone
  # logo
  # email
  # fax
  # year
  Sponsor.where(year: 2017, name: row[:name]).first_or_create(
    person: row[:person],
    address: row[:address],
    city: row[:city],
    phone: row[:phone],
    fax: row[:fax],
    email: row[:email],
    logo: File.open(File.join(logos_root, row[:image]))
  )
end
