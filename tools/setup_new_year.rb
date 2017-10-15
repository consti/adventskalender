year       = 2017
logos_root = '/Users/consti/Downloads/logos/'
sponsors_file   = '/Users/consti/Projects/adventskalender/tools/sponsors.csv'
prizes_file     = '/Users/consti/Projects/adventskalender/tools/prizes.csv'
# csv.headers
# [:year, :name, :person, :address, :city, :phone, :fax, :email, :image]

# 01 Cleanup

Kalender.destroy_all
Day.destroy_all
Prize.destroy_all
Day.create_for_year(year)

# 02 Create Sponsors
csv = CSV.read(sponsors_file, headers: true, header_converters: %i(symbol downcase))
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
  Sponsor.where(year: year, name: row[:name]).first_or_create(
    person: row[:person],
    address: row[:address],
    city: row[:city],
    phone: row[:phone],
    fax: row[:fax],
    email: row[:email],
    logo: File.open(File.join(logos_root, row[:image]))
  )
end

# 03 Check for Sponsors
csv = CSV.read(prizes_file, headers: true, header_converters: %i(symbol downcase))
csv.map do |row|
  sponsor = Sponsor.find_by(year: year, name: row[:sponsor])
  sponsor.nil? ? row[:sponsor] : nil
end.compact.each { |s| puts "Missing: #{s}" }

# 04 Create Prizes
csv = CSV.read(prizes_file, headers: true, header_converters: %i(symbol downcase))
csv.each do |row|
  # name
  # sponsor
  # day
  # anzahl
  # lions_member
  sponsor = Sponsor.find_by!(year: year, name: row[:sponsor])
  day     = Day.find_by!(date: "#{row[:day]}.12.#{year}".to_date)
  Prize.where(
    day: day,
    sponsor: sponsor,
    name: row[:name]
  ).first_or_create(
    lions_member: row[:lions_member],
    anzahl: row[:anzahl]
  )
end
