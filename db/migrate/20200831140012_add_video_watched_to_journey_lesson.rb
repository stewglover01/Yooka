class AddVideoWatchedToJourneyLesson < ActiveRecord::Migration[6.0]
  def change
    add_column :journey_lessons, :video_watched, :boolean
  end
end
