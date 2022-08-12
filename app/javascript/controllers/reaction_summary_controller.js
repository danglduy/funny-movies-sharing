import { Controller } from "@hotwired/stimulus"
import axios from "axios";

export default class extends Controller {
  static values = {
    videoId: Number
  }

  connect() {}

  async fetchReactionSummaries(_event) {
    try {
      const { data } = await axios.get(`videos/${this.videoIdValue}/video_reaction_summaries.json`);
      const { up, down } = data.reacted_emails;
      const titleTexts = []

      if (up.length > 0) {
        titleTexts.push(up.join(", ") + " liked")
      }

      if (down.length > 0) {
        titleTexts.push(down.join(", ") + " disliked")
      }

      if (titleTexts.length > 0) {
        this.element.title = titleTexts.join(", ")
      }
    } catch (error) {
      console.log(error)
    }
  }
}
