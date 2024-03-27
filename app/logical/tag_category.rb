# frozen_string_literal: true

class TagCategory
  MAPPING = {
    "general" => 0,
    "gen" => 0,
    "artist" => 1,
    "art" => 1,
    "copyright" => 3,
    "copy" => 3,
    "co" => 3,
    "name" => 4,
    "nam" => 4,
    "nm" => 4,
    "oc" => 4,
    "species" => 5,
    "spec" => 5,
    "invalid" => 6,
    "inv" => 6,
    "meta" => 7,
    "lore" => 8,
    "lor" => 8,
  }.freeze

  CANONICAL_MAPPING = {
    "General" => 0,
    "Artist" => 1,
    "Copyright" => 3,
    "Name" => 4,
    "Species" => 5,
    "Invalid" => 6,
    "Meta" => 7,
    "Lore" => 8,
  }.freeze

  REVERSE_MAPPING = {
    0 => "general",
    1 => "artist",
    3 => "copyright",
    4 => "name",
    5 => "species",
    6 => "invalid",
    7 => "meta",
    8 => "lore",
  }.freeze

  SHORT_NAME_MAPPING = {
    "gen" => "general",
    "art" => "artist",
    "copy" => "copyright",
    "nam" => "name",
    "spec" => "species",
    "inv" => "invalid",
    "meta" => "meta",
    "lor" => "lore",
  }.freeze

  HEADER_MAPPING = {
    "general" => "General",
    "artist" => "Artists",
    "copyright" => "Copyrights",
    "name" => "Names",
    "species" => "Species",
    "invalid" => "Invalid",
    "meta" => "Meta",
    "lore" => "Lore",
  }.freeze

  ADMIN_ONLY_MAPPING = {
    "general" => false,
    "artist" => false,
    "copyright" => false,
    "name" => false,
    "species" => false,
    "invalid" => true,
    "meta" => true,
    "lore" => true,
  }.freeze

  HUMANIZED_MAPPING = {
    "artist" => {
      "slice" => 0,
      "exclusion" => %w[avoid_posting conditional_dnp epilepsy_warning sound_warning],
      "regexmap" => //,
      "formatstr" => "created by %s",
    },
    "copyright" => {
      "slice" => 1,
      "exclusion" => [],
      "regexmap" => //,
      "formatstr" => "(%s)",
    },
    "name" => {
      "slice" => 5,
      "exclusion" => [],
      "regexmap" => /^(.+?)(?:_\(.+\))?$/,
      "formatstr" => "%s",
    },
  }.freeze

  CATEGORIES = %w[general species name copyright artist invalid lore meta].freeze
  CATEGORY_IDS = CANONICAL_MAPPING.values

  SHORT_NAME_LIST = SHORT_NAME_MAPPING.keys
  HUMANIZED_LIST = %w[name copyright artist].freeze
  SPLIT_HEADER_LIST = %w[invalid artist copyright name species general meta lore].freeze
  CATEGORIZED_LIST = %w[invalid artist copyright name species meta general lore].freeze

  SHORT_NAME_REGEX = SHORT_NAME_LIST.join("|").freeze
end
