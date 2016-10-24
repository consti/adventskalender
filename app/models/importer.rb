# encoding: utf-8
class Importer
  CSV_HEADER = {
    day: "Tag",
    sponsor: {
      name: "Sponsor",
      person: "Ansprechpartner",
      address: "Straße/Hausnummer",
      city: "PLZ/Ort",
      phone: "Tel.",
      fax: "FAX",
      email: "email"
    },
    prize: {
      name: "Preis",
      anzahl: "Anzahl",
      cost: "Einzelpreis",
      lions_member: "LIONS-Mitglied"
    }
  }

  def initialize(file_path, year)
    @year = year
    @csv = CSV.read file_path, headers: true, col_sep: ';'
  end

  def self.copy_logos!(year)
    Sponsor.where(year: year, logo: nil).each(&:copy_logo!)
  end

  def perform!
    create_sponsors!
    create_prizes!
  end

  def create_sponsors!
    @csv.each do |row|
      sponsor_attributes = row_to_attributes row, header: CSV_HEADER[:sponsor]
      sponsor = Sponsor.where(
        year: @year,
        name: sponsor_attributes[:name]
      ).first_or_create
      sponsor.update_attributes(sponsor_attributes)
      puts sponsor_attributes[:name] + " created/updated (ID: #{sponsor.id})"
    end
  end

  def create_prizes!
    @csv.each do |row|
      prize_attributes = row_to_attributes row, header: CSV_HEADER[:prize]
      prize_attributes.merge! day: row_to_day(row), sponsor: row_to_sponsor(row)
      prize = Prize.where(
        sponsor: prize_attributes[:sponsor],
        name: prize_attributes[:name],
        day: prize_attributes[:day]
      ).first_or_create
      prize.update_attributes(prize_attributes)
      puts prize_attributes[:name] + " created/updated (ID: #{prize.id})"
    end
  end

  def row_to_attributes(row, header:)
    header.each_with_object({}) do |(key, column_name), hash|
      hash[key] = row[column_name]
    end
  end

  def row_to_day(row)
    date = Date.parse("#{row[CSV_HEADER[:day]]}.12.#{@year}")
    Day.find_by!(date: date)
  end

  def row_to_sponsor(row)
    sponsor_attributes = row_to_attributes row, header: CSV_HEADER[:sponsor]
    Sponsor.find_by!(year: @year, name: sponsor_attributes[:name])
  end
end
