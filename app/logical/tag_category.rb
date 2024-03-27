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
    "demographics" => 5,
    "demo" => 5,
    "invalid" => 6,
    "inv" => 6,
    "meta" => 7,
    "lore" => 8,
    "lor" => 8,
    "category" => 9,
    "cat" => 9
  }.freeze

  CANONICAL_MAPPING = {
    "General" => 0,
    "Artist" => 1,
    "Copyright" => 3,
    "Name" => 4,
    "Demographics" => 5,
    "Invalid" => 6,
    "Meta" => 7,
    "Lore" => 8,
    "Category" => 9,
  }.freeze

  REVERSE_MAPPING = {
    0 => "general",
    1 => "artist",
    3 => "copyright",
    4 => "name",
    5 => "demographics",
    6 => "invalid",
    7 => "meta",
    8 => "lore",
    9 => "category",
  }.freeze

  SHORT_NAME_MAPPING = {
    "gen" => "general",
    "art" => "artist",
    "copy" => "copyright",
    "nam" => "name",
    "demo" => "demographics",
    "inv" => "invalid",
    "meta" => "meta",
    "lor" => "lore",
    "cat" => "category",
  }.freeze

  HEADER_MAPPING = {
    "general" => "General",
    "artist" => "Artists",
    "copyright" => "Copyrights",
    "name" => "Names",
    "demographics" => "Demographics",
    "invalid" => "Invalid",
    "meta" => "Meta",
    "lore" => "Lore",
    "category" => "Categories"
  }.freeze

  ADMIN_ONLY_MAPPING = {
    "general" => false,
    "artist" => false,
    "copyright" => false,
    "name" => false,
    "demographics" => false,
    "category" => false,
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

  CATEGORIES = %w[general demographics name copyright artist invalid lore meta category].freeze
  CATEGORY_IDS = CANONICAL_MAPPING.values

  SHORT_NAME_LIST = SHORT_NAME_MAPPING.keys
  HUMANIZED_LIST = %w[name copyright artist].freeze
  SPLIT_HEADER_LIST = %w[invalid artist copyright name demographics general meta lore category].freeze
  CATEGORIZED_LIST = %w[invalid artist copyright name demographics meta general lore category].freeze

  SHORT_NAME_REGEX = SHORT_NAME_LIST.join("|").freeze
end
