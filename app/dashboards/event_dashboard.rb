require "administrate/base_dashboard"

class EventDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    admin: Field::BelongsTo.with_options(class_name: "User"),
    attendances: Field::HasMany,
    users: Field::HasMany,
    likes: Field::HasMany,
    image_attachment: Field::HasOne,
    image_blob: Field::HasOne,
    id: Field::Number,
    admin_id: Field::Number,
    start_date: Field::DateTime,
    duration: Field::Number,
    title: Field::String,
    description: Field::Text,
    price: Field::Number,
    location: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :admin,
    :attendances,
    :users,
    :likes,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :admin,
    :attendances,
    :users,
    :likes,
    :image_attachment,
    :image_blob,
    :id,
    :admin_id,
    :start_date,
    :duration,
    :title,
    :description,
    :price,
    :location,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :admin,
    :attendances,
    :users,
    :likes,
    :image_attachment,
    :image_blob,
    :admin_id,
    :start_date,
    :duration,
    :title,
    :description,
    :price,
    :location,
  ].freeze

  # Overwrite this method to customize how events are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(event)
  #   "Event ##{event.id}"
  # end
end
