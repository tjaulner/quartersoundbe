module Api
    module V1
      class NotificationsController < Api::V1::ApplicationController
        skip_before_action :authenticate, only: %i[show index]

        # Returns the new record created in notifications table
        def new_notification(user, notice_id, notice_type)
            notice = user.notifications.build(notice_id: notice_id,   
            notice_type: notice_type)
            user.notice_seen = false
            user.save
            notice
        end
        
        # Receives the notification object as parameter along with a type
        # and returns a User record, Post record or a Comment record
        # depending on the type supplied 
        def notification_find(notice, type)
            return User.find(notice.notice_id) if type == 'friendRequest'
            return Post.find(notice.notice_id) if type == 'comment'
            return Post.find(notice.notice_id) if type == 'like-post'
            return unless type == 'like-comment'
            comment = Comment.find(notice.notice_id)
            Post.find(comment.post_id)
        end

    end  
    end
end