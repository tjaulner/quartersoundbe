class CommentBlueprint < Blueprinter::Base
    identifier :id
    fields :body, :created_at, :updated_at, :user_id, :user
end