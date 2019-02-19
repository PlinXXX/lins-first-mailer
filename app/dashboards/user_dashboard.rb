require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    created_events: Field::HasMany.with_options(class_name: "Event"),
    attendances: Field::HasMany,
    events: Field::HasMany,
    likes: Field::HasMany,
    avatar_attachment: Field::HasOne,
    avatar_blob: Field::HasOne,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    description: Field::Text,
    first_name: Field::String,
    last_name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :created_events,
    :attendances,
    :events,
    :likes,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :created_events,
    :attendances,
    :events,
    :likes,
    :avatar_attachment,
    :avatar_blob,
    :id,
    :email,
    :encrypted_password,
    :description,
    :first_name,
    :last_name,
    :created_at,
    :updated_at,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :created_events,
    :attendances,
    :events,
    :likes,
    :avatar_attachment,
    :avatar_blob,
    :email,
    :encrypted_password,
    :description,
    :first_name,
    :last_name,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
