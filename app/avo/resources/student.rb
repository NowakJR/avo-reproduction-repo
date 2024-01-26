# frozen_string_literal: true

module Avo
    module Resources
      class Student < Avo::BaseResource
        self.includes = []
        self.title = :email
        self.model_class = ::Student
        self.extra_params = [users_attributes: [:email, :first_name, :last_name, :phone_number, :date_of_birth]]
        
        def fields
          field :id, as: :id, hide_on: [:show, :new]
          field :email, as: :text
          field :first_name, as: :text
          field :last_name, as: :text
          field :phone_number, as: :text
          field :date_of_birth, as: :date
          field :invitation_token_sent_at, as: :date_time, hide_on: [:index, :new, :edit]
          field :active_until, as: :date,  sortable: true
          field :active_since, as: :date
          field :status, as: :select, enum: ::Student.statuses, sortable: true
          field :registration_completed, as: :boolean
          field :lessons, as: :has_many
          field :ratings, as: :has_many
          field :company, as: :belongs_to
          field :user, as: :has_one
          tool Avo::ResourceTools::NestedUser, only_on: [:new, :edit]
  
        end
      end
    end
  end
  