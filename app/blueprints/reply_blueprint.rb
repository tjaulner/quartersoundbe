class ReplyBlueprint < Blueprinter::Base
    identifier :id
    fields :body, :created_at, :updated_at, :user, :user_id, :comment, :comment_id
end