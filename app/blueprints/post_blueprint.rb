class PostBlueprint < Blueprinter::Base
    identifier :id
    fields :body, :created_at, :user, :updated_at, :user_id
end