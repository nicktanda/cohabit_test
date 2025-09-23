class CsvImportService
  def initialize(file)
    @file = file
  end

  def import!
    parsed_file = File.read(@file)
    csv = CSV.parse(parsed_file, headers: true)
    csv.each do |row|
      process_row(row)
    end
  end

  def process_row(row)
    first_name, last_name = format_name(row["Name"])
    gender = format_gender(row["Gender"])

    user = User.new(
      first_name: first_name,
      last_name: last_name.presence,
      species: row["Species"],
      gender: gender,
      weapon: row["Weapon"],
      vehicle: row["Vehicle"]
    )
    affiliations = row["Affiliations"]&.split(", ")&.map do |affiliation|
      Affiliation.find_or_create_by(name: affiliation.capitalize)
    end || []

    user.save! if user.valid? && affiliations.any?

    locations = row["Location"]&.split(", ")&.map do |location|
      Location.find_or_create_by(name: location.capitalize)
    end || []

    user.affiliations << affiliations
    user.locations << locations
    user.save!
  end

  private

  def format_name(name)
    first_name = name.split(" ")[0].capitalize
    last_name = name.split(" ")[1]&.capitalize
    return first_name, last_name
  end

  def format_gender(gender)
    formatted_gender = gender.first.upcase
    gender = if formatted_gender == "M"
      "male"
    elsif formatted_gender == "F"
      "female"
    else
      "other"
    end
  end
end
