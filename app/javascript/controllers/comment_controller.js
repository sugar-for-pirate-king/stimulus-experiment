import { Controller } from 'stimulus'

export default class CommentController extends Controller {
  static targets = ["form", "content"]

  edit(event){
    event.preventDefault()
    this.formTarget.classList.remove('d-none')
    this.contentTarget.classList.add("d-none")
  }
}