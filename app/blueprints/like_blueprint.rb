class LikeBlueprint < Blueprinter::Base
    identifier :id
    fields :created_at, :user, :updated_at, :user_id
end