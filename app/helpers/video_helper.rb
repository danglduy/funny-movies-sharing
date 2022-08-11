module VideoHelper
  def video_reactions_summary(video)
    return if video.video_reactions.blank?

    reactions_count = {}

    if video.video_reactions.up.size > 0
      reactions_count[:liked] = video.video_reactions.up.size
    end

    if video.video_reactions.down.size > 0
      reactions_count[:disliked] = video.video_reactions.down.size
    end

    reactions_count.map {|k, v| "#{v} #{k}"}.join(", ")
  end
end
